#
# Cookbook Name:: LAMP
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# install mysql server and client
include_recipe "mysql::client"
include_recipe "mysql::server"

# include mysql gem
include_recipe "database::mysql"

# mysql connection string
mysql_connection_info = {
  :host     => node['LAMP']['MySQL']['host'],
  :username => 'root',
  :port     => node['LAMP']['MySQL']['port'],
  :password => node['mysql']['server_root_password']
}

# create database for DevOps
mysql_database node['LAMP']['MySQL']['database'] do
  connection mysql_connection_info
  action :create
end

# create user for DevOps database
mysql_database_user node['LAMP']['MySQL']['user'] do
  connection mysql_connection_info
  password node['LAMP']['MySQL']['password']
  action :create
end


# grant permission for DevOps
mysql_database_user node['LAMP']['MySQL']['user'] do
  connection mysql_connection_info
  password node['LAMP']['MySQL']['password']
  database_name node['LAMP']['MySQL']['database']
  host node['LAMP']['MySQL']['host']
  privileges [:all]
  action :grant
end

# flush the privileges
mysql_database 'flush the privileges' do
  connection mysql_connection_info
  sql        'flush privileges'
  action     :query
end
