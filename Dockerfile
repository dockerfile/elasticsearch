#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM ggtools/java8

ENV ES_PKG_NAME elasticsearch-1.5.0

# Install Elasticsearch.
RUN \
  cd / && \
  curl -k https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz | \
  tar -xvzf - && \
  mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ADD docker-entry-point.sh /elasticsearch/bin/docker-entry-point.sh

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT [ "/elasticsearch/bin/docker-entry-point.sh" ]
CMD [""]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
