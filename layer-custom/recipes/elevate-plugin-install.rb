Chef::Log.info("******Installing Elevate Elasticsearch Plugin.******")

version = node.elasticsearch['elevate']['version']
fileName = "elasticsearch-elevate-plugin-#{version}.zip"
localPath = "/home/ec2-user/#{fileName}"

script "elevate_plugin_install" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
	plugin -r elevate
  	plugin -i elevate -u file://#{localPath}
  	EOH
	
	notifies :restart, 'service[elasticsearch]'
end