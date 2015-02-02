script "install_elevate_plugin" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -i elevate --url #{node.elasticsearch['elevate']['plugin-url']}
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/elevate") }
end

#notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
