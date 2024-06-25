#!/bin/bash

APP_NAME=$1
ECR_URL=$2
DOCKERFILE_PATH=$3

# Build the Docker image
docker build -t ${APP_NAME} -f ${DOCKERFILE_PATH} .

# Tag the Docker image
docker tag ${APP_NAME}:latest ${ECR_URL}:latest

# Log in to ECR
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_URL}

# Push the Docker image to ECR
docker push ${ECR_URL}:latest
