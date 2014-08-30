#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

# 自動起動
service "httpd" do
  action [:enable, :start]
end

# apache設定ファイルhttpd.confの場所と場所の設定後のリロード
template "httpd.conf" do
  path "/etc/httpd/conf/httpd.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[httpd]'
end