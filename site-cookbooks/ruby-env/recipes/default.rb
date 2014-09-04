#
# Cookbook Name:: ruby-env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# gcc, openssl, sqliteをインストール
%w(gcc git openssl-devel sqlite-devel).each do |pkg|
  package pkg do
    action :install
  end
end

# ~/.rbenvにrbenvを配置
# attributes/default.rb作成して初期設定必要
git "/home/#{node['ruby-env']['user']}/.rbenv" do
  # Githubより最新のリポジトリを取得
  repository node["ruby-env"]["rbenv_url"]
  action :sync
  user node['ruby-env']['user']
  group node['ruby-env']['group']
end

# rbenvが実行できるように.bash_profileを書き換え(macと同じ内容)
# templates/default/.bash_profile.erb作成必要
template ".bash_profile" do
  source ".bash_profile.erb"
  path   "/home/#{node['ruby-env']['user']}/.bash_profile"
  mode   0644
  owner  node['ruby-env']['user']
  group  node['ruby-env']['group']
  # 既にrbenvという文字列が.bash_profile内にない時のみ書き換え
  not_if "grep rbenv ~/.bash_profile", :environment => { :'HOME' => "/home/#{node['ruby-env']['user']}" }
end

# pluginsディレクトリを作成
directory "/home/#{node['ruby-env']['user']}/.rbenv/plugins" do
  owner  node['ruby-env']['user']
  group  node['ruby-env']['group']
  mode  0755
  action :create
end

# plugins/ruby-buildにruby-buildをダウンロード
git "/home/#{node['ruby-env']['user']}/.rbenv/plugins/ruby-build" do
  repository node["ruby-env"]["ruby-build_url"]
  action :sync
  user node['ruby-env']['user']
  group node['ruby-env']['group']
end

# rbenvのinstallコマンドを実行できるように設定
execute "rbenv install #{node['ruby-env']['version']}" do
  command "/home/#{node['ruby-env']['user']}/.rbenv/bin/rbenv install #{node['ruby-env']['version']}"
  user node['ruby-env']['user']
  group node['ruby-env']['group']
  environment 'HOME' => "/home/#{node['ruby-env']['user']}"
  # versions/x.x.xというバージョンファイルがない時のみ実行
  not_if { File.exists?("/home/#{node['ruby-env']['user']}/.rbenv/versions/#{node['ruby-env']['version']}")}
end

# rbenvのglobalコマンドを実行できるように設定
execute "rbenv global #{node['ruby-env']['version']}" do
  command "/home/#{node['ruby-env']['user']}/.rbenv/bin/rbenv global #{node['ruby-env']['version']}"
  user node['ruby-env']['user']
  group node['ruby-env']['group']
  environment 'HOME' => "/home/#{node['ruby-env']['user']}"
end

# # railsのインストール
#   execute "gem install rails -v '#{node['ruby-env']['rails_version']}'" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rails -v '#{node['ruby-env']['rails_version']}'"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rails -v '#{node['ruby-env']['rails_version']}'"
# end


# # rbenv-rehashのインストール
#   execute "gem install rbenv-rehash" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rbenv-rehash"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rbenv-rehash"
# end

# # bundlerのインストール
#   execute "gem install bundler" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install bundler"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep bundler"
# end

# # nokogiriが依存しているlibxml2/libxsltのインストール
# %w(libxml2 libxml2-devel libxslt libxslt-devel).each do |pkg|
#   package pkg do
#     action :install
#   end
# end

# # nokogiriのインストール
#   execute "gem install nokogiri -- --use-system-libraries" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install nokogiri -- --use-system-libraries"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep nokogiri"
# end

# # rubygems-updateのインストール
#   execute "gem install rubygems-update" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rubygems-update"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rubygems-update"
# end

# # rubygems-update実行
# execute "rubygems-update" do
#   command "/home/#{node['ruby-env']['user']}/.rbenv/shims/update_rubygems"
#   user node['ruby-env']['user']
#   group node['ruby-env']['group']
#   environment 'HOME' => "/home/#{node['ruby-env']['user']}"
# end

# # RMagickが依存しているImageMagickのインストール
# %w(ImageMagick ImageMagick-devel).each do |pkg|
#   package pkg do
#     action :install
#   end
# end

# # RMagickのインストール
#   execute "gem install rmagick" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rmagick"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rmagick"
# end



# # rbenv-rehashとbundlerのインストール
# %w{rbenv-rehash bundler}.each do |gem|
#   execute "gem install #{gem}" do
#     command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install #{gem}"
#     user node['ruby-env']['user']
#     group node['ruby-env']['group']
#     environment 'HOME' => "/home/#{node['ruby-env']['user']}"
#     not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep #{gem}"
#   end
# end