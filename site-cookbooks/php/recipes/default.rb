#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{php php-common php-mbstring php-pdo php-xml php-devel php-process php-cli php-pear php-mysql mysql-server}.each do |p|
   package p do
     action :install
   end
end
