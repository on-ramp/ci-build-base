#!/bin/bash

if [[ $# -lt 2 ]]
then
  echo "Usage: ./build_and_push.sh name (base-stack or ci-build-base) version (e.g. lts-14.5)"
elif [[ $1 == "base-stack" ]] || [[ $1 == "ci-build-base" ]]
then
  echo "coinweb/$1:$2"
  docker build -t coinweb/$1:$2 -f Dockerfile.$1 --build-arg lts_version=$2 .
	docker push coinweb/$1:$2
else
  echo "Name should be either base-stack or ci-build-base"
fi

