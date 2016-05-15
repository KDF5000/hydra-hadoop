#!/bin/bash

# start sshd
echo "start sshd..."
service ssh start

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members

echo -e "\nhadoop-cluster-docker developed by KDF5000 <kdf5000@163.com>"