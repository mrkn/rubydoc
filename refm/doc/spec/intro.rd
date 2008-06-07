#@###nonref

= はじめに

Rubyは手軽なオブジェクト指向プログラミングのためのインタプリタ言語です。
Rubyは(Perlのような)テキスト処理やシステム管理のための豊富な機能を持っています。
また、Rubyは単純で、分かりやすく、簡単に拡張できます。

もし、簡単なオブジェクト指向のための言語を求めていたり、
Perlは見にくいと感じていたり、
Lispの考え方は好きだがあの括弧の多さには困ると感じているなら、
Rubyはまさにぴったりです。

Rubyの特長は次の通りです。

: インタプリタ

    Rubyはインタプリタ言語ですので
    プログラムを実行するためにコンパイルする必要はありません。

: 変数に型が無い (動的型付け)

    Rubyの変数はどのような型のデータも格納する事ができますので、
    変数の型について心配する必要はありません。
    半面、コンパイル時のチェックは弱くなります。

: 変数宣言が不要

    Rubyでは変数を宣言無しで使う事ができます。
    変数の種類(ローカル変数、グローバル変数、インスタンス変数など)は
    変数名から知る事ができます。

: 単純な文法

    Rubyの文法はEiffelからわずかに影響を受けた単純なものです。

: ユーザによるメモリ管理が不要

    Rubyはメモリ管理を自動的に行います。
    どこからもアクセスされなくなったオブジェクトは
    インタプリタに組み込みのガーベージコレクタによって回収されます。

: 全てがオブジェクト

    Rubyははじめから純粋なオブジェクト指向言語として設計されています。
    整数のような基本的なデータ型をはじめとして、
    全てのデータをオブジェクトとして統一的に取り扱えます。

: クラス、継承、メソッド

    Rubyは
    クラス、継承、メソッドのようなオブジェクト指向言語として基本的な機能は
    当然持っています。

: 特異メソッド

    ある特定のオブジェクトにメソッドを付加することができます。
    たとえば、GUIのあるボタンを押された時の動作を
    メソッドとして記述するような使い方ができますし、
    これを応用してプロトタイプベースの
    オブジェクト指向プログラミングも可能です(やりたければね)。

: モジュールによるMix-in

    Rubyは多重継承は複雑さの源であるという見地から、
    意図的に多重継承を持っていませんが、
    モジュールを使ってクラス階層を横断して実装を共有できます。
    この機能を"Mix-in"と呼びます。

: ブロック付きメソッド呼び出し(イテレータ)

    制御構造の抽象化を援助するブロック付きメソッド呼び出しという機能があります。

: クロージャ

    手続きをオブジェクトとして扱う機能があります。
    このオブジェクト化された手続きのことをクロージャと呼びます。

: 強力な文字列操作/正規表現

    Perlをお手本とした強力な文字列操作や正規表現検索の機能があります。

: 多倍長整数

    組み込みの多倍長整数機能がありますので、
    メモリが許す限り、非常に大きな整数の演算もできます。
    たとえば、400の階乗なども簡単に計算できます。

: 例外処理機能

    例外処理機能は例外的な状況への対処が簡単に書けます。

: OSへの直接アクセス

    Rubyは(UNIXの)ほとんどのシステムコールの呼び出し機能を持っています。
    Rubyだけでシステムプログラミングも可能です。

: ダイナミックローディング

    OSが許せば、オブジェクトファイルを実行時に読み込む機能が提供されます。
