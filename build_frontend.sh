#!/bin/bash

echo "Building Frontend Docker image..."

# Zum Frontend-Verzeichnis navigieren
cd src/main/Frontend || {
    echo "❌ Frontend directory not found!"
    exit 1
}

# Überprüfen, ob Dockerfile existiert
if [ ! -f Dockerfile ]; then
    echo "❌ Dockerfile not found in Frontend directory!"
    exit 1
fi

# Docker Build ausführen
echo "Starting Docker build process..."
if docker build -t springai-frontend:latest .; then
    echo "✅ Frontend Docker image built successfully!"
    echo -e "\nImage details:"
    docker images | grep springai-frontend
else
    echo "❌ Error building Frontend Docker image"
    exit 1
fi

cd - > /dev/null