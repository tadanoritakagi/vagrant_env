### chef for vagrant 環境設定作成手順

* ディレクトリ作成  
$ mkdir vagrant_env  
* Gemfile作成  
$ bundle init  
* Gemfie編集  
$ vim Gemfile  
chefとknifeとberkshelfを書き込む  
※ Gemfileを確認
* bundle実行  
$ bundle install  
* カレントディレクトリでchefを初期化  
$ bundle exec knife solo init .  
* vagrantファイルを作成  
$ vagrant init osName  
* vagrantFile編集  
vim vagrantFile  
ipアドレスのコメントだけ外す  
* vagrantを初期化  
$ vagrant up  
* ssh接続簡易設定  
$ vagrant ssh-config --host hoge >> ~/.ssh/config  





