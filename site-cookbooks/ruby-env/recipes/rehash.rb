# rbenv-rehashのインストール
  execute "gem install rbenv-rehash" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rbenv-rehash"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rbenv-rehash"
end