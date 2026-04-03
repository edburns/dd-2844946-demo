#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PIDFILE="$SCRIPT_DIR/.demo-pids"

BACKEND_PORT=8080
FRONTEND_PORT=4200

export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home"
export M2_HOME="${HOME}/Downloads/apache-maven-3.9.8"
export PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:${PATH}"
export NODE_OPTIONS=--openssl-legacy-provider

# --- pre-flight checks ---
if lsof -iTCP:$BACKEND_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
  echo "❌  Port $BACKEND_PORT is already in use. Stop whatever is running there first."
  exit 1
fi
if lsof -iTCP:$FRONTEND_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
  echo "❌  Port $FRONTEND_PORT is already in use. Stop whatever is running there first."
  exit 1
fi

# --- remove stale fsevents (incompatible with Node 22) ---
rm -rf "$SCRIPT_DIR/crm-frontend/node_modules/fsevents"

# --- build backend if needed ---
JAR="$SCRIPT_DIR/crm-rest/target/crm-rest-0.0.1-SNAPSHOT.jar"
if [ ! -f "$JAR" ]; then
  echo "🔨  Building backend..."
  (cd "$SCRIPT_DIR/crm-rest" && mvn clean package -DskipTests -q)
fi

# --- start backend ---
echo "🚀  Starting backend on port $BACKEND_PORT..."
java -jar "$JAR" > "$SCRIPT_DIR/crm-rest/backend.log" 2>&1 &
BACKEND_PID=$!

# wait for backend to be ready
printf "   Waiting for backend"
for i in $(seq 1 30); do
  if curl -s -o /dev/null http://localhost:$BACKEND_PORT/authenticate 2>/dev/null; then
    echo " ✅"
    break
  fi
  printf "."
  sleep 1
  if [ "$i" -eq 30 ]; then
    echo " ❌ Backend failed to start. Check crm-rest/backend.log"
    kill "$BACKEND_PID" 2>/dev/null || true
    exit 1
  fi
done

# --- install frontend deps if needed ---
if [ ! -d "$SCRIPT_DIR/crm-frontend/node_modules" ]; then
  echo "📦  Installing frontend dependencies..."
  (cd "$SCRIPT_DIR/crm-frontend" && npm install --legacy-peer-deps -q)
  rm -rf "$SCRIPT_DIR/crm-frontend/node_modules/fsevents"
fi

# --- start frontend ---
echo "🚀  Starting frontend on port $FRONTEND_PORT..."
(cd "$SCRIPT_DIR/crm-frontend" && npx ng serve --port $FRONTEND_PORT) > "$SCRIPT_DIR/crm-frontend/frontend.log" 2>&1 &
FRONTEND_PID=$!

# wait for frontend to be ready
printf "   Waiting for frontend"
for i in $(seq 1 60); do
  if curl -s -o /dev/null http://localhost:$FRONTEND_PORT/ 2>/dev/null; then
    echo " ✅"
    break
  fi
  printf "."
  sleep 1
  if [ "$i" -eq 60 ]; then
    echo " ❌ Frontend failed to start. Check crm-frontend/frontend.log"
    kill "$BACKEND_PID" "$FRONTEND_PID" 2>/dev/null || true
    exit 1
  fi
done

# --- save PIDs ---
echo "$BACKEND_PID" > "$PIDFILE"
echo "$FRONTEND_PID" >> "$PIDFILE"

echo ""
echo "═══════════════════════════════════════════════════"
echo "  ✅  Houari CRM Demo is running!"
echo ""
echo "  🌐  App URL:      http://localhost:$FRONTEND_PORT/"
echo "  🔌  Backend API:  http://localhost:$BACKEND_PORT/"
echo "  🔑  Login:        houarizegai / 0000"
echo ""
echo "  PIDs: backend=$BACKEND_PID  frontend=$FRONTEND_PID"
echo "  Logs: crm-rest/backend.log, crm-frontend/frontend.log"
echo "  Stop: ./stop-demo.sh"
echo "═══════════════════════════════════════════════════"
