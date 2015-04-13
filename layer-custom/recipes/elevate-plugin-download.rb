gem_package "aws-sdk" do
  action :install
end

version = node.elasticsearch['elevate']['version']
fileName = "elasticsearch-elevate-plugin-#{version}.zip"
localPath = "/home/ec2user/#{fileName}"
remotePath = "/release/com/elevatedirect/elasticsearch/plugin/#{fileName}"

ruby_block "download-object" do

  block do
      require 'aws-sdk'

      s3 = ::Aws::S3::Client.new(region:'eu-west-1')

      resp = s3.get_object(
        response_target: localPath,
        bucket: 'elevate-es-plugins',
        key: remotePath
      )
  end
  
  action :run
end
