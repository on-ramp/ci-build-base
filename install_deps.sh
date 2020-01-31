#!/bin/bash
apt-get update -y && \
  apt-get install -y \
    libpq-dev \
    liblzma-dev \
    libssl-dev \
    libsecp256k1-dev \
    ssh \
    git \
    curl \
    gpg \
    jq
