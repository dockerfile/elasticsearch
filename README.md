## Elasticsearch Dockerfile


This repository contains **Dockerfile** of [Elasticsearch v2.1.1](http://www.elasticsearch.org/) for [Docker](https://www.docker.com/) including some helpful plugin(s).

## Plugins included
- `mobz/elasticsearch-head`


### Base Docker Image

* [dockerfile/java:7](http://dockerfile.github.io/#/java)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Build image from Dockerfile, from directory containing `Dockerfile`:
      - `docker build -t "some_image_name" .`


### Usage

   ```
    docker run -d -p 9200:9200 -p 9300:9300 -v "$PWD/data":/data <image_name> /elasticsearch/bin/elasticsearch -Des.network.host=::0
   ```

Above command will automatically create `data` directory in folder where you run it. If you want to have `data` in some other directory, change the part `$PWD/data` to desired path.

After few seconds, open `http://<host>:9200` or run `curl http://<host>:9200/` to verify it is all good. Otherwise, check `<data-dir>/log/elasticsearch.log` file.

HEAD plugin is available on address `http://<host>:9200/_plugin/head`
