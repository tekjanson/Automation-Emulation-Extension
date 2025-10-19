#!/bin/bash
# Helper to run Chromium inside the devcontainer with remote debugging enabled
set -euo pipefail

PORT=${1:-9222}
USER_DATA_DIR=${2:-/workspace/.chrome-profile}

mkdir -p "$USER_DATA_DIR"

exec chromium \
  --no-sandbox \
  --disable-gpu \
  --headful \
  --remote-debugging-address=0.0.0.0 \
  --remote-debugging-port="$PORT" \
  --user-data-dir="$USER_DATA_DIR" "$@"
