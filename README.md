# Qbox Disaster Recovery for ES clusters

These docker-compose files have been created for use if Qbox customer clusters become unreachable.

Each docker-compose file uses the official Elastic released images of the last major versions that are **Apache2 licensed**. Versions 1, 2, 5 **do not contain any x-pack features** and Version 6 and 7 are the explicit **Apache2 releases**.

Each `Elasticsearch` version comes with its own instance of a `NGINX` reverse proxy for basic authentication, a `Kibana` instance for visualizations, and a `monitor` for metrics. All monitor instances are the last version of `ElasticHQ` other than ES version 1, which uses `Cerebro`.  
https://www.elastichq.org/  
https://github.com/lmenezes/cerebro

Once everything is up and running, there will be a 3 node Elasticsearch cluster available on port `80`, Kibana on `/kibana`, and a monitor at `/monitor`. _Kibana for version 2 and 5 can only reached at `localhost:5601`._

Be sure to run this repo from an instance large enough to handle your application load, data set, and Elasticsearch containers.

These files were created on MacOS using Docker Desktop.

---

### Prerequisites
Docker: https://docs.docker.com/engine/install/  
Docker-Compose: https://docs.docker.com/compose/install/

---

### How to run

1. Clone the repo and `cd` in the appropriate ES version folder.
1. Set environment variables in the `.env` file.
   - `USER_NAME`="Username to authenticate - can be anything you like."
   - `PASSWORD`="Password used to authenticate - can be anything you like."
   - `SETUP_LOCAL`="Used to create NGINX basic auth credentials - _it is   recommended to point to a location within the ES version directory_."
   - `DATA_LOCATION1/2/3`="Location of where your persistent ES data will live. - it is recommended to always have at least 40% of disk free."
   - `ES_LOG_LOCAL1/2/3`="Location of where ES logs will be written to."
   - `MEM_LIMIT`="How much RAM you want each ES node to have. - Defaults to 2GB."
   - `ALLOCATED_HEAP=`"Set to half of `MEM_LIMIT`- Defaults to 1GB."
     - It is recommended to leave any extra parameters found with in `ALLOCATED_HEAP` as they are needed for that particular ES version.
1. Run `docker-compose up`
2. To stop: `cntrl-c` and `docker-compose down`

----
### Connecting to endpoints.

1. `Elasticsearch` is found on port `80` by running `curl <username>:<password>@localhost`
2. `Kibana` is found by running `curl <username>:<password>@localhost/kibana`
  - _On ES versions 2 and 5, Kibana is found by running `curl localhost:5601`_
3. The monitor is found by running `curl <username>:<password>@localhost/monitor`
  - _**ElasticHQ:** click "connect" once it opens._
  - _**Cerebro:** can only be found by hitting `localhost:9000`._
  - _Once in **Cerebro** enter your credentials (from the `.env` and choose your cluster.)_

----
### Customization and Logging

Customization of Version 1, 2, and 5 is possible via the `elasticsearch.yml` that is found in the config folder of your chosen ES version. Version 6 and 7 can be modified using environment variables in the docker-compose file.

Elasticsearch logs for each node are written to its own file and located in the directories you set in the `.env` file. Logs are rotated and settings can be found in the config folder under either the `logging.yml` or `log4j2.properties` file depending on your ES version. _Non-rotated logs are overwritten on each `docker-compose` start-up._

---

### Contacting Support

Qbox support can be contacted through email or from the Support Portal.

- **Legacy Qbox:** support@qbox.io  
- **Next-Gen Qbox:** next-gen@qbox.io  
- **Support Portal:** https://qboxio.atlassian.net/servicedesk/
  - _You must have a Qbox user to use the Support Portal_

Qbox Support will provide documentation on how to obtain and restore the most recent available copy of your data.

---
### Elasticsearch Plugins

If your ES cluster has plugins installed, you will need to install plugins before any data is restored.

Plugins must be installed on each node and the node restarted. This can be can be done by `docker exec` into your ES containers and running `bin/elasticsearch-plugin install <plugin>`, then running `docker restart <container>`.  These commands can also be added to the `elasticsearch-with-s3.Dockerfile` and will be ran on startup. The `respository-s3` plugin is already added for your convenience.

Please see the `plugins.md` file in the root of this repo for links to plugins. It is also recommended to read through Elastic's plugin information for your ES version as there are different methods of plugin installation that can be tried.  
https://www.elastic.co/guide/en/elasticsearch/plugins/7.10/plugin-management.html


### Cloning via AWS CLI rather than ES restore
You may receive information from Qbox support regarding commands to run to set up restore location, like the following:

```
cluster: [CLUSTER_NAME]
----------------------------------
1. Add the snapshot repository, replace  and  password below
curl -X PUT REPLACE_USER:REPLACE_PASS@localhost/_snapshot/recovery -H 'Content-Type: application/json' -d @- <<BODY
{
  "type": "s3",
  "settings": {
    "bucket": "[BUCKET_WITH_REGION_NAME]",
    "base_path":"[BASE_PATH]",
    "access_key": "[ACCESS_KEY]",
    "secret_key": "[SECRET_KEY]"
  }
}
BODY
```

This encompasses the information needed to authenticate and connect to an S3 bucket.  This can be adapted to be ran as an aws cli command.  Taking the info above and adapting it gives us:
```
# Assumes aws cli tool not installed, using docker instead
docker run -it --entrypoint bash -v $PWD:/backup amazon/aws-cli

# replace the following exports
export AWS_ACCESS_KEY_ID=[ACCESS_KEY]
export AWS_SECRET_ACCESS_KEY=[SECRET_KEY]
export BASE_PATH=[BASE_PATH]
export REGION=[REGION_NAME (found in bucket name)]
export CLUSTER_NAME=[CLUSTER_NAME]

# Legacy Qbox
# list contents
aws s3 --region $REGION ls s3://recovery-qbox-backup-$REGION/$BASE_PATH/

# copy
aws s3 --region $REGION cp s3://recovery-qbox-backup-$REGION/$BASE_PATH /backup/$CLUSTER_NAME/. --recursive

# Next-Gen Qbox
# list contents
aws s3 --region $REGION ls s3://recovery-qbox-backup-ng-$REGION/$BASE_PATH/

# copy
aws s3 --region $REGION cp s3://recovery-qbox-backup-ng-$REGION/$BASE_PATH /backup/$CLUSTER_NAME/. --recursive

```
---

### Disclaimer
By using this repo, you agree to Qbox's Terms of Service:  
https://qbox.io/terms

_Even though extensive testing went into the development of this repo and its files, it should not be used as an alternative to a managed production service provider or be considered a production worthy deployment and should only be used for testing or emergencies. Qbox will not offer any support for its use. Use at your own risk._

---
