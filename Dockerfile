FROM circleci/buildpack-deps:trusty-curl as base

WORKDIR /opt/ci-base

COPY install_deps.sh .
RUN sudo sh /opt/ci-base/install_deps.sh 

COPY install_bitcoin_deps.sh .
RUN sudo sh /opt/ci-base/install_bitcoin_deps.sh


RUN sudo rm -rf /opt/ci-base/*


