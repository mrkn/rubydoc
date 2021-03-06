require webrick/httpauth/userdb
require webrick/httpauth/digestauth
#@#require tempfile

= class WEBrick::HTTPAuth::Htdigest < Object
include WEBrick::HTTPAuth::UserDB

Apache の htdigest 互換のクラス。

例

 require 'webrick'
 include WEBrick
 htd = HTTPAuth::Htdigest.new('dot.htdigest')
 htd.set_passwd('realm', 'username', 'supersecretpass')
 htd.flush
 htd2 = HTTPAuth::Htdigest.new('dot.htdigest')
 p htd2.get_passwd('realm', 'username', false) == '65fe03e5b0a199462186848cc7fda42b'

== Class Methods

--- new(path)
#@todo
Htdigest オブジェクトを生成する。.htdigest ファイルのパスを path で与える。

== Instance Methods

--- delete_passwd(realm, user)
#@todo
realm に属するユーザ user のパスワードを削除する。

--- each{|user, realm, pass| ...}
#@todo
各ユーザ、realm とパスワードに関してブロックを評価する。

--- flush(path=nil)
#@todo
ファイルに書き込む。ファイル名 path を与えた場合は、path に書き込む。

--- get_passwd(realm, user, reload_db)
#@todo
realm からユーザのパスワードの MD5 ハッシュ値を取得し文字列として返す。
reload_db が true の場合、reload を呼んでからハッシュ値を返す。

--- reload
#@todo
ファイルから再度読み込む。

--- set_passwd(realm, user, pass)
#@todo
realm に対応させてユーザ user とパスワード pass を保存する。
