Chef::Log.info("******Installing Elevate Elasticsearch Plugin.******")

script "elevate_plugin_install" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -i elevate -u file:///home/ec2user/#{node.elasticsearch['elevate']['plugin-file']}
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/elevate") }
end

notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]

