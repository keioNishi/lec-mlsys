[![レクチャーノートブック](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys)
[![PyTorchバッジ](https://img.shields.io/badge/PyTorch->v2.0-232f3e.svg?style=flat)](https://pytorch.org/)
[![Discord機械学習システム](https://img.shields.io/badge/Discord-keio--sd--mlsys-3f0f40.svg?style=flat)](https://discord.gg/vFKeE6fW)
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
  - 課金することでより強力なマシンを利用でき、なによりもGeminiを利用できるため、ある程度のコード自動生成とバグの自動修復が可能となります。結果的に、課題や試験において正解に至りやすい、指向時間や実行時間が短縮されるなどの不公平が発生します
  - これら、課金によるアドバンテージについて、この授業では考慮・配慮しません
  - 試験問題の解答において課金によるアドバンテージは不問です
    - つまり試験問題解答時においてインターネットアクセスが許可され、その時点でアクセス可能であった情報であって、試験解答者の情報を共有していないという条件において、全て利用できます
  - 試験の回答は適宜記録される形式とします
    - 事前に与えられたkeio.jpアカウントによるアクセスのみ許可し、アカウント内での行動が監視されます
    - 監視を阻害する、コピーを取得することによる許可されない場所での解答作成や、解答手順が見えない、解答根拠がなく解答が突然現れる、解答に全くエラーがなく突然正解が現れる、誤答も含めて解答が他者と完全一致するなどは、全て誤答として扱います

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
- 参考資料　
  - [個人環境の構築](https://github.com/keioNishi/lec-mlsys/blob/main/README-DIY.md)
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
[![mlsys-text-J-ViT.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-J-ViT.ipynb)
- K-StyleGAN-1  
[![mlsys-text-K-StyleGAN-1.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-1.ipynb)
- K-StyleGAN-2  
[![mlsys-text-K-StyleGAN-2.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-2.ipynb)
- K-StyleGAN-3  
[![mlsys-text-K-StyleGAN-3.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-3.ipynb)
- K-StyleGAN-4-Application  
[![mlsys-text-K-StyleGAN-4-Application.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-K-StyleGAN-4-Application.ipynb)
- L-Diffusion-1  
[![mlsys-text-K-Diffusion-1.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-L-Diffusion-1.ipynb)
- L-Diffusion-2  
[![mlsys-text-K-Diffusion-2.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-L-Diffusion-2.ipynb)
- M-ChatGPT-1-Basics  
[![mlsys-text-M-ChatGPT-1-Basics.ipynb](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/keioNishi/lec-mlsys/blob/main/mlsys-text-M-ChatGPT-1-Basics.ipynb)
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
  - ただし、昨今のインフレ状況下でColabの無料枠がかなり制限されており、無慮枠だけでは、制限により授業課題の遂行などが困難になる可能性があります
  - また、無料枠を超えたことを理由とした、課題の遅延や未提出は認めませんので、この点もあらかじめ了承してください
- 学習内容において無償版と有償版の違いはなく、授業でも区別しません
  - 違うのは性能とインタフェースの一部だけで、基本機能は変わりません
- 有償版の方が素早く課題を終えることができる可能性があります
  - 有償版はより早いGPUを利用できるためです
  - 有償版(例えばColab Pro)は1,179円/月(2024年9月調査)で利用できるため、かなりお得で、十分に利用価値があります
  - およそ全ての内容を自己確認し、かつ、工夫をして動作確認しつつ、全ての課題を解くという観点で、十分な課金です
  - 不足する場合は、Pay As You Goを利用してください(1,179円で90日有効です)
  - Colab Proで十分であり、Colab Pro+を利用する必要はありません
- 講義や課題で利用する場合は日中の利用を推奨します
  - 無償版では海外、特にアメリカが利用する日本の夜間は混雑する傾向があり、海外が夜間となる日中の時間帯が比較的空いています
  - 日中混雑して利用できなかったという報告を過去受けておらず、試験も滞りなく実施できています(2024年は厳しいかもしれません)
