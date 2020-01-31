#!/bin/bash
rm -rf /var/lib/apt/lists/*
[ -d /opt/ci-base ] && rm -rf /opt/ci-base || true
[ -d /opt/ci-base-haskell ] && rm -rf /opt/ci-base-haskell || true
