#!/bin/bash

# --- Wasl Development Environment Runner ---
# This script ensures Docker is running and starts the full application stack.

echo ">>> Checking for Docker..."

if ! docker info > /dev/null 2>&1; then
  echo "!!! Docker is not running or is not installed."
  echo "Please start Docker and try again."
  exit 1
fi

echo ">>> Docker is running. Starting the Wasl environment..."

# --build: Rebuilds images if the Dockerfile or context has changed.
# --remove-orphans: Removes containers for services that are no longer in the compose file.
# -d: Run in detached mode.
# Use docker-compose v2 command 'docker compose'
docker compose up --build --remove-orphans -d

echo "--------------------------------------------------------"
echo "✅ Wasl environment is starting up in the background."
echo ""
echo "You can view logs with: docker compose logs -f"
echo "You can stop it with: docker compose down"
echo ""
echo "Services:"
echo "  - Python API Server: http://localhost:8000/docs"
echo "  -Rust Sync Server:   ws://localhost:8080/ws"
echo "--------------------------------------------------------"
