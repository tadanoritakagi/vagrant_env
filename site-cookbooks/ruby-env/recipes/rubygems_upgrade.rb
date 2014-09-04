# rubygems-updateのインストール
  execute "gem install rubygems-update" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rubygems-update"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rubygems-update"
end

# rubygems-update実行
execute "rubygems-update" do
  command "/home/#{node['ruby-env']['user']}/.rbenv/shims/update_rubygems"
  user node['ruby-env']['user']
  group node['ruby-env']['group']
  environment 'HOME' => "/home/#{node['ruby-env']['user']}"
end