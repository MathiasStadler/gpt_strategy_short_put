#!/bin/bash

CONTAINER_NAME="short_put_strategy"
IMAGE_NAME="short_put_strategy:latest"

function usage() {
    echo "Usage: $0 {new|rebuild|update|start|pause|stop|force-stop}"
    exit 1
}

case "$1" in
    new)
        echo "==> Building new Docker image..."
        docker build -t $IMAGE_NAME ./short_put_strategy
        ;;
    rebuild)
        echo "==> Rebuilding Docker image (no cache)..."
        docker build --no-cache -t $IMAGE_NAME ./short_put_strategy
        ;;
    update)
        echo "==> Updating Docker and dependencies on Debian..."
        sudo apt-get update
        sudo apt-get install -y docker.io
        sudo systemctl restart docker
        ;;
    start)
        echo "==> Starting container..."
        docker run -d --name $CONTAINER_NAME --rm $IMAGE_NAME
        ;;
    pause)
        echo "==> Pausing container..."
        docker pause $CONTAINER_NAME
        ;;
    stop)
        echo "==> Stopping container gracefully..."
        docker stop $CONTAINER_NAME
        ;;
    force-stop)
        echo "==> Force stopping container..."
        docker kill $CONTAINER_NAME
        ;;
    *)
        usage