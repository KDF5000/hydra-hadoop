#!/bin/bash
####################################
# @function: resize the cluster, excuting before start-container.sh
# @author: kdf5000 <kdf5000@163.com>
# @date: 2016-05-15
####################################'
echo $#

if [ $# -lt 1 ]
then
	echo "Usage: ./resize_containter.sh cluster_num"
	exit 1
fi

size=$1
if [ $size -lt 3 ]
then
    echo "the cluster's amout must be bigger than 2"
    exit 1
fi

cd hadoop-hydra

echo "master.kdf5000.com" > conf/slaves

slave_num=$[size - 1]
#echo $slave_num
for i in `seq $slave_num`
do
	echo "slave$i.kdf5000.com" >> conf/slaves
done

#remove old image
sudo docker rm -f master
#rebuild images
sudo docker build -t="kdf5000/hydra-hadoop" .
