FROM elasticsearch:2.4.6

RUN bin/plugin install cloud-aws
