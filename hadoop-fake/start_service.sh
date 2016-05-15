#!/bin/bash
#set env
echo "make profile work"
source /etc/profile

# start hadoop
echo "start dfs..."
/usr/local/hadoop/sbin/start-dfs.sh

echo "start yarn..."
/usr/local/hadoop/sbin/start-yarn.sh

#start hbase
echo "start hbase..."
/usr/local/hbase/bin/start-hbase.sh