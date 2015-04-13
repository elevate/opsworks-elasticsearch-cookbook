Chef::Log.info("******Downloading a file from Amazon S3.******")

gem_package "aws-sdk" do
  action :install
end

include_recipe "aws"

pluginKey = node.elasticsearch['elevate']['plugin-key']
fileName = node.elasticsearch['elevate']['plugin-file']
filePath = "/home/ec2user/#{fileName}"

aws_s3_file filePath do
  bucket 'elevate-es-plugins'
  remote_path filePath
end
