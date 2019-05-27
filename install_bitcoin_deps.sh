#!/bin/bash
sudo git clone https://github.com/bitcoin-core/secp256k1.git

cd secp256k1

sudo ./autogen.sh

sudo ./configure --enable-module-recovery --prefix=/usr

sudo make

sudo make install

