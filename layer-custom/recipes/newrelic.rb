user 'newrelic' do
	system true
end

# include_recipe "newrelic::java_agent"

node.set['newrelic_meetme_plugin'] = {
	'license' => node['newrelic']['license'],
	'services' => {
		'elasticsearch'	=> {
			'name' => node['elasticsearch']['cluster']['name'],
			'host' => 'localhost',
			'port' => 9200
		}
	}
}

include_recipe "newrelic_meetme_plugin"