// #set page(
//   paper: "a4", 
//   margin: (x: 3.0cm, y: 3.0cm)
// )
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
	// #set par(first-line-indent: 0pt)
	#it.body
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
	spacing: 1.5em,
)
#show strong: it => [
	#set text(font: ("Source Han Sans JP"), weight: "medium")
	#it.body
]

#set math.equation(numbering: "(1)")

#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent()



= ベクトル空間

== 内積

=== 数ベクトルの内積

==== 実ベクトルの場合
実ベクトル$bold(x) = vec(x, y, z)$と$bold(a) = vec(a, b, c)$の内積は，
$ vec(x, y, z) dot vec(a, b, c) := a x + b y + c z $
で与えられる．
内積を使うと，$bold(x)$の"長さ"は
$ norm(bold(x)) = sqrt(bold(x) dot bold(x)) $ <eq:norm-of-real-vector>
とかける．
@eq:norm-of-real-vector を，ベクトル$bold(x)$の*ノルム*という．


==== 複素ベクトルの場合
次に，複素ベクトル$bold(x) = vec(x, y, z)$と$bold(a) = vec(a, b, c)$の内積について考えてみよう．
たとえば
$ vec(x, y, z) dot vec(a, b, c) := a x + b y + c z $
と定義する．
すると，$bold(x)$の"長さ"は
$ norm(bold(x))
  = sqrt(bold(x) dot bold(x))
	= sqrt(x^2 + y^2 + z^2) $
である．
ところが，$x^2 + y^2 + z^2$は複素数である．
ふつう複素数の$sqrt(#hide("by"))$はとれないので，これでは困る．

そこで，$bold(x) dot bold(x)$が実数，しかもプラス（またはゼロ）になるような内積を考えよう．
たとえば
$ x^* x + y^* y + z^* z = abs(x)^2 + abs(y)^2 + abs(z)^2 $ <eq:norm-as-positive-real>
は実数，しかもマイナスにならない．

$bold(x) dot bold(x)$が @eq:norm-as-positive-real のようになる内積は，
$ bold(a) dot bold(x) := a^* x + b^* y + c^* z $ <eq:inner-product-for-complex-vector>
である．
そこで，複素ベクトルについては @eq:inner-product-for-complex-vector を内積の定義として考えよう．



=== 一般のベクトルの内積

前節で扱った内積（とくに複素数ベクトルについてのもの）を一般化する．

以下の条件を満たすものを*内積*(_inner product_)という．

+ $( bold(x), bold(y)) = (bold(y), bold(x))^*$．
	つまり，順番を逆にすると複素共役になる．
+ $(bold(x), thick a bold(y) + b bold(z)) = a(bold(x), bold(y)) + b(bold(x), bold(z))$．
+ $(bold(x), bold(x)) >= 0$．
  特に，$(bold(x), bold(x)) = 0$であるのは$bold(x) = bold(0)$に限る．


==== 注意
内積の左側はふつうの分配法則だが，
右側は
$ (a bold(x) + b bold(y), thick  bold(z)) 
	= a^* (bold(x), bold(z)) + b^* (bold(y), bold(z)) $
である．特に，左側のベクトルに係数をかけるときは，
$ c(bold(x), bold(y)) = (c^* bold(x), bold(y)) $
である．



