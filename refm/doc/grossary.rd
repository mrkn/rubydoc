= Ruby用語集

== A


: AWK
  エイホ(A)、ワインバーガー(W)、カーニハン(K)による
  小型の[[unknown:Ruby用語集/スクリプト言語]]。

== B


: blade
  ml archive ([[unknown:(('blade/ruby'))|URL:http://blade.nagaokaut.ac.jp/ruby/]])

== C


: Coerce
  数値の型変換を行うメソッド。数値計算のメソッドは自分の知らな
  いインスタンスが引数として渡された時にはcoerce
  メソッドを使って変換を行うように取り決められている。
  coerceメソッドは引数として与えられた値(を変換し
  た値)と自分(必要ならば変換した値)のペアを返す。

  Rubyのライブラリの数値型の変換順序は

            Fixnum -> Bignum -> Rational -> Float -> Complex

  になっている。

== D


: Data
  CレベルのポインタをRubyオブジェクトとして見せるためのラッパー。
  Cポインタと、mark関数、free関数から作る。Cを使ってRubyに機能
  を追加しようとする人はぜひこのクラスの使い方をマスターする必
  要がある。逆にいうとそういう予定のない人には用事がないクラス
  でもある。

: defined?
  いろいろなもの(式)が本当に定義されているかどうか調べてくれる
  演算子。定義されていなければnil、定義されてい
  ればその式の種別を示す文字列を返す。defined?は
  メソッドのようにみえるがRubyの文法に組み込まれた演算子で、引
  数の評価を行わない。よって

            defined? print("abc\n")

  はなにも出力しない。

== E


: Eiffel
  オブジェクト指向プログラミング言語。matzは昔この言語の作者の
  本(Object-oriented Software Construction 邦訳「オブジェクト
  指向入門」)を読んで目から鱗が落ちたらしい。その割にはRubyは
  Eiffelに似ていない。似ているのはブロックがendで
  終るところと、rescueという予約語だけか。

: end
  ブロック構造を終える予約語。ある統計によればRubyを最初に見た
  人の33%がこれを見てPascalを連想するという(嘘)。しかし、実際
  にはbeginと対にならないこの形式はPascalというよりAdaやEiffel
  に近い。

  RubyがCやPerlで慣れ親しんだ {}を使わなかったの
  は以下の理由である

  * 単文・複文問題の回避

    たとえばCでは

              if (a==b)
                 c();

    に文を追加しようとして

              if (a==b)
                 c();
                 d();

    などとするとややこしいバグの元になる。この問題はPascalにも存
    在する。

  * ぶらさがりelse問題の回避

    上記と類似だが、

              if (a==b)
                 if (c==d) foo();
              else bar();

    などと書いてしまうと面倒なことになる。上のプログラムは実は

              if (a==b) {
                 if (c==d) foo();
                 else bar();
              }

    という意味である。

  * 可読性の向上

    異論はあるようだが、endという単語でブロックを閉じた方がプロ
    グラムが読みやすいと考えている人がいる。

  * begin, caseの構文上の問題

    正直言うと、matzはendという名前の変数を使おうとして痛い目に
    あったことが何度かある。そこで、一度は { }を使っ
    た文法にしようと検討したが、beginとcase
    の文法がきれいにまとまらずに断念した。実をいうとこれが最大の
    理由であったりする。


: ENV
  環境変数をアクセスするための[[c:Hash]]
  と同様の動作をするオブジェクト。実際には特異メソッドを付加し
  た[[c:Object]]クラスのイン
  スタンスである。このオブジェクトによって
  [[unknown:Ruby用語集/環境変数]]を変更すると、
  Rubyの子プロセスにも引き継がれる。


== F


: FAQ
: Frequently Asked Questions
  よくある質問とその答え集。
  [[unknown:Ruby FAQ]]はまだまだ発展途上である。質問と答えは随時募集中。


== G


: goto
  Rubyにないもの。gotoがないのはそれが「あるべきでないから」ではなく、
  「実装するのが面倒だったから」である。
  gotoの代りはcatch/throwや例外で実現する。

== H
== I
== J


: JARH
: Just another Ruby hacker,

== K
== L
== M


: main
  [[unknown:Ruby用語集/トップレベル]]での[[unknown:Ruby用語集/self]]。
  selfがないわけにはいかないので、ただそこにある
  ためだけの単なるObjectクラスのインスタンスであるが、
  Objectクラスを操作するため、いくつかの特異メソッドを定義して
  ある。

  定義されている特異メソッド

  * private

  * public

  * include


: matz
  Rubyの作者。まつもと ゆきひろとも言う。
  [[m:URL:http:#/cmail.sourceforge.jp/]]
  と4人の子供の父親でもある。

: ミックスイン
: Mix-in
  アイスクリームにいろんなものをまぜて新しい味を作ること。転じ
  て[[unknown:Ruby用語集/モジュール]]をクラスに混ぜて機能を追加
  すること。[[unknown:Ruby用語集/継承]]を参照。

  Rubyでは多重継承を採用せず、is-aの関係のための継承と、機能の
  共有のためのMix-inを用意している。これは多重継承を濫用すると
  関係が混乱するというmatzの信念のためである。

== N
== O
== P


: Perl
  何だったっけ？

: POLS
  Principle of least surprise

: Python
  Rubyのライバル。「年を経た蛇」。matzがPythonに満足していれば
  Rubyは生まれなかったであろう。一番気になっているのは名前の長
  さ(6文字)である。

== Q
== R


: RAA
  Ruby Application Archive([[unknown:RAA|URL:http://www.ruby-lang.org/en/raa.html]])

: RCR
  Ruby Change Request

: RD
  Ruby Document

: Ruby
  オブジェクト指向スクリプト言語。Rubyの名前は「Perlに続く
  (pearlは6月の誕生石、Rubyは7月の誕生石)」という程度の意味で
  名付けられた。Rubyは別に何かの略ではない。

== S


: Sather
  オブジェクト指向プログラミング言語。matzは
  [[unknown:Ruby用語集/Eiffel]]よりもSatherが好きだ。しかし、
  SatherもやっぱりRubyには全然似ていない。

: self
  [[unknown:Ruby用語集/レシーバ]]を参照する式。なぜ
  selfかというと、[[unknown:Ruby用語集/メソッド]]
  を動詞と考えるとレシーバは主語に当たり、メソッドから見ると
  ((*自分*))であるからという説があるが、Rubyでは深
  く考えず、単に[[unknown:Ruby用語集/Smalltalk]]を真似ただけ
  だ、という説が有力である。

: Smalltalk
  オブジェクト指向プログラミング言語。現在の
  [[unknown:Ruby用語集/オブジェクト指向]]と
  いう[[unknown:Ruby用語集/パラダイム]]の基礎を築いた言語。

: super
  オーバーライドしたメソッドから上位のメソッドを呼び出す方法。
  引数を省略した時には呼び出し元のメソッドと同じ引数で呼び出さ
  れる。


  * 問題:

    引数として与えられた変数の値を変更した場合には、
    superで元の値が渡るか、変更した値が渡るか。

              def foo(a)
                 print a
              end
              def self.foo(a)
                a=25
                super
              end
              foo(5)    # 5 or 25??

  * 答え:

    変更した値(25)((-古いバージョンでは 5 を返すという仕様だった。現在
    はこの問題自体にあまり意味がないかも知れない-))

== T


: Thread
  もとはThread of controlの略。一連の制御の流れのこと。Rubyでは
  一つのプログラムの中に複数のスレッドが存在できる。

== U


: undef
  メソッドを未定義状態にすること。[[unknown:Ruby用語集/継承]]
  も[[unknown:Ruby用語集/Mix-in]]もクラスにメソッドを追加するこ
  とだが、undefを使えばメソッドを取り除くことがで
  きる。ただし、クラスの実装に必要なメソッド(メソッド内部から
  呼ばれているメソッド)を外してしまうと痛い目に遭う。

== V
== W
== X
== Y
== Z

== あ


: イテレータ
: Iterator
  [[unknown:Ruby用語集/ブロック付きメソッド呼び出し]]のこと。
  ブロック付きメソッドは当初繰り返し処理を行うために作られたため、
  未だにイテレータと呼ぶことがある。
  繰り返しを意図したメソッドをイテレータと呼ぶのはかまわないが、
  ブロック付きメソッド呼び出し全般をイテレータと呼ぶと混乱の元
  になるので気を付けるように。

: インスタンス
: Instance
  [[unknown:Ruby用語集/オブジェクト]]のこと。オブジェクトがある
  クラスに所属することを強調する意味あいがあるらしい。オブジェ
  クトなんだかインスタンスなんだか混乱してオブジェクト指向に挫
  折する人は多いと聞く。

: インスタンス変数
: Instance Variable
  オブジェクトに固有の変数のこと。Rubyのインスタンス変数は識別
  子の直前に@をつけたものであり、メソッドの中から
  しか参照できない。

: オーバーライド
: Override
  [[unknown:Ruby用語集/再定義]]のこと。スーパークラスまた
  は[[unknown:Ruby用語集/include]]しているモジュールで定義され
  ているメソッドと同じ名前のメソッドを定義すること。オーバーラ
  イドした上位のメソッドは
  [[unknown:Ruby用語集/super]]を使って呼び出すこと
  ができる。

: オブジェクト
: Object
  ((*もの*))のこと。「愛」は多分オブジェクトではな
  いが、「ラブレター」はオブジェクトである。あるものがものであ
  るか、そうでないかは多分に哲学的である。この辺がオブジェクト
  指向は難しいといわれる原因かも知れない。コンピュータ業界では
  メモリ中の特定の空間のことをオブジェクトと呼ぶ人がいたりする
  人がいる。困ったものだ。[[unknown:Ruby用語集/カプセル化]]、
  [[unknown:Ruby用語集/抽象データ型]]参照。

: オブジェクト指向
  オブジェクトを基本にした[[unknown:Ruby用語集/パラダイム]]。
  英語の"Object-Oriented"という形容詞が、日本に来て名詞化した。
  オブジェクトを考え方の中心に置けば、なんでも良いようにも思え
  るが、一般的には

  * [[unknown:Ruby用語集/継承]]

  * [[unknown:Ruby用語集/カプセル化]]

  * [[unknown:Ruby用語集/ポリモルフィズム]]

    (あるいは[[unknown:Ruby用語集/動的結合]])

  が必要らしい。
  なんでも解決できる「魔法」のように考える人もいるが、世の中そ
  んなに甘くない。誕生から20数年を経てようやっと実用的に使われ
  るようになった…んだろうな、多分。

: オブジェクト指向設計
: Object-Oriented Design
  オブジェクトを基本にしたシステム設計

: オブジェクト指向プログラミング
: Object-Oriented Programming
  オブジェクトを基本にしたプログラミング。

: オブジェクト指向分析
: Object-Oriented Analysis
  オブジェクトを基本にしたシステム分析。


== か


: カプセル化
: Encapsulation
  データに対する直接的な操作はデータの型に付随する特定の手続き
  ([[unknown:Ruby用語集/メソッド]]と呼ぶ)からだけ行うことにより、
  内部構造や処理のアルゴリズムを外部から隠してしまうこと。
  [[unknown:Ruby用語集/抽象データ型]]参照。

  Rubyはインスタンス変数はメソッドからしか参照できないので、カ
  プセル化が強制されているといえる。

: 環境変数
: Environment Variable
  親プロセスから子プロセスに対して受け渡される値。
  [[unknown:Ruby用語集/ENV]]でアクセスされる。
  子プロセスに渡るのは環境変数のコピーなので、子プロセスから親
  プロセスに環境変数を使って情報を受け渡すことはできない。
  親はなかなか子供に耳を傾けないものである。

: 関数
: Function
  厳密にいうとRubyに関数はない。しかし、レシーバを省略したメソッ
  ド呼び出しは外見が関数に似ているし、
  [[unknown:Ruby用語集/self]]やインスタンス変数など
  レシーバの情報を全く参照しない事実上の関数として働いていると
  いっても良いメソッドもある。だから厳密でない言い方としてそう
  いうメソッドを関数と呼ぶこともある。

  そういう関数(的メソッド)は大抵レシーバを省略した形式でしか呼
  び出せないように[[unknown:Ruby用語集/可視性]]がprivateに
  設定してある。このようなメソッドの代表として
  [[unknown:Ruby用語集/モジュール関数]]がある。

: クラスメソッド
: Class Method
  クラスのメソッド。全てのクラスのクラス
  [[c:Class]]で定義されている
  全てのクラスで共有されているメソッドとクラスそれぞれが固有に持っている
  [[unknown:Ruby用語集/特異メソッド]]とがあるが、そんな
  ことは大した問題ではない。
  クラスメソッド内でのselfはクラスであるので勘違いしないように。

: グローバル変数
: Global Variable
  プログラム全体から参照できる変数。危険。多用しないこと。

: 継承
: Inheritance
  先祖や親戚から受け継いだものに頼り切って、
  自分では最低限のことしかしないこと。現実世界では嫌な奴。
  転じて、ある[[unknown:Ruby用語集/クラス]]に機能を追加した新しいクラス
  を作ること。継承はis-aの関係を表現するのに有効である。たとえ
  ば、学生一般の性質を記述した「学生」クラスを継承して、実験に
  苦しめられる「工学部生」クラスを作ることができる。is-aの関係
  がなく、単に性質や機能を共有する場合には[[unknown:Ruby用語集/Mix-in]]
  を使うことが望ましいとされる。


== さ


: 再定義
: Redefinition
  [[unknown:Ruby用語集/オーバーライド]]のこと。

: 辞書
: Dictionary
  項目からその定義を取り出すことができるもの。転じて
  [[unknown:Ruby用語集/ハッシュ]]の別名。オブジェクト指向の起源と
  も呼べる[[unknown:Ruby用語集/Smalltalk]]においてハッシュに
  相当するデータ構造が「辞書」と呼ばれていたせいで辞書という用
  語になじんでいる一群の人々がいる。

: 初期化
: Initialize
  オブジェクト(あるいは「なにか」)を「使える」状態にすること。
  インスタンスの初期化には
  [[m:Object#initialize]]
  メソッドを再定義する。クラスのメソッド
  [[m:Class#new]]のデフォルトの
  定義は新たに生成したインスタンスに対して、
  initializeを実行する。newへの
  引数はそのままinitializeに渡される。また、
  newがブロックとともに呼び出された時には
  initializeにそのブロックがそのまま与えられる。

  ということは[[m:Class#new]]
  を再定義する必要はないはずだ。

: スクリプト
: Script
  台本。転じて、インタープリタが解釈する比較的短いプログラムの
  こと。もちろん中には超大作の台本もある。

: スクリプト言語
: Script Language
  [[unknown:Ruby用語集/スクリプト]]に従ってバッチ処理を行うイン
  タープリタのこと。人間も台本を読むという点においてスクリプト
  言語である。

: 即値
: Immediate Value
  [[unknown:Ruby用語集/参照]]ではなく、実際の値が変数に格納さ
  れるもの。Rubyの現在の実装ではFixnum、Symbolとnil/true/falseだけが即
  値である。しかし、Fixnumが即値でないRubyの実装があっても構わ
  ないし、モデル上全ての値がオブジェクトへの参照であると考えて
  も差し支えない。

: ソート
: Sort
  順番に並べ替えること。Ruby は数え上げる事ができて
  (Enumerable がincludeされていて)、各要素に順序
  が定義されて(<=> が定義されて)いれば、配列に限らずどん
  な複雑なオブジェクトの集まりもソートしてくれる。


== た


: 大域脱出
: Non-Local Exit
  [[unknown:制御構造/break]],
  [[unknown:制御構造/next]],
  [[unknown:制御構造/redo]],
  [[unknown:制御構造/retry]],
  [[unknown:制御構造/return]]
  などのメソッドの範囲内での脱出ではなく、捕捉されない限りメソッ
  ド呼び出しの階層を遡って中断するタイプのものを大域脱出と呼ぶ。
  Rubyの大域脱出には、例外によるものとcatch/throwがある。

  ほとんどの例外は(exitで発生するSystemExit
  を含めて[[unknown:制御構造/rescue]]
  で捕捉できるが、捕捉することに意味がない例外
  (例:メモリ割当に失敗した/インタプリタそのもののバグ)は
  捕捉の対象にならない。

  catch/throwはthrowされると指定されたタグと同じ
  タグを持つcatchまで一気にジャンプするものである。

: ダイナミックローカル変数
: Dynamic Local Variable
  [[unknown:Ruby用語集/ローカル変数]] の一種。Rubyのローカル変数はスコープが
  静的に決まるためコンパイル時に変数が作成されるが、ダイナミックローカ
  ル変数は、実行の都度変数が作成される。ブロックの中で初めて代入された
  ローカル変数はダイナミックローカル変数となり、そのスコープはブロック
  の中だけとなる。これは、[[unknown:Ruby用語集/Thread]] 毎に独立した変数を持
  つためにある。

: 抽象データ型
: Abstract Data Type
  データの構造とそのデータに対する操作をひとまとめにしたものを
  抽象データ型と呼ぶ。抽象データに対する操作は必ずその操作を経
  由する必要がある。結果、データ構造は外部からは直接参照されず、
  内部構造の変更が外部に悪影響を及ぼさない。このことを
  [[unknown:Ruby用語集/カプセル化]]と呼ぶ。

: 定数
: Constant
  一度定義したら値を変えることができない[[unknown:Ruby用語集/変数]]。
  でも、この定義は矛盾しているなあ。

: 動的結合
: Dynamic Binding
  操作の対象のデータ型に合わせて適切な手続き(メソッド)が実行時
  に選択されること。プログラムの柔軟性を高める働きがある。
  オブジェクト指向の要件のひとつ。
  Rubyでは[[unknown:Ruby用語集/変数]]に型が無いので動的結合は必然である。

: 特異クラス
: Singleton Class
  ある特定のオブジェクトだけのための仮想的なクラス。

: 特異メソッド
: Singleton Method
  ある特定のオブジェクトにだけ定義されたメソッド。
  [[unknown:Ruby用語集/メソッド]]参照。
  特異メソッドは以下の場合に他のオブジェクトにも引き継がれる。

  * [[m:Kernel#clone]]した場合

  * サブクラスを作った場合

  特異メソッドで元のクラスのメソッドをオーバーライドした場合は
  もとのメソッドは[[unknown:メソッド呼び出し/super]]で呼び
  出すことができる。

: ドキュメント
: Document
  matzの苦手なもの。彼は普段から「ソースがドキュメントだ。バグ
  も完全に記述されている」と主張しているが、誰も受け入れない。
  当り前だ。

: トップレベル
: Top Level
  クラス／モジュール定義の一番外側のコンテキスト。Rubyスクリプトはトップレベルの
  コンテキストから処理が始まる。

  いきなり、
    print "on Toplevel"
  というスクリプトを書いたとき、print メソッドはトップレベルから呼ばれている。

  トップレベルの [[unknown:Ruby用語集/self]] は [[unknown:Ruby用語集/main]] を指す。

== な
== は


: バイトオーダー
: Byte Order
  0x01020304という4バイトデータを1,2,3,4
  と配置するか、4,3,2,1と配置するかということ。前
  者を[[unknown:Ruby用語集/ビッグエンディアン]]、後者を
  [[unknown:Ruby用語集/リトルエンディアン]]と呼ぶ。どちらが
  良いかという論争は時のはじめから続いていてまだ結論が出ていない。

: 破壊的
: Destructive
  [[m:String#chop!]],
  [[m:Array#concat]] などの
  メソッドは、レシーバの状態を変化させるので、
  「破壊的な作用をする」という。
  めったにコンピュータを壊すことはない。

: ハッシュ
: Hash
  Rubyにおけるキーから値へのマッピングを表すデータ構造。
  [[unknown:Ruby用語集/連想配列]]とか
  [[unknown:Ruby用語集/辞書]]とも呼ばれる。ハッシュがハッシュ
  と呼ばれるのはその実現に「ハッシュ表」と呼ばれるアルゴリズム
  が使われているからである。ハッシュというのは「切り刻む」とい
  う意味で、「ハッシュド・ビーフ」の「ハッシュ」である。

: パラダイム
: Paradigm
  「考え方」の難しい表現。素直に分かりやすい言葉を使えばいいのに…。

: ビックエンディアン
: Big Endian
  アメリカ大陸原住民…はインディアン。
  こっちはエンディアンで語源はスウィフトの「ガリバー旅行記」に出て来る
  卵を丸い端から食べる人たちである。
  当然、尖った端から食べる人たちは
  [[unknown:Ruby用語集/リトルエンディアン]]である。
  コンピュータ業界ではCPUなどがデータを並べる時の形式のひとつで、
  ネットワーク族はビッグエンディアンを好むという。
  [[unknown:Ruby用語集/バイトオーダー]]参照

: ビルトインクラス
: Built-In Class
  Rubyインタプリタ組み込みでインスタンスの構造が
  通常のオブジェクトと異なるクラス。
  これらのクラスを継承したクラスを定義することはお勧めしない。
  Rubyのビルトインクラスは以下の通りである
  (本当はもっとあるけど気にしないように、ちゃんと
  [[unknown:組み込みクラス／モジュール／例外クラス]]
  に列挙されてるのだから)

  * [[c:Array]]
  * [[c:Bignum]]
  * [[c:Class]]
  * [[c:Data]]
  * [[c:FalseClass]]
  * [[c:File]]
  * [[c:Fixnum]]
  * [[c:Float]]
  * [[c:Hash]]
  * [[c:IO]]
  * [[c:MatchData]]
  * [[c:Module]]
  * [[c:NilClass]]
  * [[c:Proc]]
  * [[c:Regexp]]
  * [[c:String]]
  * [[c:Struct]]
  * [[c:Thread]]
  * [[c:TrueClass]]


: ブロック
: Block
  ループを構成したり、家や塀を建てたり、人を殴ったりするもの。

: ブロック付きメソッド呼び出し
  コードの集まり(ブロック)を受け取ることのできるメソッドを
  ブロック付きメソッド呼び出しと呼ぶ。

  ブロック付きメソッドの中では[[unknown:メソッド呼び出し/yield]]を使って
  ブロックを実行することができる。

  当然のことながら、与えられたブロックをどのように処理するかは
  メソッド側に委ねられている。ので、内部でブロックを評価しない
  メソッドにブロックを与えてもなにも起きない。エラーも起きない。

: 変数
: Variable
  オブジェクトにつける名札。Rubyの変数には
  [[unknown:Ruby用語集/グローバル変数]]、
  [[unknown:Ruby用語集/ローカル変数]]、
  [[unknown:Ruby用語集/インスタンス変数]]がある。
  それと[[unknown:Ruby用語集/定数]]は値を変えることができない
  ので、((*変*))数ではないが、名札であるという点に
  おいては変数と同じである。

: ポリモルフィズム
: 多態, Polymorphism
  対象になるオブジェクトによって実際の操作が決定されること。
  Rubyでは[[unknown:Ruby用語集/レシーバ]]のオブジェクトに応じ
  てメソッドが選択されることによって実現されている。


  * 例

              obj = "abc"
              print obj.length, "\n"          # => 3
              obj = [1,2,3,4]
              print obj.length, "\n"          # => 4

== ま


: モジュール関数
: Module Function
  [[unknown:Ruby用語集/関数]]のように用いられるメソッドの中で、
  モジュールのメソッドとしても、特異メソッドとしても定義されて
  いるものはモジュール関数と呼ばれる。例えば
  [[c:Math]]モジュールのほとんどのメソッドは
  モジュール関数である。これらのメソッドは、例えば

            Math.sqrt(2)

  という形式でも

            include Math
            sqrt(2)

  という形式でも使えて便利である。

: メソッド
: Method
  [[unknown:Ruby用語集/オブジェクト]]に対する操作。操作対象のオ
  ブジェクト([[unknown:Ruby用語集/レシーバ]])は
  [[unknown:Ruby用語集/self]]で参照できる。
  Rubyの場合[[unknown:Ruby用語集/ビルトインクラス]]のオブ
  ジェクトを除けば、オブジェクトの構造は動的に決まるので、ある
  オブジェクトの性質はそのオブジェクトに定義されているメソッド
  によって決定される。

== や
== ら


: リトルエンディアン
: Little Endian
  最初10人いて段々減っていく。コンピュータ業界ではデータを並べ
  る時の形式のひとつで、非常に大きなシェアを持つあるCPUメーカー
  はリトルエンディアンを好むという。[[unknown:Ruby用語集/バイトオーダー]]参照

: 例外
: Exception
  例外的な状況で発生するもの。例外が発生すると
  [[unknown:制御構造/begin]]の
  rescue節を使って明示的に捕捉されない限り、
  呼び出し階層を遡ってプログラム(thread)の実行は中断される。例外の
  おかげでRubyプログラムはほとんどの場合例外的な状況についていちいち
  チェックせずにすむ。例外の発生した場所の情報は
  [[unknown:$@|組み込み変数]]に、例外そのものに関する情報は[[unknown:$!|組み込み変数]]
  に格納されている。

: レシーバ
: Receiver
  メソッドの実行主体。メソッド呼び出し式の`.'の左
  側にあるもの。メソッド内では
  [[unknown:Ruby用語集/self]]で参照できる。レシーバ
  の[[unknown:Ruby用語集/インスタンス変数]]は
  @変数名という形式でアクセスできる。

: 連想配列
: Associative Array
  [[unknown:Ruby用語集/ハッシュ]]の別名。ハッシュが任意のキーから
  値を取り出すことができるので、「連想」と、またハッシュは添字
  が数字でない配列とみなすことができるので「配列」と呼ぶらしい。
  昔々は連想配列(連想記憶と呼ばれていた)はハードウェアによって
  実現されるものだと考えられていたが、計算速度の向上や適切なア
  ルゴリズムの発見(「ハッシュ表」と呼ぶ。ハッシュの語源)により
  ソフトウェアのみによって実現されるようになった。

: ローカル変数
: Local Variable
  ある範囲内でのみ参照可能な変数。その範囲をスコープと呼ぶ。
  Rubyのスコープは

  * プログラム全体

  * クラス・モジュール定義

  * メソッド定義

  * ブロック

  で、ブロックだけは外側のスコープのローカル変数もアクセスでき
  る。ローカル変数の有効範囲はスコープでの最初の代入が現れた場
  所からスコープの終りまでである。有効範囲は静的に決まり、実際
  に実行されるかどうかは関係ない。

== わ
== Symbol
