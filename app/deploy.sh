#!/bin/bash
set -e

APP_NAME="devops-app"
IMAGE="ghcr.io/venkatesh-gangavarapu/devops-learning-journey/myapp:${IMAGE_TAG:-25e5d1720d2da299be94edc7c9dd4f8f4abfc73f}"
PORT=80

echo "Starting deployment for $IMAGE"

echo "Pulling image.."
docker pull $IMAGE

echo "Stopping old container (if exists)..."
docker rm -f $APP_NAME || true

echo "Starting new container..."
docker run -d \
	--name $APP_NAME \
	-p $PORT:5000 \
	$IMAGE

echo "Waiting for application to start..."
sleep 5

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/health)

if [ "$STATUS" != "200" ]; then
	echo "Health check failed (status=$STATUS)"
	echo "Rolling back deployment"
	docker rm -f $APP_NAME
	exit 1
fi

echo "Deployment Successful"

