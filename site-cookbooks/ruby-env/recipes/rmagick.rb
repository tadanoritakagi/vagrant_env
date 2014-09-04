# RMagickが依存しているImageMagickのインストール
%w(ImageMagick ImageMagick-devel).each do |pkg|
  package pkg do
    action :install
  end
end

# RMagickのインストール
  execute "gem install rmagick" do
    command "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem install rmagick"
    user node['ruby-env']['user']
    group node['ruby-env']['group']
    environment 'HOME' => "/home/#{node['ruby-env']['user']}"
    not_if "/home/#{node['ruby-env']['user']}/.rbenv/shims/gem list | grep rmagick"
end