FROM elasticsearch:5.6.16

RUN bin/elasticsearch-plugin install repository-s3
