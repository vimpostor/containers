#!/usr/bin/env bash

set -e

IMAGENAME="$(basename "$PWD")"
echo "Building $IMAGENAME"
podman build -t "$IMAGENAME" .
podman login docker.io
podman push "$IMAGENAME:latest" "vimpostor/$IMAGENAME:latest"
