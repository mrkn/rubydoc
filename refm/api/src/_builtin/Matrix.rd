= class Matrix < Object
#@#[2002-04-03]  by [[unknown:すす|URL:mailto:sugawah@attglobal.net]]

(数[[c:Numeric]]を要素とする)行列を扱うクラス

行列

m×n個の数a(i,j)を

  [ a(0,0) a(0,1) a(0,2)  a(0,3) ... a(0,n-1)   ]
  [ a(1,0) a(1,1) a(1,2)  a(1,3) ... a(1,n-1)   ]
  [ a(2,0) a(2,1) a(2,2)  a(2,3) ... a(2,n-1)   ]
  [                                             ]
  [ a(m-1,0)                         a(m-1,n-1) ]

のように、縦横の表にあらわしたものを(m,n)型の行列という。
m=nの行列をm次の正方行列(square matrix)という。

上からi番目の横の数の並びを第i行(the i-th row)、
左からj番目の縦の数の並びを第j列(the j-th column)という。

(m,n)型行列は、
大きさnの行(横)ベクトルをm個縦に並べたものとみなすこともできるし、
大きさmの列(縦)ベクトルをn個横に並べたものとみなすこともできる。

第i行、第j列にある数a(i,j)を(i,j)要素((-elementという語には、数学では
「成分」、物理では「要素」という訳をあてる。数学の「要素」はcomponent
という語に当たる-))(the (i,j)-th element)という。

i=jの要素a(i,j)を対角要素(diagonal element)、
それ以外の要素を非対角要素(nondiagonal element)という。


使い方 Usage

[[c:Matrix]]クラスを使うためには、require 'matrix'する必要がある。

  require 'matrix'

[[c:Complex]]クラスとの併用

require 'complex'することによって、
Matrixオブジェクトの要素は[[c:Complex]]クラスに拡張される。
多くのメソッドは、この拡張されたMatrixクラスでも、期待通りに動作する。



次の例は、各要素を共役複素数に置換するメソッド([[m:Matrix#conjugate]])である。

  require 'matrix'
  require 'complex'
  
  class Matrix
    def conjugate
      collect{|e| e.conjugate }
    end
  end


== Class Methods
--- [](rows)

rowsを要素とする行列を生成する。
ただし、引数rowsはネストした配列(=配列の配列)である。
例

  Matrix[[11, 12], [21, 22]]

--- rows(rows, copy = true)

rowsを要素とする行列を生成する。
ただし、引数rowsはネストした配列(=配列の配列)である。
また、オプション引数 copy が偽(false)ならば、複製を行わない。

--- columns(columns)

columnsを列ベクトルの集合とする行列を生成する。

--- diagonal(values)

対角要素がvalues(オブジェクトの並び)で、非対角要素が全て0であるような
正方行列を生成する。

(注:) valuesに一次元Arrayを1個指定すると、そのArrayを唯一の要素とした1×1の
行列ができる。

--- scalar(n, value)

対角要素が全てvalue(数)で、非対角要素が全て0であるようなn次の正方行列を生成する。

--- identity(n)
--- unit(n)
--- I(n)

n次の単位行列を生成する。

単位行列とは、対角要素が全て1で、非対角要素が全て0であるような行列である。

--- zero(n)

n次の零行列を生成する。
零行列とは、要素が全て0の行列である。

--- row_vector(row)

要素がrowの(1,n)型の行列(行ベクトル)を生成する。
ここで、引数rowは、[[c:Vector]]または[[c:Array]]で与えられる。

--- column_vector(column)

要素がcolumnの(n,1)型の行列(列ベクトル)を生成する。
ここで、引数columnは、[[c:Vector]]または[[c:Array]]で与えられる。

== Instance Methods
--- [](i, j)

(i,j)要素を返す。

--- row_size

行の大きさを返す。

--- column_size

列の大きさを返す。

--- minor(from_row,row_size,from_col,col_size)
--- minor(from_row..to_row,from_col..to_col)

部分行列を返す。たたし、パラメータは、次の方法で指定する。
  (1) 開始行番号, 行の大きさ, 開始列番号, 列の大きさ
  (2) 開始行番号..終了行番号, 開始列番号..終了列番号

--- []=(i,j,x)
(i,j)要素をxに変更する。

このメソッドは、matrix.rbに定義されていない。
以下に、その定義と使用例を示す。

  require 'matrix'

  class Matrix
    def []=(i,j,x)
      @rows[i][j]=x
    end
  end

  m=Matrix[[11,12],[21,22]]
  m[1,1]=-1
  p m #=> Matrix[[11,12],[21,-1]]

--- *(m)

行列mを右から乗じた行列を返す。

--- +(m)

行列mを加えた行列を返す。

--- -(m)

行列mを減じた行列を返す。

--- /(m)

行列mの逆行列を右から乗じた行列を返す。

--- inverse
--- inv

逆行列を返す。

--- **(n)
--- power(n)
--- **(m)
--- power(m)

スカラーnに対するべき乗を返す。

行列mに対するべき乗を返す。

--- determinant
--- det

行列式 (determinant) を返す。
#@# ((-線形代数の教科書を見よ-))

--- rank

階数 (rank) を返す。
#@# ((-線形代数の教科書を見よ-))

--- trace
--- tr

トレース (trace) を返す。
行列のトレース (trace) とは、対角要素の和である。

--- transpose
--- t

転置行列 (transpose matrix) を返す。
冒頭に掲げた行列に対して、 a(j,i) を (i,j) 要素とする (n,m) 型行列を転置行列という。

--- row(i)

第i番目の行ベクトルを返す。
ブロックが与えられたときは、各行ベクトルについて、ブロックを繰り返す。

--- column(j)

第j番目の列ベクトルを返す。
ブロックが与えられたときは、各列ベクトルについて、ブロックを繰り返す。

--- collect {|x| ... }
--- map {|x| ... }

行列の各要素に対してブロックの適用を繰り返した結果を、要素として持つ行列を生成する。

--- regular?

正則(regular)なら真を返す。

行列が正則であるとは、正方行列であり、かつ、その逆行列が存在することである。

--- singular?

特異(singular)である、すなわち、正則でないなら真を返す。

--- square?

正方行列であるなら、真を返す。


--- row_vectors

列ベクトルの配列を返す。

--- column_vectors

行ベクトルの配列を返す。

--- to_a

[[c:Array]]に変換する。
結果は、ネストした配列(配列の配列)となる。

--- to_f

各要素を浮動小数点数[[c:Float]]に変換する。

--- to_i

各要素を整数[[c:Integer]]に変換する。

--- to_r

各要素を有理数[[c:Rational]]に変換する。

#@# bc-rdoc: detected missing name: new
#@# --- new(init_method, *argv)
#@# 
#@# This method is used by the other methods that create matrices,
#@# and is of no use to general users.
#@# bc-methods -r matrix Matrix で見つからなかった。okkez

#@# bc-rdoc: detected missing name: coerce
--- coerce(other)

FIXME: describe #coerce.

#@# bc-rdoc: detected missing name: compare_by_row_vectors
--- compare_by_row_vectors(rows)

Not really intended for general consumption.

#@# bc-rdoc: detected missing name: inverse_from
--- inverse_from(src)

Not for public consumption?



#@#== ChangeLog
#@#
#@#*[2004-04-23] by [[unknown:坂野|URL:mailto:mas@star.le.ac.uk]]
#@#    * Matrix.diagonalに注意書を加える。
#@#*[2002-04-03] by [[unknown:すす|URL:mailto:sugawah@attglobal.net]]
#@#    * 使い方の節を追加
#@#    * Working with Complex classの節を追加
#@#    * []=メソッドを追加
#@#    * イテレータ関係を同じ節にまとめた
#@#    * 誤りを訂正し、説明を直した。
#@#    * 他クラスへのリンクを追加 Numeric, Vector
#@#*[2002-04-02] 初版 by [[unknown:すす|URL:mailto:sugawah@attglobal.net]]
