#!/bin/bash
apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    cmake \
    postgresql \
    postgresql-server-dev-12
