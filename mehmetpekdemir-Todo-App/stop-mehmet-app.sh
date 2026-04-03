#!/usr/bin/env bash
# stop-mehmet-app.sh — Stop the mehmet Todo app (frontend + backend + MySQL)
# Run from the mehmetpekdemir-Todo-App/ directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="$SCRIPT_DIR/.mehmet-pids"

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
for PORT in 3004 8085; do
  PIDS=$(lsof -ti:$PORT 2>/dev/null || true)
  if [ -n "$PIDS" ]; then
    echo "==> Killing processes on :$PORT (PIDs: $PIDS)..."
    echo "$PIDS" | xargs kill 2>/dev/null || true
  else
    echo "==> Nothing running on :$PORT"
  fi
done

# ── 2. MySQL ──────────────────────────────────────────────────────────────────

if docker ps --format '{{.Names}}' | grep -q '^todo-mysql$'; then
  echo "==> Stopping MySQL container..."
  docker stop todo-mysql
  docker rm todo-mysql
  echo "    MySQL stopped and removed."
elif docker ps -a --format '{{.Names}}' | grep -q '^todo-mysql$'; then
  echo "==> Removing stopped MySQL container..."
  docker rm todo-mysql
  echo "    MySQL container removed."
else
  echo "==> No todo-mysql container found."
fi

echo ""
echo "==> mehmet app stopped."
