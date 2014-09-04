# bundlerのインストール
  execute "gem install bundler" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install bundler"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep bundler"
end