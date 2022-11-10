#!/bin/bash
set -e

cd "$(dirname -- "$0")/../"
echo "Changed directory to $(pwd)"

echo "Building image..."
docker build -t squidfunk/mkdocs-material:6.0.2 -f scripts/Dockerfile .
echo "Done building image."

exit 0