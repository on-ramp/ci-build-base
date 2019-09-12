# In the past we used to depend on:
#   circleci/buildpack-deps:trusty-curl
#
# The main reason to change the base image was that
# the distribution conflicted with GHC linking phase
# with c libraries (e.g. hookup depends on openssl and
# it was impossible to build the project using the previous
# image).
ARG lts_version

FROM fpco/stack-build:$lts_version as base

WORKDIR /opt/ci-base

COPY install_deps.sh .
RUN sudo sh /opt/ci-base/install_deps.sh

COPY install_bitcoin_deps.sh .
RUN sudo sh /opt/ci-base/install_bitcoin_deps.sh

COPY clean.sh /opt
RUN sudo sh /opt/clean.sh

WORKDIR /opt


