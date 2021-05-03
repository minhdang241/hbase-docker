#!/bin/bash

#start ssh deamon

service ssh start

cd /usr/local/hbase/bin/

./start-hbase.sh

hbase thrift start -p 8081 --infoport 8082

tail -f /dev/null