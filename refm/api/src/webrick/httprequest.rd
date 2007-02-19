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
#@todo
�ꥯ�����ȤΥإå��γ����������Ƥ�ʸ������֤���

#@since 1.8.2
--- accept
#@todo
Accept �إå������Ƥ�������֤���������ʼ�����(qvalue)�ǥ����Ȥ��줿��ǥ��������פ�ʸ���������

--- accept_charset
#@todo
Accept-Charset  �إå������Ƥ�������֤���������ʼ�����(qvalue)�ǥ����Ȥ��줿ʸ�����åȤ�ʸ���������

--- accept_encoding
#@todo
Accept-Encoding  �إå������Ƥ�������֤���������ʼ�����(qvalue)�ǥ����Ȥ��줿�����ǥ��󥰤�ʸ���������

--- accept_language
#@todo
Accept-Language  �إå������Ƥ�������֤���������ʼ�����(qvalue)�ǥ����Ȥ��줿���������ʸ���������
#@end

--- addr
#@todo
[[m:IPSocket#addr]]��Ʊ�͡�

--- attributes
#@todo

--- body
--- body { ... }
#@todo

#@since 1.8.2
--- content_length
#@todo
content-length ���������֤���

--- content_type
#@todo
content-type �إå���ʸ������֤���
#@end

--- cookies
#@todo
[[c:WEBrick::Cookie]] ��������֤���

--- each {|key, val| ... }
#@todo
�إå�̾�� key�����Ƥ� val �Ȥ��ƥ֥�å���ɾ�����ޤ���

--- fixup
#@todo

--- header
#@todo
�إå�̾�� key�����Ƥ� val �Ȥ���ϥå�����֤���key �� val ��ʸ����

--- host
#@todo
host ��ʸ������֤���

--- http_version
#@todo
[[c:WEBrick::HTTPVersion]] ���֥������Ȥ��֤���

--- keep_alive
--- keep_alive?
#@todo
Keep-Alive ���ɤ������֤���

--- meta_vars
#@todo

--- parse(socket = nil)
#@todo

--- parse_uri(str, scheme = "http")
#@todo

--- path
#@todo
path ��ʸ������֤���

--- path_info
--- path_info=(value)
#@todo
path ��Ʊ�͡�

--- peeraddr
#@todo
[[m:IPSocket#peeraddr]]��Ʊ�͡�

--- port
#@todo
�����ФΥݡ��Ȥ�ʸ������֤���

--- query
#@todo
�ϥå�����֤���key �� val �� unescape ����Ƥ��롣

--- query_string
#@since 1.8.4
--- query_string=(value)
#@todo
#@end
request_uri.query ��Ʊ�͡�

--- raw_header
#@todo

--- request_line
#@todo
���饤����ȤΥꥯ�����Ȥκǽ�ι�(GET / HTTP/1.1)��ʸ������֤���

--- request_method
#@todo
���饤����ȤΥꥯ�����Ȥ� HTTP �᥽�å�(GET, POST,...)��ʸ������֤���

--- request_time
#@todo
�ꥯ�����Ȥ��줿����� Time ���֥������Ȥ��֤���

--- request_uri
#@todo
[[c:URI]] ���֥������Ȥ��֤���

--- script_name
--- script_name=(value)
#@todo

--- to_s
#@todo

--- unparsed_uri
#@todo

--- user
--- user=(value)
#@todo

== Constants

--- BODY_CONTAINABLE_METHODS
#@todo

--- BUFSIZE
#@todo
