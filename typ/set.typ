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
	spacing: 1.6em,
)

#show strong: set text(font: ("Source Han Sans JP"), weight: "medium")

#set math.equation(numbering: "(1)")

#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent()


= 集合

#outline()

#pagebreak()

== 集合って何だ？

数学の世界にはいろいろな"モノ"がある．
たとえば$1$や$3$のような数字はモノである．
もっと難しい数字，たとえば$-2$や$5/3$，あるいは$sqrt(6)$や$pi$（$= 3.1415 dots$）だってモノである．

数字でなくともよい．
文字$a$や$zeta$もモノとみなせる．
あるいは関数$f(x) = x^2$や$h(x, y) = x \/ y$もモノと考えられる．

こういった"モノ"を集めたのが*集合*である．
集合はたとえば
$ X = { 1, 2, 3 } $
とかける．
この式では集合の枠${quad}$の中に，$1, 2, 3$という3つの数字が入っている．
つまり，$X$は3つの数字を集めた集合である．
これを，*$1, 2, 3$を元（げん）にもつ集合*という．

集合$X$は，$1$を元としてもつ．
このことを，
$ 1 in X quad "とか，" quad 1 in.rev X $
とかく．
#footnote[集合$X$がクワ"$in$"を使って$1$を取り込んでいるイメージである．]
一方，$X$は$6$を元としてもたない．
これは，
$ 6 in.not X quad "とか，" quad 6 in.rev.not X $
とかく．
#footnote[等しくないというため，$eq$に線を引いて$eq.not$にしたのと同じ．]

元をひとつも含まない集合を*空集合*といい，$emptyset$とかく．
形式的にかくと，$emptyset = { thin }$である．




#pagebreak()


== 集合の書き方

前節では，集合がもつ元を
$ X = {1, 2, 3, 4, 5, 6, 7, 8} $
のように書き連ねてあらわした．
このように具体的に元を列挙するのではなく，
$ ZZ = { n | n "は整数" } $
のように，元の満たすべき条件を書くことがある．

そもそも考える世界を$RR$（実数の集合）だけに限って，
$RR$に含まれる元の中で，特定の条件を満たすもの
$ QQ = {  p / q in RR  mid(|)  p ": 整数", thick q ": 自然数"  } $
とかくこともある（この場合の$QQ$は有理数である）．

例えば，$NN$を自然数の集合（${1, 2, 3, ...}$）とすると，
$ A = {  n in NN  mid(|)  n < 5  } = {1, 2, 3, 4} $
である．

#pagebreak()


=== ラッセルのパラドックス

本論には関係ないが，集合について面白いことがある．

実は，集合$X$が自分自身を元として含むことは，特に禁止されていない．
つまり，
$X = {X, a, b}$
という無限ループのような集合も許される．

$X$を，「集合をあつめた集合」（*集合族*）として，
$X$の部分集合
$ cal(S) := { A in X  mid(|)  A in.not A } $
というのを考えてみよう．
つまり，$cal(S)$は「自分自身を元として含まない集合$A$のあつまり」である．

定義より明らかに$cal(S) subset X$であるが，これに加えて$cal(S)$が$X$の元（つまり$cal(S) in X$）と仮定しよう．
すると

+ $cal(S) in cal(S)$なら，$cal(S)$の定義より$cal(S) in.not cal(S)$が成立する．明らかに矛盾．
+ $cal(S) in.not cal(S)$なら，$cal(S)$の定義より$cal(S) in cal(S)$である．やはり矛盾する．

したがって，$cal(S)$は$X$の元ではない．

ここで，もし$cal(S)$が
$ cal(S) := {  "集合"A  mid(|)  A in.not A  } $
と定義されたとする．
先ほどのように「$cal(S)$は$X$の元ではない」という言い訳が効かないので，矛盾してしまう．
このように，実は${ a in X | dots}$における$in X$は，必要不可欠なのである．


#pagebreak()


== 集合の演算

+ *和集合*……集合$A$と$B$の両方に含まれる元をあつめた集合を$underline( A sect B )$とかく．つまり，$A sect B := { x | x in A "かつ" x in B }$である．
+ *共通部分*……集合$A$と$B$の少なくとも一方に含まれる元をあつめた集合を$underline( A union B )$とかく．つまり，$A union B := { x | x in A "または" x in B }$である．

具体例でみてみよう．

$ A = { 1, 2, 3, 4, 5 },
	quad B = {1, 3, 5, 7, 9} $
とする．
$ A sect B = {1, 3, 5}
  quad
	A union B = {1, 2, 3, 4, 5, 7, 9} $


また，「集合$A$から$B$を取り除いたもの」，
きちんというと「集合$A$の元のうち，集合$B$の元でないものをあつめた集合」を，$underline( A without B )$とかく．
つまり，$A without B := { x in A  |  x in.not B  }$である．

上の$A, B$を使うと，
$ A without B = {2, 4}  quad  B without A = {7, 9} $


#pagebreak()


=== 集合の包含（ほうがん）関係


集合$A$のすべての元が集合$B$の元であるとき，
*$B$は$A$を含む*，あるいは*$A$は$B$に含まれる*という．
記号は$A subset B$または$B supset A$である．
#footnote[
	$subset$と$supset$は，$<=$と$>=$の関係だと思ってよい．
	ただし，$a lt.eq.not b$と$a gt.eq.not b$は両立しないのに対し，$A subset.not B$かつ$A subset.not B$はありうる．
]

これも具体例でみてみよう．
$ A = { 1 },  quad  B = {1, 2}  quad  C = {1,3} $
このとき，$A subset B$かつ$A subset C$である．
$A subset A$でもある．
また，$B subset.not A$である．
なお，$B subset C$ではないし，$C subset B$でもない．

定義からわかるように，
$A = B$のときも$A subset B$（かつ$A supset B$）である．
これを強調するために，$A subset.eq B$とかくこともある．
特に$A eq.not B$であるとき，$A subset.neq B$とかき，*$B$は$A$より真に大きい*という．


=== $in$と$subset$、区別できますか？

集合として
$ X := { 1, thick
		     2, thick 
				 {1}, thick 
				 {1, 2, 3} } $
を考える．
このとき，
$ 1 in X  quad  2 in X  quad  3 in.not X 
  quad
	{1} in X  quad  {1, 2} in.not X  quad  {1, 2, 3} in X $
である．また，
$ {1} subset X  quad  {1, 2} subset X  quad  {1, 2, 3} subset.not X 
  quad 
	{2} subset X  quad  {2, 3} subset.not X
	$
である．