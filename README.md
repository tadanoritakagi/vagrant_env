### chef for vagrant 環境設定備忘録
***

#### 初期設定  

* ディレクトリ作成  
$ mkdir vagrant_env  
* Gemfile作成  
$ bundle init  
* Gemfie編集  
$ vim Gemfile  
chefとknifeとberkshelfを書き込む  
※ 実際のGemfileを参照
* bundle実行  
$ bundle install  
* カレントディレクトリでchefを初期化  
$ bundle exec knife solo init .  
* Berksfile修正  
$ vim Berksfile
opsなんちゃらを、下記に変える  
source 'https://api.berkshelf.com'  
* vagrantファイルを作成  
$ vagrant init osName  
* vagrantFile編集  
$ vim vagrantFile  
ipアドレスのコメントだけ外す  
* vagrantを初期化  
$ vagrant up  
* ssh接続簡易設定  
$ vagrant ssh-config --host hoge >> ~/.ssh/config  
* vagrantをchefとひもづける  
$ bundle exec knife solo bootstrap hoge  
* ssh接続してutf-8関係を修正  
$ ssh hoge  
[vagrant@localhost~]$ sudo vi /etc/sysconfig/i18n  
※ 実際のi18nを参照
* git初期化〜コミット  
$ git init  
$ git add .  
$ git commit -m "initial commit"  

***

#### vim設定  

* vimのcookbookを作成  
$ bundle exec knife cookbook create vim -o site-cookbooks  
* レシピを作成  
$ vim site-cookbooks/vim/recipe/default.rb  
※ 実際の上記ファイルを参照  
* nodeにレシピを入れる  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  

***

#### apache設定  

* apacheのcookbookを作成  
$ bundle exec knife cookbook create apache -o site-cookbooks  
* レシピを作成  
$ vim site-cookbooks/apache/recipe/default.rb  
※ 実際の上記ファイルを参照  
* nodeにレシピを入れる  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  
* apacheの設定ファイルを作成  
まずはゲストosの中のhttpd.confファイルを共有フォルダ経由でホストosにコピー  
$ ssh hoge  
[vagrant@localhost~]$ cp /etc/httpd/conf/httpd.conf /vagrant/site-cookbooks/apahce/templates/default/httpd.conf.erb  
* レシピを編集  
$ vim site-books/apache/recipe/default.rb  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  

***

#### mysql設定  

* mysqlのcookbookを作成  
$ bundle exec knife cookbook create mysql -o site-cookbooks  
* レシピを作成  
$ vim site-cookbooks/mysql/recipe/default.rb  
※ 実際の上記ファイルを参照  
* 変数を設定する  
$ vim site-cookbooks/mysql/attributes/default.rb  
※ 実際の上記ファイルを参照  
* 初期パスワードを設定する  
$ vim site-cookbooks/mysql/recipe/default.rb  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにレシピを入れる  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  

***

#### ruby設定  

* rubyのcookbookを作成  
$ bundle exec knife cookbook create ruby-env -o site-cookbooks  
* rbenv install, rbenv rehash, rbenv global, ruby-buil, bundler  
rails, nokogiri(依存するlibxml2, libxslt), rubygems-update, Imagemagick,  
RMagickをインストールするレシピを作成  
$ vim site-cookbooks/ruby-env/recipe/default.rb  
※ 実際の上記ファイルを参照  
* 変数を設定する  
$ vim site-cookbooks/ruby-env/attributes/default.rb  
※ 実際の上記ファイルを参照  
* 環境変数を変更する  
※ rubyのバージョンはデフォルトで2.0.0-p481にしてある  
※ railsのバージョンはデフォルトで4.0.0にしてある  
rbenv install -lからのrbenv installで好きなバージョンに変更可能  
$ vim site-cookbooks/ruby-env/templates/default/.bash_profile.erb  
※ 実際の上記ファイルを参照  
* nodeにレシピを入れる  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  

***

#### node.js設定  

* node.jsのcookbookを作成  
$ bundle exec knife cookbook create nodejs -o site-cookbooks  
* node.jsをインストールするレシピを作成  
$ vim site-cookbooks/nodejs/recipe/default.rb  
※ 実際の上記ファイルを参照  
* 変数を設定する  
$ vim site-cookbooks/nodejs/attributes/default.rb  
※ 実際の上記ファイルを参照  
* nodeにレシピを入れる  
$ vim nodes/hoge.json  
※ 実際の上記ファイルを参照  
* nodeにインストール  
$ bundle exec knife solo cook hoge  
* プロビジョニング  
$ vagrant provision  