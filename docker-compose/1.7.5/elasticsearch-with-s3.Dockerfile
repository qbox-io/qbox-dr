FROM elasticsearch:1.7.5

RUN bin/plugin --url https://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.7.1.zip --install cloud-aws
