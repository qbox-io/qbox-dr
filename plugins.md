### Elasticsearch plugins

Below is a list of available plugins that some Qbox users have installed on their ES clusters.

If a plugin can not be installed with the conventional method (if the download is no longer available, etc.), you may need to identify a download link (http method of install) and [pass a url](https://www.elastic.co/guide/en/elasticsearch/plugins/7.10/plugin-management-custom-url.html) to install.

_Usually for ES versions 2, 5, and 6, the plugin version matches the ES version. However, on ES version 1 and some ES version 2 plugins, this is not always the case. So please review plugin documentation when ever possible._

**Plugins usually must be installed on every node in the cluster, and each node must be restarted after installation**

----

- **elasticsearch/elasticsearch-analysis-icu**    
  webpage: https://github.com/elasticsearch/elasticsearch-analysis-icu  
  url: https://download.elasticsearch.org/elasticsearch/elasticsearch-analysis-icu/elasticsearch-analysis-icu-*VERSION*.zip  


- **elasticsearch/elasticsearch-analysis-kuromoji**  
  webpage: https://github.com/elasticsearch/elasticsearch-analysis-kuromoji  


 - **elasticsearch/elasticsearch-analysis-smartcn**    
   webpage: https://github.com/elasticsearch/elasticsearch-analysis-stempel


  - **elasticsearch/elasticsearch-analysis-phonetic**   
   webpage: https://github.com/elasticsearch/elasticsearch-analysisphonetic  
   url:  https://download.elasticsearch.org/elasticsearch/elasticsearchanalysis-phonetic/elasticsearch-analysis-phonetic-*VERSION*.zip



  - **elasticsearch/elasticsearch-mapper-attachments**  
   webpage: https://github.com/elasticsearch/elasticsearch-mapperattachments  
   url: https://download.elasticsearch.org/elasticsearch/elasticsearchmapper-attachments/elasticsearch-mapper-attachments-*VERSION*.zip


  - **elasticsearch/elasticsearch-delete-by-query**  
     webpage: https://github.com/elasticsearch/delete-by-query


   - **NLPchina/elasticsearch-sql**  
      webpage: https://github.com/NLPchina/elasticsearch-sql  
      url: https://github.com/NLPchina/elasticsearch-sql/releases/download/*VERSION*.0/elasticsearch-sql-*VERSION*.0.zip


  - **jlinn/elasticsearch-analysis-url**  
      webpage: https://github.com/jlinn/elasticsearch-analysis-url  
       url: https://github.com/jlinn/elasticsearch-analysis-url/releases/download/v*VERSION*/elasticsearch-analysis-url-*VERSION*.zip

  - **graphaware/graph-aided-search**  
      webpage: https://github.com/graphaware/graph-aided-search  
      url: com.graphaware.es/graph-aided-search/*VERSION*


  - **solutions.siren/siren-join**  
      webpage: https://github.com/sirensolutions/siren-join  
      url: solutions.siren/siren-join/*VERSION*


  - **couchbaselabs/elasticsearch-transport-couchbase**  
      webpage: https://github.com/couchbaselabs/elasticsearch-transport-couchbase  
      url: https://github.com/couchbaselabs/elasticsearch-transport-couchbase/releases/download/*VERSION*/elasticsearch-transport-couchbase-*VERSION*.zip


  - **elasticsearch/elasticsearch-ingest-attachment**  
      webpage: https://www.elastic.co/guide/en/elasticsearch/plugins/master/ingest-attachment.html


  - **elasticsearch/elasticsearch-ingest-geoip**  
      webpage: https://www.elastic.co/guide/en/elasticsearch/plugins/master/ingest-ingest-geoip.html


  - **elasticsearch/elasticsearch-ingest-user-agent**  
      webpage: https://www.elastic.co/guide/en/elasticsearch/plugins/master/ingest-user-agent.html  


  - **o19s/elasticsearch-learning-to-rank**  
      webpage: https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/#

  - **com.yakaz.elasticsearch.plugins/elasticsearch-analysis-combo**  
     webpage: https://github.com/yakaz/elasticsearch-analysis-combo  
     url: https://repo1.maven.org/maven2/com/yakaz/elasticsearch/plugins/elasticsearch-analysis-combo/*VERSION*/elasticsearch-analysis-combo-*VERSION*.zip

  - **elasticsearch/elasticsearch-lang-javascript**  
      url: https://download.elasticsearch.org/elasticsearchelasticsearchlang-javascript/elasticsearch-lang-javascript-*VERSION*.zip


  - **elasticsearch/elasticsearch-lang-python**  
     url: https://download.elasticsearch.org/elasticsearch/elasticsearch-lang-python/elasticsearch-lang-python-*VERSION*zip


  - **CloudAWS plugin** - for adding AWS snapshot repos to ES version 1 and 2)  (cloud-aws)
     webpage: https://github.com/elastic/elasticsearch-cloud-aws  
     url: https://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.7.1.zip  
       - Examples:  
         1.7.5: `/bin/plugin --url https://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.7.1.zip --install cloud-aws`  
         2.4.6: `/bin/plugin install cloud-aws`


  - **Repository s3** - for adding AWS snapshot repos to ES version 5, 6, 7.  (repository-s3)   
     webpage:
     https://www.elastic.co/guide/en/elasticsearch/plugins/7.10/repository-s3.html
       - Examples:  
         5.6.16: `/bin/elasticsearch-plugin install repository-s3`   
         6.8.23: `/bin/elasticsearch-plugin install repository-s3`  
         7.10.2: `/bin/elasticsearch-plugin install repository-s3`  
