= メソッド呼び出し(super・ブロック付き・yield)

  * [[ref:super]]
  * [[ref:block]]
  * [[ref:yield]]
  * [[ref:block_arg]]

例:

          foo.bar()
          foo.bar
          bar()
          print "hello world\n"
          print
          Class.new
          Class::new

文法:

          [式  `.'] 識別子 [`(' 式 ... [`*' [式]],[`&' 式] `)']
          [式 `::'] 識別子 [`(' 式 ... [`*' [式]],[`&' 式] `)']

メソッド呼び出し式はレシーバ(`.' の左側の式の値)のメソッドを呼び
出します。レシーバが指定されない時は self のメソッドを呼び出しま
す。

`.' と `::' とはほぼ同じ意味です。但し、定数を表す場合は、
`::' を使わなければいけません(例: [[m:Math::PI]])。逆に、

   Klass::Foo

とした場合、常に定数と見なされるという制限があります。
`::' を、クラスメソッド呼び出しに使うという流儀がありますが、
#@#((-あらい 2002-04-21: このマニュ
#@#アルでは `::' の流儀を積極的には使いません。クラスメソッドとインスタン
#@#スメソッドの表記を使い分けるのは難しいと考えている(実際、同じスクリプ
#@#ト内で `::' を使ったり、`.' を使ったりと一貫しない例は良く見かける)の
#@#と、クラスが普通のオブジェクトと同様オブジェクトであることの理解を妨げ
#@#る。大文字のメソッドに関してここに書いた制限があるのが煩わしい。という
#@#個人的な考えからです-))
この点は要注意です。大文字で始まるメソッド名を使用する場合は

   Klass.Foo

と `.' を使うか、

   Klass::Foo()

と括弧でメソッド呼び出しであることを明示する必要があります。

メソッド名には通常の識別子の他、識別子に ? または ! の続い
たものが許されます。慣習として、述語(真偽値を返すメソッド)には ?
を、同名の(! の無い)メソッドに比べてより破壊的な作用をもつメソッ
ド(例: tr と tr!)には ! をつけるようになっています。

最後の引数の直前に * がついている場合、その引数の値が展開されて
渡されます。展開はメソッド to_a を経由して行なわれます。つまり:

          foo(1,*[2,3,4])
          foo(1,*[])

は、それぞれ

          foo(1,2,3,4)
          foo(1)

と同じです。

最後の引数の直前に & がついている場合、その引数で指定した手続き
オブジェクト([[c:Proc]])やメソッドオブジェクト([[c:Method]])がブロック
としてメソッドに渡されます。詳細は [[ref:block]] を参照してください。

メソッド呼び出しの際、private なメソッドは関数形式(レシーバを省
略した形式)でしか呼び出すことができません。また protected なメソッ
ドはそのメソッドを持つオブジェクトのメソッド定義式内でなければ呼び出せ
ません。[[ref:d:spec/def#limit]] を参照して下さい。

==[a:super] super

例:

          super
          super(1,2,3)

文法:

          super
          super(式, ... )

super は現在のメソッドがオーバーライドしているメソッドを呼び出し
ます。括弧と引数が省略された場合には現在のメソッドの引数がそのまま引き
渡されます。引数を渡さずにオーバーライドしたメソッドを呼び出すには
super() と括弧を明示します。

例:

        class Foo
          def foo(arg=nil)
            p arg
          end
        end

        class Bar < Foo
          def foo(arg)
            super(5)       # 5 を引数にして呼び出す
            super(arg)     # 5 を引数にして呼び出す
            super          # 5 を引数にして呼び出す super(arg) の略記法
            arg = 1
            super          # 1 を引数にして呼び出す super(arg) の略記法
            super()        # 引数なしで呼び出す
          end
        end
        Bar.new.foo 5

==[a:block] ブロック付きメソッド呼び出し

例:

          [1,2,3].each do |i| print i*2, "\n" end
          [1,2,3].each {|i| print i*2, "\n" }

文法:

          method(arg1, arg2, ...)  do [`|' 式 ... `|'] 式 ... end
          method(arg1, arg2, ...) `{' [`|' 式 ... `|'] 式 ... `}'
          method(arg1, arg2, ..., `&' proc_object)

ブロック付きメソッドとは制御構造の抽象化のために用いられる
メソッドです。最初はループの抽象化のために用いられていたため、
特にイテレータと呼ばれることもあります。
do ... end または { ... }  で囲まれたコードの断片
(ブロックと呼ばれる)を後ろに付けてメソッドを呼び出すと、その
メソッドの内部からブロックを評価できます。
ブロック付きメソッドを自分で定義するには yield 式を使います。

{ ...  } の方が do ...  end ブロックよりも強く結合します
#@#((-version 1.6.0 から 1.6.2 まではこの結合強度の違いがなくなっていまし
#@#たが、これはバグです。version 1.6.3 で修正されました-))。
次に例を挙げますが、このような違いが影響するコードは読み辛いので避けましょう:

          foobar a, b do .. end   # foobarの引数はa, bの値とブロック
          foobar a, b { .. }      # ブロックはメソッドbの引数、aの値とbの返り値とがfoobarの引数

ブロックの中で初めて代入された(宣言された)ローカル変数はその
ブロックの中でだけ有効です。例えば:

          foobar {
            i = 20                # ローカル変数 `i' が宣言された
             ...
          }
          print defined? i        # `i' はここでは未定義なので false
          foobar a, b do
            i = 11                # まったく別の変数 i の宣言
             ...
          end

以下は逆にブロック外でも有効な例です。

          i = 10
          [1,2,3].each do |m|
            p i * m               # いきなり i を使える
          end

ブロックの部分だけを先に定義して変数に保存しておき、後からブロック付きメソッドに渡すことも出来ます。
それを実現するのが手続きオブジェクト([[c:Proc]])です。
それをブロックとして渡すにはブロック付きメソッドの最後の引数として `&' で修飾した手続きオブジェクトを渡
します。Proc の代わりにメソッドオブジェクト([[c:Method]])を渡す
ことも出来ます。この場合、そのメソッドを呼ぶ手続きオブジェクトが生成さ
れ渡されます。

        # 1引数の手続き(その働きは引数をpで印字すること)を生成し、変数pobjに格納
        pobj = proc {|v|
          p v
        }

        [1,2,3].each(&pobj) # 手続きオブジェクトをブロックの代わりに渡している
        => 1
           2
           3

#@since 1.8.0
to_proc メソッドを持つオブジェクトならば、`&'
修飾した引数として渡すことができます。デフォルトで Proc、Method オブジェ
クトは共に to_proc メソッドを持ちます。to_proc はメソッド呼び出し時に実
行され、Proc オブジェクトを返すことが期待されます。

    class Foo
      def to_proc
        Proc.new {|v| p v}
      end
    end

    [1,2,3].each(&Foo.new)

    => 1
       2
       3
#@end

ブロック付きメソッドの戻り値は、通常のメソッドと同様ですが、ブロックの中から
[[ref:d:spec/control#break]] により中断された場合は nil を返します。

#@since 1.8.0
break に引数を指定した場合はその値がブロック付きメソッドの戻り値になります。
#@end

==[a:yield] yield

自分で定義したブロック付きメソッドでブロックを呼び出すときに使います。
yield に渡された値はブロック記法において | と | の間にはさまれた
変数(ブロックの引数)に代入されます。

例:

          yield data

文法:

          yield `(' [式 [`,' 式 ... ]] `)'
          yield [式 [`,' 式 ... ]]

引数をブロックの引数として渡してブロックを評価します。yield は
イテレータを定義するために [[ref:d:spec/def#method]] 内で使用します。

        # ブロック付きメソッドの定義、
        # その働きは与えられたブロック(手続き)に引数1, 2を渡して実行すること
        def foo
          yield(1,2)
        end

        # fooに「2引数手続き、その働きは引数を配列に括ってpで印字する」というものを渡して実行させる
        foo {|a,b|
          p [a, b]
        }  # => [1, 2] (要するに p [1, 2] を実行した)

        # 今度は「2引数手続き、その働きは足し算をしてpで印字する」というものを渡して実行させる
        foo {|a, b|
          p a + b
        }  # => 3 (要するに p 1 + 2 を実行した)

        # 今度のブロック付きメソッドの働きは、
        # 与えられたブロックに引数10を渡して起動し、続けざまに引数20を渡して起動し、
        # さらに引数30を渡して起動すること
        def bar
          yield 10
          yield 20
          yield 30
        end

        # barに「1引数手続き、その働きは引数に3を足してpで印字する」というものを渡して実行させる
        bar {|v|
          p v + 3
        }
        # => 13
        #    23
        #    33 (同じブロックが3つのyieldで3回起動された。
        #        具体的には p 10 + 3; p 20 + 3; p 30 + 3 を実行した)

        # Array#eachの(粗製乱造の)類似品
        def iich(arr) # 引数に配列を取る
          idx = 0
          while idx < arr.size
            yield(arr[idx]) # 引数の各要素毎に、その要素を引数にしてブロックを起動
            idx += 1
          end
        end

        sum = 0
        iich([1, 4, 9, 16, 25]) {|elem|
          sum += elem
        }
        p sum # => 55

ブロック引数の代入は[[ref:d:spec/operator#multiassign]]と同じルールで行われます。
また yield を実行したメソッドにブロックが渡されていない
(ブロック付きメソッド呼び出しではない)時は例外 [[c:LocalJumpError]] が発生します。

yield はブロック内で最後に評価した式の値を返します。また、
[[ref:d:spec/control#next]] によりブロックの実行が中断された場合は nil
を返します。

#@since 1.8.0
next に引数を指定した場合はその値が yield の戻り値になります。
#@end

===[a:block_arg] ブロックパラメータの挙動

#@if( "1.8.0" <= version and version < "1.9.0")
メソッド呼び出しと挙動が異なります。例えば引数の数が違っても例外が
発生しません。

ブロックパラメータの受渡しは、以下の点に関して将来変更されるかもしれま
せん。現在は警告が出ます。

      def foo
        yield 1,2,3
      end

      foo {|v| p v}

      # => -:5: warning: multiple values for a block parameter (3 for 1)
           [1, 2, 3]

これは、

      yield [1,2,3]

あるいは

      foo {|*v| p v}

とするべきです。同様の多重代入

      v = 1,2,3

は現在のところ警告は出ませんが使用しない方がよいでしょう。
#@#((-[[ruby-dev:20358]], [[ruby-dev:20409]]-))
#@end

#@since 1.9.0
メソッド呼び出しと挙動が異なります。
lambda でないブロックを呼び出したとき

  * 引数の数が違ってもエラーになりません。
  * 配列をひとつ渡したときにそれが引数の並びとして展開されることがあります。

 def foo
   yield 1,2,3
 end

 foo{|v| p v}       #=> 1

 def bar
   yield [1,2,3]
 end
 
 bar{|a, b, c| p a} #=> 1

 def hoge
   yield [1,2,3],4,5
 end
 
 hoge{|a, b, c| p a} #=> [1,2,3]


[[url:http://cvs.m17n.org/~akr/diary/2007-08.html#a2007_08_16_1]]
#@end
