Ruby インタプリタ作成時に設定された情報を格納したライブラリです。

#@since 1.9.1
= module RbConfig
alias Config

Ruby インタプリタ作成時に設定された情報を格納したライブラリです。
RbConfig モジュールを定義します。

#@else
= module Config
#@since 1.8.5
alias RbConfig
#@end

Ruby インタプリタ作成時に設定された情報を格納したライブラリです。
Config モジュールを定義します。

#@if (version >= "1.8.5")
RbConfig モジュールを Config と同じものとして定義します。
#@end

#@end
#@#=== 使いかた

#@#  require 'rbconfig'

== Singleton Methods

#@if (version >= "1.8.5")
--- expand(val)
#@todo

#@since 1.9.1
@see [[m:RbConfig::MAKEFILE_CONFIG]]
#@else
@see [[m:Config::MAKEFILE_CONFIG]]
#@end
#@end
#@since 1.9.2
--- ruby
#@todo

returns the absolute pathname of the ruby command.
#@end

== Constants

--- DESTDIR
#@todo

--- TOPDIR
#@todo

--- CONFIG
#@todo


設定値を格納したハッシュです。以下のキーと値を持ちます。

: srcdir
      コンパイルした Ruby のソースディレクトリ
: prefix
      Ruby のインストール先の基準ディレクトリ
: ruby_install_name
: RUBY_INSTALL_NAME
      ruby インタプリタのファイル名
: EXEEXT
      実行ファイルの拡張子
: SHELL
      シェルのパス名
: CFLAGS
      C コンパイラのオプション
: CPPFLAGS
      C プリプロセッサのオプション
: CXXFLAGS
      C++ コンパイラのオプション
: FFLAGS
      Fortran コンパイラのオプション
: LDFLAGS
      リンカオプション
: LIBS
      ライブラリ
: exec_prefix
      アーキテクチャ依存の実行ファイルのインストール先ディレクトリ
: bindir
      実行ファイルのインストール先ディレクトリ
: sbindir
      管理者用実行ファイルのインストール先ディレクトリ
: libexecdir
      他のプログラムから実行される実行ファイルのインストール先ディレクトリ
: datadir
      アーキテクチャに依存しないデータのインストール先ディレクトリ
: sysconfdir
      設定ファイルのインストール先ディレクトリ
: sharedstatedir
: localstatedir
: libdir
: includedir
: oldincludedir
: infodir
: mandir
#@since 1.9.1
: MAJOR
      Ruby のライブラリ向けインタフェースのバージョン(キー ruby_version)の major (1.9.2 の 1)

      処理系自体のバージョンは RUBY_VERSION を参照すること
: MINOR
      Ruby のライブラリ向けインタフェースのバージョンの minor (1.9.2 の 9)
: TEENY
      Ruby のライブラリ向けインタフェースのバージョンの teeny (1.9.2 の 2)
#@else
: MAJOR
      Rubyのバージョン の major (1.8.7 の 1)

      Ruby 1.9 以降で処理系自体のバージョンではなくライブラリ向け
      インタフェースのバージョンを示すことになったので、
      処理系自体のバージョンは RUBY_VERSION を参照すること
: MINOR
      Ruby のバージョン の minor (1.8.7 の 8)
: TEENY
      Ruby のバージョン の teeny (1.8.7 の 7)
#@end
: host
: host_alias
: host_cpu
: host_vendor
: host_os
      実行するシステムの情報
#@todo
//emlist{
        例:

        C:\>ruby -v -r rbconfig -e "p Config::CONFIG['host']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i686-pc-cygwin"
//}
: target
: target_alias
: target_cpu
: target_vendor
: target_os
      生成されたコードを実行するシステムの情報
//emlist{
        例:

        C:\>ruby -v -r rbconfig -e "p Config::CONFIG['target']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i386-pc-cygwin"
//}
: build
: build_alias
: build_cpu
: build_vendor
: build_os
      ビルドしたシステムの情報
//emlist{
        例:

        C:\>ruby -vrrbconfig -e "p Config::CONFIG['build']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i586-pc-linux-gnu"
//}
: CC
      ビルドに使われた C コンパイラ
: CPP
      ビルドに使われた C プリプロセッサ
: YACC
      ビルドに使われた コンパイラコンパイラ
: RANLIB
: AR
      ビルドに使われたライブラリアン
: NM
: DLLWRAP
: AS
: DLLTOOL
      ビルドに使われたライブラリ操作コマンド
      (?)
: WINDRES
      Windows のリソース操作コマンド
: LN_S
      シンボリックリンク作成コマンド
: SET_MAKE
: OBJEXT
      オブジェクトファイル(コンパイルだけされてリンク前のファイル)の拡張子
: LIBOBJS
      ruby本体にリンクされているオブジェクトファイル
      (?)
: ALLOCA
: XLDFLAGS
: DLDFLAGS
: STATIC
: CCDLFLAGS
: LDSHARED
: DLEXT
: DLEXT2
      ダイナミックリンクライブラリの拡張子
: STRIP
      オブジェクトファイルからシンボルを切り捨てるコマンド
: EXTSTATIC
: setup
: MINIRUBY
      ビルド途中に作成される機能限定版rubyのcompile_dirからの相対パス
: PREP
: LIBRUBY_LDSHARED
: LIBRUBY_DLDFLAGS
: RUBY_SO_NAME
      ruby共有ライブラリの名前
: LIBRUBY_A
: LIBRUBY_SO
: LIBRUBY_ALIASES
: LIBRUBY
: LIBRUBYARG
: SOLIBS
: DLDLIBS
: ENABLE_SHARED
      configureで--enable-sharedだったかどうか(値は"yes"または"no")
: MAINLIBS
: arch
      実行対象となるアーキテクチャ。RUBY_PLATFORMと同じ。
: sitearch
      サイトごとの拡張ライブラリインストール時にarchの代わりに利用される値。
      通常はarchと同じになるが、特定のプラットフォーム(mswin32・mingw32)では
      異なる。
      拡張ライブラリにバイナリ互換性があるarch間で、拡張ライブラリを共有する
      ために用いられる。
: sitedir
: configure_args
      ビルド時のconfigureの引数。
: ruby_version
#@until 1.9.1
      rubyのライブラリ向けインタフェースのバージョン(例:"1.6")
#@end
#@since 1.9.1
      rubyのライブラリ向けインタフェースのバージョン(例:"1.9.1")
#@end
      処理系自体のバージョンはこちらでなく RUBY_VERSION を参照すること
: rubylibdir
: archdir
: sitelibdir
: sitearchdir
: compile_dir
      ビルド時の作業ディレクトリ。

--- MAKEFILE_CONFIG
#@todo

#@since 1.9.1
[[m:RbConfig::CONFIG]]
#@else
[[m:Config::CONFIG]]
#@end
と同じですが、その値は以下のような形
で他の変数への参照を含みます。
  MAKEFILE_CONFIG["bindir"] = "$(exec_prefix)/bin"
これは、Makefile の変数参照の形式で MAKEFILE_CONFIG は、
Makefile 作成の際に利用されることを想定しています。

  require 'rbconfig'
  
  print <<-END_OF_MAKEFILE
  prefix = #{Config::MAKEFILE_CONFIG['prefix']}
  exec_prefix = #{Config::MAKEFILE_CONFIG['exec_prefix']}
  bindir = #{Config::MAKEFILE_CONFIG['bindir']}
  END_OF_MAKEFILE
  
  => prefix = /usr/local
     exec_prefix = $(prefix)
     bindir = $(exec_prefix)/bin

#@since 1.9.1
[[m:RbConfig.expand]]
#@else
[[m:Config.expand]]
#@end
は、このような参照を解決する
メソッドとして rbconfig 内部で利用されています。
(CONFIG 変数は、MAKEFILE_CONFIG の内容から
#@since 1.9.1
[[m:RbConfig.expand]]
#@else
[[m:Config.expand]]
#@end
を使って生成されています)

  require 'rbconfig'
  p Config.expand(Config::MAKEFILE_CONFIG["bindir"])
  # => "/usr/local/bin"
