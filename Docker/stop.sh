#!/bin/bash

echo "Stopping Google Colab container..."
docker compose down

echo "Container stopped."
echo ""
echo "Note: docker-compose.override.yml is kept for future runs."
echo "To remove it manually, run: rm docker-compose.override.yml"
