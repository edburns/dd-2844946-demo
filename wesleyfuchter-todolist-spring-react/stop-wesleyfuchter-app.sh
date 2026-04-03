#!/usr/bin/env bash
# stop-wesleyfuchter-app.sh — Stop the wesleyfuchter todolist app (frontend + backend + PostgreSQL)
# Run from the wesleyfuchter-todolist-spring-react/ directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="$SCRIPT_DIR/.wesleyfuchter-pids"

# ── 1. Frontend & Backend ─────────────────────────────────────────────────────

if [ -f "$PID_FILE" ]; then
  # shellcheck source=/dev/null
  source "$PID_FILE"
  [ -n "${FRONTEND_PID:-}" ] && kill "$FRONTEND_PID" 2>/dev/null || true
  [ -n "${BACKEND_PID:-}"  ] && kill "$BACKEND_PID"  2>/dev/null || true
  rm -f "$PID_FILE"
fi

# Always kill by port — npm start spawns child processes that outlive the
# saved PID (e.g. webpack-dev-server continues after the npm parent dies).
for PORT in 3010 8090; do
  PIDS=$(lsof -ti:$PORT 2>/dev/null || true)
  if [ -n "$PIDS" ]; then
    echo "==> Killing processes on :$PORT (PIDs: $PIDS)..."
    echo "$PIDS" | xargs kill 2>/dev/null || true
  else
    echo "==> Nothing running on :$PORT"
  fi
done

# ── 2. PostgreSQL ─────────────────────────────────────────────────────────────

if docker ps --format '{{.Names}}' | grep -q '^todolistdb$'; then
  echo "==> Stopping PostgreSQL container..."
  docker stop todolistdb
  docker rm todolistdb
  echo "    PostgreSQL stopped and removed."
elif docker ps -a --format '{{.Names}}' | grep -q '^todolistdb$'; then
  echo "==> Removing stopped PostgreSQL container..."
  docker rm todolistdb
  echo "    PostgreSQL container removed."
else
  echo "==> No todolistdb container found."
fi

echo ""
echo "==> wesleyfuchter app stopped."
