#!/bin/bash -eu

usage () {
  echo "Usage: $0 NAME VERSION"
  echo ""
  echo "Arguments:"
  echo "  NAME          base-stack|ci-build-base"
  echo "  VERSION       target tag, e.g. lts-14.5"
}

[[ $# -eq 2 ]] || { usage; exit 1; }

ARG_NAME="$1"
ARG_TAG="$2"

if ! [[ "$ARG_NAME" =~ ^base-stack|ci-build-base$ ]]
then
  echo "Name should be either base-stack or ci-build-base"
  exit 1
fi

#------------------------------------------------------------------------------#

IMGFULL="coinweb/$ARG_NAME:$ARG_TAG"
echo "Building $IMGFULL"
set -x
docker build \
    -f "Dockerfile.$ARG_NAME" \
    --build-arg lts_version="$ARG_TAG" \
    -t "$IMGFULL" \
    .
docker push "$IMGFULL"
