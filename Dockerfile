#
# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#
 
# Pull base image.
FROM dockerfile/java
 
# Install ElasticSearch.
 
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz
RUN tar xzf elasticsearch-1.1.1.tar.gz
RUN mv elasticsearch-1.1.1 /opt/elasticsearch
RUN rm elasticsearch-1.1.1.tar.gz
 
# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
 
# Define an entry point.
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
