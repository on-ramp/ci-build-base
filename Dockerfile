FROM circleci/buildpack-deps:trusty-curl as base

WORKDIR /opt/ci-base

COPY install_deps.sh .
RUN sudo sh /opt/ci-base/install_deps.sh

COPY install_haskell.sh .
RUN sudo sh /opt/ci-base/install_haskell.sh

COPY install_bitcoin_deps.sh .
RUN sudo sh /opt/ci-base/install_bitcoin_deps.sh

COPY install_openssl.sh .
RUN sudo sh /opt/ci-base/install_openssl.sh

COPY clean.sh /opt
RUN sudo sh /opt/clean.sh

WORKDIR /opt


