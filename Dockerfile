#
# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#
 
# Pull base image.
FROM dockerfile/java
 
# Install ElasticSearch.
RUN cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz
RUN cd /tmp && tar xvzf elasticsearch-1.1.1.tar.gz && rm -f elasticsearch-1.1.1.tar.gz
RUN mv /tmp/elasticsearch-1.1.1 /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR "/data"

# Define default command.
ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
