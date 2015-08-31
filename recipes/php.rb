#
# Cookbook Name:: LAMP
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php" do
  action :install
end

package "php-mysql" do
  action :install
end
