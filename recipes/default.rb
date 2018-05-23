#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

package 'apache2'

instance = search("aws_opswords_instance", "self:true").first
hostname1 = #{instance['hostname']}

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
  owner 'root'
  variables(
   :motd => "this is the message mate!",
   :hostname => hostname1

)
end

service "apache2" do
  action :restart
end
