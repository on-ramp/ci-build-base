#!/bin/bash
git clone https://github.com/bitcoin-core/secp256k1.git

cd secp256k1

./autogen.sh

./configure

make

sudo make install

