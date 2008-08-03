#@since 1.9.0
= 多言語化

Ruby は US-ASCII 以外の文字エンコーディングを扱うことができます。
文字列の内部表現のエンコーディングは固定されていません。
プログラマは目的に応じて使用するエンコーディングを選ぶことができます。

同じプロセスの中で異なるエンコーディングの文字列が同時に存在することができます。
全ての文字列は自身のエンコーディング情報を保持します。これにより各文字列は文字列として
適切に取り扱われます。

Ruby スクリプトに非 ASCII 文字を使うことができます。
文字列リテラルや正規表現リテラルだけでなく変数名、メソッド名、クラス名などにも
非 ASCII 文字を使うことができます。ただし文字列リテラル・正規表現リテラル以外での非 ASCII 文字の使用は
推奨されません。

グローバル変数 [[m:$KCODE]] は廃止されました。

 * [[ref:m17_prog]]
 * [[ref:ruby18]]
 * [[ref:encoding]]
 * [[ref:script_encoding]]

===[a:m17_prog] M17N プログラミングの基本

プログラマは文字列を扱うときエンコーディングを常に意識しなければいけません。
生成される段階で Ruby の文字列が適切なエンコーディング情報を持つよう心がけるべきです。
文字列が生成されるのは主に「リテラルから」「IOから」 
「文字列操作から」の 3 通りです。このうち文字列操作に関しては Ruby インタプリタが適切に
処理しますから、プログラマは 「リテラルから生成」「IO から生成」 の二通りに関して注意する必要があります。
IO から生成される文字列のエンコーディングに関しては [[ref:c:IO#m17n]] を参照してください。

文字列のエンコーディングを扱う上で基本となるメソッドは次の2つです。
[[m:String#encode]] メソッドは文字列のエンコーディングを変換した新しい文字列を生成して返します。
エンコーディングの変換には [[c:NKF]] ではなくこのメソッドを使うことが推奨されます。
[[m:String#force_encoding]] メソッドは文字列のエンコーディング情報を書き換えます。
例えばエンコーディングが不明のテキストファイルから読み込んだ文字列に後からエンコーディングを
設定する場合などに使います。

例:
  "いろは".encode("Shift_JIS")
   "\xA4\xA4\xA4\xED\xA4\xCF".force_encoding("EUC-JP")

====[a:ruby18] Ruby 1.8 からの移行

Ruby 1.8 からの移行措置として、コマンドオプション -K を指定すれば
Ruby 1.8 用に書かれたスクリプトもできる限り動くような仕様になっています。
ただし Ruby 1.9 には多言語化以外にも多くの非互換性が存在するので必ずしも動くとは限りません。

いずれにしても、これからは Ruby 1.9 への移行を考慮してスクリプトに非 ASCII 文字を使う場合、
マジックコメントでスクリプトエンコーディングを指定しておくのがよいでしょう。[[ref:magic_comment]] を
参照してください。

例:
  スクリプトを EUC-JP で書いていて、扱うテキストも EUC-JP の場合。 => コマンドオプションに -Ke を指定。

===[a:encoding] Ruby がサポートするエンコーディング

Ruby のエンコーディングのサポートはエンコーディングの種類によって異なります。

: ASCII互換エンコーディング
  フルサポートです。UTF-8, EUC-JP, Shift_JIS などがこれにあたります。
: ASCII互換ではないエンコーディング
  スクリプトエンコーディングに使えません。またエンコーディングが固定されていない
  正規表現がマッチングを行うと例外が発生します。UTF-16LE, UTF-16BE などがこれにあたります。
: ダミーエンコーディング
  サポートしません。Ruby はエンコーディングの名前だけ知っている状態です。ISO-2022-JP, UTF-7 
  がこれにあたります。

サポートするエンコーディングのリストは [[m:Encoding.list]], [[m:Encoding.name_list]]
で取得することができます。
また拡張ライブラリを作成することによりサポートするエンコーディングを動的に増やすことができます。

それぞれの用語の定義は以下を参照してください。

====[a:ascii_compat] ASCII互換エンコーディング

「ASCII互換エンコーディング」とは、ASCII 文字を表すバイト列が US-ASCII エンコーディングのバイト列
と同じエンコーディングを意味します。
コードポイントが同一という意味ではありません。従って UTF-16 はASCII互換ではありません。
また厳密性を追求せず、おおむね互換なら互換と呼びます。よって Shift_JIS は ASCII 互換です。

====[a:7bit_clean] 7bit クリーンな文字列

ASCII 互換エンコーディングをもつ 7bit クリーンな文字列は
エンコーディングに関わらず ASCII として扱うことができます。
例えば 7bit クリーンな文字列同士の比較の際、[[m:String#==]] は
両者の文字エンコーディングが異なっていても、文字列を表すバイト列が同じなら true を返します。
ASCII 互換エンコーディングをもつ文字列にエンコーディングの変換なしで結合することができます。

例:

  s = "abc"
  a = s.encode("EUC-JP")
  b = s.encode("UTF-8")
  p a == b                           #=> true
  p a + b                            #=> "abcabc"

====[a:binary] バイナリの取扱い

Ruby はバイナリをエンコーディングが ASCII-8BIT である文字列として扱います。

====[a:dummy] ダミーエンコーディング
#@todo

ダミーエンコーディングとは Ruby インタプリタが名前を知っているが対応していないエンコーディングのことです。
実際には ISO-2022-JP や UTF-7 などステートフルエンコーディングがダミーエンコーディングになります。
ダミーであるかどうかは [[m:Encoding#dummy?]] を使って識別できます。
ダミーエンコーディングを持つ文字列の扱いは以下のように制限されます。

 * 文字列のインスタンスメソッドは 1 文字ではなく 1 バイトを単位として動作します。
 * エンコーディングの異なる 7bit クリーンな文字列との結合ができません。例外が発生します。

またダミーエンコーディングはスクリプトエンコーディングとして使うことができません。

例:
  s = "漢字".encode("ISO-2022-JP")
  p s[0]   #=> "\e"  
  s + "b"  #=> ArgumentError: character encodings differ: ISO-2022-JP and US-ASCII

===[a:script_encoding] スクリプトエンコーディング

スクリプトエンコーディングとは Ruby スクリプトを書くのに使われているエンコーディングです。
マジックコメントで指定します。
現在のスクリプトエンコーディングは __ENCODING__ により取得することができます。

例: 
  # coding: euc-jp
  p __ENCODING__     #=> #<Encoding:EUC-JP>

====[a:magic_comment] magic comment

マジックコメントを使うことにより ruby インタプリタにスクリプトエンコーディングを
伝えることができます。マジックコメントとはスクリプトファイルの1行目に書かれた
 
  # coding: euc-jp

という形式のコメントのことです。1 行目が shebang である場合、マジックコメントは 2 行目に
書くことができます。上の形式以外にも

 # encoding: euc-jp
 # -*- coding: euc-jp -*-
 # vim:set fileencoding=euc-jp

などの形式を解釈します。

マジックコメントによりスクリプトファイル毎にスクリプトエンコーディングを
指定することができます。あるファイルに非 ASCII 文字を使う場合、マジックコメントを
必ず設定しなければいけません。設定されていなかった場合、エラーになります。

マジックコメントが指定されなかった場合、コマンド引数 -K, RUBYOPT およびファイルの shebang から
スクリプトエンコーディングは以下のように決定されます。左が優先です。

 magic comment(最優先) > -K > RUBYOPTの-K > shebang 

上のどれもが指定されていない場合、通常のスクリプトなら US-ASCII、-e や stdin から実行されたものなら
locale がスクリプトエンコーディングになります。

====[a:incompat] 1.8 からのスクリプトエンコーディングに関する非互換性

 * スクリプトのリテラル中に非 ASCII 文字が含まれている場合、
   1.8 では -K オプションなしで正常に動作していたとしても、1.9 では必ずパース時に
   エラーになります。
   -K オプションがない場合、1.8 では 1.9 の ASCII-8BIT 相当の挙動でしたが、1.9
   では US-ASCII として扱われるためです。

 * マジックコメントがあった場合、1.8 では無視されますが、1.9 ではそれ
   がスクリプトエンコーディングに反映されます。-K オプションよりも優先されます。

 * -K オプション・RUBYOPT・shebang の間の優先順位が 1.8 と 1.9 では違います。
   それぞれの優先順位は以下の通りです。左が優先です。
//emlist{
    Ruby 1.8 : shebang > RUBYOPTの-K > -K
    Ruby 1.9 : -K      > RUBYOPTの-K > shebang
//}

====[a:literal] リテラルのエンコーディング

文字列リテラル、正規表現リテラルそしてシンボルリテラルから生成されるオブジェクトのエンコーディングは
スクリプトエンコーディングになります。
ただしそれらが 7bit クリーンである場合、エンコーディングは US-ASCII になります。

#@# see parser_str_new at parse.y
またスクリプトエンコーディングが US-ASCII である場合、7bit クリーンではないバックスラッシュ記法で
表記されたリテラルのエンコーディングは ASCII-8BIT になります。

例: 

  # coding: us-ascii
  p __ENCODING__        #=> #<Encoding:US-ASCII>
  p "abc".encoding      #=> #<Encoding:US-ASCII>
  p "\x80".encoding     #=> #<Encoding:ASCII-8BIT>
 

  # coding: euc-jp
  p __ENCODING__        #=> #<Encoding:EUC-JP>
  p "abc".encoding      #=> #<Encoding:US-ASCII>  (7bit クリーンなので US-ASCII になる)
  p "\x80".encoding     #=> #<Encoding:EUC-JP>    


#@end
