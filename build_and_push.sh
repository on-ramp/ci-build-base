#!/bin/bash -eu

usage () {
  echo "Usage: $0 NAME VERSION"
  echo ""
  echo "Arguments:"
  echo "  NAME          circleci-image or base-stack|ci-build-base|stacktastic-build"
  echo "  VERSION       target tag, e.g. lts-14.5; for circleci-image it should be one of alpine|ami2-dbmate"
}

[[ $# -eq 2 ]] || { usage; exit 1; }

ARG_NAME="$1"
ARG_TAG="$2"

if [[ "$ARG_NAME" =~ ^circleci-image|base-stack|ci-build-base|stacktastic-build$ ]]
then
  if [[ "$ARG_NAME" == "circleci-image" && "$ARG_TAG" =~ ^alpine|ami2-dbmate$ ]]
  then
    IMGFULL="coinwebltd"
  elif [[ "$ARG_NAME" != "circleci-image" ]]
  then
    IMGFULL="coinweb"
  else
    echo "Unrecognized tag"
    exit 1
  fi
else
  echo "Unrecognized image flavor"
  exit 1
fi

[[ -n $IMGFULL ]] && IMGFULL="${IMGFULL}/${ARG_NAME}:${ARG_TAG}"
#------------------------------------------------------------------------------#

echo "Building $IMGFULL"
set -x
docker build \
    -f "Dockerfile.$ARG_NAME" \
    --build-arg STACK_RESOLVER="$ARG_TAG" \
    -t "$IMGFULL" \
    .
docker push "$IMGFULL"
