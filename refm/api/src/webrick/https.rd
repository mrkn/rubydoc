#@since 1.8.1
require webrick/ssl

[[c:WEBrick::HTTPServer]] �� SSL/TLS ���б������뤿��μ�����
���Υե������ require ����� WEBrick::HTTPServer �� SSL/TLS �б��ˤʤ�ޤ���

= redefine WEBrick::Config

== Constants

--- HTTP
[[m:WEBrick::Config::SSL]] �����Ƥ��ޡ�������ޤ���

= reopen WEBrick::HTTPRequest

== Instance Methods

--- cipher

--- server_cert

--- client_cert

= redefine WEBrick::HTTPRequest

== Instance Methods

--- parse(socket = nil)

--- parse_uri(str, scheme = "http")

--- meta_vars
#@end
