# In the past we used to depend on:
#   circleci/buildpack-deps:trusty-curl
#
# The main reason to change the base image was that
# the distribution conflicted with GHC linking phase
# with c libraries (e.g. hookup depends on openssl and
# it was impossible to build the project using the previous
# image).
FROM fpco/stack-build:lts-13.20 as base

WORKDIR /opt/ci-base

COPY install_deps.sh .
RUN sudo sh /opt/ci-base/install_deps.sh

# Haskell is already installed on this base image
#
#COPY install_haskell.sh .
#RUN sudo sh /opt/ci-base/install_haskell.sh

COPY install_bitcoin_deps.sh .
RUN sudo sh /opt/ci-base/install_bitcoin_deps.sh

# Openssl is already installed on this base image
#
#COPY install_openssl.sh .
#RUN sudo sh /opt/ci-base/install_openssl.sh

COPY clean.sh /opt
RUN sudo sh /opt/clean.sh

WORKDIR /opt


