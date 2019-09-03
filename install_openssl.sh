#!/bin/bash

cd /usr/local/src
sudo wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
sudo tar -zxf openssl-1.1.1c.tar.gz

cd openssl-1.1.1c
sudo ./config
sudo make
# sudo make test # optional
sudo make install

sudo mv /usr/bin/openssl /root/
sudo ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl

# Otherwise:
#   "openssl: error while loading shared libraries: libssl.so.1.1: cannot open shared object file: No such file or directory"
# From https://github.com/openssl/openssl/issues/3993#issuecomment-337632051
sudo ldconfig

