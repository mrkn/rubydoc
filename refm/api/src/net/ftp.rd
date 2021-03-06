FTP プロトコルを扱うライブラリです。

基本的には  unix の ftp コマンドのような
command-line interface の FTP クライアントを使ったことのある
人にとってわかりやすいインターフェースになっています。
より「Ruby 的」であるインターフェースも用意しています。

FTP については [[RFC:959]]、[[RFC:3659]] を参考にしてください。

=== バイナリモードとテキストモード
FTP のデータ転送にはテキストモードとバイナリモード
があります。テキストモードで転送する場合には
改行を適宜CRLFに変換します。バイナリモードの場合は
一切の変換をしません。

通常はバイナリモード以外を使う必要はないでしょう。

[[m:Net::FTP#get]]、[[m:Net::FTP#put]] は
[[m:Net::FTP#binary]] の値に従ってテキストモードと
バイナリモードの一方を選びます。また、
[[m:Net::FTP#getbinaryfile]]、[[m:Net::FTP#putbinaryfile]]
は [[m:Net::FTP#binary]] の値によらずバイナリモードで、
[[m:Net::FTP#gettextfile]]、[[m:Net::FTP#puttextfile]] は
[[m:Net::FTP#binary]] の値によらずテキストモードで
データ転送が行われます。

=== パッシブモードとアクティブモード
FTP はファイル転送やディレクトリ情報取得のための
データ転送用の TCP コネクションを、
サーバとの制御コマンドをやりとり
するためのコネクションとは別に作成します。

このデータ転送用コネクションを作成する際に、
アクティブモードでは
サーバ側からクライアント側へコネクションを作り、
パッシブモードでは
クライアント側からサーバ側へコネクションを作ます。

そのため、アクティブモードではサーバ-クライアント間に
ファイアーウォールや NAT がある場合にはうまく接続できない
場合があります。この時にはパッシブモードを利用してください。

=== 例

例1:
  require 'net/ftp'
  ftp = Net::FTP.new('ftp.example.org')
  ftp.login
  ftp.passive = true
  ftp.chdir('pub/ruby')
  files = ftp.list('ruby*')
  ftp.getbinaryfile('ruby-1.9.1-p243.tar.bz2', 'ruby.bz2', 1024)
  ftp.close

例2:
  require 'net/ftp'
  Net::FTP.open('ftp.example.org') do |ftp|
    ftp.login
    ftp.passive = true
    ftp.chdir('pub/ruby')
    files = ftp.list('*.bz2')
    ftp.getbinaryfile('ruby-1.9.1-p243.tar.bz2', 'ruby.bz2', 1024)
  end

= class Net::FTP < Object
FTP を実装したクラスです。


== Class Methods

--- new(host = nil, user = nil, passwd = nil, acct = nil) -> Net::FTP

新しい Net::FTP のインスタンスを生成します。

host が指定された場合、生成されたインスタンスに対して 
[[m:Net::FTP#connect]] を呼び出し、
さらに user が指定された場合は [[m:Net::FTP#login]] 
を呼び出します。

@param host 接続するホストを指定します。
@param user ログインに使うユーザ名を指定します。
@param passwd ログインに使うパスワードを指定します。
@param acct ログイン後に送る ACCT コマンドのパラメータを指定します。

@see [[m:Net::FTP.open]]

--- open(host, user = nil, passwd = nil, acct = nil) -> Net::FTP
--- open(host, user = nil, passwd = nil, acct = nil){|ftp| ... } -> object

新しい Net::FTP インスタンスを生成します。

[[m:Net::FTP.new]] と異なり host を省略できません。

ブロックを与えた場合には、生成したインスタンスを
ブロックに渡して呼びだします。この場合、ブロック終了時に
[[m:Net::FTP#close]] を呼びだし、ブロックの値を
返します。

ブロックを与えなかった場合には生成したインスタンスを返します。

user が指定された場合は [[m:Net::FTP#login]] 
を呼び出します。

@param host 接続するホストを指定します。
@param user ログインに使うユーザ名を指定します。
@param passwd ログインに使うパスワードを指定します。
@param acct ログイン後に送る ACCT コマンドのパラメータを指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

== Instance Methods

--- connect(host, port = FTP_PORT) -> ()

host で指定されたホストに接続します。

環境変数 SOCK_SERVER が指定されている場合、SOCKS プロクシを
経由して接続します。

@param host 接続するホスト名です。
@param port 接続するポート番号です。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- sendcmd(cmd) -> String
cmd で指定されたコマンドをサーバーに送り、
サーバーからの応答を返します。

@param cmd コマンドを文字列で指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。


--- voidcmd(cmd) -> nil
cmd で指定されたコマンドをサーバーに送ります。

@param cmd コマンドを文字列で指定します。

@raise Net::FTPReplyError 応答コードが 2yz 以外の場合に発生します。

--- login(user = "anonymous", passwd = nil, acct = nil) -> ()
ホストへのログイン処理を行ないます。

このメソッドはホストへの接続後にしか使えません。

user, passwd が省略された場合、ユーザ名
"anonymous", パスワード user@host となります。

acct を省略しなかった場合には、 ACCT コマンドを
acct で指定したパラメータで送ります。

@param user ログインに使うユーザ名を指定します。
@param passwd ログインに使うパスワードを指定します。
@param acct ログイン後に送る ACCT コマンドのパラメータを指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- retrbinary(cmd, blocksize, rest_offset = nil) -> nil
--- retrbinary(cmd, blocksize, rest_offset = nil){|data| ...} -> nil

サーバーに cmd で指定されたコマンドを送り、バイナリデータを 
取り寄せます。

blocksize で指定されたバイト単位でデータを
読み込み、ブロックに渡します。

rest_offset が省略されなかった場合は、cmdを送る前に
REST コマンドを送り、指定したバイト数の位置から
転送を開始します。

@param cmd コマンドを文字列で与えます。
@param blocksize 読み込み単位をバイト単位で与えます。
@param rest_offset REST コマンドに与えるオフセットを与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

@see [[m:Net::FTP#getbinaryfile]]

--- retrlines(cmd){|line| ...} -> nil
サーバーに cmd で指定されたコマンドを送り、テキストデータを 
取り寄せます。

一行づつテキストを読み込み、ブロックに渡します。

@param cmd コマンドを文字列で与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

@see [[m:Net::FTP#gettextfile]]

--- storbinary(cmd, file, blocksize, rest_offset = nil) -> nil
--- storbinary(cmd, file, blocksize, rest_offset = nil){|data| ...} -> nil
サーバーに cmd で指定されたコマンドを送り、バイナリデータを 
送ります。

送るデータは [[c:IO]] のインスタンスを
file で指定します。
(実際には [[c:StringIO]] のような IO とメソッドレベルで
互換するオブジェクトであればなんでもかまいません)。

blocksize で指定されたバイト単位で file からデータを読みこみ、
サーバに送ります。

rest_offset が省略されなかった場合は、cmdを送る前に
REST コマンドを送り、指定したバイト数の位置から
転送を開始します。

ブロックが指定された場合には、転送するデータを blocksize ごとに
ブロックにも渡します。

@param cmd コマンドを文字列で与えます。
@param file 送るデータを与えます。
@param blocksize 読み込み単位をバイト単位で与えます。
@param rest_offset REST コマンドに与えるオフセットを与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

@see [[m:Net::FTP#putbinaryfile]]

--- storlines(cmd, file) -> nil
--- storlines(cmd, file){|line| ...} -> nil
サーバーに cmd で指定されたコマンドを送り、テキストデータを
送ります。

一行づつで file からテキストを読み込み、サーバーに送ります。

送るデータは [[c:IO]] のインスタンスを
file で指定します。
(実際には [[c:StringIO]] のような IO とメソッドレベルで
互換するオブジェクトであればなんでもかまいません)。

ブロックが与えられた場合には各行をそのブロックに渡します。

@param cmd コマンドを文字列で与えます。
@param file 送るデータを与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

@see [[m:Net::FTP#puttextfile]]

--- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE){|data| ...} -> nil
--- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil

サーバ上のファイルをバイナリモードで取得します。

サーバー上にある remotefile という名前のファイルを取得し、
ローカルの localfile という名前のファイルに保存します。

localfile が nil である場合には保存はしません。

データの転送は blocksize バイト毎に行なわれます。

ブロックが指定された場合は
データを blocksize バイト受信するごとに、そのデータを
ブロックに渡します。

@param remotefile 取得対象のリモートのファイル名を与えます。
@param localfile 取得したデータを格納するローカルのファイル名を与えます。
@param blocksize データ転送の単位をバイト単位で与えます。


@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- gettextfile(remotefile, localfile = File.basename(remotefile)) -> nil
--- gettextfile(remotefile, localfile = File.basename(remotefile)){|line| ...} -> nil

サーバ上のファイルをテキストモードで取得します。

サーバー上にある remotefile という名前のファイルを取得し、
ローカルの localfile という名前のファイルに保存します。

localfile が nil である場合には保存はしません。

ブロックが指定された場合は
データを1行受信するごとに、その行をブロックに渡します。

@param remotefile 取得対象のリモートのファイル名を与えます。
@param localfile 取得したデータを格納するローカルのファイル名を与えます。


@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) {|data| ...} -> nil

サーバにファイルをバイナリモードで転送します。

ローカルの localfile という名前のファイルを読みだし、
サーバー上の remotefile という名前のファイルに保存します。

データの転送は blocksize バイト毎に行なわれます。

ブロックが指定された場合は
データを blocksize バイト転送するごとに、そのデータを
ブロックに渡します。

@param localfile 転送するローカルのファイル名を与えます。
@param remotefile 転送データを保存するリモートのファイル名を与えます。
@param blocksize データ転送の単位をバイト単位で与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- puttextfile(localfile, remotefile = File.basename(localfile)) -> nil
--- puttextfile(localfile, remotefile = File.basename(localfile)) {|line| ... } -> nil
サーバにファイルをテキストモードで転送します。

ローカルの localfile という名前のファイルを読みだし、
サーバー上の remotefile という名前のファイルに保存します。

ブロックが指定された場合は
データを1行転送するごとに、その行を
ブロックに渡します。

@param localfile 転送するローカルのファイル名を与えます。
@param remotefile 転送データを保存するリモートのファイル名を与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- acct(account) -> nil

サーバーに ACCT コマンドでアカウント情報を送ります。

@param account 送りたいアカウント情報を文字列で与えます。

@raise Net::FTPReplyError 応答コードが2yzでない場合に発生します。

--- nlst(dir = nil) -> [String]

dir で指定したディレクトリのファイルの配列を返します。

dir を省略した場合カレントディレクトリが指定されます。

@param dir ディレクトリを文字列で指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- list(*args) -> [String]
--- list(*args) {|line| ... } -> nil
--- ls(*args) -> [String] 
--- ls(*args) {|line| ... } -> nil
--- dir(*args) -> [String]
--- dir(*args) {|line| ...} -> nil

LIST コマンドを送信し、結果を返します。

ブロックとともに呼び出された場合は各行に対してブロックを
実行します。ブロックなしの場合には文字列の配列で結果を返します。

@param args LIST の引数を文字列で渡します。複数渡すことができます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。

--- rename(fromname, toname) -> nil
ファイルをリネームします。

リモートサーバ上の fromname という名前のファイルを
toname という名前に変更します。

@param fromname 変更前のファイル名を与えます。
@param toname 変更後のファイル名を与えます。

@raise Net::FTPReplyError 応答コードが正しくない場合に発生します。リネームに失敗した場合に発生します。

--- delete(filename) -> nil
ファイルを削除します。

リモートサーバ上の fromname という名前のファイルを削除します。

削除に失敗した場合には 例外が発生します。

@param filename 削除するファイルの名前を与えます。

@raise Net::FTPPermError 応答コードが 5yz であった場合に発生します。
@raise Net::FTPReplyError 応答コードが 5yz 以外で正しくない場合に発生します。

--- chdir(dirname) -> nil
リモートサーバでのカレントディレクトリを dirname に変更します。

@param dirname 変更先のディレクトリを与えます。
@raise Net::FTPReplyError 応答コードがエラーである場合に発生します。カレントディレクトリ変更に失敗した場合に発生します。

--- size(filename) -> Integer
リモートサーバ上のファイルのサイズを返します。

@param filename サイズを調べたいファイル名を与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。

--- mtime(filename, local = false) -> Time

filename の更新時刻を Time オブジェクトで返します。

local を真とすると、得られた更新時刻を地方時とみなします。
偽の場合は更新時刻を協定世界時とみなします。

@param filename 更新時刻を得たいファイルの名前を文字列で与えます。
@param local 返り値の時刻を地方時とみなすかどうかを真偽値で与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。

--- mkdir(dirname) -> String
リモートサーバ上にディレクトリを作成します。

作成に失敗した場合には例外が発生します。

@param dirname 作成するディレクトリ名を文字列で指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。

--- rmdir(dirname) -> nil
リモートサーバ上のディレクトリを削除します。

@param dirname 削除するディレクトリ名を文字列で指定します。

@raise Net::FTPReplyError 応答コードが正しくない場合に発生します。削除に失敗した場合に発生します。

--- pwd -> String
--- getdir -> String
カレントディレクトリを返します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。

--- system -> String
サーバーの OS のタイプを返します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。

--- abort -> String
データの転送を中止します。

@return サーバからの応答を文字列で返します。

@raise Net::FTPReplyError 応答コードが正しくない場合に発生します。

--- status -> String
現在の状態を返します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。

--- mdtm(filename) -> String
MDTM コマンドを送信し、結果を返します。

@param filename コマンドを発行したいファイル名を文字列で指定します。
@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。

--- passive -> bool
passive モードであるならば真を、そうでなければ
偽を返します。

デフォルトは偽です。

@see [[m:Net::FTP#passive=]]
--- passive=(bool)
passive モードを設定します。

@see [[m:Net::FTP#passive]]

--- return_code -> String
このメソッドは obsolete です。使わないでください。

"\n" を返します。

--- return_code=(string)
このメソッドは obsolete です。使わないでください。

--- lastresp -> String
--- last_response_code -> String

サーバからの最後の応答のコードを文字列で返します。

例えばログイン([[m:Net::FTP#login]])に成功した場合には
"230" を返します。

数字の意味は [[rfc:959]] 参照してください。

@see [[m:Net::FTP#last_response]]
--- last_response -> String
サーバからの最後の応答を文字列で返します。

例えばログイン([[m:Net::FTP#login]])に成功した場合には
"230 Login successful.\n" を返します。

@see [[m:Net::FTP#last_response_code]]
--- welcome -> String
サーバのウェルカムメッセージを返します。

このメッセージはログイン([[m:Net::FTP#login]])時に
サーバから送られます。

--- help(arg = nil) -> String
サーバからの help 情報を返します。

@param arg HELP コマンドのパラメータを指定します。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。

--- quit -> nil
FTP のセッションからログアウトします。

--- close -> ()
サーバとの接続を切ります。

再び [[m:Net::FTP#connect]] で接続しない限り
一切の操作が不可能になります。

--- closed? -> bool
接続が切れている時に真を返します。

--- resume -> bool
現在のリジュームモードの状態を返します。

リジュームモードが有効であるならば、
いくつかの転送メソッドにおいて
転送が中断され不完全な転送しかできなかった場合に
再開が可能になります。

デフォルトは false です。

転送の中断と再開が可能なのは以下のメソッドです。
  * [[m:Net::FTP#get]]
  * [[m:Net::FTP#put]]
  * [[m:Net::FTP#getbinaryfile]]
  * [[m:Net::FTP#putbinaryfile]]

転送が中断したかどうかは転送先に問題のファイルが存在するか
どうかで判定され、そのファイルサイズで再開する位置を
決めます。

@see [[m:Net::FTP#resume=]]
#@# リジュームモードとは途中で中断された
#@# データ転送を再開するためのものです。デフォルトの値は false です。
#@# この値が真であるとき、いくつかの転送メソッドは事前に REST コマンドを
#@# 発行することによって転送元と転送元のオフセットをセットします。
#@# これにより、すでに転送されたデータは転送されなくなります。
#@# 具体的には以下のメソッドが影響を受けます。

#@# getbinaryfile はローカルファイルのサイズをオフセットとします。

#@# putbinaryfile はリモートファイルのサイズをオフセットとします。

--- resume=(boolean)
現在のリジュームモードを設定します。

@param boolean trueならばリジュームモードを on にします。
@see [[m:Net::FTP#resume]]

--- debug_mode -> bool
デバッグモードであれば真を、そうでなければ偽を返します。

値が真であるとき、送受信の記録と ABOR, STAT の結果が
[[m:$stdout]] に随時表示されます。

デフォルトは偽です。
@see [[m:Net::FTP#debug_mode=]]

--- debug_mode=(boolean)

デバッグモードの on/off を設定します。

@param boolean 真ならばデバッグモードを on にします。
@see [[m:Net::FTP#debug_mode]]

--- set_socket(sock, get_greeting = true) -> nil
FTP のコントロール接続の
ソケットを TCPSocket オブジェクト sock に設定します。

get_greeting に偽が与えられると、
set_socket は通信先を設定するだけで sock に対する操作を
何も行ないません。
get_greeting が真ならば、通信先を sock に
設定したあと、通常FTPサーバが接続時に送ってくるメッセージを読み込みます。

通常このメソッドは使うべきではありません。このライブラリの
実装を理解した上で必要な場合のみ利用してください。

@param sock コントロール接続に使うソケットを指定します。
@param get_greeting ソケットを設定した後接続時メッセージをソケットから読みこむかどうかを指定します。

--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil

サーバ上のファイルを取得します。

[[m:Net::FTP#binary]] の値に従って
[[m:Net::FTP#getbinaryfile]] もしくは
[[m:Net::FTP#gettextfile]] を呼びだします。

binary が偽のとき、つまりテキストモードの
ときには blocksize は無視されます。

@param remotefile 取得対象のリモートのファイル名を与えます。
@param localfile 取得したデータを格納するローカルのファイル名を与えます。
@param blocksize データ転送の単位をバイト単位で与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。


--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil

サーバへファイルを転送します。

[[m:Net::FTP#binary]] の値に従って
[[m:Net::FTP#putbinaryfile]] もしくは
[[m:Net::FTP#puttextfile]] を呼びだします。

binary が偽のとき、つまりテキストモードの
ときには blocksize は無視されます。

@param localfile 転送するローカルのファイル名を与えます。
@param remotefile 転送データを保存するリモートのファイル名を与えます。
@param blocksize データ転送の単位をバイト単位で与えます。

@raise Net::FTPTempError 応答コードが 4yz のときに発生します。
@raise Net::FTPPermError 応答コードが 5yz のときに発生します。
@raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
@raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。

--- binary -> bool
[[m:Net::FTP#put]], [[m:Net::FTP#get]] による転送を
バイナリモード(IMAGE)で行うかどうかを返します。

デフォルトの値は true です。

偽の場合、テキストモード(ASCII)が仮定されます。

EBCDIC や LOCAL など他の表現タイプはサポートされていません。

@see [[m:Net::FTP#binary=]]
--- binary=(bool)
[[m:Net::FTP#put]], [[m:Net::FTP#get]] による転送を
バイナリモード(IMAGE)で転送するかどうかを指定します。

デフォルトの値は true です。

偽の場合、テキストモード(ASCII)が仮定されます。

EBCDIC や LOCAL など他の表現タイプはサポートされていません。

@param bool 真ならばバイナリモードを on にします。
@see [[m:Net::FTP#binary]]

--- noop -> nil
NOOP コマンドを発行します。

サーバから応答が得られる他は何もしません。

@raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。

--- site(arg) -> nil
SITE コマンドを発行します。

@param arg SITEコマンドのパラメータを指定します。

@raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。

== Constants

#@# --- CRLF
#@# nodoc

--- DEFAULT_BLOCKSIZE -> Integer
get, put をするときのデフォルトのブロックサイズです。

--- FTP_PORT -> Integer
FTPのデフォルトのポート番号(21)です。

#@# --- MDTM_REGEXP
#@# nodoc

#@since 1.9.2
= class Net::FTP::NullSocket < Object

全てのメソッド呼び出しに対して [[c:Net::FTPConnectionError]] を発生させます。
#@end

= class Net::FTPError < StandardError
net/ftp ライブラリ関連のエラー全般を表す例外クラスです。

サーバの応答コードがエラーを示している場合に発生します。

例外発生の原因となったサーバ応答は [[m:Exception#message]]
から得られます。

= class Net::FTPReplyError < Net::FTPError
FTPの応答が 1yz や 3yz であり、それが
想定外であることを表わす例外クラスです。

= class Net::FTPTempError < Net::FTPError
FTP の応答コード 4yz 
(Transient Negative Completion reply)
を表す例外クラスです。

詳しくは [[RFC:959]] を参照してください。

= class Net::FTPPermError < Net::FTPError
FTP の応答コード 5yz 
(Permanent Negative Completion reply)
を表す例外クラスです。

詳しくは [[RFC:959]] を参照してください。

= class Net::FTPProtoError < Net::FTPError
サーバの応答が FTP のプロトコルに沿っていない場合に
発生する例外のクラスです。
