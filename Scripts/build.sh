#!/bin/bash

# Config
BASE_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-base:latest"

DOTNET_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-dotnet:latest"
NODE_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-node:latest"
PYTHON_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-python:latest"

echo "--- STEP 3: Building Base Docker Image ---"
docker build -t "${BASE_IMAGE_NAME}" ./BaseContainer

echo "--- STEP 3: Building .NET Docker Image ---"
docker build -t "${DOTNET_IMAGE_NAME}" ./Variants/dotnet

echo "--- STEP 3: Building Node.js Docker Image ---"
docker build -t "${NODE_IMAGE_NAME}" ./Variants/node

echo "--- STEP 3: Building Python Docker Image ---"
docker build -t "${PYTHON_IMAGE_NAME}" ./Variants/python

echo "--- LOOP COMPLETE ---"
