#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# This will update the ubuntu app
apt_update 'update' do
  action :update
end

package 'python-pip' do
  action [:install, :upgrade]
end

package 'libncurses5-dev' do
  action [:install, :upgrade]
end


# export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# pip install -r requirements.txt
# python app.py
