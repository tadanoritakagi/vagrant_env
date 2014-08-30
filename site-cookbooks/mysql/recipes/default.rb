#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(mysql-server).each do |pkg|
  package pkg do
    action :install
  end
end

# 自動起動
service "mysqld" do
  action [:enable, :start]
end

# 初期ルートパスワード設定
execute "set root password" do
  command "mysqladmin -u root password '#{node['mysql']['server_root_password']}'"
  only_if "mysql -u root -e 'show databases;'"
end