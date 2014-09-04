# nokogiriが依存しているlibxml2/libxsltのインストール
%w(libxml2 libxml2-devel libxslt libxslt-devel).each do |pkg|
  package pkg do
    action :install
  end
end

# nokogiriのインストール
  execute "gem install nokogiri -- --use-system-libraries" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install nokogiri -- --use-system-libraries"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep nokogiri"
end