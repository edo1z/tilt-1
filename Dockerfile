# ベースイメージ
FROM python:3.12-slim

# Poetryをインストールするために必要なパッケージ等を追加
RUN apt-get update && apt-get install -y curl git

# Poetryのインストール (最新版の公式推奨スクリプト)
# バージョンは必要に応じて固定しても良い
RUN curl -sSL https://install.python-poetry.org | python3 -

# Poetry がインストールされたパスを通す
ENV PATH="/root/.local/bin:${PATH}"

# 作業ディレクトリ作成
WORKDIR /app

# ホスト側の pyproject.toml / poetry.lock をコピー
COPY pyproject.toml poetry.lock /app/

# Poetryで依存関係をインストール (--no-root でプロジェクト本体はインストールしない)
RUN poetry install --no-root

# ソースコードをコピー
COPY . /app

# プロジェクト本体をインストール (必要に応じて)
# RUN poetry install

# FastAPIを起動するコマンド
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
