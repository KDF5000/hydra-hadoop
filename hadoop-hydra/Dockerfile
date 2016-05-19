# distributed hadoop
FROM kdf5000/ubuntu-hadoop
MAINTAINER KDF5000 <kdf5000@163.com>

ENV HADOOP_HOME /usr/local/hadoop
RUN mv $HADOOP_HOME/etc/hadoop/core-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old    \
    && mv $HADOOP_HOME/etc/hadoop/hdfs-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old \
    && mv $HADOOP_HOME/etc/hadoop/yarn-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old \
    && mv $HADOOP_HOME/etc/hadoop/slaves  $HADOOP_HOME/etc/hadoopslaves.old

ENV HBASE_HOME /usr/local/hbase
RUN mv $HBASE_HOME/conf/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml.old \
    && mv $HBASE_HOME/conf/regionservers $HBASE_HOME/conf/regionservers.old

ADD conf/hadoop/* $HADOOP_HOME/etc/hadoop/
ADD conf/hbase/* $HBASE_HOME/conf/

ADD start-ssh-serf.sh  /root/
ADD wordcount.sh /root/
RUN chmod a+x /root/start-ssh-serf.sh && chmod a+x /root/wordcount.sh 

#format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -force -format 

CMD '/root/start-ssh-serf.sh'; 'bash'