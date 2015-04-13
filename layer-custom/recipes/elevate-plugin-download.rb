Chef::Log.info("******Downloading a file from Amazon S3.******")

gem_package "aws-sdk" do
  action :install
end

include_recipe "aws"

version = node.elasticsearch['elevate']['version']
fileName = "elasticsearch-elevate-plugin-#{version}.zip"
localPath = "/home/ec2user/#{fileName}"
remotePath = "/release/com/elevatedirect/elasticsearch/plugin/#{fileName}"

aws_s3_file localPath do
  bucket 'elevate-es-plugins'
  remote_path remotePath
end
