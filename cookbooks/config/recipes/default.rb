#
# Cookbook Name:: proxy
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'thin install'
execute '/usr/sbin/update-rc.d -f thin defaults'
execute 'mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf-orig'

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  variables :server_name => 'vagrant-test', :application_root => '/vagrant/application'
  notifies :restart, "service[nginx]"
end

execute 'cd /vagrant/application; bundle install'

service "thin" do
  action[:enable,:start]
end

service "nginx" do
  action[:enable,:start]
end