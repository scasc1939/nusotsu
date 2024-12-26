#set page(
  paper: "a5", 
  margin: (x: 1.5cm, y: 2.0cm),
	numbering: "1",
)

// 見出し
#show heading.where(level: 1): it => [
	#set text(
		16pt, 
		font: ("Source Han Sans JP"), 
		weight: "bold"
	)
	#set align(center)
	#block(
		it.body
	)
	#v(1em)
]

#show heading.where(level: 2): it => [
	#set text(
		14pt, 
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)
	#block(it.body)
	#v(1em)
]

#show heading.where(level: 3): it => [
	#set text(
		12pt, 
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)
	#block(it.body)
	#v(1em)
]

#show heading.where(level: 4): it => [
	#set text(
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)  
  #block(it.body)
  #v(0.5em)
]

// テキスト全般
#set text(
	lang: "ja",
  font: ("New Computer Modern", "Source Han Serif JP"),
  size: 11pt
)
#set par(
	first-line-indent: 1em,
  justify: true,
  leading: 1.2em,
	spacing: 1.6em,
)

#show strong: set text(font: ("Source Han Sans JP"), weight: "medium")

#show emph: set text(font: ("New Computer Modern", "Source Han Sans JP"), style: "italic")

#set math.equation(numbering: "(1)")



= ルベーグ積分

#outline()


#pagebreak()




== 積分の定義

積分をどのようにして定義したらよいだろうか？


=== リーマン積分

変数$bold(x)$の領域を，ユークリッド平面$X = RR^2$とする．この面内にある適当な形の領域を$E$としよう．

$E$上でほぼ連続#footnote[正確には，有限個の点を除き連続．]な関数$f(bold(x)) = f(x, y)$を考える．$f(bold(x))$の$E$上での積分$integral_E f(bold(x)) d bold(x)$は，*面$f(bold(x))$と地面$E$で挟まれた領域の体積*として定義された#footnote[積分は微分の逆だと覚えている人は，認識を改めてください．]．

#figure(
  image("../fig/integral_as_volume.svg", width: 60%),
  caption: [積分のイメージ．]
)


#pagebreak()


正確に言うと，以下のようになる．

+ 積分領域$E$を$N$個の長方形領域に分割する．
+ それぞれの領域$E_i$の面積$S(E_i)$を計算する．
+ それぞれの領域$E_i$について，$f(bold(x))$の最大値$M_i$と最小値$m_i$が定まる．
+ それぞれの領域の体積の上限（$M_i dot S(E_i)$）と下限（$m_i dot S(E_i)$）を計算する．
+ 分割$N$を多くしていったとき，
  $ lim_(N -> oo) sum_(i=1)^N M_i S(E_i) = lim_(N -> oo) sum_(i=1)^N m_i S(E_i) $
  <eq:Riemann-integral-limit>
  であるとき，$integral_E f(bold(x)) d bold(x)$を@eq:Riemann-integral-limit で定める．

#linebreak()

リーマン積分では，不連続な関数，たとえば*ディリクレ関数*
$ 
f(x) :=
cases(
  1  quad  x "が有理数，つまり" x in QQ,
  0  quad  x "が無理数，つまり" x in RR without QQ
)
$
の積分$integral_0^1 f(x) d x$を定義できない．
どれだけ区間$E_i$を細かくしても，
$E_i$には有理数と無理数が両方含まれるので，$M_i = 1$，$m_i = 0$であり，@eq:Riemann-integral-limit の極限が一致しないからである．

#linebreak()

それでは，$E_i$を長方形領域（1次元だったら区間）とするのを諦めたらどうなるだろうか？


#pagebreak()


=== ルベーグ積分の定義


変数$bold(x)$の領域を，ユークリッド平面$X = RR^2$とする．この面内にある適当な形の領域を$E$としよう．

$f(bold(x))$を，$E$上で定義された可測関数としよう．ただし，$f(bold(x)) >= 0$とする．つまり，$f(bold(x))$は平面$E$の上に浮いている面である．

リーマン積分$integral_E f(bold(x)) d bold(x)$は，面$f(x)$がつくる領域の体積として定義することができた．同じように，*ルベーグ積分$integral_E f(bold(x)) d mu (bold(x))$とは，$f(bold(x))$がつくる3次元領域の体積*と考えられる．

もし，$f(bold(x))$が定数$M$だったら（地面と平行な平面だったら），この積分は，*$E$の面積かける$M$*で求められる．$E$の面積とは，ルベーグ測度$mu (E)$のことであるから，
$ integral_E f(bold(x)) d mu (bold(x)) := M mu (E) $
と定義できる．

#pagebreak()

次に，領域$E$が$E = union.sq.big_(i=1)^n E_i$のように*$n$-分割*できたとしよう．分けられた*それぞれの面$E_i$上で$f(bold(x))$が定数$f(bold(x)) equiv alpha_i$*だとする．式で書くと，
$ f(bold(x)) := sum_(i=1)^n alpha_i chi_(E_i) (bold(x)) $
<eq:simple-function>
全体はガタガタしているが，それぞれの段差は平らである関数である．このような関数の積分は，それぞれの段差の積分
$ integral_(E_i) f(bold(x)) d mu (bold(x)) = alpha_i mu (E_i) $
をすべて足したもの
$ integral_E f(bold(x)) d mu (bold(x)) := sum_(i=1)^n alpha_i mu (E_i) $
と定義できる．

@eq:simple-function のような関数のことを，*単関数* (simple function) という．



#pagebreak()

たとえば，正方形
$ E := { (x, y) in RR^2  |  -a < x,y < a } $
を次のように4分割する．
$ 
  E_1 &= { (x, y) in E | x > 0, thick y > 0 } \
  E_2 &= { (x, y) in E | x > 0, thick y < 0 } \
  E_3 &= { (x, y) in E | x < 0, thick y > 0 } \
  E_4 &= { (x, y) in E | x < 0, thick y < 0 } \
$
もちろんそれぞれの面積は$mu (E_1) = mu (E_2) = mu (E_3) = mu (E_4) = a^2$である．

それぞれの領域（右上，右下，左上，左下）では$f(bold(x))$は定数であるとする．たとえば，
$
  f(bold(x)) = cases(
    1 quad bold(x) in E_1,
    2 quad bold(x) in E_2,
    3 quad bold(x) in E_3,
    4 quad bold(x) in E_4,
  )
$
領域の境界には段差があるが，領域内では水平である．このような場合，まず右上部分だけの体積$integral_(E_1) f(bold(x)) d mu (bold(x)) = 1 times a^2$を計算し，同じように右下（$2 a^2$），左上（$3 a^2$），左下（$4 a^2$）の体積を計算してから，これらをぜんぶ足せばよい．積分は
$ integral_E f(bold(x)) d mu (bold(x)) = 10 a^2 $


#pagebreak()


=== 単関数による近似

*マイナスにならない関数*$f$（つまり，$f(x) >= 0$）は，単関数を使って下から近似できる．

#figure(
  image("../fig/simple_function.svg"),
  caption: [
    単関数の作り方．2回目（赤色の実線）と3回目（青色の破線）．
  ]
)

大雑把な作り方は以下の通り．

+ *1回目*．$0 <= f(x) <= 1$の領域を$2$分割する．分割した線にあうように，$f(x)$を切り下げる．
+ *2回目*．$0 <= f(x) <= 2$の領域を$2 times 2^2 = 8$分割して，同じように切り下げる．
+ *3回目*．$0 <= f(x) <= 3$の領域を$3 times 2^3 = 27$分割する．



#pagebreak()




=== 単関数による積分の定義

前で見たように，マイナスにならない*単関数*
$ f(bold(x)) := sum_(i=1)^n alpha_i chi_(E_i) (bold(x)) $
（@eq:simple-function の再掲，$E = E_1 union.sq dots.c union.sq E_n$と分割する）に対して，積分は
$ integral_E f(bold(x)) d mu (bold(x)) := sum_(i=1)^n alpha_i mu (E_i) $
<eq:integral-of-simple-function>
と定義できる．

次に，*マイナスにならない関数*$f$に対して，単関数$f_1, f_2, ...$をうまくとって，
$ lim_(n -> oo) f_n (bold(x)) = f(bold(x)) $
（各$bold(x)$に対して），しかも
$ f_1 (bold(x)) <= f_2 (bold(x)) <= f_3 (bold(x)) <= dots.c $
（単調増加）とすることができる．もちろん各$n$について，$f_n$は単関数なので，@eq:integral-of-simple-function による積分が定義できる．そこで，
$ 
  integral_E f(bold(x)) d mu (bold(x)) 
  	:= lim_(n -> oo) sum_(i=1)^n alpha_i mu (E_i)
$
<eq:integral-of-non-negative-function>
ととる．実は，単関数$f_1, f_2, dots$のとりかたによらず，@eq:integral-of-non-negative-function が定義できることが示される．これが*ルベーグ積分*の定義である．



=== 実関数・複素関数の積分

マイナスになりうる関数の積分を定義するのも簡単である．
実関数$f$に対して，
$ 
  f^+ (bold(x)) := max (f(bold(x)), 0),
	quad 
	f^- (bold(x)) := -min (f(bold(x)), 0)
$
ととる．$f^+$は$f$がプラスの区間，$f^-$は$f$がマイナスの区間でだけ値をとる関数である．これらは両方とも非負の関数である#footnote[$f^-$については符号を変えて非負になるようにしてある．]から，
$
	integral_E f d mu
		:= integral_E f^+ d mu - integral_E f^- d mu
$
<eq:integral-of-real-function>
が計算できる#footnote[イメージとしては，$integral_E (f^+ - f^-) d mu$．]．もちろんこれが$oo - oo$になってしまうと@eq:integral-of-real-function は定義できないが，そうでなければ@eq:integral-of-real-function を積分の定義とする．

@eq:integral-of-real-function が定義できるとき，*$f$は$E$で定積分を持つ*という．特に，@eq:integral-of-real-function が有限（$!= plus.minus oo$）の値をとるとき，*$f$は$E$で可積分*（または*積分可能*）*である*という．

複素関数の積分は，実部と虚部にわけてやればよい．つまり，
$
	integral_E f d mu
		:= integral_E Re (f) d mu + i integral_E Im (f) d mu
$


