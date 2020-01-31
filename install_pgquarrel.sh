#!/bin/bash
curl -L -o pgquarrel.tar.gz https://github.com/eulerto/pgquarrel/archive/pgquarrel_0_6_0.tar.gz
mkdir pgquarrel && tar -xzf pgquarrel.tar.gz -C pgquarrel --strip-components 1
cd pgquarrel
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/pgquarrel -DCMAKE_PREFIX_PATH=/usr/lib/postgresql/12 .
make
make install

echo 'export PATH=$PATH:/usr/local/pgquarrel/bin' >> ~/.bashrc 
source ~/.bashrc

ln -s /usr/local/pgquarrel/lib/libmini.so /usr/lib/libmini.so
