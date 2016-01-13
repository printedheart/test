#
# Cookbook Name:: dbresson_challenge
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

challenge = node['challenge']

include_recipe 'nodejs'
include_recipe 'runit'
include_recipe 'nginx'

package 'git'

group challenge['group']

user challenge['user'] do
  group challenge['group']
end

runit_service 'challenge' do
  default_logger true
end

deploy 'challenge' do
  repo challenge['repo']
  user challenge['user']
  deploy_to challenge['path']
  migrate false
  symlink_before_migrate({})
  action :deploy
end
