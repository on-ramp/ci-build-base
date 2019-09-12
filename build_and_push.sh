#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: ./build_and_push.sh version (e.g. lts-13.2)"
else
  export LTS_VERSION=$1
  docker build -t coinweb/base-stack:$LTS_VERSION --build-arg lts_version=${LTS_VERSION} .
	docker push coinweb/base-stack:$LTS_VERSION
fi

