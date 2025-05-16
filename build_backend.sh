#!/bin/bash

echo "########################"
echo "                        "
echo "Starting Maven Build ..."
echo "                        "
echo "########################"
mvn clean package

if [ $? -ne 0 ]; then
  echo "Maven Build failed!"
  exit 1
fi

JAR_SOURCE=./target/SpringAI-Demo-1.0.0.jar
JAR_DEST=./docker/backend/SpringAI-Demo-1.0.0.jar

if [ ! -f "$JAR_SOURCE" ]; then
  echo ".jar file not found at $JAR_SOURCE. Please make sure that the Maven Build finishes!"
  exit 1
fi

echo "########################"
echo "                        "
echo "Copying .jar file to backend/ directory ..."
echo "                        "
if [ -f "$JAR_DEST" ]; then
  rm "$JAR_DEST"
fi

cp "$JAR_SOURCE" "$JAR_DEST"

if [ $? -ne 0 ]; then
  echo "Copying .jar file to /backend directory failed!"
  exit 1
fi

echo "########################"
echo "                        "
echo "Starting Docker Build ..."
echo "                        "
echo "########################"
docker build -t springboot-app -f docker/backend/Dockerfile docker/backend

if [ $? -ne 0 ]; then
  echo "Docker Build failed!"
  exit 1
fi

echo "########################"
echo "                        "
echo "Starting Compose Build ..."
echo "                        "
echo "########################"
docker compose build springboot-app

if [ $? -ne 0 ]; then
  echo "Compose Build failed!"
  exit 1
fi

echo "✅ Build finished successfully!"