#!/usr/bin/env bash
# start-wesleyfuchter-app.sh — Start the wesleyfuchter todolist app (PostgreSQL + backend + frontend)
# Run from the wesleyfuchter-todolist-spring-react/ directory.
# Saves PIDs to .wesleyfuchter-pids for stop-wesleyfuchter-app.sh.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="$SCRIPT_DIR/.wesleyfuchter-pids"

echo "==> wesleyfuchter todolist app"
echo "    Frontend will be: http://localhost:3010/pending"
echo "    Backend will be:  http://localhost:8090"
echo ""

export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home"
export M2_HOME="${HOME}/Downloads/apache-maven-3.9.8"
export PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:${PATH}"

# ── 0. Clear stale processes ──────────────────────────────────────────────────

for PORT in 8090 3010; do
  STALE=$(lsof -ti:$PORT 2>/dev/null || true)
  if [ -n "$STALE" ]; then
    echo "==> Killing stale process on :$PORT (PID $STALE)..."
    kill $STALE 2>/dev/null || true
    sleep 1
  fi
done

# ── 1. PostgreSQL ─────────────────────────────────────────────────────────────

echo "==> Starting PostgreSQL container..."
if docker ps -a --format '{{.Names}}' | grep -q '^todolistdb$'; then
  docker start todolistdb
else
  docker run --name todolistdb \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -p 5432:5432 \
    -d postgres:16
fi

echo -n "    Waiting for PostgreSQL to be ready"
for i in $(seq 1 30); do
  if docker exec todolistdb pg_isready -U postgres &>/dev/null; then
    echo " OK"
    break
  fi
  echo -n "."
  sleep 2
  if [ "$i" -eq 30 ]; then
    echo ""
    echo "ERROR: PostgreSQL did not become ready in time." >&2
    exit 1
  fi
done

echo "==> Creating database and user (idempotent)..."
docker exec todolistdb psql -U postgres -c "CREATE DATABASE todolist;" 2>/dev/null || true
docker exec todolistdb psql -U postgres -c "CREATE USER todolist WITH ENCRYPTED PASSWORD 'todolist';" 2>/dev/null || true
docker exec todolistdb psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE todolist TO todolist;" 2>/dev/null || true
docker exec todolistdb psql -U postgres -d todolist -c "GRANT ALL ON SCHEMA public TO todolist;" 2>/dev/null || true

# ── 2. Backend ───────────────────────────────────────────────────────────────

echo "==> Building backend..."
cd "$SCRIPT_DIR/repo/backend"
LOG="$(date +%Y%m%d-%H%M)-job-logs.txt"
mvn clean package -DskipTests > "$LOG" 2>&1
echo "    Build log: repo/backend/$LOG"

echo "==> Starting backend on :8090..."
java -jar target/todolist-0.0.1-SNAPSHOT.jar > backend-run.log 2>&1 &
BACKEND_PID=$!
echo "    PID: $BACKEND_PID"

echo -n "    Waiting for backend to be ready"
for i in $(seq 1 30); do
  if curl -sf http://localhost:8090/tasks/pending &>/dev/null; then
    echo " OK"
    break
  fi
  echo -n "."
  sleep 2
  if [ "$i" -eq 30 ]; then
    echo ""
    echo "WARNING: Backend health check timed out — it may still be starting." >&2
  fi
done

# ── 3. Frontend ──────────────────────────────────────────────────────────────

echo "==> Installing frontend dependencies..."
cd "$SCRIPT_DIR/repo/ui"
npm install --prefer-offline 2>&1 | tail -5

echo "==> Starting frontend on :3010..."
PORT=3010 NODE_OPTIONS=--openssl-legacy-provider npm start > frontend-run.log 2>&1 &
FRONTEND_PID=$!
echo "    PID: $FRONTEND_PID"

# ── Save PIDs ─────────────────────────────────────────────────────────────────

printf "BACKEND_PID=%s\nFRONTEND_PID=%s\n" "$BACKEND_PID" "$FRONTEND_PID" > "$PID_FILE"

echo ""
echo "==> wesleyfuchter app is starting up."
echo "    Frontend:  http://localhost:3010/pending"
echo "    Backend:   http://localhost:8090"
echo "    Logs:      repo/backend/backend-run.log  repo/ui/frontend-run.log"
echo "    PIDs:      $PID_FILE"
echo ""
echo "    To stop: ./stop-wesleyfuchter-app.sh"
