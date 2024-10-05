# 個人環境の利用について
- 個人でNVIDIA製のGPUマシンを所有している場合は、Colab同様の環境を個人で構築して利用することができます
  - あくまでもColabの利用を推奨し、個人環境の不具合対応も限定的となりますが、Colabの制約を開放しGPU処理環境や深層機械学習環境を自分の手で構築・実行することは極めて大きな意味を持ちます
- 互換性の問題による不具合・不利益は免責とします
  - 個人環境の構築に関する質問は授業の保証範囲外で不具合に対するサポートなどは行いませんが、可能な範囲で対応します
  - 個人環境構築は構築して利用した場合、最終評価で採点上考慮することがあります
- 新たにGPU対応のPC、高価なGPUを購入するのは無意味で、Colabを使った方がよいです

以下、個人PCへのCUDA環境の構築について説明します

テキストは、すべてColab上で実行することを想定していますが、Colabを利用すると様々な制約があることも事実です
- 例えば、実行時間制限やファイルが消える、ブラウザを閉じることができないなど
自分のマシンに環境を構築することでこれらの制約を取り除くことができます
- 高性能なGPUがあればColabよりもかなり実行時間を削減できます
- ここでは、シンプルで実現しやすい、Dockerコンテナを利用する方法と、本当に自分で最初から構築する直接インストールという「いばらの道」について説明しています

高性能なGPUを所持している、職場や研究室などのマシンに独自の環境を構築して利用できる場合は、次を参考にチャレンジしてください
- 特に困らないであろうというところは、説明を省略しています。
- 相応のマシン管理、Linuxの知識が必要です

なお、下記はWindows WSL2とUbuntu環境について記述しています
- Ubuntu(24.04)の利用を推奨します
  - Ubuntu以外のLinuxディストリビューションでもインストール可能ですが、インストール方法は各自で確認してください
  - 現時点でUbuntu, wsl共に最新のRTX4090へのインストールはそれなりに問題が解決されています
  - WSLではないWindows環境の利用は、新GPUの利用では険しい道である一方で動作速度も遅いという報告があるため非推奨です
- Windowsの場合はWSL2の利用を推奨します(このパターンが多いかとは思います)
  - Ubuntuを直接インストールした場合とほぼ変わらない環境が構築できます
- Anacondaを利用して構築することもできます(非推奨)
 - Anacondaは商用利用できません
 - Python3のvenvを使うことで、ほぼ問題ないはずです
 - どうしても利用したい場合は、minicondaがよいでしょう

# GPUの確認
まず、自身のGPU環境を確認しよう

- 個人で所有しているのは、かなりヤバい人ですが、NVIDIA T4/V100/A100/A800/H100 GPUなどが自由に使える、もしくは、研究室や企業などでこれらが搭載されたマシンが利用できる場合は、単純に、自分のマシンにGoogleが提供するDockerコンテナが推奨する環境として導入し、Colabで実行可能なモデルを実行できます
- GPUメモリ24G以上の良いGPU(nVIDIA RTX 4090/3090Ti/3090/4500Ada/A6000/A5500/5000Ada/6000Ada/6000/A5500/A5000 Tesla K80など)を持っているならば、このテキストのコードを全て実行できます
  - さらに、最新GPUを所有している場合、ColabのA100に近い速度で処理できるようになります(ColabのA100は実機A100よりも遅い)
- GPUメモリ16G以上のGPU(nVIDIA RTX 4080/4080Super/4080Ti/4060Ti(16G版)/A4000,Turing,Quadro GP100, RTX 4090 Laptopなど)であれば、テキストのコードの多くがそのまま動作します
- GPUメモリが12G以上のGPU(nVIDIA RTX 4070Ti Super/4070Ti/4070Super/4070/3060/2060, RTX 4080 Laptopなど、RTX 2080Ti, TITAN V, TITAN X, GTX TITAN Xもここに含まれる)であれば、さらに動作するテキストの数は少なくなるが、工夫することで(途中でエラーになった場合、つじつまを合わせて、途中から実行しなおすなど)、多くのテキストが動作するようになる
- Radeonについては確認実績がないが、PyTorchでROCmバージョンを入手しインストールすることで利用でき、数多く動作報告も存在しているため、上記のGPUメモリサイズを参考に是非チャレンジしてほしい
- それ以外のGPUの場合、多くのテキストが実行できないが、基本的なモデルは実行可能であろう 


# インストール
インストール作業は、慣れない場合ほぼ丸一日作業となりますので注意してください

CUDAは、GPUを効率よく利用するためのnVIDIAが提供しているライブラリで、これがないと動作しません

- Windowsが動作しているPC、Ubuntuが動作しているPC、もしくは新しいPCを準備します  

以下、WindowsでWSLを用いて構築する場合、Linuxマシンを新たに構築する場合、インストール済みのLinuxマシンに構築する場合の順に手順を説明します
- 新しいPCがある場合は、Ubuntuのインストールをお勧めします

## Windowsマシンへのインストールについて
- WSL2をインストールします  
  - WSL2が動作するように設定を変更します(WSL2のインストールの詳細は検索して対応してください)
  - 「Windows の機能の有効化または無効化」の」「Linux 用 Windows サブシステム」をONにします
  - WSL2 Ubuntu-20.04 LTSのインストールします
  - Windowsマークを右クリック→Windowsターミナル（管理者）を立ち上げ、次のコマンドを実行してUbuntuをインストールします
```
wsl --install
```
- NVIDIA Drivers for CUDA on WSL のインストール(WSL2を利用する場合はWSL専用のドライバがありますので注意してください)
  - 以下、Windowsで作業します([こちら](https://docs.nvidia.com/cuda/wsl-user-guide/index.html#abstract)が参考になります)
  - [こちら](https://developer.nvidia.com/cuda/wsl) からダウンロードしてください(リンクは変更されている可能性があります)
  - 所持しているGPUの型番が必要です
- CUDA Toolkitをインストール
  - [こちら]([https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local)) からダウンロードしてください(リンクは変更されている可能性があります)
  - WSL2の場合は、Linux, x86_64(環境に併せてください), WSL-Ubuntu, deb(network)を選択します(インストールしたバージョンも指定します)
  - 表示されるコマンドラインをWSL2 Ubuntuのコマンドラインに入力して実行します
- 'nvidia-smi'を実行して、GPUを認識していることを確認してください
  - なにか表のような、まともなメッセージが出たら認識されています
- 開発ツール一式をbuild-essentialでインストール
```
sudo apt install build-essential
```
**この後は、次の「Docker環境の構築」に続いてください**

## Linuxマシンを新たに構築しインストールする場合について
- Ubuntu24.04.xをインストールします
- **インストール時に、'Install third-party software ...' のチェックボックスをONにしてインストールします**
- これだけで基本環境がすべて導入され、'nvidia-smi'が動作するようになります
  - 'nvidia-smi'を実行して、GPUを認識していることを確認してください
  - なにか表のような、まともなメッセージが出たら認識されています
- Ubuntuのインストールそのものは、各種ネット情報を利用してください
- ひとまずbuild-essentialをインストール
```
sudo apt install build-essential
```
**この後は、次の「Docker環境の構築」に続いてください**

## 構築済みのLinuxマシンへのインストールについて
上記のように再インストールするとトラブルが少ないですが、構築済みのLinuxに導入することもできます
- まず、開発のためのツール一式をインストールします
- build-essentialをインストール
```
sudo apt install build-essential
```

- CUDAを導入します
  - [こちら](https://developer.nvidia.com/cuda-downloads) からダウンロードしてください(リンクは変更されている可能性があります)
- NVIDIAドライバーを導入
  - Ubuntuをインストールする際に自動的にインストールされているはずですので確認します
  - 次のコマンドで、GPUの情報が表示されたら、次のドライバインストール手順はスキップできますが、最新にした方がトラブルが少ないです
```
nvidia-smi
```
- もし、上記に失敗したら、以下のコマンドを入力して導入してください
```
sudo ubuntu-drivers list
sudo ubuntu-drivers install 
sudo reboot #再起動
```
'nvidia-smi'が動作するようにしてください

# Docker環境の構築
## インストール環境の確認
  - コマンドラインに以下のコマンドを入力して動作を確認してください[詳細はこちら](https://dev.classmethod.jp/articles/monitor-nvidia-gpu-usage-with-nvidia-smi-nvsmi/)
  - 既に確認済みであればスキップして結構です
> nvidia-smi

## Dockerのインストール
[Googleによるローカルランタイムマニュアル](https://research.google.com/colaboratory/local-runtimes.html?hl=ja)を参照する

### Linuxの場合
```
apt install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
```  
としてインストールする  
- nvidiaドライバを認識させるため、nvidia-container-runtimeを導入する
```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-toolkit.gpg
curl -fsSL https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | tee /etc/apt/sources.list.d/nvidia-toolkit.list
sed -i -e "s/^deb/deb \[signed-by=\/usr\/share\/keyrings\/nvidia-toolkit.gpg\]/g" /etc/apt/sources.list.d/nvidia-toolkit.list
sudo apt-get update
sudo apt install nvidia-container-runtime
```  

### Windowsの場合
- WSLがインストールされていることを確認してください(CUDAのインストールで導入済みのはず)
- 公式サイト( https://www.docker.com )からWindows版インストーラーをダウンロードしてインストール
  - なお、先にDockerを入れてからCUDAを入れるとエラーになる可能性があるので、手順通りにインストールすること

# Colab環境の構築
専用に何かAI実行・実装環境を構築するのではなく、単純にColabと同じことがしたい、という場合は比較的簡単に環境を構築できます

ここでは、Colabと同様の仮想環境を構築します
- 完全に一致するわけではないため、動作しないテキストコードも存在します
- 正しく動作しないコードがある場合、極力動作するように改善する予定です

## Dockerランタイムの起動

ここで、次の2つの方法ががあります

### (方法1) docker-composeを利用して専用イメージを利用する(お勧め)

- Githubからテキスト全体をcloneして入手する、このテキストのレポジトリについて、Dockerディレクトリに移動する

- lec-mlsysの中のDockerディレクトリにあるdocker-compose.ymlを利用してDockerコンテナを作成して起動する

windowsではsudoは不要です
```
cd lec-mlsys/Docker
sudo docker-compose up -d
```
もしくは、次のように実行する(Docker/run.sh)
```
sudo docker compose up -d
```

docker-compose.ymlの中に、`- JUPYTER_TOKEN=2238522`とあるが、慶應矢上キャンパスの郵便番号であり、この番号がトークン番号となります

コンテナが起動すると、認証に使用する初期バックエンド URL（ http://127.0.0.1:9000/?token=... の形式）が含まれたメッセージが表示されるため、この URL を控えておく
- わからなくても、変更していなければ2238522です

### docker: Error response from daemon: could not select device driver "" with capabilities: [[gpu]] と表示される

原因不明であるが、あるある問題でnvidia-container-runtimeを入れて設定し直す
- 24.04の最新を導入する場合はこの問題は発生しません

```
sudo su
apt install nvidia-container-runtime
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey |   sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list |   sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
apt update
apt install nvidia-container-runtime
service docker restart
```
最後にsuから抜けるため、'exit'しておくこと

### (方法2) ColabのDockerランタイムイメージをインストールして実行する(非推奨)

```
docker run --shm-size=1gb --gpus=all -p 127.0.0.1:9000:8080 us-docker.pkg.dev/colab-images/public/runtime
```
`--shm-size=1gb` は、dockerコンテナの/dev/shmのサイズを増やすために必要であり、これを忘れるとデータローダなどで実行できない
  - 指定を忘れると、Bus Errorが発生する場合がある

## シェルを繋いで動作確認

### コンテナが一つしか動いていない(上記の手順で素直にここまで来た)場合

次の手順で接続(Docker/bash.sh)します
```
sudo docker compose exec colab /bin/bash
```
もしくは、素のdockerコマンドで、
```
sudo docker exec -i -t `sudo docker ps -l -q` /bin/bash
```

これで、構築したcolab環境のシェルに入ることができます

### コンテナが複数動作している場合

既にコンテナを利用していて、複数動作している場合は、Colabを指定する必要があります

- コンテナ一覧の取得
```
sudo docker compose ps
```
もしくは、素のdockerコマンドで、
```
sudo docker ps
```
として一覧を表示

- コンテナ名を指定してログイン
docker composeでは、SERVICE名が直接利用できるが、素のdockerではコンテナIDが必要、そこでその中からコンテナID(16進数表示のID)を取得して利用
```
sudo docker exec コンテナSERVICE名 /bin/bash -i -t 
```
もしくは
```
sudo docker exec -i -t コンテナID /bin/bash
```
とする

- 動作確認
次に、bashの中でnvidia-smiを起動して動作を確認する
```
nvidia-smi
```
ここで、Failed to initialize NVML: Unknown Errorと表示された場合は、次の対策を講じる(この問題はそのうち解決されると思われます)

- "MVMLのUnknown Error"の対応

まず、コンテナを停止させます(Docker/stop.sh)
```
sudo docker compose stop
```
もしくは
```
sudo docker stop `sudo docker ps -l -q`
```

/etc/nvidia-container-runtime/confファイルのno-cgroupsのコメントを外す
```
sudo sed -i 's/#no-cgroups = false/no-cgroups = false/' /etc/nvidia-container-runtime/conf
ig.toml
```

もう一度、コンテナを起動して確認しなおすと、nvidia-smiが正しく動作することがわかります

上記起動プロセスをもう一度行ってもよいですが、再起動を効率よく行うために、
```
docker compose restart
```
とすると簡単に再起動できます(この場合はstartでもよい)
- ただし、docker-compose.ymlがある場所で実行してください

# Colabへの接続

- Colab で、**接続** ボタンをクリックして **ローカル ランタイムに接続...** を選択
- 表示されたダイアログに、コピーしたURL( http://localhost:9000/?token=2238522 )を入力して [接続] ボタンをクリック
  - なお、ホスト名はlocalhostや127.0.0.1でなければならない点に注意すること
  - `--shm-size`オプションは、docker-compose.ymlの中で拡大するように記述しているため不要です
- リモートにあるColabホストにアクセスする場合は、sshのポートフォワードを利用し、'ssh ユーザ名@ホスト名 -L 9000:localhost:9000'などとして、リモートのホストに転送

以上でGoogle Colaboratoryと全く同じ環境が手に入ります

次のような注意点があります
- gradioなど、別途ポートを利用するライブラリなどを利用する場合は、工夫が必要です
  - 現状、gradioだけ対応させており、次のように記述を変更することで利用可能ととなります
    `app.launch（server_name="0.0.0.0"）` => `app.launch（server_name="0.0.0.0", share=True）`
- notebook上でtensorboardを表示する機能などは利用できません
- google colab専用の命令、例えば`from google.colab`などは、ライブラリを読み込み可能であるが、実行時にエラーとなります
  - `runtime.unassign()`などでエラーとなります

以上で終了です

# 専用の環境を構築したい場合

CUDAをインストールした後、以下のインストールを行います
- こちらはいばらの道です
- 下記の手順では、Colabとは異なる環境が構築されるため、より一般的な環境を構築することができますが、テキストはColabでの実行に特化しているため、テキストの全てが実行可能になる、というわけではありません
  - Dockerを用いた場合よりも、動作するコードの数が減少します
- 正しく動作しないコードがある場合、極力動作するように改善する予定です
  - ご報告お待ちしております

## 仮想環境でpythonを動かす

ここから先はWindowsのWSLとLinux Ubuntuで共通です

### venvを使う(推奨)

Ubuntu24.04では次を実行してvenvを導入します

```
sudo apt install python3.8-venv
```

次に、venvを使って仮想環境を作成します
- 実際にはフォルダが作成され、その中に環境が構築されます
- ここまでで、/home/ユーザ名/lec-mlsysができているはずです。

```
cd ~/
python3 -m venv "lec-mlsys"
```
として、そのフォルダをのものを仮想環境にします

インストールできたら、lec-mlsysに入り、
```
. bin/activate
```
もしくは
```
soure bin/activate
```

### Anacondaもしくはminicondaを利用する(非推奨)

Anacondaは商用利用できないため、通常はminicondaを導入してください

- [Anacondaのサイト](https://anaconda.com)からインストール用Anacondaもしくはminicondaスクリプトをダウンロード
  - Linux 64-Bit(x86) Installer を選択
- インストール用スクリプトを実行、誰々は自身のアカウント名に変更  
```
bash /mnt/c/Users/誰々/Downloads/Anaconda3-インストールバージョン-Linux-x86_64.sh
もしくは
sh ./Downloads/Anaconda3-インストールバージョン-Linux-x86_64.sh
```
- Anacondaインストーラが~/.bashrcに設定を追記するため、sourceする
```
source ~/.bashrc
```
もしくは
```
. ~/.bashrc
```
Anaconda環境を更新します
- しばらく利用すると更新が必要になることもあります
- 以下の方法は、あとから再実行して更新することができます
- ただし、一度動く環境が構築できた場合は、むやみに更新するとトラブル発生の原因になります
```
conda update -n base conda
conda install anaconda
conda update --all
```

最後に、授業で使う環境(名前はなんでもよいがlecture-ml -> lecmlや機械学習システム -> mlsys)を作成します
```
conda create -n mlsys
```
以降、授業の内容を扱う時は最初に、  
```
conda activate mlsys
```
として始めることになります  
なお、`conda info -e`とすると、作った環境の一覧を見ることができます

## Pytorhをインストールする

まずは[pytorchのホームぺージ](https://pytorch.org/)に行きます
toolkitはCUDAバージョンを指定してインストールします
- バージョンは`nvidia-smi`の右上に表示されます
- 基本的には最新版を導入しますが、下記動作確認で失敗するようであればNightlyを導入する必要があるかもしれません
- かなり時間がかかります
```
conda install -y pytorch torchvision torchaudio cudatoolkit=11.x -c pytorch -c nvidia
もしくは
conda install -y pytorch torchvision torchaudio cudatoolkit=11.x -c pytorch -c conda-forge
```

- 比較的新しいGPUや新しい機能を利用する場合は、Nightlyを利用します(現状で必要はありません)
```
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.x -c pytorch-nightly -c nvidia
```

導入したら、次で動作を確認  
```
$ python
Python 3.10.8 (main, Nov 24 2022, 14:13:03) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
Python 3.11.5 (main, Sep 11 2023, 13:54:46) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> print(torch.cuda.is_available())
True
>>> print(torch.cuda.get_device_name())
NVIDIA GeForce RTX 4090
>>> print(torch.version.cuda)
12.1
>>> print(torch.cuda.get_arch_list())
['sm_50', 'sm_60', 'sm_61', 'sm_70', 'sm_75', 'sm_80', 'sm_86', 'sm_90']
>>> 
```
などとなりますが、まず最初にTrueと出ればOK、出ない場合は、頑張って解決しましょう  
例えば、間違ってcpu版が入っている可能性があります

最後の一覧に、所有しているGPUのアーキテクチャが含まれていれば、サポートされています
- なくても動作していましたし、それなりに計算速度も速くなるようです

## Jupyter Notebookをインストール
Google Colaboratoryと協調動作させることや、Colabなしでもテキストの閲覧と実行ができるようになります  
```
conda install -y jupyter
pip install --upgrade jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws
jupyter nbextension enable --py widgetsnbextension
```

## 授業で利用するライブラリをインストール

### condaで普通に導入

condaで入れていますが、-c conda-forge オプションが必要な場合もあります  
まずは、次で一気にいれてみます
```
conda install -y numpy pandas matplotlib scikit-learn scikit-learn-intelex scikit-image python-graphviz pydotplus seaborn missingno lxml lightgbm xgboost ipywidgets requests beautifulsoup4 gensim keras
```
もし、問題が発生するか、`Solving environment: failed with initial frozen solve. Retrying with flexible solve.`と表示され、多くの場合かなり待たされた場合は、さらに待っても解決しない可能性が高いです  
- このような場合、baseでconda update condaとしてcondaを更新するのも一つの手ですが、環境は人によって異なるため、とにかくもがいてください
- 問題が解決しない場合、anacondaをきれいに最初から入れなおすのが良いと思います

### conda-forgeを利用して導入

確認において、conda-forgeの利用が必要なライブラリは以下の通りです
- かなり先で使いますので無理にインストールする必要はありません
```
conda install -y -c conda-forge librosa
```

### pipを利用して導入

- OpenCVをインストール
今は、これで入るはずです
```
pip install opencv-python
```

なお、以下の方法もありますが、不要のはずです
```
conda install -y opencv こちらが上手くいかない場合は、conda-forgeで
conda install -y -c conda-forge opencv
```

ここまでインストールしたら、次の作業が2022.9時点で問題となる可能性が高く、環境を複製しておくことをお勧めします
```
conda create -n mlsysbk --clone mlsys
```

### 言語処理系ライブラリ

- pytorch関連
  - 2022年9月時点で、最新のGPU(3090系など)を利用している場合、インストールにより必要な`sm_84`未対応のグレードダウンしたpytorchがインストールされますので、避けた方がよく、その場合テキストの一部で動作できない記述が発生します
```
pip install torchdata torchtext
```
- mecab関連  
ほぼ役割を終えましたが…
```
conda install -y -c conda-forge mecab
```
さらに次も必要です
```
sudo apt install libmecab-dev mecab-ipadic-utf8
pip install mecab-python3
sudo ln -s /etc/mecabrc /usr/local/etc/mecabrc
pip install unidic-lite
```

- テキストの中も相当数追加していますので注意してください

### その他

- tensorflowを導入する  
これが、pythonのバージョン整合が厳しく、失敗することもありますが、授業では特に必須ではないためスキップしても構いません  
さらに、tensorflowを入れることで、pytorchのアーキテクチャサポートが制限されるという現象から、tensorflow用の環境を別途clone作成してからインストールすることをお勧めします
```
conda install -y tensorflow-gpu tensorflow-datasets tensorflow-hub
```
ですが入らなくても特に困ることはありません
```
conda install -y tensorflow-gpu tensorflow-datasets tensorflow-hub -c conda-forge
```
で入る場合もあります  
なお、tensorflow-gpuさえ入ればなんとかなります

- tensorboardも導入する  
Colabはtensorboardが初めからインストールされており、テキストの最後の方で利用するため、ここで導入します
```
pip install tensorboard
```

# 最後に

ここまでインストールしたら、この環境を壊さないように、バックアップを取得しておきましょう
- 動作しなくなったら、こちらで取得したlecmlbkというバックアップをリストアして利用するとよいです

## condaの場合
```
conda create -n mlsysbk --clone mlsys
```

## venvの場合

venvはこれが厄介です

### パッケージ一覧の取得
```
pip freeze > requirements.txt
```
としてインストールされたパッケージ一覧を取得

### 新環境のフォルダを作成
複製先で仮想環境(例えばsub)を構築
```
mkdir sub
cd sub
```
### 仮想環境を構築
```
python -m venv [仮想環境名]
```
### 仮想環境を有効化
```
source /bin/active
```
もしくは
```
. bin/activate
```
### subに requirements.txt を配置

先ほど作成した requirements.txt をこちらに'mv'します

### パッケージをインストール
パッケージを requirements.txt を用いてインストールします
```
pip install -r requirements.txt
```
### インストールされたパッケージを表示・確認
```
pip freeze
```

# 補足

## wgetの導入

中にはwgetなど、Linux系のコマンドを利用しています  
Linux上で構築する場合は特に問題とはなりませんが、Windows上で構築するには、次の2つのLinuxで著名なコマンドラインツールを導入をしておくとよいでしょう

使用頻度も高いので、ぜひ入れてください。

https://sourceforge.net/projects/gnuwin32/files/wget/1.11.4-1/wget-1.11.4-1-setup.exe/download

これを実行するだけです  
ほかのアーキテクチャでも同様に、利用できるようにしてください

## Gitの導入
  
GitHub環境を自身のマシンに導入する際には、ほぼ必須ともいえるツールです  
特に、Windowsユーザの皆さんには、Git Bashの導入をお勧めします  
Git Bashを導入することで、下記、busyboxの導入は不要になるといえます

## busyboxの導入

Git Bashを導入しない場合、Windowsでは、lsなどUnix系コマンドの実行はかなり厄介です(Windows11でかなり良くなりますが)  
そこで、次のbusyboxの導入が検討されますが、お勧めではありません(https://frippery.org/files/busybox/busybox.exe)

導入後、busybox.exeをC:\Windowsにコピーして、その中で busybox --installとするとメジャーコマンドが利用できるようになります

## Jupyter NotebookをGoogle Colaboratoryに接続する

これが重要です  
Google Colaboratoryに慣れている人は、ピュアなJupyter Notebookは使いにくいと感じると思います  
そこで、いつも通りGoogle Colaboratoryを利用しつつ、ローカルの計算リソースを利用することができますので、紹介します

- 最初だけ、実行バッチファイルを作成する

メモ帳でも、busyboxのviでもよいので、jupyterrun.batというファイルを作成します

中身は次の通りです
```
jupyter notebook --no-browser --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0 --allow-root --ip=0.0.0.0 --NotebookApp.token=''
```
なお、この仕様は近々変更される予定で、
```
jupyter notebook --no-browser --App.allow_origin='https://colab.research.google.com' --port=8888 --ServerApp.port_retries=0 --allow-root --ip=0.0.0.0 --NotebookApp.token=''
```
とする必要があるかもしれません

- 最初に一度jupyterrun.batを実行する

ログが吐き出しつつ起動し、複数のセッションが接続できるようになります

- 普通にGoogle Colaboratoryでノートブックを開き、「接続」する際に、「ローカルランタイムに接続」を選択する

http://localhost:8888/ バックエンドに指定されているはずですので、そのまま接続とする

これで、 Google Coalbを利用せず、自分の環境を利用するようになり、様々な制限が外れます

- つまり、利用時間やセッションの制限はなくなり、ファイルが消えることもありません

Docker Containerを利用している場合は、そちらの内容に従ってください

## resolv.conf

wslは、resolv.confを勝手に書き換えて、そのまま名前が解決できず接続できない環境を作ってしまいがちです
- `/etc/resolv.conf`を例えば`nameserver 8.8.8.8`などとすると動作する
- このような現象が発生する場合は、以下の通りの修正で解決することができます

一般には、`rc.local`というファイルを生成することで、このファイルが起動時実行されることから、中に`/etc/resolv.con`を書き換えるように記述すればよいですが、wslには`rc.local`を実行させる機能が備わっていません

しかしながら、wslが最初に`/sbin/mount -a`を実行することから、このときにrcファイルシステムをマウントするように設定し、`mount.rc`を呼び出させることで、`rc.local`と同じことができるようになります
- この中で`resolv.conf`を書き換える必要があるかもしれません

手順は次の通り
- まず、`none none rc defaults 0 0`という行を/etc/fstabに追加する
  - これにより起動時に`/sbin/mount.rc`ファイルが呼び出されるようになる
- `/sbin/mount.rc`ファイルを実行可能スクリプトとして作成する
  - sudo su でroot権限に入る
  - echo '#!/bin/bash' > /sbin/mount.rc
  - echo '(sleep 5; echo "nameserver 8.8.8.8" > /etc/resolv.conf)&' >> /sbin/mount.rc
  - chmod +x /sbin/mount.rc
  - 忘れずにexitしておく
  
実は、resolv.confを書き換える前にmount.rcが呼び出されてしまうため、sleepする必要がある

## よく使うAnacondaコマンド

その他、よく使うコマンドを紹介しておきます
- `conda info -e`: 作った環境の一覧を表示
- `conda create -n test`: testという名前の環境を作成
- `conda remove -n test --all`: testという環境を削除
- `conda create -n myenv python=3.7`: Python バージョンを指定して作成
- `conda activate test`: 環境testの有効化
- `conda deactivate`: 環境の無効化
- `conda create -n copyenv --clone originenv`：originenvからcopyenvを作成


## Anacondaが最初に起動しないようにする

また、Anacondaをインストールすると、(base)と表示されます。これが嫌という場合もあるかと思います
```
conda config --set auto_activate_base false
```
として、デフォルトでbaseがactivateされないようにするとよいでしょう。ログインしなおすと(base)と表示されません

## よく使うDockerコマンド

次のコマンドがよく利用されます

ひとまず、ps, start, stop、さらには、rm, rmiを知っていれば問題ありません

- `docker version`：Dockerのバージョン確認
- `docker images`：Dockerイメージ一覧
- `docker rmi <イメージID>`：Dockerイメージの削除
- `docker rm <コンテナID>`：Dockerコンテナの削除
- `docker ps -a`：すべてのDockerコンテナ状態確認
- `docker ps`：現在起動中コンテナの確認
- `docker exec -i -t <コンテナ名またはコンテナID> bash`：コンテナ内部に入るコマンド
- `docker start <コンテナID>`：dockerを起動するコマンド
- `docker commit <コンテナID> <コンテナイメージ名:タグ>`：docker commitによるイメージ作成
- `docker run <起動オプション> <コンテナイメージ> <コンテナ起動時に実行するコマンド>`：docker runによるコンテナイメージからコンテナを起動
- `docker pull <コンテナイメージの公開パス:タグ>`：docker pull によるコンテナイメージのダウンロード
- `docker build -t <コンテナイメージ名:タグ> <Dockerfileが存在するディレクトリ>`：docker build コマンドを使ったコンテナイメージの作成
- `docker login -u <コンテナレジストリのユーザー名> -p <コンテナレジストリのパスワード> <コンテナレジストリのログインサーバー>`：コンテナレジストリへログイン
- `docker stop <コンテナID>`：コンテナを停止
- `docker start <コンテナID>`：コンテナを起動する

また、複数コンテナを簡単・効率的に管理・実行するためのdocker composeには、次のコマンドがよく利用されます(docker-compose.ymlがある場所で実行してください)
- `docker compose up -d`：compose.yamlファイルに基づきアプリケーションを起動、「-d」は、バックグラウンドでコンテナを起動するオプション
- `docker compose stop`：アプリケーションを停止
- `docker compose down`：アプリケーションを停止し、コンテナを削除
- `docker compose restart`：アプリケーションの再起動

## wslに導入した仮想環境の削除

windowsコマンドラインで、
```
wsl -l -v
```
として一覧を表示し、
```
wsl --unregister 削除する環境名
```
で削除します

# 注意

## Anacondaの操作について

一度動く環境ができたら、その環境を維持するため、`conda update --all`すらも避けるべきです
- これで壊してしまった経験が何度かあります
```
conda create -n copyenv --clone originenv
```
として、環境をコピーしてからconda update --all を始めるとよいです
