FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.8.23

RUN su elasticsearch
RUN bin/elasticsearch-plugin install repository-s3 --batch
