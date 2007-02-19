require webrick/version
require webrick/httpversion
require webrick/httputils
require webrick/utils
require webrick/log

= module WEBrick::Config

== Constants

--- General
#@todo

GenericServer.new(config) に与えた時に有効な設定とそのデフォルト値。

[[url:http:#/shogo.homelinux.org/~ysantoso/webrickguide/html/Server_Configuration.html]]

  WEBrick::Config::General = {
    :ServerName     => Utils.getservername,
    :BindAddress    => nil,   # "0.0.0.0" or "::" or nil
    :Port           => nil,   # users MUST specifiy this!!
    :MaxClients     => 100,   # maximum number of the concurrent connections
    :ServerType     => nil,   # default: WEBrick::SimpleServer
    :Logger         => nil,   # default: WEBrick::Log.new
    :ServerSoftware => "WEBrick/#{WEBrick::VERSION} " +
                       "(Ruby/#{RUBY_VERSION}/#{RUBY_RELEASE_DATE})",
    :TempDir        => ENV['TMPDIR']||ENV['TMP']||ENV['TEMP']||'/tmp',
    :DoNotListen    => false,
    :StartCallback  => nil,
    :StopCallback   => nil,
    :AcceptCallback => nil,
    :DoNotReverseLookup => nil,
  }

: :ServerName
サーバのホスト名を表す文字列。デフォルトの Utils.getservername は /etc/hostname
に書かれている文字列を設定する。

: :BindAddress
サーバのアドレスを指定する。デフォルトの nil や "0.0.0.0", "::" などを指定した
場合は使用可能なすべてのネットワークインターフェースに対して listen を開始する。
[[m:socket#ホスト指定形式]]を参照。

: :Port
サーバのポートを指定する。[[m:socket#サービス指定形式]]を参照。

: :MaxClients
クライアントの最大接続数を表す整数。

: :ServerType
[[unknown:執筆者募集]]

: :Logger
ログをとるオブジェクト。Logger オブジェクトに定義されているべきメソッドに関しては
[[c:WEBrick::Log]] を参照。一般的には WEBrick::Log.new(log_file, level) と
log_file と level を設定し直すだけで十分。

: :DoNotListen
true の場合、GenericServer オブジェクトを生成しただけでは listen を開始しない。

: :StartCallback
start 開始時に呼ばれる [[c:Proc]] オブジェクト。呼ばれる時に引数は
特に与えられない。

: :StopCallback
サーバを stop した時に呼ばれる [[c:Proc]] オブジェクト。呼ばれる時に引数は
特に与えられない。

: :AcceptCallback
クライアントからの接続を accept したときに呼ばれる [[c:Proc]] オブジェクト。
クライアントと接続された [[c:TCPSocket]] オブジェクトを引数として呼ばれる。

: :DoNotReverseLookup
true の場合、ホスト名への逆引きを行わなくなる。
[[m:BasicSocket#do_not_reverse_lookup]]
も参照。

--- HTTP
#@todo

--- FileHandler
#@todo

--- BasicAuth
#@todo

--- DigestAuth
#@todo

--- LIBDIR
#@todo
