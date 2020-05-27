docker練習用のリポジトリ
dockerからjenkinsを動かせることを目的とする。

## ローカル起動手順

※Dockerfileを読み込む場合
### イメージ作成
`docker build -t jenkins .`    
### コンテナ作成
`docker run --name jenkins -u root -p 8080:8080 -p 50000:50000 -v /c/Users/[適当なパス]:/var/jenkins_home -d jenkins`

※pullする場合
### イメージ作成
`docker pull jenkins/jenkins:2.190.1`
### コンテナ作成
`docker run --name jenkins -u root -p 8080:8080 -p 50000:50000 -v /c/Users/[適当なパス]:/var/jenkins_home -d jenkins/jenkins:2.190.1`

```
権限をrootにしないとパーミッションエラーでマウント出来ない
```

### コンテナの中に入る実行する
`docker exec -it jenkins bash`


### 初期パスワードを表示する
`cat /var/jenkins_home/secrets/initialAdminPassword` 

### jenkins GUIでの初期設定
#### jenkinsにアクセス
http://localhost:8080 でアクセス
#### 初期設定
画面に従い初期設定する。
ユーザ作成画面に遷移しないはず、、遷移する場合は適当にユーザを作成する。

#### 初回ログイン
ユーザ名   : admin
パスワード : admin

#### 手動プラグインインストール
plugins.shで自動インストールできないものに関しては、手動でインストールする。

* Pipeline: Multibranch with defaults
* Simple Theme Plugin
  →セットアップは https://reboooot.net/post/customize-jenkins-theme/ 参照
* Blue Ocean
  →イイ感じのGUIを提供するプラグイン 


### コンテナを停止する
docker stop jenkins

### コンテナを再開する
docker start jenkins


## windowsのフォルダにマウント出来ない場合
dockerのsetting画面を開き、Shared Drivesにチェックがついていることを確認してResetする。