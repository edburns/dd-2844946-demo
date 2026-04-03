#!/usr/bin/env bash
# start-mehmet-app.sh — Start the mehmet Todo app (MySQL + backend + frontend)
# Run from the mehmetpekdemir-Todo-App/ directory.
# Saves PIDs to .mehmet-pids for stop-mehmet-app.sh.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="$SCRIPT_DIR/.mehmet-pids"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home"
export M2_HOME="${HOME}/Downloads/apache-maven-3.9.8"
export PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:${PATH}"

# ── 0. Clear stale processes ──────────────────────────────────────────────────
# A stale process on :8085 would cause the new JVM to fail and its create-drop
# shutdown hook would then DROP the live database tables.

for PORT in 8085 3004; do
  STALE=$(lsof -ti:$PORT 2>/dev/null || true)
  if [ -n "$STALE" ]; then
    echo "==> Killing stale process on :$PORT (PID $STALE)..."
    kill $STALE 2>/dev/null || true
    sleep 1
  fi
done

# ── 1. MySQL ─────────────────────────────────────────────────────────────────

echo "==> Starting MySQL container..."
if docker ps -a --format '{{.Names}}' | grep -q '^todo-mysql$'; then
  docker start todo-mysql
else
  docker run --name todo-mysql \
    -e MYSQL_ROOT_PASSWORD= \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    -e MYSQL_DATABASE=todo_dev \
    -p 3306:3306 \
    -d mysql:8.0
fi

echo -n "    Waiting for MySQL to be ready"
for i in $(seq 1 30); do
  if docker exec todo-mysql mysql -u root -e "SELECT 1" &>/dev/null; then
    echo " OK"
    break
  fi
  echo -n "."
  sleep 2
  if [ "$i" -eq 30 ]; then
    echo ""
    echo "ERROR: MySQL did not become ready in time." >&2
    exit 1
  fi
done

# ── 2. Backend ───────────────────────────────────────────────────────────────

echo "==> Building backend..."
cd "$SCRIPT_DIR/backend"
LOG="$(date +%Y%m%d-%H%M)-job-logs.txt"
mvn clean package -DskipTests > "$LOG" 2>&1
echo "    Build log: backend/$LOG"

echo "==> Starting backend on :8085..."
java -jar target/todo-app-0.0.1-SNAPSHOT.jar > backend-run.log 2>&1 &
BACKEND_PID=$!
echo "    PID: $BACKEND_PID"

echo -n "    Waiting for backend to be ready"
for i in $(seq 1 30); do
  if curl -sf http://localhost:8085/actuator/health &>/dev/null || \
     curl -sf http://localhost:8085/swagger-ui.html &>/dev/null || \
     curl -o /dev/null -sf http://localhost:8085/ &>/dev/null; then
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
cd "$SCRIPT_DIR/frontend"
npm install --prefer-offline 2>&1 | tail -5

echo "==> Starting frontend on :3004..."
PORT=3004 NODE_OPTIONS=--openssl-legacy-provider npm start > frontend-run.log 2>&1 &
FRONTEND_PID=$!
echo "    PID: $FRONTEND_PID"

# ── Save PIDs ─────────────────────────────────────────────────────────────────

printf "BACKEND_PID=%s\nFRONTEND_PID=%s\n" "$BACKEND_PID" "$FRONTEND_PID" > "$PID_FILE"

echo ""
echo "==> mehmet app is starting up."
echo "    Frontend:  http://localhost:3004"
echo "    Backend:   http://localhost:8085"
echo "    Swagger:   http://localhost:8085/swagger-ui.html"
echo "    Logs:      backend/backend-run.log  frontend/frontend-run.log"
echo "    PIDs:      $PID_FILE"
echo ""
echo "    Pre-seeded credentials:  Mehmet1/Mehmet1 (ADMIN)  Mehmet2/Mehmet2 (USER)"
echo ""
echo "    To stop: ./stop-mehmet-app.sh"
