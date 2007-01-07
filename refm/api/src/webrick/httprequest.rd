#@#require timeout
#@#require uri
require webrick/httpversion
require webrick/httpstatus
require webrick/httputils
require webrick/cookie

= class WEBrick::HTTPRequest < Object

[[url:http://shogo.homelinux.org/~ysantoso/webrickguide/html/HTTPRequest.html]]

== Instance Methods

--- [](header_name)
リクエストのヘッダの該当する内容を文字列で返す。

#@since 1.8.2
--- accept
Accept ヘッダの内容を配列で返す。配列は品質係数(qvalue)でソートされたメディアタイプの文字列の配列。

--- accept_charset
Accept-Charset  ヘッダの内容を配列で返す。配列は品質係数(qvalue)でソートされた文字セットの文字列の配列。

--- accept_encoding
Accept-Encoding  ヘッダの内容を配列で返す。配列は品質係数(qvalue)でソートされたコーディングの文字列の配列。

--- accept_language
Accept-Language  ヘッダの内容を配列で返す。配列は品質係数(qvalue)でソートされた自然言語の文字列の配列。
#@end

--- addr
[[m:IPSocket#addr]]と同様。

--- attributes

--- body
--- body { ... }

#@since 1.8.2
--- content_length
content-length を整数で返す。

--- content_type
content-type ヘッダを文字列で返す。
#@end

--- cookies
[[c:WEBrick::Cookie]] の配列を返す。

--- each {|key, val| ... }
ヘッダ名を key、内容を val としてブロックを評価します。

--- fixup

--- header
ヘッダ名を key、内容を val とするハッシュを返す。key も val も文字列。

--- host
host を文字列で返す。

--- http_version
[[c:WEBrick::HTTPVersion]] オブジェクトを返す。

--- keep_alive
--- keep_alive?
Keep-Alive かどうかを返す。

--- meta_vars

--- parse(socket = nil)

--- parse_uri(str, scheme = "http")

--- path
path を文字列で返す。

--- path_info
--- path_info=(value)
path と同値。

--- peeraddr
[[m:IPSocket#peeraddr]]と同様。

--- port
サーバのポートを文字列で返す。

--- query
ハッシュを返す。key も val も unescape されている。

--- query_string
#@since 1.8.4
--- query_string=(value)
#@end
request_uri.query と同値。

--- raw_header

--- request_line
クライアントのリクエストの最初の行(GET / HTTP/1.1)を文字列で返す。

--- request_method
クライアントのリクエストの HTTP メソッド(GET, POST,...)を文字列で返す。

--- request_time
リクエストされた時刻を Time オブジェクトで返す。

--- request_uri
[[c:URI]] オブジェクトを返す。

--- script_name
--- script_name=(value)

--- to_s

--- unparsed_uri

--- user
--- user=(value)

== Constants

--- BODY_CONTAINABLE_METHODS

--- BUFSIZE
