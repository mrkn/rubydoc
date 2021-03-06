#@if (version >= "1.6.6")
Unix系OS の syslog を扱うライブラリです。

= module Syslog
include Syslog::Constants

UNIXのsyslogのラッパーモジュール。
syslog の詳細については [[man:syslog(3)]] を参照してください。

  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  Syslog.close
  # 書き込まれているか確かめる。
  # 但し、実行環境によってログの場所が違う。くわしくはsyslog.confを参照。
  File.foreach('/var/log/system.log'){|line|
    line.chomp!
    if /syslogtest/ =~ line
      puts line
    end
  }

== Module Functions

--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) -> self
--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self

与えられた引数でsyslogを開く。以降、他の Syslog モジュール関数が使
用可能となる。

ブロック付きで呼ばれた場合は、self を引数としてブロックを実行し、
最後に [[m:Syslog.#close]] を行う。

syslog の詳細については [[man:syslog(3)]] を参照してください。

@param ident すべてのログにつく識別子で、どのプログラムから送られ
             たログなのかを識別するために使われる文字列を指定します。
             指定しない場合はプログラム名が使われます。

@param options Syslog.open や Syslog.log の動作を制御するフラグを指定します。
               指定しない場合は、Syslog::LOG_PID|Syslog::LOG_CONSの値が使われ
               ます。使用できる値は[[c:Syslog::Constants]] を参照してください。
               
@param facility ログ出力を行うプログラムの種別を指定します。syslog はこの値
                にしたがって出力先となるログファイルを決定します。 詳しくは、
                [[man:syslog.conf(5)]], 
                [[c:Syslog::Constants]] を参照してください。

@raise RuntimeError syslogを既に開いていた場合は[[c:RuntimeError]]が発生する。

@return self を返します。

syslogを既に開いていた場合は[[c:RuntimeError]]が発生します。

  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  begin
    Syslog.open("syslogtest2")
  rescue RuntimeError => err
    puts err #=> "syslog already open"
  end

options と facility に指定できる値については
[[c:Syslog::Constants]] を参照してください。

指定例:
        Syslog.open('ftpd', Syslog::LOG_PID | Syslog::LOG_NDELAY,
                    Syslog::LOG_FTP)

--- open!(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self
--- reopen(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self

開いていた syslog を最初にクローズする点を除いて[[m:Syslog.#open]] と同じです。

@param ident すべてのログにつく識別子で、どのプログラムから送られ
             たログなのかを識別するために使われる文字列を指定します。
             指定しない場合はプログラム名が使われます。

@param options Syslog.open や Syslog.log の動作を制御するフラグを指定します。
               指定しない場合は、Syslog::LOG_PID|Syslog::LOG_CONSの値が使われ
               ます。使用できる値は[[c:Syslog::Constants]] を参照してください。
               
@param facility ログ出力を行うプログラムの種別を指定します。syslog はこの値
                にしたがって出力先となるログファイルを決定します。 詳しくは、
                [[man:syslog.conf(5)]], [[c:Syslog::Constants]] を参照してく
                ださい。

使用例
  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  begin
    Syslog.open!("syslogtest2")
    Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 200)
  rescue RuntimeError => err
    # RuntimeError は発生しない。
    puts err 
  end
  File.foreach('/var/log/system.log'){|line|
    print line if line =~ /the sky is/
  }

@see [[m:Syslog.#open]]

--- opened? -> bool

syslog をオープンしていれば真を返す。

使用例
  require 'syslog'

  p Syslog.opened? #=> false
  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  p Syslog.opened? #=> true


--- ident -> String | nil
--- options -> Fixnum | nil
--- facility -> Fixnum | nil

最後のopenで与えられた対応する引数を返します。

使用例
  require 'syslog'

  Syslog.open("syslogtest")
  p Syslog.ident    #=> "syslogtest"
  p Syslog.options  #=> 3
  p Syslog.facility #=> 8

--- log(priority, format, *arg) -> self

syslogにメッセージを書き込みます。

priority は優先度を示す定数([[c:Syslog::Constants]]参照)。
また、facility([[c:Syslog::Constants]]参照)を論理和で指定す
ることで open で指定した facility を切替えることもできる。

format 以降は [[m:Kernel.#sprintf]] と同じ形式の引数を指定する。

但し、[[man:syslog(3)]] のように format に %m は使用できません。

メッセージに改行を含める必要はない。

@param priority priority は優先度を示す定数を指定します。
                詳しくは、[[c:Syslog::Constants]]を参照してください。

@param format フォーマット文字列です。

@param arg フォーマットされる引数です。

@raise ArgumentError 引数が２つ以上でない場合に発生します。

例:
  Syslog.open("syslogtest") {|syslog|
    syslog.log(Syslog::LOG_CRIT, "the sky is falling in %d seconds!", 10)
  }


--- emerg(message, *arg) -> self
--- alert(message, *arg) -> self
--- crit(message, *arg) -> self
--- err(message, *arg) -> self
--- warning(message, *arg) -> self
--- notice(message, *arg) -> self
--- info(message, *arg) -> self
--- debug(message, *arg) -> self

Syslog#log()のショートカットメソッド。
システムによっては定義されていないものもあります。

例えば、Syslog.emerg(message, *arg) は、Syslog.log(Syslog::LOG_EMERG, message, *arg)
と同じです。

@param message フォーマット文字列です。[[m:Kernel.#sprintf]] と同じ形式の引数を指定します。

@param arg フォーマットされる引数です。

@raise ArgumentError 引数が1つ以上でない場合に発生します。

@raise RuntimeError syslog がopen されていない場合発生します。

例:
  Syslog.open("syslogtest") {|syslog|
    syslog.crit("the sky is falling in %d seconds!",5)
  }

--- mask -> Fixnum | nil
--- mask=(mask)

ログの優先度のマスクを取得または設定する。
マスクは永続的であり、
Syslog.openやSyslog.close
ではリセットされない。

@param mask ログの優先度のマスクを設定します。

@raise RuntimeError syslog がオープンされていない場合、発生します。

使用例

  require 'syslog'
  include Syslog::Constants
  # ログの場所は実行環境によって異なる。詳しくはsyslog.conf を参照
  log = '/var/log/ftp.log'

  Syslog.open('ftpd', LOG_PID | LOG_NDELAY, LOG_FTP)
  Syslog.mask = Syslog::LOG_UPTO(LOG_ERR)

  [ LOG_CRIT, LOG_ERR, LOG_WARNING,
    LOG_NOTICE, LOG_INFO, LOG_DEBUG ].each_with_index { |c, i|
    Syslog.log(c, "test for syslog FTP #{c}, #{i}")
  }
  Syslog.close
  File.foreach(log){|line|
    print line if line =~ /FTP/
  } 

--- close -> nil

syslogを閉じます。

@raise RuntimeError syslog がopen されていない場合発生します。

使用例
  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  Syslog.close

--- instance -> self

selfを返す。(旧版との互換性のため)

--- LOG_MASK(priority) -> Fixnum

1つの優先度に対するマスクを作成する。

@param priority priority は優先度を示す定数を指定します。
                詳しくは、[[c:Syslog::Constants]]を参照してください。

例:
         Syslog.mask = Syslog::LOG_MASK(Syslog::LOG_ERR)

--- LOG_UPTO(priority) -> Fixnum

priorityまでのすべての優先度のマスクを作成する。

@param priority priority は優先度を示す定数を指定します。
                詳しくは、[[c:Syslog::Constants]]を参照してください。

例:
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_ERR)

= module Syslog::Constants


このモジュールにはシステムで使用可能なLOG_*定数が定義されている。

  例:
    require 'syslog'
    include Syslog::Constants


== Constants
--- LOG_PID
--- LOG_CONS
--- LOG_ODELAY
--- LOG_NDELAY
--- LOG_NOWAIT
--- LOG_PERROR

オプション(options)を示す定数。
定数 の詳細については [[man:syslog(3)]] を参照してください。

--- LOG_AUTH
--- LOG_AUTHPRIV
--- LOG_CONSOLE
--- LOG_CRON
--- LOG_DAEMON
--- LOG_FTP
--- LOG_KERN
--- LOG_LPR
--- LOG_MAIL
--- LOG_NEWS
--- LOG_NTP
--- LOG_SECURITY
--- LOG_SYSLOG
--- LOG_USER
--- LOG_UUCP
--- LOG_LOCAL0
--- LOG_LOCAL1
--- LOG_LOCAL2
--- LOG_LOCAL3
--- LOG_LOCAL4
--- LOG_LOCAL5
--- LOG_LOCAL6
--- LOG_LOCAL7

機能(facilities)を示す定数。

定数 の詳細については [[man:syslog(3)]] を参照してください。

--- LOG_EMERG
--- LOG_ALERT
--- LOG_CRIT
--- LOG_ERR
--- LOG_WARNING
--- LOG_NOTICE
--- LOG_INFO
--- LOG_DEBUG

優先度(priorities)を示す定数。
定数 の詳細については [[man:syslog(3)]] を参照してください。

#@end
