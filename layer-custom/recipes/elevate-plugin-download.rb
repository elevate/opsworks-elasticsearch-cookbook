gem_package "aws-sdk-v1" do
  action :install
end

chef_gem "aws-sdk-v1"

version = node.elasticsearch['elevate']['version']
accessKey = node.elasticsearch['elevate']['plugin_access_key']
secretKey = node.elasticsearch['elevate']['plugin_secret_key']
fileName = "elasticsearch-elevate-plugin-#{version}.zip"
localPath = "/home/ec2-user/#{fileName}"
remotePath = "/release/com/elevatedirect/elasticsearch/plugin/elasticsearch-elevate-plugin/#{version}/#{fileName}"

ruby_block "download-object" do

  block do
      require 'aws-sdk-v1'

	  # http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3.html
      AWS.config(:access_key_id => accessKey, :secret_access_key => secretKey)
      
      s3 = AWS::S3.new
      s3obj = s3.buckets['elevate-es-plugins'].objects[remotePath]
      File.open(localPath, 'wb') do |file|
        s3obj.read do |chunk|
          file.write(chunk)
        end
      end
  end

  action :run
end
