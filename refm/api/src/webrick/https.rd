#@since 1.8.1
require webrick/ssl

[[c:WEBrick::HTTPServer]] �� SSL/TLS ���б������뤿��μ�����
���Υե������ require ����� WEBrick::HTTPServer �� SSL/TLS �б��ˤʤ�ޤ���

= redefine WEBrick::Config

== Constants

--- HTTP
#@todo
[[m:WEBrick::Config::SSL]] �����Ƥ��ޡ�������ޤ���

= reopen WEBrick::HTTPRequest

== Instance Methods

--- cipher
#@todo

--- server_cert
#@todo

--- client_cert
#@todo

= redefine WEBrick::HTTPRequest

== Instance Methods

--- parse(socket = nil)
#@todo

--- parse_uri(str, scheme = "http")
#@todo

--- meta_vars
#@todo
#@end
