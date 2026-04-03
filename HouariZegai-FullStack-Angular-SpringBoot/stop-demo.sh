#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PIDFILE="$SCRIPT_DIR/.demo-pids"

stopped=0

# --- stop saved PIDs ---
if [ -f "$PIDFILE" ]; then
  while read -r pid; do
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
      kill "$pid" 2>/dev/null && echo "🛑  Stopped PID $pid" && stopped=$((stopped + 1))
    fi
  done < "$PIDFILE"
  rm -f "$PIDFILE"
  sleep 1
fi

# --- stop anything still listening on our ports ---
for port in 8080 4200; do
  for pid in $(lsof -iTCP:$port -sTCP:LISTEN -t 2>/dev/null || true); do
    kill "$pid" 2>/dev/null && echo "🛑  Stopped listener PID $pid on port $port" && stopped=$((stopped + 1))
  done
done

if [ "$stopped" -eq 0 ]; then
  echo "ℹ️  No demo processes were running."
else
  echo "✅  Demo stopped."
fi
