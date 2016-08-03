#
# Cookbook Name:: Jellyfish
# Recipe:: default
#
# Copyright (c) 2016 Eagel Genomics Ltd, Apache License, Version 2.0
#######################################

include_recipe 'apt'
include_recipe 'build-essential'

package 'tar' do
  action :install
end

#######################################

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Jellyfish']['archive']}" do
  source node['Jellyfish']['download_url']
  action :create_if_missing
end

execute 'Extract Jellyfish files' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['Jellyfish']['archive']} -C #{node['Jellyfish']['install_dir']}"
  not_if { ::File.exist?(node['Jellyfish']['dir']) }
end

bash 'Build Jellyfish' do
  cwd node['Jellyfish']['dir']
  code <<-EOH
    ./configure
    make
    make install
    EOH
  not_if { ::File.exist?('/usr/local/bin/jellyfish') }
end

magic_shell_environment 'LD_LIBRARY_PATH' do
  value '/usr/local/lib'
end
