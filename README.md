# smp_ci
sample ci

### docker build
```
docker build --no-cache=true -t smp_ci:latest -f ./ops/Dockerfile .  
  or
docker build -t smp_ci:latest -f ./ops/Dockerfile .
```

### docker run
```
docker-compose -f ./ops/docker-compose.yml up -d
  or
docker run --net=smp-ci-nw\
    --name smp_ci asia.gcr.io/(project)/smp_ci:latest \
    /bin/sh -c "./run_nose_test.sh"
```

### local build
https://cloud.google.com/cloud-build/docs/concepts/overview?authuser=1&hl=ja#running_builds_locally

  - Cloud BuildのDocker認証ヘルパー インストール
    ```
    gcloud components install docker-credential-gcr
    ```

  - ローカルビルダー インストール
    ```
    gcloud components install cloud-build-local
    ```

  - build
    ```
    cloud-build-local --config=cloudbuild.yaml .

    (実際にビルドする場合)
    cloud-build-local --config=cloudbuild.yaml --dryrun=false .

    (実際にビルドして、イメージをレジストリにpushする場合)
    cloud-build-local --config=cloudbuild.yaml --dryrun=false --push .

    ※最後の `.` はソースを指定する。
    ```


---
### <参考>
[GitHubとGoogle Cloud Build の連携を試してみた！](https://medium.com/google-cloud-jp/try-github-cloudbuild-integration-5149175105fb)

1. Google Cloud Build app  
   [GitHub app page](https://github.com/apps/google-cloud-build)から、 `Google Cloud Build app` をインストールして、RepositoriesとGCPプロジェクトを連携させる。
