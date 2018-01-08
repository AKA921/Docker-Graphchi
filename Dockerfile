FROM phusion/baseimage:0.9.22
MAINTAINER UPUP

RUN apt-get update && apt-get install -y wget unzip zlib1g-dev build-essential
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/GraphChi/graphchi-cpp/archive/master.zip && unzip master.zip && rm master.zip
RUN cd graphchi-cpp-master && make 

VOLUME /datasets
WORKDIR /datasets

CMD ["/sbin/init"]

#sudo docker cp /home/upup/Desktop/graphdata 71240874ebd4:/upup
#root@71240874ebd4:/graphchi-cpp-master# bin/example_apps/pagerank file /upup/test/facebook_combined.txt