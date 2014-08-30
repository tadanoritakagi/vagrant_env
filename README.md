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
vim vagrantFile  
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

#### apache設定  






