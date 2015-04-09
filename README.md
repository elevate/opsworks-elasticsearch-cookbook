opsworks-elasticsearch-cookbook
===============================

AWS OpsWorks Elasticsearch sample cookbook referenced in [this blog] (http://blogs.aws.amazon.com/application-management/post/Tx3MEVKS0A4G7R5/Deploying-Elasticsearch-with-OpsWorks)


- Avoid Dependency On github.com 

Vendor Dependencies:
------------------------------
berks vendor

copy 'layer-custom' into the berks-cookbooks folder 

zip berks-cookbooks to elevate-opsworks-elasticsearch-cookbooks.zip 
copy up to elevate-chef s3 bucket 

run opsworks