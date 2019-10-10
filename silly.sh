#!/bin/bash

#echo "This is a silly script" > /tmp/silly.txt



wget http://memcached.org/latest
tar -zxvf memcached-1.5.19.tar.gz
cd memcached-1.5.19
./configure && make && make test && sudo make install
cd ..

git clone http://github.com/brianfrankcooper/YCSB.git
cd YCSB
mvn -pl site.ycsb:memcached-binding -am clean package
cd ..

./bin/ycsb load memcached -s -P workloads/workloada > outputLoad.txt
./bin/ycsb run memcached -s -P workloads/workloada > outputRun.txt
