FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

RUN su elasticsearch
RUN bin/elasticsearch-plugin install repository-s3 --batch
