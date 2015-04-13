Chef::Log.info("******Downloading a file from Amazon S3.******")

gem_package "aws-sdk" do
  action :install
end

include_recipe "aws"

ruby_block "download-object" do
  block do

      require 'aws-sdk'

      pluginKey = node.elasticsearch['elevate']['plugin-key']
      fileName = node.elasticsearch['elevate']['plugin-file']
      filePath = "/home/ec2user/#{fileName}"

      Chef::Log.info("******pluginKey #{pluginKey}.  fileName #{fileName}.  filePath #{filePath}.  ******")

      s3 = ::Aws::S3::Client.new(region:'eu-west-1')

      resp = s3.get_object(
        response_target: filePath,
        bucket: 'elevate-es-plugins',
        key: pluginKey
      )

    end

  action :run

end