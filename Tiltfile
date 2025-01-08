# Tiltfile

# 1. Dockerイメージのビルド設定
docker_build(
  'my-tilt-app-image',  # イメージ名。deployment.yaml で参照
  '.',
  dockerfile='Dockerfile',
  live_update=[
    sync('.', '/app'),  # ホストの現在ディレクトリをコンテナの /app に同期
    run('poetry install --no-root', trigger=['pyproject.toml', 'poetry.lock'])
  ],
)

# 2. k8s マニフェストの読み込み
k8s_yaml('k8s/deployment.yaml')
k8s_yaml('k8s/service.yaml')


# 3. ポートフォワード設定（Service を利用しない場合や補助的に使う場合）
#   Service: NodePort でアクセス可能なら必須ではありませんが、補助的に設定する例
k8s_resource(
  'my-tilt-app',
  port_forwards=8000  # 例：ローカルホストの 8000 番を Pod の 8000 番にフォワード
)

# 4. 推奨: Tilt が実行されたら Minikube コンテキストを自動的に使用する
#   事前に `kubectl config use-context minikube` しているなら省略可。
#   参考: https://docs.tilt.dev/api.html#tilt_set_team   (最新版のAPIをご確認ください)