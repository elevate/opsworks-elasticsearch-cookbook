Chef::Log.info("******Installing Elevate Elasticsearch Plugin.******")

script "elevate_plugin_install" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
	plugin -r elevate
  	plugin -i elevate -u file:///home/ec2user/#{node.elasticsearch['elevate']['plugin-file']}
  	EOH
	
	notifies :restart, 'service[elasticsearch]'
end