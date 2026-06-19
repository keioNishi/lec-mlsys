# Local Google Colab (Docker)

NVIDIA GPU を使った Google Colab ローカルランタイム環境です。

## 前提条件

- Docker および Docker Compose
- NVIDIA GPU + ドライバ
- nvidia-container-toolkit

### nvidia-container-toolkit のインストール

未インストールの場合、以下を実行：

```bash
./install_gpu_support.sh
```

## 使い方

### コンテナの起動

```bash
./run.sh
```

GPU の存在と nvidia-container-toolkit を確認した上でコンテナを起動します。

### コンテナの停止

```bash
./stop.sh
```

## Google Colab からの接続

1. Windows ブラウザで [Google Colab](https://colab.research.google.com/) を開く
2. ノートブックを開く（または新規作成）
3. 右上の「接続」横の **▼** → **「ローカル ランタイムに接続」**
4. バックエンド URL に以下を入力：
   ```
   http://localhost:9000/?token=2238522
   ```
5. 「接続」をクリック

> WSL2 環境では `localhost` でアクセスできます。

## ポート一覧

| ポート | 用途 |
|--------|------|
| 9000 | Colab ランタイム接続用 |
| 7860 | Gradio 等のアプリ用 |

## ディレクトリ構成

| パス | 説明 |
|------|------|
| `./content/` | `/content` にマウント（ノートブックの作業ディレクトリ） |
| `./cache/` | `/root/.cache` にマウント（pip キャッシュ等） |

## スクリプト一覧

| スクリプト | 説明 |
|------------|------|
| `run.sh` | GPU 確認 + コンテナ起動 |
| `stop.sh` | コンテナ停止 |
| `install_gpu_support.sh` | nvidia-container-toolkit インストール |
