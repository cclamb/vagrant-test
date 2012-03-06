#
# Cookbook Name:: proxy
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template '/etc/apt/apt.conf' do
  source 'apt.conf.erb'
  variables :http_proxy => 'http://wwwproxy.sandia.gov:80/', :https_proxy => 'http://wwwproxy.sandia.gov:80/'
end
