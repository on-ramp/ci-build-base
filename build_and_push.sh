#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: ./build_and_push.sh version (e.g. 0.0.1)"
else
  docker build -t coinweb/ci-build-base:$1 .
	docker push coinweb/ci-build-base:$1
fi

