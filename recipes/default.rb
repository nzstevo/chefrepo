#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

package 'apache2'

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
  owner 'root'
  variables(
   :motd => "this is the message mate!",
   :myenvars => "#{node[:testing][:att1]}"
)
end

service "apache2" do
  action :restart
end
