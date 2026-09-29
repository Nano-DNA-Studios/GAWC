#!/bin/bash

# Config
BASE_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-base:latest"

DOTNET_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-dotnet:latest"
NODE_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-node:latest"
PYTHON_IMAGE_NAME="ghcr.io/nano-dna-studios/gawc-python:latest"

./Scripts/build.sh

echo "--- STEP 4: Transferring and Loading Image Directly ---"
docker save "${BASE_IMAGE_NAME}" | ssh rnaserver "docker load"

echo "--- STEP 4: Transferring and Loading Image Directly ---"
docker save "${DOTNET_IMAGE_NAME}" | ssh rnaserver "docker load"

echo "--- STEP 4: Transferring and Loading Image Directly ---"
docker save "${NODE_IMAGE_NAME}" | ssh rnaserver "docker load"

echo "--- STEP 4: Transferring and Loading Image Directly ---"
docker save "${PYTHON_IMAGE_NAME}" | ssh rnaserver "docker load"
