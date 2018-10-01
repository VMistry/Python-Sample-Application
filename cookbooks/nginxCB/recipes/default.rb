#
# Cookbook:: nginxCB
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update "update_sources" do
  action :update
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:start, :enable]
end

template '/etc/nginx/sites-available/proxy.conf' do
  source "proxy.conf.erb"
  notifies(:restart, 'service[nginx]')
end

link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end
