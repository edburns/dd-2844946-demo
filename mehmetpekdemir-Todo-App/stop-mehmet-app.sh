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

  if [ -n "${FRONTEND_PID:-}" ] && kill -0 "$FRONTEND_PID" 2>/dev/null; then
    echo "==> Stopping frontend (PID $FRONTEND_PID)..."
    kill "$FRONTEND_PID" 2>/dev/null || true
  else
    echo "==> Frontend not running via PID file; killing :3004 if found..."
    kill "$(lsof -ti:3004)" 2>/dev/null || true
  fi

  if [ -n "${BACKEND_PID:-}" ] && kill -0 "$BACKEND_PID" 2>/dev/null; then
    echo "==> Stopping backend (PID $BACKEND_PID)..."
    kill "$BACKEND_PID" 2>/dev/null || true
  else
    echo "==> Backend not running via PID file; killing :8085 if found..."
    kill "$(lsof -ti:8085)" 2>/dev/null || true
  fi

  rm -f "$PID_FILE"
else
  echo "==> No PID file found; killing by port..."
  kill "$(lsof -ti:3004)" 2>/dev/null && echo "    Stopped frontend (:3004)" || echo "    No process on :3004"
  kill "$(lsof -ti:8085)" 2>/dev/null && echo "    Stopped backend (:8085)"  || echo "    No process on :8085"
fi

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
