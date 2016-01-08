#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM java:7

ENV ES_PKG_NAME elasticsearch-2.1.1

# Install Elasticsearch.
RUN \
    cd / && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
    tar xf $ES_PKG_NAME.tar.gz && \
    mv $ES_PKG_NAME elasticsearch && \
    /elasticsearch/bin/plugin install mobz/elasticsearch-head

VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

WORKDIR /data

# Define default command.
RUN useradd -ms /bin/bash es
USER es
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
