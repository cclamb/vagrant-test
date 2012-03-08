#
# Cookbook Name:: proxy
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

http_proxy = node[:proxy][:http]
https_proxy = node[:proxy][:https]

template '/etc/apt/apt.conf' do
  source 'apt.conf.erb'
  variables :http_proxy => http_proxy, :https_proxy => https_proxy
end #unless http_proxy && https_proxy 
