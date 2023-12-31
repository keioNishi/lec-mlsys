# ニューラルネットワークの基本

構造については既に触れた

## 学習と推論
利用する際には「学習」と「推論」を行う
- 学習：学習用のデータ（教師データ）を用いてNNに含まれるニューロンの重み値を調整するステップ
- 推論：調整済みの重み値をもつネットワークを使って、回答を出すステップ

一般に、学習には大量の計算資源と時間が必要
- すなわち、計算機の能力向上がその発展には不可欠
- 結合情報や学習が進んだ重み値（纏めてモデルと呼ぶ）の再現は比較的容易にできるため、応用しやすい

## 具体例を考える

エアコンを自動制御したいとする
- リモコンに快適ボタンと不快ボタンだけある
  - このリモコンを使って情報を集める
  - ボタンが押された時の温度と湿度を監視する

その申告値をグラフすると次のようになった
- 快適と申告した時の温度と湿度に青点
- 不快と申告した時の温度と湿度に赤点

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance5.png">


人間ならば、次のように快適と不快の境界を定めて制御すればよいとすぐにわかる
- 赤に入ったら制御！青に入ったら現状維持！

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance6.png">

機械はどうする？

# 基本機能を備えたplaygraound.tensorflowで遊ぶ

[playground.tensorflow.org](https://bit.ly/3gZzHq5) にアクセスして色々と試してみよう

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance11.png">

## まずは最初の状態から

基本操作
- 丸三角右ボタンを押すと学習が進む
- 学習が進むと、右上の損失関数の値が小さくなる
  - 損失(ロス)は推論結果と教師データの差を示したグラフであり、この差が少なくなるということは、学習が進んで推論が正解に近づいていること
  - ロスグラフは右肩下がりに推移するし、推移しなければ何かがおかしい(間違っている)
  - よく見ると2つのグラフがあるが、一つはテストロスで、検証用データのロス、もう一つがトレインロスで、学習用データのロス
  - トレインロスを用いて、バックプロパゲーションが実施され、テストロスは何もしない(してはいけない)

学習がすすめば、「快適」と「不快・要制御」の領域が塗り分けられる
- 重要なのは「青や赤がない点も塗り分けていること」
- まずは動かして、何ができているかを理解する
- ハイパーパラメータを色々変えるのは、ちょっと後回し

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance12.png">

## そんなの、ニューラルネットワークなんて不要です！

はい、その通りです
- 例えば、右の図において、快適か深いかを調べたい点がある

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance13.png">

- この点について、周りの点との距離を2点間の距離の公式で調べて、「一番近いのは青点、赤点どちらか？」とか「近いトップ10位に青点が多いか、赤点が多いか？」とかを調べればよい
- この考え方で境界を決めると次の通り

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance14.png">

出来てはいるが…、だが、現実はそうではない

## どうも…データが少ないのよね
テストデータの数を10%と少なくしても、うまくいくように設定できる

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance15.png">

## データも少ないし、人間って適当なのよね
人間は機械ではなくきまぐれなので、
- 同じ温度湿度でも、家族喧嘩して「不快」と怒って押してみたり
- AIだと？！いじめてやれ！って敢えて逆を押してみたり
- 寝ていて誤ってボタンを押してみたり

好き放題やりますよね、それでも、出来てしまう

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance16.png">

## つまりロバストである
- 非線形な場合でも対応する
  - 線形つまり、直線で表現できるのに、わざわざAIを使うのは大げさで、しばしば学会で笑いものになる
  - 芋を太陽に突っ込んで焼くな！オーブンで十分
- 非線形な関係は、表現の幅が広すぎてグンと難しくなる
  - 世界は非線形なものばかり
- モデルがわからなくても、なんとかなる
  - 物理的にモデルがわかっている場合は使うな
- 少々ノイズがあっても、なんとかなる
  - 一言で言えば、「いい感じにやってくれる」

## どのようなデータを特徴量とするのか
一番最初の状態に戻そう

このモデルでは、与えられた特徴量から快適・不快のマップを作成するような問題を解いている

では、どのような特徴量を与えるとよいのか？を考える
- 今は、シンプルにx, y 共に平均増加する直線($y=x$)

快適域はあるスポットであり、そこから外れると不快になる
- $y=x^2$の方が適切ではないか？
- やってみよう
  - $X^1, X^2$をクリックして非選択にする
  - $X^{11}, X^{22}$をクリックしてこれらのみ選択する

ちゃんとうまく分類できる

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance17.png">

それも、先ほどよりも短時間で収束する！

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance18.png">

なぜ$y=x^2$という関数を選んだのか？
- $y=x^2$のグラフは下に凸なので「中央と外」の区別がしやすいだろうと予想
  - 予想して選ぶならできて当然だろう！と思う人、その通りです
  - 画像認識AIも画像に特化して構成されている
- 膨大な計算量と時間を我慢するならば、工夫せずにやってよい
  - そこに金や時間を掛ける意味が？？？とならなければ、それでよい
  - 実際にはお金や時間を掛けたくないので、チートをしてでもはやく解ける方法が欲しいと考えるのは当然
- このように、データの特徴を見出しその扱いになれているエキスパートがデータサイエンティスト
  - AIを勉強するというよりも、データサイエンティストとして、正しくデータを処理できる人材になるべきである、というのが言いたいこと
  - データをそのまま食べさせるのではなく、工夫する
  - 工夫しなければ、教師データが大量に必要になる場合もある
 
**それどころか、特徴量を工夫するとさらにいいことがある**

もっとシンプルにネットワークを構成できる！
- これまでは、中間層が2層で、4x2ノード、これを中間層なしでいきなり出力、としても大丈夫
  - つまり、計算量がグンと下がり、安い計算機で学習できる！

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance19.png">

## 理解を深める

なぜ、単純に温度と湿度それぞれについて𝑦𝑦=𝑥𝑥という簡単な式を与えるだけで学習できたのだろうか？

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance20.png">

**確認すると、確かにできる！**

一つだけにしてみても、案の定、中央が円で囲われた境界が現れている

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance21.png">

実はなくてもよく、既に試した通り、最終形が隠れ層の内容であれば省略すればよい

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance22.png">

## では、無駄に大きなネットワークを使ってもできるのか？

何の問題もない

つまり、「工夫しなくても十分な規模のネットワークを使えばなんでもできる」ということがDNNの重要なメリット

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance23.png">

## 特徴量を一杯そろえてもできるのか？

何の問題もない

途中で欲しい分類が得られていることから「無駄」であることはわかる
- やはり、潤沢に特徴量やノードを準備しておけば、自動で学習するからうれしいであろう
- これを自動というのならば、計算資源を潤沢に使って「自動」を実現すればよい

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance24.png">

## なぜ多層NNの学習が難しかったのかを確認
- 層数が大きい場合、活性化関数にシグモイドを選ぶと収束しない
- DNNではシグモイドが使えない。ReLUの発明がDNNの世界を切り開いた
  - 一方で、隠れ層が多いから良い結果がでるというわけではないことも確認する
  - tanhでもよさそうだが、計算コストが大きい

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance25.png">

## 過学習ってなに？

何事もやりすぎてはダメ！
- 分類できたのに、時間をかけすぎると、とにかく頑張って「細かく」区分けしようとする
  - とくに無駄にネットワークを複雑にすると起きてしまう
  - グラフで学習データは値がよくなる(小さくなる)が、検証データは悪くなる

<img src="http://class.west.sd.keio.ac.jp/dataai/text/guidance26.png">
