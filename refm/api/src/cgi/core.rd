#@since 1.9.1
cgi �饤�֥��Υ�����ǽ���󶡤���饤�֥��Ǥ���
#@end

= class CGI < Object
include CGI::QueryExtension

CGI ������ץȤ�񤯤����ɬ�פʵ�ǽ���󶡤��륯�饹�Ǥ���

== Class Methods
--- parse(query) -> Hash

Ϳ����줿������ʸ�����ѡ������ޤ���

@param query ������ʸ�������ꤷ�ޤ���

�㡧
        require "cgi"

        params = CGI.parse("query_string")
          # {"name1" => ["value1", "value2", ...],
          #  "name2" => ["value1", "value2", ...], ... }
#@# module QueryExtension �ɤ�����
#@until 1.9.1
#@include(util.rd)
#@end
== Instance Methods

--- header(options = "text/html") -> String

HTTP �إå��� options �˽��ä��������ޤ��� [[m:CGI#out]] �Ȱ㤤��ɸ����ϤˤϽ��Ϥ��ޤ���
[[m:CGI#out]] ��Ȥ鷺�˼��Ϥ� HTML ����Ϥ��������ʤɤ˻Ȥ��ޤ���
���Υ᥽�åɤ�ʸ���󥨥󥳡��ǥ��󥰤��Ѵ����ޤ���

�إå��Υ����Ȥ��Ƥϰʲ������Ѳ�ǽ�Ǥ���

: type
  Content-Type �إå��Ǥ����ǥե���Ȥ� "text/html" �Ǥ���
: charset
  �ܥǥ��Υ���饯�����åȤ� Content-Type �إå����ɲä��ޤ���
: nph
  �����ͤ���ꤷ�ޤ������ʤ�С�HTTP �ΥС�����󡢥��ơ����������ɡ�
  Date �إå��򥻥åȤ��ޤ����ޤ� Server �� Connection �γƥإå��ˤ�ǥե�����ͤ򥻥åȤ��ޤ���
  ������ꤹ����ϡ��������ͤ�����Ū�˥��åȤ��Ƥ���������
: status
  HTTP �Υ��ơ����������ɤ���ꤷ�ޤ���
  ���Υꥹ�Ȥβ������Ѳ�ǽ�ʥ��ơ����������ɤΥꥹ�Ȥ�����ޤ���
: server
  �����Х��եȥ�������̾�λ��ꤷ�ޤ���Server �إå����б����ޤ���
: connection
  ��³�μ������ꤷ�ޤ���Connection �إå����б����ޤ���
: length
  �������륳��ƥ�Ĥ�Ĺ������ꤷ�ޤ���Content-Length �إå����б����ޤ���
: language
  �������륳��ƥ�Ĥθ������ꤷ�ޤ���Content-Language �إå����б����ޤ���
: expires
  �������륳��ƥ�Ĥ�ͭ�����¤� [[c:Time]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���
  Expires �إå����б����ޤ���
: cookie
  ���å����Ȥ���ʸ���� [[c:CGI::Cookie]] �Υ��󥹥��󥹡��ޤ��Ϥ��������󤫥ϥå������ꤷ�ޤ���
  ��İʾ�� Set-Cookie �إå����б����ޤ���

status �ѥ�᡼���ˤϰʲ���ʸ���󤬻Ȥ��ޤ���

        "OK"                  --> "200 OK"
        "PARTIAL_CONTENT"     --> "206 Partial Content"
        "MULTIPLE_CHOICES"    --> "300 Multiple Choices"
        "MOVED"               --> "301 Moved Permanently"
        "REDIRECT"            --> "302 Found"
        "NOT_MODIFIED"        --> "304 Not Modified"
        "BAD_REQUEST"         --> "400 Bad Request"
        "AUTH_REQUIRED"       --> "401 Authorization Required"
        "FORBIDDEN"           --> "403 Forbidden"
        "NOT_FOUND"           --> "404 Not Found"
        "METHOD_NOT_ALLOWED"  --> "405 Method Not Allowed"
        "NOT_ACCEPTABLE"      --> "406 Not Acceptable"
        "LENGTH_REQUIRED"     --> "411 Length Required"
        "PRECONDITION_FAILED" --> "412 Rrecondition Failed"
        "SERVER_ERROR"        --> "500 Internal Server Error"
        "NOT_IMPLEMENTED"     --> "501 Method Not Implemented"
        "BAD_GATEWAY"         --> "502 Bad Gateway"
        "VARIANT_ALSO_VARIES" --> "506 Variant Also Negotiates"

@param options [[c:Hash]] ��ʸ����� HTTP �إå����������뤿��ξ������ꤷ�ޤ���

�㡧
        header
          # Content-Type: text/html

        header("text/plain")
          # Content-Type: text/plain

        header({"nph"        => true,
                "status"     => "OK",  # == "200 OK"
                  # "status"     => "200 GOOD",
                "server"     => ENV['SERVER_SOFTWARE'],
                "connection" => "close",
                "type"       => "text/html",
                "charset"    => "iso-2022-jp",
                  # Content-Type: text/html; charset=iso-2022-jp
                "language"   => "ja",
                "expires"    => Time.now + 30,
                "cookie"     => [cookie1, cookie2],
                "my_header1" => "my_value"
                "my_header2" => "my_value"})

�㡧
        cgi = CGI.new('html3')
        print cgi.header({"charset" => "shift_jis", "status" => "OK"})
        print "<html><head><title>TITLE</title></head>\r\n"
        print "<body>BODY</body></html>\r\n"

@see [[ruby-list:35911]]

--- out(options = "text/html") { .... }

HTTP �إå��ȡ��֥�å���Ϳ����줿ʸ�����ɸ����Ϥ˽��Ϥ��ޤ���

HEAD�ꥯ������ (REQUEST_METHOD == "HEAD") �ξ��� HTTP �إå��Τߤ���Ϥ��ޤ���

charset �� "iso-2022-jp"��"euc-jp"��"shift_jis" �Τ����줫��
�������ʸ���󥨥󥳡��ǥ��󥰤�ư�Ѵ�����language �� "ja"�ˤ��ޤ���

@param options [[c:Hash]] ��ʸ����� HTTP �إå����������뤿��ξ������ꤷ�ޤ���

�㡧
        cgi = CGI.new
        cgi.out{ "string" }
          # Content-Type: text/html
          # Content-Length: 6
          #
          # string

        cgi.out("text/plain"){ "string" }
          # Content-Type: text/plain
          # Content-Length: 6
          #
          # string

        cgi.out({"nph"        => true,
                 "status"     => "OK",  # == "200 OK"
                 "server"     => ENV['SERVER_SOFTWARE'],
                 "connection" => "close",
                 "type"       => "text/html",
                 "charset"    => "iso-2022-jp",
                   # Content-Type: text/html; charset=iso-2022-jp
                 "language"   => "ja",
                 "expires"    => Time.now + (3600 * 24 * 30),
                 "cookie"     => [cookie1, cookie2],
                 "my_header1" => "my_value",
                 "my_header2" => "my_value"}){ "string" }

@see [[m:CGI#header]]

--- print(*strings)
#@todo

������ʸ�����ɸ����Ϥ˽��Ϥ��ޤ���
cgi.print �� $DEFAULT_OUTPUT.print �������Ǥ���

�㡧
       cgi = CGI.new
       cgi.print "This line is a part of content body.\r\n"

== Constants

--- CR -> String

�����å��꥿�����ɽ��ʸ����Ǥ���

--- LF -> String

�饤��ե����ɤ�ɽ��ʸ����Ǥ���

--- EOL -> String

����ʸ���Ǥ���

#@# --- REVISION -> String
#@# nodoc

--- NEEDS_BINMODE -> bool

�ե�����򳫤��Ȥ��˥Х��ʥ�⡼�ɤ�ɬ�פ��ɤ�����ɽ������Ǥ���
�ץ�åȥե������¸������Ǥ���

--- PATH_SEPARATOR -> Hash

�ѥ��ζ��ڤ�ʸ�����Ǽ���ޤ���

--- HTTP_STATUS -> Hash

HTTP �Υ��ơ����������ɤ�ɽ���ϥå���Ǥ���

#@until 1.9.1
--- RFC822_DAYS

--- RFC822_MONTHS
#@end

= module CGI::QueryExtension

������ʸ����򰷤�����Υ᥽�åɤ�������Ƥ���⥸�塼��Ǥ���

== Instance Methods

--- [](key) -> Array

ʸ���� key ���б�����ѥ�᡼����������֤��ޤ���
key ���б�����ѥ�᡼�������Ĥ���ʤ��ä����ϡ�nil ���֤��ޤ�����[[m:CGI#params]]�������Ǥ���

�ե����फ�����Ϥ��줿�ͤ䡢URL �������ޤ줿 QUERY_STRING �Υѡ�����̤μ����ʤɤ˻��Ѥ��ޤ���

@param key ������ʸ����ǻ��ꤷ�ޤ���

--- accept -> String

ENV['HTTP_ACCEPT'] ���֤��ޤ���

--- accept_charset -> String

ENV['HTTP_ACCEPT_CHARSET'] ���֤��ޤ���

--- accept_encoding -> String

ENV['HTTP_ACCEPT_ENCODING'] ���֤��ޤ���

--- accept_language -> String

ENV['HTTP_ACCEPT_LANGUAGE'] ���֤��ޤ���

--- auth_type -> String

ENV['AUTH_TYPE'] ���֤��ޤ���

--- cache_control -> String

ENV['HTTP_CACHE_CONTROL'] ���֤��ޤ���

--- content_length -> Fixnum

ENV['CONTENT_LENGTH'] ���֤��ޤ���

--- content_type -> String

ENV['CONTENT_TYPE'] ���֤��ޤ���

--- cookies -> Hash

���å�����̾�����ͤ�ڥ��ˤ������Ǥ���ĥϥå�����֤��ޤ���

--- cookies=(value)

���å����򥻥åȤ��ޤ���

@param value ���å�����̾�����ͤ�ڥ��ˤ������Ǥ���ĥϥå������ꤷ�ޤ���

--- from -> String

ENV['HTTP_FROM'] ���֤��ޤ���

--- gateway_interface -> String

ENV['GATEWAY_INTERFACE'] ���֤��ޤ���

--- has_key?(*args) -> bool
--- key?(*args) -> bool
--- include?(*args) -> bool

Ϳ����줿������������˴ޤޤ�Ƥ�����ϡ������֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

@param args �������İʾ���ꤷ�ޤ���

--- host -> String

ENV['HTTP_HOST'] ���֤��ޤ���

--- keys(*args) -> [String]

���٤ƤΥѥ�᡼���Υ���������Ȥ����֤��ޤ���

--- multipart? -> bool

�ޥ���ѡ��ȥե�����ξ��ϡ������֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

       �㡧
       cgi = CGI.new
       if cgi.multipart?
         field1=cgi['field1'].read
       else
         field1=cgi['field1']
       end

--- negotiate -> String

ENV['HTTP_NEGOTIATE'] ���֤��ޤ���

--- params -> Hash

�ѥ�᡼�����Ǽ�����ϥå�����֤��ޤ���

�ե����फ�����Ϥ��줿�ͤ䡢URL�������ޤ줿 QUERY_STRING �Υѡ�����̤μ����ʤɤ˻��Ѥ��ޤ���

      cgi = CGI.new
      cgi.params['developer']     # => ["Matz"] (Array)
      cgi.params['developer'][0]  # => "Matz"
      cgi.params['']              # => nil

--- params=(hash)

Ϳ����줿�ϥå����ѥ�᡼���˥��åȤ��ޤ���

@param hash �ϥå������ꤷ�ޤ���


--- path_info -> String

ENV['PATH_INFO'] ���֤��ޤ���

--- path_translated -> String

ENV['PATH_TRANSLATED'] ���֤��ޤ���

--- pragma -> String

ENV['HTTP_PRAGMA'] ���֤��ޤ���

--- query_string -> String

ENV['QUERY_STRING'] ���֤��ޤ���

--- raw_cookie -> String

ENV["HTTP_COOKIE"] ���֤��ޤ���

--- raw_cookie2 -> String

ENV["HTTP_COOKIE2"] ���֤��ޤ���

--- referer -> String

ENV['HTTP_REFERER'] ���֤��ޤ���

--- remote_addr -> String

ENV['REMOTE_ADDR'] ���֤��ޤ���

--- remote_host -> String

ENV['REMOTE_HOST'] ���֤��ޤ���

--- remote_ident -> String

ENV['REMOTE_IDENT'] ���֤��ޤ���

--- remote_user -> String

ENV['REMOTE_USER'] ���֤��ޤ���

--- request_method -> String

ENV['REQUEST_METHOD'] ���֤��ޤ���

--- script_name -> String

ENV['SCRIPT_NAME'] ���֤��ޤ���

--- server_name -> String

ENV['SERVER_NAME'] ���֤��ޤ���

--- server_port -> Fixnum

ENV['SERVER_PORT'] ���֤��ޤ���

--- server_protocol -> String

ENV['SERVER_PROTOCOL'] ���֤��ޤ���

--- server_software -> String

ENV['SERVER_SOFTWARE'] ���֤��ޤ���

--- user_agent -> String

ENV['HTTP_USER_AGENT'] ���֤��ޤ���

= module CGI::QueryExtension::Value
#@# nodoc

== Instance Methods

--- [](idx, *args)
#@todo

--- first -> self
--- last  -> self
#@todo

--- set_params(params)
#@todo

--- to_a -> Array
--- to_ary -> Array
#@todo
