# railsのインストール
  execute "gem install rails -v '#{node['ruby-env']['rails_version']}'" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rails -v '#{node['ruby-env']['rails_version']}'"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rails -v '#{node['ruby-env']['rails_version']}'"
end