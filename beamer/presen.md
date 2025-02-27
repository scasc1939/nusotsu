# 原稿

- [原稿](#原稿)
  - [目次](#目次)
  - [なぜ線形代数？](#なぜ線形代数)
      - [量子力学の基本方程式](#量子力学の基本方程式)
      - [数学的には](#数学的には)
  - [ヒルベルト空間って？](#ヒルベルト空間って)
    - [ヒルベルト空間](#ヒルベルト空間)
    - [ベクトル](#ベクトル)
      - [ベクトルの性質](#ベクトルの性質)
      - [ユークリッド空間の例](#ユークリッド空間の例)
      - [ベクトル空間の定義](#ベクトル空間の定義)
      - [ベクトルの例](#ベクトルの例)
      - [ベクトル空間の基底と次元](#ベクトル空間の基底と次元)
    - [内積](#内積)
      - [なぜ内積が必要か？](#なぜ内積が必要か)
      - [ユークリッド内積](#ユークリッド内積)
      - [内積の定義](#内積の定義)
      - [正規直交基底](#正規直交基底)
      - [関数の内積](#関数の内積)
    - [完備性](#完備性)
      - [内積空間の完備性](#内積空間の完備性)
      - [（参考）完備性の定義](#参考完備性の定義)
    - [ヒルベルト空間](#ヒルベルト空間-1)
      - [ヒルベルト空間](#ヒルベルト空間-2)
  - [ヒルベルト空間から ℂ^N へ](#ヒルベルト空間から-ℂn-へ)
    - [同型](#同型)
      - [同型とは：ベクトル空間の同型](#同型とはベクトル空間の同型)
      - [同型とは：線形構造](#同型とは線形構造)
      - [同型とは：内積空間の同型](#同型とは内積空間の同型)
      - [N次元ベクトル空間どうしは同型](#n次元ベクトル空間どうしは同型)
    - [表現行列](#表現行列)
      - [表現行列の導入](#表現行列の導入)
      - [表現行列の形式的な定義](#表現行列の形式的な定義)
  - [量子力学の公理](#量子力学の公理)
      - [有限次元の状態](#有限次元の状態)
    - [量子系の状態](#量子系の状態)
      - [量子系の状態とは？](#量子系の状態とは)
    - [測定とは？](#測定とは)
      - [オブザーバブルとエルミート行列](#オブザーバブルとエルミート行列)
      - [オブザーバブルの測定](#オブザーバブルの測定)
      - [オブザーバブルの測定（つづき）](#オブザーバブルの測定つづき)
    - [基底測定](#基底測定)
    - [状態の時間発展](#状態の時間発展)
      - [状態の時間発展](#状態の時間発展-1)
    - [波束の収縮](#波束の収縮)
      - [波束の収縮](#波束の収縮-1)
  - [多体系の量子力学](#多体系の量子力学)
    - [スピン系](#スピン系)
      - [スピン](#スピン)
    - [テンソル積](#テンソル積)
      - [多粒子系の扱い方：テンソル積](#多粒子系の扱い方テンソル積)
      - [テンソル積の空間](#テンソル積の空間)
      - [行列のテンソル積](#行列のテンソル積)
      - [テンソル積で表せないテンソル積](#テンソル積で表せないテンソル積)
      - [エンタングル状態](#エンタングル状態)
      - [エンタングル状態の測定](#エンタングル状態の測定)
  - [量子テレポーテーション](#量子テレポーテーション)




## 目次

発表の流れは，こんな感じです．

まず前半で準備として，量子力学でよく登場する「ヒルベルト空間」をきちんと定義します．そして，スピン系の状態は，数ベクトル（数字を縦に並べたもの）として考えることができるということを説明します．

そして後半では，線形代数の言葉を使ってエンタングル状態（今回のテーマであるエンタングルメント）を定義して，その性質について話します．

エンタングルメントは，ごく少数の量子力学の公理（前提）から簡単に定義できるのですが，それにも関わらず，エンタングルした粒子は，常識からかけ離れた非常に不思議なふるまいをします．

不思議な不思議なエンタングルメントの世界へようこそ．


## なぜ線形代数？

「量子力学が線形代数である」とはよくいわれますし，実際ここでも線形代数を使って議論をするのですが，まずは，「量子力学が線形代数である」とはどういうことなのかについて，少し見ておきましょう．


#### 量子力学の基本方程式

皆さんも当然ご存じでしょうが，量子力学の基本方程式である，

(*NEXT*)

この**シュレーディンガー方程式**は，「線形な微分方程式」です．

つまり，シュレーディンガー方程式の解となる2つの関数 $\psi, \xi$ を重ね合わせた関数（2つの線形結合をとったもの），

(*NEXT*)

このような $\eta$ は，やはりこのシュレーディンガー方程式の解になっています．

$\eta(\boldsymbol{r}) = a \psi(\boldsymbol{r}) + b \xi(\boldsymbol{r})$ という関数の形は，なんとなくベクトルの線形結合 $\boldsymbol{v} = a \boldsymbol{x} + b \boldsymbol{y}$ に似ていますね．



#### 数学的には

方程式の「解の重ね合わせ」ができるということはつまり，「方程式の解となる関数の全体が**ベクトル空間**をなす」ということです．

ベクトル空間のきちんとした定義はこれから述べますが，このベクトル空間を扱うのが，皆さんもよくご存じであろう「線形代数学」と呼ばれる数学の分野です．

量子力学で扱う「ヒルベルト空間」とは，このベクトル空間のうちの特別なもの（関数を扱う上で良い性質をもったもの）を指します．



## ヒルベルト空間って？

それでは前半のはじめとして，ヒルベルト空間を定義しましょう．


### ヒルベルト空間

名前だけは有名なヒルベルト空間ですが，一体何者なのでしょうか．

(*NEXT*)

ヒルベルト空間の定義は，「内積をもつベクトル空間であって，ノルムに関して完備なもの」です．

これでピンとくる人はあまりいないでしょうから，それぞれの用語について，このセクションできちんと定義しようと思います．



### ベクトル

まずは「ベクトル空間」についてです．


#### ベクトルの性質

本題に入る前に，そもそもベクトルとはどういったものなのでしょうか？　ここでは「ベクトルに関する計算」という観点から考えていましょう．

ベクトルに対してできる計算には2種類あります．

まず，2つのベクトルを足すことができます．ベクトル $\boldsymbol{x}$ と $\boldsymbol{y}$ の和 $\boldsymbol{x} + \boldsymbol{y}$ も，当然ベクトルになっています．

また，1つのベクトルの複素数倍（スカラー倍）をすることもできます．もちろん $c \boldsymbol{x}$ もベクトルになっています．

この2つを合わせると，ベクトルの**線形結合**というものを考えることができます．ここでは $a \boldsymbol{x} + b \boldsymbol{y}$ という2個のベクトルの線形結合を書いていますが，もっとたくさんのベクトルの線形結合をとることもできます．

この線形結合こそが，ベクトルの基本です．そこで，線形結合，あるいは線形演算（和とスカラー倍）の性質について見ていくことにします．


#### ユークリッド空間の例

まずは典型的なベクトル空間である**ユークリッド空間**について考えてみましょう．

ユークリッド空間のベクトルというのは，数字を縦にいくつかならべた，よく見るものですね．もちろん，この空間のベクトル $\boldsymbol{x}$ と $\boldsymbol{y}$ の線形結合 $a \boldsymbol{x} + b \boldsymbol{y}$ も，またベクトルになります．

(*NEXT*)

先ほど見た，シュレーディンガー方程式の解の重ね合わせ $a \psi + b \xi$ がまた方程式の解になることに似ていますね．


#### ベクトル空間の定義

ユークリッド空間にあるベクトルの性質を書き連ねたのが，ここにあげた，1–8の条件です．

なかなかこう列挙するとギョッとしますが，よくよく見てみると，ひとつひとつが当たり前のことを言っているにすぎません．

(*NEXT*)

ここで発想を転換させると，ここに挙げた1–8をみたすような $\boldsymbol{\psi}$ は，ユークリッド空間の縦ベクトルと同じような性質があるといえます．

そこで，これら1–8の条件を満たすような $\boldsymbol{\psi}$ を，**ベクトル**と呼ぶことにします．

シュレーディンガー方程式の解も，この条件を満たすので，ベクトルといえます．


<!--
数学では，こうやって，最初から具体的なベクトル空間――たとえばユークリッド空間のようなもの――を考えるのではなく，まずは抽象的な定義をバンと与えてから，その定義を使ってコツコツと計算をするということをよくやります．
-->


#### ベクトルの例

ベクトルの例としては，こんなふうに，いろいろなものがあります．


#### ベクトル空間の基底と次元

このようにしてベクトル空間が定義されたわけですが，どんなベクトル空間にも**基底**と呼ばれる特別なベクトルの組が存在して，その基底に含まれるベクトルの数を**次元**とよぶのは，ご存じのとおりです．


というわけで，ここまででベクトル空間の基本的な性質の説明が終わりました．



### 内積

#### なぜ内積が必要か？

さて，ベクトル空間は前のセクションのように定義できるのですが，実はこれだけだと，まだ，ベクトルの幾何学的な性質，具体的には，ベクトルの「長さ」や，ベクトル同士が「直交する」といった概念が定義できません．

(*NEXT*)

何がまずいのかというと，量子力学でよく登場する「**正規直交基底**」（あるいは**完全正規直交系**）が，まだ定義できないということです（「正規」とは長さが1という意味です）．

そこで，ベクトルの「長さ」や，ベクトルの「直交」といった，ベクトルの幾何学的な定義するために，ベクトル空間に対して**内積**と呼ばれる新たな演算を導入します．

<!-- 小難しい話をすると，ベクトル空間に対して内積を定義することは，ベクトル空間にある種の「位相的な性質」を入れることに対応します．内積空間の取り扱いというのは，線形代数と位相空間論を合わせた議論にあたるわけです（ここでの位相空間とは， phase space ではなく topological space のことです．）． -->



#### ユークリッド内積

何はともあれ，まずはユークリッド空間での内積を考えてみましょう．

(*NEXT*)

ユークリッド空間の縦ベクトルに対する内積というのは，式○のように書くことができます．これのことを「ユークリッド内積」ということもあるくらいには，有名なものでしょう．

ここで，左側にあるベクトルの成分 $x_i$ に対して，複素共役をとっていることにだけ注意してください．大事です．

（内積の記号 $\langle \boldsymbol{x}, \boldsymbol{y} \rangle$ がピンとこない人は，真ん中にあるコンマの位置に縦線 $\vert$ を引いてみてください．ブラ・ケットの内積 $\langle \boldsymbol{x} \vert \boldsymbol{y} \rangle$ になります．）

そして，同じベクトル同士の内積をとって，その平方根（ルート）をとったものを，ベクトルの**ノルム**と呼びます．いわゆるベクトルの長さですね．

この定義からわかるように，ルートの中身 $\langle \boldsymbol{x}, \boldsymbol{x} \rangle$ は必ずゼロ以上の実数 $\sum_i \lvert x_i \rvert^2$ です．つまり，どんなベクトルに対してノルムを計算しても，必ずゼロ以上の実数になります（長さがマイナスや虚数になると困ります．）．

（先ほどの内積の定義で， $x_i$ に対して複素共役をとっていないと，ここでノルムがうまく定義できません．）

ちなみに，内積の定義で，左側にある $x_i$ の代わりに，右側の $y_i$ の複素共役をとっても，ノルムはきちんと定義できます（ノルムが正の実数またはゼロになります）．物理では，ふつう左側に複素共役をします．なぜかというと，ブラ・ケット記法を使うときにはこちらのほうが都合がよいのですが，とりあえず単なるお約束と思っておけば大丈夫です．



#### 内積の定義

ユークリッド・ベクトルの内積には，ここの1から3に書いてあるような性質があります．どれも定義からすぐに証明できますね．

(*NEXT*)

そこで，ベクトル空間のセクションで議論した時と同じように，この1から3の条件をみたすような $\langle ○, ○ \rangle$ を，ベクトル空間の**内積**と呼ぶことにしましょう．

(*NEXT*)

ここで注意があるのですが，内積の記号で左側にあるベクトルについては，線形性が成立しません．ブラ・ケット記法でも，ブラのまま計算をすると，よくわからくなりますよね．


#### 正規直交基底

ここまでの議論で内積が定義できたので，**正規直交基底**を定義することができます．

とはいえ定義そのものは簡単で，長さが1であって，互いに直交するような基底のことですね．式で書くとこんな感じです．

ということで，ベクトル空間に内積を導入して，それを使って正規直交基底を定義することができました．


#### 関数の内積

関数の内積はこういったふうに定義できる，というのも，よく知られていますね．



### 完備性

最初に見たヒルベルト空間の定義の中で，最後に残った「完備（かんび）」についてですが，まじめにやると，けっこう面倒なので，ここではイメージを紹介するだけにします．


#### 内積空間の完備性

内積空間では，ベクトルの列（ $\boldsymbol{\psi}_1, \boldsymbol{\psi}_2, \dots$ のような，数列のようなもの）が収束するかしないかということを考えることができます．

（実は内積のないベクトル空間では，収束を定義できません．）

完備というのは，「収束しそうなベクトルの列」に，極限（収束先）が存在するということです．

ベクトルの列がある1点に収束しそうに見えたとしても，その点に穴が空いていたら，そこに収束することはできません．

空間にそういった穴が空いていないというのが，完備性の条件です．

いまいちわかりづらい説明ですが，今回扱う有限次元の空間は，必ず完備性をみたします．よってあまり気にする必要はありません．



#### （参考）完備性の定義

（略）


### ヒルベルト空間

これで，ヒルベルト空間の定義が理解できるようになりました．


#### ヒルベルト空間

内積をもつベクトル空間（内積空間）であって，完備な空間のことをヒルベルト空間と定義します．



## ヒルベルト空間から ℂ^N へ

さて，このようにしてヒルベルト空間を定義することができました．そうしたらベクトルに作用する線形な演算子というものを定義して，それを使って，いよいよ量子力学が扱えるようになるわけです（線形演算子の定義は，皆さんもよくご存じでしょうから，ここでは扱いません．）．

しかしながら，ヒルベルト空間の定義はかなり抽象的で，わかりづらいと思います．ましてや，ヒルベルト空間のベクトルに作用する線形演算子の取り扱い方を議論するというのは，かなり面倒です．

そこで，ここでは抽象的なヒルベルト空間の**ベクトル＋線形演算子**の代わりに，**縦ベクトル＋行列**を使って議論を進めたいと思います．

そんな都合の良い話があるのか，と感じるかもしれませんが，ちゃんと，数学的に厳密に，ヒルベルト空間＝縦ベクトルの空間であることを示すことができます．そのために，ここで「同型（どうけい）」という概念について見ることにしましょう．



### 同型

これまでベクトル空間の話をやってきましたが，そこではベクトルとして $\boldsymbol{\psi}$ という文字を使って議論していました（ $\boldsymbol{v}$ や $x$ でも良かったのですが）．

ベクトルの例としては，ユークリッド空間の縦ベクトル $\boldsymbol{v}$ や，線形な微分方程式の解 $\varphi(x)$ がありましたが，ベクトルの正体が何であれ，ベクトル空間の定義に出てきたのは $\boldsymbol{\psi}$ だけでした．


#### 同型とは：ベクトル空間の同型

つまり，ベクトル空間を定義するのに必要なのは，ベクトル $\boldsymbol{\psi}$ ，和 $+$ ，スカラー倍 $\cdotp$ の3つだけということです．

(*NEXT*)

ということは，2つのベクトル空間を考えたとき，それぞれの空間のベクトルが1対1に対応して，なおかつ，空間の線形構造が同じ（つまり和とスカラー倍が同じ）なら，その2つのベクトル空間は，線形代数で扱う範疇では，同じベクトル空間であると考えて問題ありません．

つまり，2つのベクトル空間の違いは，使っている文字の違いだけ，というふうに考えることができるということです．

このように，ベクトル空間として「同じ」と見做せる2つの空間のことを，同型（どうけい）であるといいます．



#### 同型とは：線形構造

線形構造が同じというのは，ここに書いたとおりですね．



#### 同型とは：内積空間の同型

ヒルベルト空間では，線形演算（和とスカラー倍）だけではなく，内積も定義されるのでした．よって，2つのヒルベルト空間が同型であるといえるには，線形構造だけではなく，内積の構造も同じである必要があります．

そこで，この条件も同型の定義に加えておくことにしましょう．

完備性については，ここで扱う有限次元の空間では関係ないので，省略することにします．



#### N次元ベクトル空間どうしは同型

面白いのはここからです．

ここに定理として書きましたが，なんと，有限次元のベクトル空間（あるいは内積空間）は，すべてそれぞれ同型です．

証明自体もそれなりに重要で，2つのベクトル空間の基底（内積空間の場合は正規直交基底）をそれぞれとって，基底を構成するベクトルを1対1に対応させることで証明できます．

量子力学でよくやる，スピン $\uparrow$ の状態を $(1, 0)$ ，スピン $\downarrow$ の状態を $(0, 1)$ に置き換えるというのは，実は同型による対応付けだったんですね．

(*NEXT*)

結局，この定理から， $N$ 次元のベクトル空間（あるいは内積空間）は，実質的には1つだけということがわかります（すべての $N$ 次元空間は互いに同型なので）．

そもそも，なぜ同型という概念を定義したのでしょうか？

同型の利点として，考えたいベクトル空間の代わりに，それと同型なベクトル空間を使うことで，もっと楽に議論をすることができる，ということが挙げられます．

今見た定理を使えば， $N$ 次元ヒルベルト空間を直接扱う代わりに，一番扱いやすい数ベクトルのユークリッド空間 $\mathbb{C}^N$ を考えればよいということですね．



### 表現行列

$N$ 次元のヒルベルト空間のベクトルは，ユークリッド空間 $\mathbb{C}^N$ の縦ベクトルとして扱えるのでした．

同じように，同型を使うと，量子力学の基本となる線形写像（線形演算子）は，どんなものでも行列として書くことができることがわかります．

それが表現行列です．

抽象的なヒルベルト空間を扱う代わりに，縦ベクトルと表現行列を使った議論ができるということですね．


#### 表現行列の導入

このあたりに表現行列のイメージを書きましたが，

(*NEXT*)

(*NEXT*)


#### 表現行列の形式的な定義

(*NEXT*)

重要なのは表現行列を定義する方法ではなく，「線形演算子の代わりに行列を考えればよい」という事実です．

これを使うと，物理量に対応するエルミート演算子は，エルミート行列として書けて，時間発展に対応するユニタリ演算子は，ユニタリ行列として書けるわけです．

というわけで，これでめでたく，ヒルベルト空間として縦ベクトルと行列を使って議論ができるようになりました．



## 量子力学の公理

それではいよいよ，今までに用意したことを使って量子力学の復習をしてみましょう．



#### 有限次元の状態

無限次元のヒルベルト空間を扱うのは非常に大変なので，ここでは状態が有限次元である場合について扱います．

古典的な物理量に対応しない状態（たとえばスピン）については，ヒルベルト空間が有限次元になるので，これでも扱えます．

同型のところで扱ったように，有限次元のヒルベルト空間というのは，縦ベクトルの空間 $\mathbb{C}^N$ と同型である，つまりヒルベルト空間のベクトルの代わりに，縦ベクトルを使えば良いのでした．

よって，縦ベクトルと行列を使った議論だけで，ヒルベルト空間を取り扱うことができます．

そこで，これからは，行列を使った量子力学のやり方について，考えてみます．


### 量子系の状態

まず始めに，量子力学的な系の状態が，どのようにしてあらわされるかですが・・・


#### 量子系の状態とは？

量子力学において，状態はヒルベルト空間における単位ベクトルとしてあらわされます．（皆さんもご存じでしょう．）

特に注意すべきところもないので，次に行きます．



### 測定とは？

では，量子力学で扱う物理量の測定については，どのように定式化すればよいでしょう．

それを考える前に，まず，物理量とは何かについて考えてみましょう．



#### オブザーバブルとエルミート行列


まず，そもそも原理的に観測できない物理量は，存在しないのと同じです．したがって，考えるべきなのは，観測できる物理量，**オブザーバブル**です．

すべてのオブザーバブルには，それに対応するエルミート行列が存在します．そこで，このことを，オブザーバブルの公理とします．これも，量子力学を学んだ人なら，誰しも知っているはずです．

ここで，線形代数学の知識から，エルミート行列の固有ベクトルは，考えているヒルベルト空間の正規直交基底になるということがわかります．

つまり，ヒルベルト空間に属するすべての状態が，オブザーバブルの固有ベクトルの線形結合で書けるということです．

無限次元のヒルベルト空間でも同じようなことが成り立つのですが，それを証明するには，非常に難しい議論をいくつも重ねる必要があるようです．



#### オブザーバブルの測定

オブザーバブルそのものを定義したので，次に「オブザーバブルの測定」を定義します．

状態 $\ket{\psi}$ にある量子系に対して，オブザーバブル $A$ の測定を行うと，そのオブザーバブルに対応するエルミート行列 $\mathsf{A}$ の固有値のうちのいずれが，オブザーバブルの測定値として得られます（これも有名な話です）．

スライドには若干詳しめに書きましたが，大した話ではないので飛ばします．


#### オブザーバブルの測定（つづき）

（略）



### 基底測定

基底測定についてですが，この段階で言ってもわかりづらいので，いったん飛ばすことにします．

(*NEXT*)

<!-- 
#### オブザーバブルとエルミート行列の関係

オブザーバブルの固有状態は，必ずヒルベルト空間 $\mathscr{H}$ の正規直交基底になります．なぜなら，オブザーバブルは対応するエルミート行列として書け，エルミート行列の固有ベクトル系は，ヒルベルト空間 $\mathscr{H}$ の正規直交基底をなすからです．

(*NEXT*)

それでは，この対応を逆にたどることはできるのでしょうか？　ヒルベルト空間 $\mathscr{H}$ の正規直交基底を適当にとったとき，それに対応するようなオブザーバブル $A$ が必ず存在するのでしょうか？

言い換えれば，すべてのエルミート行列に対して，それに対応するオブザーバブルが存在するのでしょうか？



#### 基底測定

答えを言えば，量子力学の公理が要求するのは，「オブザーバブルに対してエルミート行列が存在する」ことであり，その逆は必ずしも要請されません．

しかし，ここでは後の議論のために，ヒルベルト空間 $\mathscr{H}$ の任意の正規直交規定を，固有状態系として持つようなオブザーバブルが存在するということを，仮定します．

このあと，スピン状態を扱うので，その場合，すべての正規直交基底が，スピンの方向（ $z$-方向など）に対応していると思うことにします．

このような，正規直交基底に対応するオブザーバブルを測定することを，その基底に関する**基底測定**と呼ぶことにします．
 -->


### 状態の時間発展

次に，状態の時間発展についてです．


#### 状態の時間発展

これも，状態 $\ket{\psi}$ の時間変化が，ユニタリ行列によって表される，という，有名な話ですね．

ただし，ここで言っている時間発展には，人為的な操作も含みます．

つまり，誰かが量子系に対して操作を加えたとすると，その操作による状態変化も，やはりユニタリ行列であらわされるということです（このあとで述べる「測定」を除きます）．

(*NEXT*)

それでは，ユニタリ行列であらわされる状態の時間発展が必ず可能なのかというと，そうではありません．

しかし，ここではユニタリ行列としてあらわされる状態変化を，実験をする人が何らかの操作によって実現できると仮定することにします．

つまり，実験室ではどんなユニタリ変換もできるんだというふうに仮定するのですね．


### 波束の収縮

公理の最後として，波束の収縮という，量子力学の非常に不思議で，深淵なるところを定義します．


#### 波束の収縮

ある状態 $\ket{\psi}$ にある系に対して，何かしらのオブザーバブル $A$ を測定するとします．

この測定によって，実験者は $A$ の固有状態のうちのどれかひとつ， $\ket{\varphi_a}$ に対応する値を観測するはずです．

これは前の公理で見たとおりのことです．

ところが面白いことに，この測定をした瞬間，系の状態 $\ket{\psi}$ （オブザーバブル $A$ の固有状態 $\ket{\varphi_a}$ の線形結合で書ける）が，観測した固有状態 $\ket{\varphi_a}$ に変化（収縮）してしまいます（固有ベクトルに縮退がない場合）．

これを，**波束の収縮**といいます．

量子力学の面白いところですね．




## 多体系の量子力学

ここまでで，行列を使った量子力学について，最低限の説明が終わりました．

しかし，ここまでで扱えるようになったのは，単一の（1粒子からなる）量子系のみです．

ところが，ここで扱いたいエンタングルメントというのは，いくつかの量子力学的な粒子が組み合わさることでおこる現象ですから，いくつかの量子系が合わさってできた，複合系を考える必要があります．

それでは，複合系を量子力学で扱うには，どうすればよいでしょうか．

このセクションでは，量子多体系（といっても2体系）の取り扱い方について考えます．


### スピン系

多体系の話に行く前に，話を簡単にするためにこれから考える，スピン系の取り扱い方を一応見ておきます．


#### スピン

スピン $1/2$ を持つ粒子の固有状態として，スピンアップの状態とスピンダウンの状態をとることができて，これらが（スピン状態の）ヒルベルト空間の正規直交基底を成します．

(*NEXT*)

というわけで，それぞれの状態を2次元縦ベクトル $(1, 0)$ ， $(0, 1)$ に対応させることにしましょう．よくやる方法ですね．

こんなことができるのは，2次元ヒルベルト空間が $\mathbb{C}^2$ と同型だったからですね．

(*NEXT*)

もちろん，アップとダウンを重ね合わせたスピン状態も，このように2次元縦ベクトルで書けますね．


### テンソル積

今見たスピン系を使って，2粒子の扱い方を考えます．


#### 多粒子系の扱い方：テンソル積

1粒子の扱い方は，量子力学で最初から扱われますし，多数（ $N_{\mathrm{A}}$ ＝アボガドロ数程度）の粒子の扱い方は，統計力学で取り上げられます．

その真ん中，2粒子とか3粒子の扱い方というのはあまりまじめに取り上げられていないような気がします．

(*NEXT*)

こうした複合系を扱うために，テンソル積とよばれる演算を導入します．

2つの粒子の状態 $\ket{\psi}, \ket{\xi}$ が，それぞれ，ベクトル $(a, b)$ ， $(c, d)$ として書けているとします．

このとき， $\ket{\psi}$ と $\ket{\xi}$ のテンソル積の定義はここに書いたとおりで，特に補足するところもありません．縦ベクトルを積み重ねたような感じで定義されます．

見ていただければわかるように，1粒子の状態が2次元ベクトルであれば，その2粒子の状態は4次元ベクトルになるんですね．

(*NEXT*)

テンソル積を帰納的に使えば，3粒子，4粒子系の状態も定義できます．


#### テンソル積の空間

実はテンソル積の全体も，ヒルベルト空間をなします．

つまり，テンソル積の基底というものを考えることもできます．

今見たテンソル積 $\mathbb{C}^2 \otimes \mathbb{C}^2$ の基底としては，例えば，1粒子のヒルベルト空間 $\mathbb{C}^2$ の基底を，それぞれ組み合わせた4つがあります．

この4つを，テンソル積の定義に従ってそれぞれ計算すれば，下の4つになります．こう書いてしまえばただの $\mathbb{C}^4$ の基底ですね．

これらが $\mathbb{C}^2 \otimes \mathbb{C}^2$ の基底ということは，つまり空間 $\mathbb{C}^2 \otimes \mathbb{C}^2$ は， $\mathbb{C}^4$ であるということです．


#### 行列のテンソル積

先ほどは縦ベクトルのテンソル積を定義しましたが，行列についても同じようにテンソル積が定義できます．

定義自体は特に面白くないのですが，行列のテンソル積で面白いのが，ここの式ですね．

行列のテンソル積を，縦ベクトルのテンソル積に作用させると，不思議なことに，左側の行列が左側のベクトルに，右の行列は右側のベクトルに，それぞれ作用するような形になっています．



#### テンソル積で表せないテンソル積

話を縦ベクトルのテンソル積に戻します．

面白いことに，テンソル積については「テンソル積で表せないテンソル積」というものが存在します．

矛盾しているような言い方ですが，そこまで難しいことではありません．

ヒルベルト空間 $\mathbb{C}^2$ と $\mathbb{C}^2$ のテンソル積は， $\mathbb{C}^4$ になるのでした．

ところが， $\mathbb{C}^4$ のベクトル（4次元縦ベクトル）が，2つのベクトルのテンソル積として書けるとは限りません．

ここには $(0, 1, 1, 0)$ という4次元ベクトルを書きましたが，これは2つの2次元ベクトルのテンソル積として書けません．

なぜなら，これが $(a, b) \otimes (c, d)$ と書けたと仮定しましょう．テンソル積を計算すると， $(ac, ad, bc, bd)$ となります．

ところが，まず $ac = 0$ なので， $a = 0$ または $c = 0$ です．ところが， $a = 0$ なら $ad = 1$ に矛盾しますし， $c = 0$ なら $bc = 1$ に矛盾します．

というわけで， $(0, 1, 1, 0)$ というベクトルは，テンソル積なのに，2つのベクトルのテンソル積として書けないことがわかりました．



#### エンタングル状態

$(0, 1, 1, 0)$ を，スピン系の状態で書けば，このようになります（ $\ket{\uparrow} = (1, 0)$, $\ket{\downarrow} = (0, 1)$ を使う． $1/\sqrt{2}$ は規格化のための係数）．もちろん，先ほどと同じように，この状態は2つのスピン状態 $\ket{\psi}, \ket{\xi}$ のテンソル積として書くことができません．

このような状態のことを，**エンタングル状態**といいます．

日本語では**量子もつれ**と言います．


#### エンタングル状態の測定

このような2粒子A,Bを合わせたエンタングル状態に対して，スピンの向きが上向きか下向きかを測定することを考えます．

とりあえず粒子Aのスピンを測定することにしましょう．

測定によって， A のスピンの向きが上か下かが確定します．たとえば上向きだったとしましょう．

すると，前に見た波束の収縮が起こって，複合状態が A のスピンが上向きという状態に収束します．つまり， $\ket{\uparrow}_{\mathrm{A}}$ を含む項だけが残り，あとは消えます．

この状況では， $\ket{\uparrow}_{\mathrm{A}} \otimes \ket{\downarrow}_{\mathrm{B}}$ という項しか残りません．

つまり，粒子Aのスピンを測定しただけで，粒子Bのスピンが下向きと決まってしまうのです．

このように，エンタングル状態とは，2粒子の状態が“もつれている”状態であると言えます．



## 量子テレポーテーション





