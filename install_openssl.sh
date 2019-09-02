#!/bin/bash

cd /usr/local/src
sudo wget https://www.openssl.org/source/openssl-1.0.2-latest.tar.gz
sudo tar -zxf openssl-1.0.2-latest.tar.gz

cd openssl-1.0.2s
sudo ./config
sudo make
# make test # optional
sudo make install

sudo mv /usr/bin/openssl /root/
sudo ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl

