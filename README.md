docker練習用のリポジトリ
dockerからjenkinsを動かせることを目的とする。

## ローカル起動手順

※Dockerfileを読み込む場合
### イメージ作成
`docker build -t jenkins .`    
### コンテナ作成
`docker run --name jenkins  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -d jenkins`

### イメージ作成
※pullする場合
`docker pull jenkins/jenkins:2.190`
### コンテナ作成
`docker run --name jenkins  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -d jenkins/jenkins:2.190`

### コンテナを実行する
`docker exec -it jenkins bash`


### 初期パスワードを表示する
`cat /var/jenkins_home/secrets/initialAdminPassword` 




### コンテナを停止する
docker stop jenkins

### コンテナを再開する
docker start jenkins
