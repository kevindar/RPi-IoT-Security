##Security system based on ubuntu 20.04
FROM ubuntu:20.04

# Export environment variables
ENV COWRIE_GROUP=cowrie \
    COWRIE_USER=cowrie 

ENV LD_LIBRARY_PATH=/usr/local/lib

# Adjust Timezone (for correct logging)
# RUN echo "Asia/Jakarta" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# install packages
RUN apt update && \
    apt install -y \
    wget \
    build-essential

# copy scripts from local repo to docker container
COPY ./scripts /

# add user to run cowrie
RUN groupadd -r -g 1000 ${COWRIE_GROUP} && \
    useradd -r -u 1000 -M -g ${COWRIE_GROUP} ${COWRIE_USER}

# install cowrie
RUN /scripts/cowrie-install.sh

COPY ./cowrie-files/* /cowrie/etc

# install Elastic, Logstash and Kibana
RUN /scripts/elk-setup.sh

# install Snort3
RUN /scripts/snort3-install.sh

COPY /scripts/snort-files/* /usr/local/etc/pulledpork3

VOLUME [ "/cowrie/var", "/cowrie/etc", "/snort3/etc", "/snort3/log", "/opt/elasticsearch/data" ]

EXPOSE 22 5601 5044 9200 9300