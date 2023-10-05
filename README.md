[![レクチャーノートブック](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys)
[![PyTorchバッジ](https://img.shields.io/badge/PyTorch->v1.0-232f3e.svg?style=flat)](https://pytorch.org/)
[![Slackデータシステムの知能化とデザイン](https://img.shields.io/badge/Slack-keio--sd--mlsys-3f0f40.svg?style=flat)](https://keio-sd-mlsys.slack.com/)
[![HIT-Academy](https://img.shields.io/badge/Slack-hitacademy--ml-3f0f40.svg?style=flat)](https://hitacademy-ml.slack.com/)

# レクチャーノートブックについて
このレポジトリでは、西が担当する以下の講義のテキストを公開しています
- 「機械学習システム(旧:データシステムの知能化とデザイン)」(慶應理工SD3年選択科目)
- 「深層機械学習ハンズオン」(日立アカデミー)
- 「マシンラーニング」(その他一般企業向けセミナー)

## このレポジトリの利用について
- 全体の閲覧とダウンロード
  - 左上もしくはこちら[![レクチャーノートブック](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys)のバッジを利用してください
- 個別ダウンロードは下記にリンクがあります
  - 授業を受ける際にはこちらが便利です

## 授業形態について
- この授業は、講義と演習で構成されます
  - 講義はこちらのテキストに沿って進めます
  - 演習はテキスト内にある演習問題や、別途与えられる演習問題を用いて行います
  - 2018年度授業よりGoogle Colaboratory(以下Colab)を利用しており、利用にあたっては諸注意があります

## 推奨環境について
- この授業は個人PCや教室のPC上で動作するGoogle Chromeブラウザを利用し、GitHubおよびColabにアクセスして受講することを想定しています
- これらの手段を利用している場合に限り動作を保証し、正しく動作しない場合は適切に対応します
  - Google Chromeのプラグインやクッキー、キャッシュなどに起因する不具合は個別に対応してください
- PC（ブラウザ）の利用が必須です
  - Firefox、Edge、Safariなどのほか、スマートフォンやタブレットでもPCと同等の機能を持つブラウザであれば利用できますが、作業効率や動作保証などの観点からお勧めしません
- 個人のPCを持参して利用することを強くお勧めします

### Google Colaboratory(Colab)の利用について
- この授業はColabの利用を必須とします
  - ColabはWebブラウザとGoogleアカウントがあれば利用できます
    - この授業専用にアカウントを取得することをお勧めします
    - 大学などが提供するグループのGoogleアカウントの利用は避けてください(課金できない場合があります)
- 課金により、より優れた環境を利用でき、課金する、課金しないは個人の自由とします
  - 無償でも履修上問題なく、演習問題の解答や試験でも障害は発生しません
  - 課金することでより強力なマシンを利用できるため、実行時間が短縮されるなどの不公平が発生しますが、この授業では考慮・配慮しません

### Google Colaboratoryが提供する仮想マシン環境には様々な制限があります
- 実行時間などに制限があるため放置すると最初からやり直しになります
- Google Colaboratory(Colab)は再セットアップするたびにファイルがすべて削除されます
  - Google Driveをマウントするなど工夫しなければなにも保存されません

# 授業テキスト
下記の`Open in Colab`バッジをクリックすると、該当するテキストのColabを開くことができます
- 開いた後、変更を加える場合は必ず「ノートブックの保存」を行い、自身のGoogle Drive内部に保存してください

----
- ガイダンス  
  - [歴史](https://github.com/keioNishi/lec-mlsys/blob/main/Guidance-1.md)
  - [基本](https://github.com/keioNishi/lec-mlsys/blob/main/Guidance-2.md)
  - [現実](https://github.com/keioNishi/lec-mlsys/blob/main/Guidance-3.md)
- 1-準備  
[![mlsys-text-1-準備.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-1-準備.ipynb)
- 2-ML基礎  
[![mlsys-text-2-ML基礎.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-2-ML基礎.ipynb)
- 2-ML基礎-補助  
[![mlsys-text-2-ML基礎-補助.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-2-ML基礎-補助.ipynb)
- 2-python復習  
[![mlsys-text-2-python復習.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-2-python復習.ipynb)
- 3-データの扱い  
[![mlsys-text-3-データの扱い.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-3-データの扱い.ipynb)
- 4-MLライブラリの基礎  
[![mlsys-text-4-MLライブラリの基礎.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-4-MLライブラリの基礎.ipynb)
- 5-Sklearn-まとめ  
[![mlsys-text-5-Sklearn-まとめ.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-5-Sklearn-まとめ.ipynb)
- 6-ニューラルネットワークの基礎  
[![mlsys-text-6-ニューラルネットワークの基礎.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-6-ニューラルネットワークの基礎.ipynb)
- 7-PyTorch  
[![mlsys-text-7-PyTorch.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-7-PyTorch.ipynb)
- 8-PyTorch-Basics  
[![mlsys-text-8-PyTorch-Basics.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-8-PyTorch-Basics.ipynb)
- 9-CNN  
[![mlsys-text-9-CNN.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-9-CNN.ipynb)
- A-RNN  
[![mlsys-text-A-RNN.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-A-RNN.ipynb)
- B-AutoEncoder  
[![mlsys-text-B-AutoEncoder.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-B-AutoEncoder.ipynb)
- C-転移学習  
[![mlsys-text-C-転移学習.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-C-転移学習.ipynb)
- D-強化学習  
[![mlsys-text-D-強化学習.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-D-強化学習.ipynb)
- E-PyTorch-Advanced  
[![mlsys-text-E-PyTorch-Advanced.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-E-PyTorch-Advanced.ipynb)
- F-物体検出・分割-1  
[![mlsys-text-F-物体検出・分割-1.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-F-物体検出・分割-1.ipynb)
- F-物体検出・分割-2  
[![mlsys-text-F-物体検出・分割-2.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-F-物体検出・分割-2.ipynb)
- G-音声識別  
[![mlsys-text-G-音声識別.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-G-音声識別.ipynb)
- H-GAN-1  
[![mlsys-text-H-GAN.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-H-GAN-1.ipynb)
- H-GAN-2  
[![mlsys-text-H-GAN.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-H-GAN-2.ipynb)
- I-NLP-1-Basics  
[![mlsys-text-I-NLP-1-Basics.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-I-NLP-1-Basics.ipynb)
- I-NLP-2-AttenSAGS2S  
[![mlsys-text-I-NLP-2-AttenSAGS2S.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-I-NLP-2-AttenSAGS2S.ipynb)
- I-NLP-3-Transformer  
[![mlsys-text-I-NLP-3-Transformer.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-I-NLP-3-Transformer.ipynb)
- I-NLP-4-BERT  
[![mlsys-text-I-NLP-4-BERT.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-I-NLP-4-BERT.ipynb)
- I-NLP-5-CLIP  
[![mlsys-text-I-NLP-5-CLIP.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-I-NLP-5-CLIP.ipynb)
- J-Transformer-ViT  
[![mlsys-text-J-Transformer-ViT.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-J-Transformer-ViT.ipynb)
- K-StyleGAN-1  
[![mlsys-text-K-StyleGAN-1.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-1.ipynb)
- K-StyleGAN-2  
[![mlsys-text-K-StyleGAN-2.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-2.ipynb)
- K-StyleGAN-3  
[![mlsys-text-K-StyleGAN-3.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-3.ipynb)
- K-StyleGAN-4  
[![mlsys-text-K-StyleGAN-4.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-4.ipynb)
- L-Diffusion-1  
[![mlsys-text-K-Diffusion-1.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-L-Diffusion-1.ipynb)
- L-Diffusion-2  
[![mlsys-text-K-Diffusion-2.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-L-Diffusion-2.ipynb)
- M-ChatGPT-1-Basics  
[![mlsys-text-M-ChatGPT-1-Basic.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-M-ChatGPT-1-Basic.ipynb)
- M-ChatGPT-2-Application  
[![mlsys-text-M-ChatGPT-2-Application.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-M-ChatGPT-2-Application.ipynb)
- N-アプリ-transformer  
[![mlsys-text-N-アプリ-transformer.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-N-アプリ-transformer.ipynb)
- O-RWKV  
[![mlsys-text-O-RWKV.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-O-RWKV.ipynb)
- P-Federated  
[![mlsys-text-P-Federated.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-P-Federated.ipynb)
- Q-AIの将来  
[![mlsys-text-Q-AIの将来.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-Q-AIの将来.ipynb)
----

# Colabの利用形態ついて
- Colabは無料で利用できる無償版の他、有償版があります
  - 授業で扱う内容の確認や実行、課題・試験なども含めて、無償版で問題ありません
- 学習内容において無償版と有償版の違いはなく、授業でも区別しません
  - 違うのは性能とインタフェースの一部だけで、基本機能は変わりません
- 有償版の方が素早く課題を終えることができる可能性があります
  - 有償版はより早いGPUを利用できるためです
  - 有償版(例えばColab Pro)は1,179円/月(2023年9月調査)で利用できるため、かなりお得で、十分に利用価値があります
- 講義や課題で利用する場合は日中の利用を推奨します
  - 無償版では海外、特にアメリカが利用する日本の夜間は混雑する傾向があり、海外が夜間となる日中の時間帯が比較的空いています
  - 日中混雑して利用できなかったという報告を過去受けておらず、試験も滞りなく実施できています

# 個人環境の利用について
- 個人でNVIDIA製のGPUマシンを所有している場合は、Colab同様の環境を個人で構築して利用することができます
  - あくまでもColabの利用を推奨し、個人環境の不具合対応も限定的となりますが、Colabの制約を開放しGPU処理環境や深層機械学習環境を自分の手で構築・実行することは極めて大きな意味を持ちます
- 互換性の問題による不具合・不利益は免責とします
  - 個人環境の構築に関する質問は授業の保証範囲外で不具合に対するサポートなどは行いませんが、可能な範囲で対応します
  - 個人環境構築はいばらの道ですが、構築して利用した場合、最終評価で採点上考慮することがあります
- 新たにGPU対応のPC、高価なGPUを購入するのは無意味で、Colabを使った方がよいです

以下、個人PCへのCUDA環境の構築について説明します

テキストは、すべてColab上で実行することを想定していますが、Colabを利用すると様々な制約があることも事実です
- 例えば、実行時間制限やファイルが消える、ブラウザを閉じることができないなど
自分のマシンに環境を構築することでこれらの制約を取り除くことができます
- 高性能なGPUがあればColabよりもかなり実行時間を削減できます
- 繰り返しますがいばらの道です

高性能なGPUを所持している、職場や研究室などのマシンに独自の環境を構築して利用できる場合は、次を参考にチャレンジしてください
- 特に困らないであろうというところは、説明を省略しています。
- 相応のマシン管理、Linuxの知識が必要です

なお、下記はWindows WSL2とUbuntu環境について記述しています
- Ubuntu(20.04および22.04)の利用を強く推奨します
  - Ubuntu以外のLinuxディストリビューションでもインストール可能ですが、インストール方法は各自で確認してください
  - 現時点でUbuntu, wsl共に最新のRTX4090へのインストールはそれなりに問題が解決されています
  - WSLではないWindows環境の利用は、特に新しいGPUを用いる場合は険しい道となる場合があり、また動作速度も遅いという報告があるため全く推奨されません
- Windows上で動作するAnacondaを利用して構築することもできます
 - 推奨ではありませんが、以下を参考にしてトライしてみてください
 - WSL2を利用すれば、比較的容易に構築できるはずです

## CUDAのインストール

インストール作業は、慣れない場合ほぼ丸一日作業となりますので注意してください

Windows、Ubuntu、もしくは新しいPCを準備します  
以下、WindowsでWSLを用いて構築する場合、Linuxマシンを新たに構築する場合、インストール済みLinuxマシンに構築する場合の順に手順を説明します
- Windowsマシンへのインストールについて
  - WSL2をインストールします  
    WSL2のインストールの詳細は検索して対応してください
    - WSL2が動作するように設定を変更します
    - 「Windows の機能の有効化または無効化」の」「Linux 用 Windows サブシステム」をONにします
    - WSL2 Ubuntu-20.04 LTSのインストールします
    - Windowsマークを右クリック→Windowsターミナル（管理者）を立ち上げ、次のコマンドを実行してUbuntuをインストールします
  ```
  wsl --install
  ```
  - NVIDIA Drivers for CUDA on WSL のインストール(WSL2を利用する場合はWSL専用のドライバがありますので注意してください)
    - Windowsで作業します
    - [こちら](https://developer.nvidia.com/cuda/wsl) からダウンロードしてください(リンクは変更されている可能性があります)
    - 所持しているGPUの型番が必要です
  - CUDA Toolkitをインストール
    - [こちら](https://developer.nvidia.com/cuda-downloads) からダウンロードしてください(リンクは変更されている可能性があります)
    - WSL2の場合は、Linux, x86_64(環境に併せてください), WSL-Ubuntu, deb(network)を選択します(インストールしたバージョンも指定します)
    - 表示されるコマンドラインをWSL2 Ubuntuのコマンドラインに入力して実行します
- Linuxマシンを新たに構築しインストールする場合について
  - Ubuntu22.04.xをインストールします
  - **インストール時に、'Install third-party software ...' のチェックボックスをONにしてインストールします**
  - これだけで基本環境がすべて導入され、'nvidia-smi'が動作するようになります
  - 念のため、build-essentialをインストール
  ```
  sudo apt install build-essential
  ```
  として開発ツール一式を一気に導入します
- 構築済みのLinuxマシンへのインストールについて
  - 上記のように再インストールするとトラブルが少ないですが、必要に応じて以下の手順でインストールします
  - build-essentialをインストール
  ```
  sudo apt install build-essential
  ```
  として開発ツール一式を一気に導入します
  - CUDA Toolkitをインストール
    - [こちら](https://developer.nvidia.com/cuda-downloads) からダウンロードしてください(リンクは変更されている可能性があります)
    - WSL2の場合は、Linux, x86_64(環境に併せてください), Ubuntu, deb(network)を選択します(インストールしたバージョンも指定します)
    - 表示されるコマンドラインをWSL2 Ubuntuのコマンドラインに入力して実行します
  - Ubuntuの利用を推奨します
    - Ubuntu20.04、22.04いずれも問題ありません
  - NVIDIAドライバーを導入  
    - 通常は、以下のコマンドを入力して導入してください
  ```
  sudo ubuntu-drivers list
  sudo ubuntu-drivers install 
  sudo reboot #再起動
  ```
    - うまくいかない場合は、GUIドライバ(X Windowsのドライバ)と競合している場合があります  
    ```
    sudo sh -c "cat << ETX > /etc/modprobe.d/blacklist-nouveau.conf
    blacklist nouveau
    options nouveau modeset=0
    ETX" && cat /etc/modprobe.d/blacklist-nouveau.conf
    sudo update-initramfs -u
    sudo reboot
    ```
    として回避してください

以下、Ubuntu、Windows共に共通です
- インストール環境の確認
  - コマンドラインに以下のコマンドを入力して動作を確認してください  
> nvidia-smi

## 単にColabをローカルで動作させたい場合

つまり、専用に何かAI実行・実装環境を構築するのではなく、単純にColabと同じことがしたい、という場合は次の通り、比較的簡単に環境を構築できます
- 所有しているGPUで若干方法や楽さが変わります

### エグイ環境を持っている恵まれている人の場合

個人で所有しているのは、かなりヤバい人ですが、NVIDIA T4、V100、A100、H100 GPUなどが自由に使える、もしくは、研究室や企業などでこれらが搭載されたマシンが利用できる場合は、単純に、自分のマシンにGoogleが提供するDockerコンテナを導入して実行することができます

[Googleによるローカルランタイムマニュアル](https://research.google.com/colaboratory/local-runtimes.html?hl=ja)を参照する

- ColabのDockerランタイムイメージをインストールする  
```
docker run --shm-size=1gb --gpus=all -p 127.0.0.1:9000:8080 us-docker.pkg.dev/colab-images/public/runtime
```
`--shm-size=1gb` は、dockerコンテナの/dev/shmのサイズを増やすために必要であり、これを忘れるとデータローダなどで実行できない
- Bus Errorが発生する場合がある

**ここまできたら、「起動」に続く**

### 普通の環境(といっても十分エグイが)

GPU環境を確認しよう
- GPUメモリ20G以上の良いGPU(nVIDIA RTX 2080Ti/3090/3090Ti/4090/6000Ada/6000/A5500/A5000)を持っているならば、このテキストのコードを全て実行可能である
  - さらに、最新GPUを所有している場合、ColabのA100と同等の速度で実行できるようになる(ColabのA100は実機A100よりも遅い)
- GPUメモリ16G以上のGPU(nVIDIA RTX 4080/4060Ti/4060A4000,Turing,Quadro GP100)あれば、テキストのままほぼ動作する
- GPUメモリが12G以上のGPU(nVIDIA RTX 4070Ti/4070/3080/3060/2060など)であれば、さらに動作するテキストの数は少なくなるが、工夫することで(途中でエラーになった場合、つじつまを合わせて、途中から実行しなおすなど)、やはりほとんどのテキストが動作するようになる
- Radeonについては確認実績がないが、PyTorchでROCmバージョンを入手しインストールすることで利用でき、数多く動作報告も存在しているため、上記のGPUメモリサイズを参考に是非チャレンジしてほしい
- それ以外のGPUの場合、多くのテキストが実行できないが、基本的なモデルは実行可能であろう

条件を満たせば、LinuxでもWindowsでも、DockerファイルからDockerコンテナを作成して、Colab環境を起動してしまえばよい

- **Windowsの場合**
  - WSLをインストールする
```
wsl --install
```
  - Docker Desktopをインストールする  
公式サイト( https://www.docker.com )からWindows版インストーラーをダウンロードしてインストール

**ここまできたら、「起動」に続く**

- **Linuxの場合**
  - Dockerをインストールする  
```
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
```  
としてインストールする

**ここまできたら、「起動」に続く**

### 起動

- このレポジトリのDockerにあるdocker-compose.ymlを利用してDockerコンテナを作成する
  - Toolsまで移動する
  - docker-composeを利用してコンテナを作成して起動する(なおwindowsではsudoは不要です)  
```
sudo docker-compose up -d
```
もしくは、次のように実行する
```
sudo docker compose up -d
```

docker-compose.ymlの中に、`- JUPYTER_TOKEN=2238522`とあるが、慶應矢上キャンパスの郵便番号であり、この番号がトークン番号となります

コンテナが起動すると、認証に使用する初期バックエンド URL（ http://127.0.0.1:9000/?token=... の形式）が含まれたメッセージが表示されるため、この URL を控えておく
- わからなくても、変更していなければ2238522です

### 接続

- Colab で、**接続** ボタンをクリックして **ローカル ランタイムに接続...** を選択する
- 表示されたダイアログに、コピーしたURL( http://localhost:9000/?token=2238522 )を入力して [接続] ボタンをクリックする
  - なお、ホスト名はlocalhostや127.0.0.1でなければならない点に注意すること
  - `--shm-size`オプションは、docker-compose.ymlの中で拡大するように記述しているため不要です

これだけで解決し、Google Colaboratoryと全く同じ環境が手に入る

次のような注意点がある
- gradioなど、別途ポートを利用するライブラリなどを利用する場合は、工夫が必要である
  - 現状、gradioだけ対応させており、次のように記述を変更することで利用可能となる
    `app.launch（server_name="0.0.0.0"）` => `app.launch（server_name="0.0.0.0", share=True）`
- notebook上でtensorboardを表示する機能などは利用できない

## 専用の環境を構築したい場合

CUDAをインストールした後、以下のインストールを行います
- 下記の手順では、Colabとは異なる環境が構築されるため、より一般的な環境を構築することができますが、テキストを全て実行可能になる、というわけではありません
- テキストはColabに特化しています

### Anacondaのインストール

ここから先はWindowsのWSLとLinux Ubuntuで共通です
- [Anacondaのサイト](https://anaconda.com)からインストール用スクリプトをダウンロード
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

### Pytorhをインストールする
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

- 比較的新しいGPUや新しい機能を利用する場合は、Nightlyを利用します
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

### Jupyter Notebookをインストール
Google Colaboratoryと協調動作させることや、Colabなしでもテキストの閲覧と実行ができるようになります  
```
conda install -y jupyter
pip install --upgrade jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws
jupyter nbextension enable --py widgetsnbextension
```

### 授業で利用するライブラリをインストール

#### condaで普通に導入

なお、condaで入れていますが、-c conda-forge オプションが必要な場合もあります  
まずは、次で一気にいれてみます
```
conda install -y numpy pandas matplotlib scikit-learn scikit-learn-intelex scikit-image python-graphviz pydotplus seaborn missingno lxml lightgbm xgboost ipywidgets requests beautifulsoup4 gensim keras
```
もし、問題が発生するか、`Solving environment: failed with initial frozen solve. Retrying with flexible solve.`と表示され、多くの場合かなり待たされた場合は、さらに待っても解決しない可能性が高いです  
- このような場合、baseでconda update condaとしてcondaを更新するのも一つの手ですが、環境は人によって異なるため、とにかくもがいてください
- 問題が解決しない場合、anacondaをきれいに最初から入れなおすのが良いと思います

#### conda-forgeを利用して導入

確認において、conda-forgeの利用が必要なライブラリは以下の通りです
- かなり先で使いますので無理にインストールする必要はありません
```
conda install -y -c conda-forge librosa
```

#### pipを利用して導入

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
conda create -n lecmlbk --clone lecml
```

#### 言語処理系ライブラリ

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

#### その他

- tensorflowを入れる
これが、pythonのバージョン整合が厳しく、失敗することもありますが、授業では特に必須ではないためスキップしても構いません  
さらに、tensorflowを入れることで、pytorchのアーキテクチャサポートが制限されるという現象から、tensorflow用の環境を別途clone作成してからインストールすることをお勧めします
```
conda install -y tensorflow-gpu tensorflow-datasets tensorflow-hub
```
ですが入らなくても特に困ることはありません。
```
conda install -y tensorflow-gpu tensorflow-datasets tensorflow-hub -c conda-forge
```
で入る場合もあります  
なお、tensorflow-gpuさえ入ればなんとかなります

- tensorboardも導入する  
Colabはtensorboardが初めからインストールされており、テキストの最後の方で利用するため、ここで導入しておく
```
pip install tensorboard
```

## 最後に

ここまでインストールしたら、この環境を壊さないように、バックアップを取得しておきましょう
- 動作しなくなったら、こちらで取得したlecmlbkというバックアップをリストアして利用するとよいです
```
conda create -n lecmlbk --clone lecml
```

## おまけ

### jupyter AIを導入

```
pip install jupyter_ai jupyter_ai_magics openai huggingface_hub ipywidgets pillow
```

として導入、jupyter-aiを起動すると、jupyter同様に8888ポートで見えるようになる

できることは次の通り

- チャットできる
      
  - 左パネルにチャットのボタンが追加されており、ChatGPTと対話できる
  - Language modelをOpenAI::gpt-4に、Embadding modelをOpenAI::text-embedding-ada-002などに設定する
  - APIKEYを入力する(ここは有料です)

- ノートブックについて問い合わせる
      
  - ノートブックのセルに対して範囲選択をすると、チャットエリアの下部にInclude selectionとReplace selectionが表示され、Include selectionを選択すると選択したコードを含んだ形で質問ができる
  - Replace selectionを選択すると、選択したコードがチャットの回答で上書きされる(チャットの回答が正しい保障はない)

- 追加で学習させる
      
これが強力で、embedding modelを用いることで、チャットが質問に答える際に自分が保有するドキュメントなどのローカルデータを含めるようにすることができる
  - 例えば、docsというフォルダを作成し、その下に様zまあなドキュメントを入れ、チャット欄で、`/learn docs/`と入力することで学習させることができる(/learnがコマンド)
  - この学習した内容に対して問い合わせる場合は`/ask "質問文章"`とする
      
- マジックコマンドを利用して、直接結果をセルに反映する
      
`%load_ext jupyter_ai_magics`として拡張機能をロードし、`%ai list`として、その一覧をみると様々な機能拡張が利用できることがわかる

```
%%ai openai:text-ada-001
Write some JavaScript code that prints "hello world" to the console.
```

このようにmodel IDも指定してコマンドを使うことで、結果がmarkdown内に挿入され、`%%ai openai:text-ada-001 -f code`とすると、コードとして挿入される
      
- セルを参照することができる

セルを参照することができるコマンドが存在するため、次のような指定ができる

```
%%ai openai:text-davinci-003 --format code
The following Python code:
--
{In[14]}
--
produced the following Python error:
--
{Err[14]}
--
Please tell me the cause of the error.
```

- Stable Diffusionで画像生成

なんてことはない

```
%%ai huggingface_hub:stabilityai/stable-diffusion-2-1 --format image
It's an astronaut with a boombox
```

ちなみに、waifu-diffusionの場合は、次の通り

```
%%ai huggingface_hub:hakurei/waifu-diffusion --format image
masterpiece, best quality, 1girl, green hair, sweater, looking at viewer, upper body, beanie, outdoors, watercolor, night, turtleneck
```

- ただし、日本語の対応はいまいちで今後のに期待

### wgetの導入

中にはwgetなど、Linux系のコマンドを利用しています  
Linux上で構築する場合は特に問題とはなりませんが、Windows上で構築するには、次の2つのLinuxで著名なコマンドラインツールを導入をしておくとよいでしょう

使用頻度も高いので、ぜひ入れてください。

https://sourceforge.net/projects/gnuwin32/files/wget/1.11.4-1/wget-1.11.4-1-setup.exe/download

これを実行するだけです  
ほかのアーキテクチャでも同様に、利用できるようにしてください

### Gitの導入
  
GitHub環境を自身のマシンに導入する際には、ほぼ必須ともいえるツールです  
特に、Windowsユーザの皆さんには、Git Bashの導入をお勧めします  
Git Bashを導入することで、下記、busyboxの導入は不要になるといえます

### busyboxの導入

Git Bashを導入しない場合、Windowsでは、lsなどUnix系コマンドの実行はかなり厄介です(Windows11でかなり良くなりますが)  
そこで、次のbusyboxの導入が検討されますが、お勧めではありません(https://frippery.org/files/busybox/busybox.exe)

導入後、busybox.exeをC:\Windowsにコピーして、その中で busybox --installとするとメジャーコマンドが利用できるようになります

## Jupyter NotebookをGoogle Colaboratoryに接続する

これが重要です  
Google Colaboratoryに慣れている人は、ピュアなJupyter Notebookは使いにくいと感じると思います  
そこで、いつも通りGoogle Colaboratoryを利用しつつ、ローカルの計算リソースを利用することができますので、紹介します

- 最初だけ、実行バッチファイルを作成する

メモ帳でも、busyboxのviでもよいので、jupyterrun.batというファイルを作成します。中身は次の通りです
```
jupyter notebook --no-browser --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0 --allow-root --ip=0.0.0.0 --NotebookApp.token=''
```
なお、この仕様は近々変更される予定で、
```
jupyter notebook --no-browser --App.allow_origin='https://colab.research.google.com' --port=8888 --ServerApp.port_retries=0 --allow-root --ip=0.0.0.0 --NotebookApp.token=''
```
とする必要があるかもしれません

- 最初に一度jupyterrun.batを実行する

ログが吐き出され動き出すはずです。これが動いている間は、複数のセッションが接続できます

- 普通にGoogle Colaboratoryでノートブックを開き、「接続」する際に、「ローカルランタイムに接続」を選択する

http://localhost:8888/ バックエンドに指定されているはずですので、そのまま接続とします

これで、 Google Coalbを利用せず、自分の環境を利用するようになります。全ての制限が外れます。つまり、利用時間やセッションの制限はなくなり、ファイルが消えることもありません

## resolv.conf

wslは、resolv.confを勝手に書き換えて、そのまま名前が解決できず接続できない環境を作ってしまいがちである
- `/etc/resolv.conf`を例えば`nameserver 8.8.8.8`などとすると動作する
- このような現象が発生する場合は、以下の通りの修正で解決する

一般には、`rc.local`というファイルを生成することで、このファイルが起動時実行されることから、中に`/etc/resolv.con`を書き換えるように記述すればよいが、wslには`rc.local`を実行させる機能が備わっていない

しかしながら、wslが最初に`/sbin/mount -a`を実行することから、このときにrcファイルシステムをマウントするように設定し、`mount.rc`を呼び出させることで、`rc.local`と同じことができる
- この中で`resolv.conf`を書き換えるという技を使う

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

## 注意

### Anacondaの操作について

一度動く環境ができたら、その環境を維持するため、`conda update --all`すらも避けるべきです
- これで壊してしまった経験が何度かあります
```
conda create -n copyenv --clone originenv
```
として、環境をコピーしてから始めるとよいです

その他、よく使うコマンドを紹介しておきます
- `conda info -e`: 作った環境の一覧を表示
- `conda create -n test`: testという名前の環境を作成
- `conda remove -n test --all`: testという環境を削除
- `conda create -n myenv python=3.7`: Python バージョンを指定して作成
- `conda activate test`: 環境testの有効化
- `conda deactivate`: 環境の無効化

### Anacondaが最初に起動しないようにする

また、Anacondaをインストールすると、(base)と表示されます。これが嫌という場合もあるかと思います。
```
conda config --set auto_activate_base false
```
として、デフォルトでbaseがactivateされないようにするとよいでしょう。ログインしなおすと(base)と表示されません。

