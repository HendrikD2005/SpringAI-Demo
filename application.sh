#!/bin/bash

case "$1" in
    "start")
        echo "Starting containers..."
        if docker compose up -d; then
            echo "✅ Containers started successfully"
            echo -e "\nContainer Status:"
            docker compose ps
        else
            echo "❌ Error starting containers"
        fi
        ;;
    "stop")
        echo "Stopping containers..."
        if docker compose down; then
            echo "✅ Containers stopped successfully"
        else
            echo "❌ Error stopping containers"
        fi
        ;;
    "start-silent")
        echo "Starting containers silently..."
        if docker compose up -d >/dev/null 2>&1; then
            echo "✅ Containers started successfully"
            echo -e "\nRunning containers:"
            docker compose ps --format "table {{.Name}}\t{{.Status}}"
        else
            echo "❌ Error starting containers"
        fi
        ;;
    "stop-silent")
        echo "Stopping containers silently..."
        if docker compose down >/dev/null 2>&1; then
            echo "✅ Containers stopped successfully"
        else
            echo "❌ Error stopping containers"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|start-silent|stop-silent}"
        echo "  start:        Starts all containers with full output"
        echo "  stop:         Stops all containers with full output"
        echo "  start-silent: Starts all containers silently"
        echo "  stop-silent:  Stops all containers silently"
        exit 1
        ;;
esac