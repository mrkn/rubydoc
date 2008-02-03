require webrick/httputils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPServlet::HTTPServletError < StandardError
#@todo

= class WEBrick::HTTPServlet::AbstractServlet < Object

サーブレットの抽象クラスです。実装は AbstractServlet のサブクラスで行います。

サーブレットは以下のように使われます。[[c:WEBrick::HTTPServlet::CGIHandler]] は
[[lib:webrick/httpservlet/cgihandler]] で提供されているサーブレットです。
CGIHandler は AbstractServlet のサブクラスです。

 require 'webrick'
 srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
                                 :BindAddress => '127.0.0.1',
                                 :Port => 20080})
 srv.mount('/view.cgi', WEBrick::HTTPServlet::CGIHandler, 'view.rb')
 trap("INT"){ srv.shutdown }
 srv.start

上のスクリプトでは以下のような流れで view.rb は実行されます。

 (1) サーバのパス /view.cgi と CGIHandler がマウントにより結びつけられます。
 (2) パス /view.cgi にアクセスがあるたびにサーバ(WEBrick::HTTPServer オブジェクト)は 'view.rb' 
     を引数として CGIHandler オブジェクトを生成します。
 (3) サーバはリクエストオブジェクトを引数として CGIHandler#service メソッドを呼びます。
 (4) CGIHandler オブジェクトは view.rb を CGI スクリプトとして実行します。

このように [[c:WEBrick]] では Web サーバの機能の大部分がサーブレットの形で提供されています。
またサーブレットを作成することにより新たな機能を Web サーバに追加することもできます。

== Class Methods

--- new(server, *options)    -> WEBrick::HTTPServlet::AbstractServlet

サーブレットを生成して返します。
[[c:WEBrick::HTTPServer]] オブジェクトは server に自身を指定してサーブレットを生成します。

@param server サーブレットを生成する WEBrick::HTTPServer オブジェクトを指定します。

@param options [[m:WEBrick::HTTPServer#mount]] 第3引数以降に指定された値がそのまま与えられます。

--- get_instance(server, *options)    -> WEBrick::HTTPServlet::AbstractServlet

new(server, *options) を呼び出してサーブレットを生成して返します。
[[c:WEBrick::HTTPServer]] オブジェクトは実際にはこの get_instance メソッドを呼び出して
サーブレットを生成します。

特に理由が無い限り AbstractServlet のサブクラスがこのメソッドを再定義する必要はありません。

@param server [[m:WEBrick::HTTPServer#mount]] 第3引数以降に指定された値がそのまま与えられます。

@param options [[m:WEBrick::HTTPServer#mount]] 第3引数以降に指定された値がそのまま与えられます。

== Instance Methods

--- service(req, res)    -> ()

指定された [[c:WEBrick::HTTPRequest]] オブジェクト req の [[m:WEBrick::HTTPRequest#request_method]] に応じて、
自身の do_GET, do_HEAD, do_POST, do_OPTIONS... いずれかのメソッドを req と res を引数として呼びます。

[[m:WEBrick::HTTPServer]] オブジェクトはクライアントからのリクエストがあるたびに
サーブレットオブジェクトを生成し service メソッドを呼びます。

特に理由が無い限り AbstractServlet のサブクラスがこのメソッドを定義する必要はありません。

@param req クライアントからのリクエストを表す [[m:WEBrick::HTTPRequest]] オブジェクトです。

@param res クライアントへのレスポンスを表す [[m:WEBrick::HTTPResponse]] オブジェクトです。

@raise WEBrick::HTTPStatus::MethodNotAllowed 
       指定された [[c:WEBrick::HTTPRequest]] オブジェクト  req が自身に定義されていない 
       HTTP のメソッドであった場合発生します。


--- do_GET(req, res)        -> ()
--- do_HEAD(req, res)       -> ()
--- do_POST(req, res)       -> ()
--- do_PUT(req, res)        -> ()
--- do_DELETE(req, res)     -> ()
--- do_OPTIONS(req, res)    -> ()

自身の service メソッドから HTTP のリクエストに応じて
呼ばれるメソッドです。AbstractServlet のサブクラスはこれらのメソッドを適切に実装し
なければいけません。返り値は特に規定されていません。

クライアントが使う可能性のある RFC で定義された HTTP のメソッドはすべて実装する必要があります。
クライアントからのリクエストに使われないと分かっているメソッドは実装しなくてもかまいません。
実装されていない HTTP メソッドであった場合、自身の service メソッドが
例外を発生させます。

例:

  require 'webrick'
  class HogeServlet < WEBrick::HTTPServlet::AbstractServlet 
    def do_GET(req, res)
       res.body = 'hoge'
    end
  end

  srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
                                  :BindAddress => '127.0.0.1',
                                  :Port => 20080})
  srv.mount('/', HogeServlet)
  trap("INT"){ srv.shutdown }
  srv.start
