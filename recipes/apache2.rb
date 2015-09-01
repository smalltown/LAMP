#
# Cookbook Name:: LAMP
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

temp = node.chef_environment.match('_(.*)')
simple_phase = temp[1].to_s

# prepare deployment information from data bag
deployInfo = data_bag_item('deployment', "#{node.chef_environment}_DevOps_site80")

include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_php5'

# disable default site
apache_site '000-default' do
  enable false
end

# create port 80 virtual host document root
directory "#{node['LAMP']['Apache2']['document_root']}" do
  action :create
  recursive true
end


# write site 80
template "#{node['LAMP']['Apache2']['document_root']}/index.php" do
  source 'index.php.erb'
  owner 'root'
  group 'root'
  mode '0644'

  variables({
   :version => deployInfo['version']['deploy'],
   :timestamp => deployInfo['timestamp']['deploy']
  })
end


template "#{node['LAMP']['Apache2']['document_root']}/info.php" do
  source 'info.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# enable site 80
web_app "#{node['LAMP']['Apache2']['site80']}" do
  server_name node['LAMP']['Apache2']['server_name']
  server_port 80
  server_aliases [node['LAMP']['Apache2']['server_name']]
  aliases "#{node['LAMP']['Apache2']['alias']} #{node['LAMP']['Apache2']['document_root']}"
  docroot node['LAMP']['Apache2']['document_root']
  rewrite 'On'
end
