#
# Cookbook Name:: LAMP
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum-epel"

service 'pushy-client' do
  action [:enable, :start]
end
