#!/bin/bash

echo "Starting Maven Build ..."
mvn clean package

if [ $? -ne 0 ]; then
  echo "Maven Build failed!"
  exit 1
fi

if [ ! -f ./target/SpringAI-Demo-1.0.0.jar ]; then
  echo ".jar file not found. Please make sure that the Maven Build finishes!"
  exit 1
fi

echo "Starting Docker Build ..."
docker build -t springai-demo -f app/Dockerfile .

if [ $? -ne 0 ]; then
  echo "Docker Build failed!"
  exit 1
fi

echo "Build finished!"
