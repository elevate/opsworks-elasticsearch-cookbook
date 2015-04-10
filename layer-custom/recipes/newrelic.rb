user 'newrelic' do
	system true
end

# include_recipe "newrelic::java_agent"

include_recipe "newrelic_meetme_plugin"