#!/bin/sh

IMAGE_NAME=ec2setup

echo "Building image needed to execute ec2setup script..."
docker build -t ${IMAGE_NAME} .
docker run -it --rm \
    -e REGION \
    -e USER \
    -e AWS_ACCESS_KEY \
    -e AWS_SECRET_KEY \
    -e SWARM_ID \
    ${IMAGE_NAME} "$@"
