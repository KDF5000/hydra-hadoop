# distributed hadoop
FROM kdf5000/ubuntu-hadoop
MAINTAINER KDF5000 <kdf5000@163.com>

ENV HADOOP_HOME /usr/local/hadoop
RUN mv $HADOOP_HOME/etc/hadoop/core-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old    \
    && mv $HADOOP_HOME/etc/hadoop/hdfs-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old \
    && mv $HADOOP_HOME/etc/hadoop/yarn-site.xml  $HADOOP_HOME/etc/hadoop/core-site.xml.old \
    && mv $HADOOP_HOME/etc/hadoop/slaves  $HADOOP_HOME/etc/hadoopslaves.old

ADD conf/* $HADOOP_HOME/etc/hadoop/
ADD start-ssh-serf.sh  /root/
ADD wordcount.sh /root/
RUN chmod a+x /root/start-ssh-serf.sh && chmod a+x /root/wordcount.sh 

#format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -force -format 

CMD '/root/start-ssh-serf.sh'; 'bash'