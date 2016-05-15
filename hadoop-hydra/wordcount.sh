#!/bin/bash

# test the hadoop cluster by running wordcount

# create input files
rm -r -f input &> /dev/null 
mkdir input
echo "Hello Docker" >input/file2.txt
echo "Hello Hadoop" >input/file1.txt

#delete input folder in HDFS
hdfs dfs -rm -r -f input &> /dev/null
# create input directory on HDFS
hdfs dfs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./input/* input


#delete output folder in HDFS
hdfs dfs -rm -r -f output &> /dev/null
# run wordcount 
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar grep input output "[a-z.]+"

# print the input files
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/*