#!/bin/bash
sudo docker rm -f $(sudo docker ps -a -q) 

sudo docker rmi $(sudo docker images -q -f "dangling=true")

sudo docker run -d -t --dns 127.0.0.1 -P --name master -h master.kdf5000.com -w /root kdf5000/ubuntu-hadoop &> /dev/null
sudo docker run -d -t --dns 127.0.0.1 -P --name master -h master.kdf5000.com -w /root kdf5000/hydra-hadoop
sudo docker run -d -t --dns 127.0.0.1 -P --name slave$i -h slave$i.kdf5000.com -e JOIN_IP=$FIRST_IP kdf5000/hydra-hadoop
sudo docker exec -it  master /bin/bash