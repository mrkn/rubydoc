CGI �ץ����λٱ�饤�֥��Ǥ���

CGI �ץ�ȥ���ξܺ٤ˤĤ��Ƥϰʲ���ʸ��򻲾Ȥ��Ƥ���������

  * [[url:http://Web.Golux.Com/coar/cgi/draft-coar-cgi-v11-03.txt]]
  * [[RFC:3875]]: The Common Gateway Interface (CGI) Version 1.1

=== ������

==== �ե�����ե�����ɤ��ͤ�����

  require "cgi"
  cgi = CGI.new
  values = cgi['field_name']   # <== 'field_name' ������
    # 'field_name' �����ꤵ��Ƥ��ʤ��ä��顢 []���֤��� (1.6)
    # 'field_name' �����ꤵ��Ƥ��ʤ��ä��顢 ""���֤���(1.8)
#@#
  fields = cgi.keys            # <== field name������

#@# returns true if form has 'field_name'
  # �ե������ 'field_name' �Ȥ���field name������Ȥ��˿�
  cgi.has_key?('field_name')
  cgi.include?('field_name')

==== �ե�����ե�����ɤ��ͤ�ϥå���Ȥ�������

�ե�������ͤ�ϥå���Ȥ�������ˤ� CGI#params ��Ȥ��ޤ���

  ��
  require "cgi"
  cgi = CGI.new
  params = cgi.params

�ޤ� CGI#params �����Ʊ�� Hash ���֥������Ȥ��֤��Τ�
�ʲ��Τ褦�ʻȤ�������Ǥ��ޤ���

  cgi.params['new_field_name'] = ["value"]  # �������ѥ�᡼����ä���
  cgi.params['field_name'] = ["new_value"]  # �ѥ�᡼�����ͤ��Ѥ���
  cgi.params.delete('field_name')           # �ѥ�᡼����õ�
  cgi.params.clear                          # ���ѥ�᡼����õ�

==== �ե�����ե�����ɤ��ͤ�ե��������¸����

PStore ��Ȥ��Τ��Ǥ��ñ�Ǥ���

  # ��¸
  require 'pstore'
  db = PStore.new("query.db")
  db.transaction do
    db["params"] = cgi.params
  end

  # ����
  require 'pstore'
  db = PStore.new("query.db")
  db.transaction do
    cgi.params = db["params"]
  end

��������PStore �� Ruby �ΥС������ˤ�äƥǡ����ߴ�����
�ʤ��ʤ뤳�Ȥ�����Τǡ�Ĺ�����֥ǡ�������¸���뤳�Ȥ�����
���ˤϸ�Ƥ��ɬ�פǤ���

[[c:PStore]] �⻲�Ȥ��Ƥ���������

==== �ޥ���ѡ��ȥե�����ɤ��ͤ��������ʥե�����������

  require "cgi"
  cgi = CGI.new
  value = cgi.params['field_name'][0]   # TempFile ���֥������ȡ�Ruby 1.8�Ǥ� 10240�Х���̤���ξ��� StringIO���֥������ȡ�
  value.read                            # ��ʸ�������Ƥ����ե��������ȡ�
  value.local_path                      # ������ե�����Υѥ���Ruby 1.8�Ǥ�¸�ߤ��ʤ���
  value.original_filename               # ����̾��
  value.content_type                    # content_type



==== ���饤����Ȥ˥��å������Ϥ�

  require "cgi"
  cgi = CGI.new
  for name, cookie in cgi.cookies
    cookie.expires = Time.now + 30
  end
  cgi.out("cookie" => cgi.cookies){"string"}

  cgi.cookies # { "name1" => cookie1, "name2" => cookie2, ... }

  require "cgi"
  cgi = CGI.new
  cgi.cookies['name'].expires = Time.now + 30
  cgi.out("cookie" => cgi.cookies['name']){"string"}

==== ���饤����Ȥ��饯�å���������

  require "cgi"
  cgi = CGI.new
  values = cgi.cookies['name']  # values �� name ���å������ͤ�����
                                # name ���å�����¸�ߤ��ʤ����϶�������֤���
  names = cgi.cookies.keys      # ���ƤΥ��å�����̾��������

==== CGI �˴�Ϣ����Ķ��ѿ����ͤ��������

CGI �˴�Ϣ����Ķ��ѿ����ͤ�ľ�� ENV ��������¾�ˡ�
CGI ���饹�Υ᥽�åɤ����뤳�Ȥ�Ǥ��ޤ���
����Ū�ˤϴĶ��ѿ���̾���� downcase �����᥽�åɤ˥ޥåפ���ޤ���
�㤨�� AUTH_TYPE �ˤ� CGI#auth_type ���б����ޤ���

  require "cgi"
  cgi = CGI.new
  value = cgi.auth_type

���Τ褦�ʴĶ��ѿ��ˤϰʲ��Τ�Τ�����ޤ���

  * AUTH_TYPE
  * CONTENT_LENGTH
  * CONTENT_TYPE
  * GATEWAY_INTERFACE
  * PATH_INFO
  * PATH_TRANSLATED
  * QUERY_STRING
  * REMOTE_ADDR
  * REMOTE_HOST
  * REMOTE_IDENT
  * REMOTE_USER
  * REQUEST_METHOD
  * SCRIPT_NAME
  * SERVER_NAME
  * SERVER_PORT
  * SERVER_PROTOCOL
  * SERVER_SOFTWARE

#content_length �� #server_port
#@if (version == "1.8.1")
(1.8.1��ź�դ�cgi�ˤϡ�CGI#server_port�����0���֤��פȤ����Х�������ޤ�)
#@end
�������򡢤���¾�Υ᥽�åɤ�ʸ������֤��ޤ���

HTTP_COOKIE �� HTTP_COOKIE2 �ˤ�
���줾�� raw_cookie �� raw_cookie2 ���б����ޤ���

  value = cgi.raw_cookie      # ENV["HTTP_COOKIE"]
  value = cgi.raw_cookie2     # ENV["HTTP_COOKIE2"]

�Ǹ�ˡ��ʲ��� HTTP ��Ϣ�δĶ��ѿ��� HTTP_ ���������ʬ�� downcase
�����᥽�å�̾���������Ƥ��ޤ���

  ��
  value = cgi.accept              # ENV["HTTP_ACCEPT"]
  value = cgi.accept_charset      # ENV["HTTP_ACCEPT_CHARSET"]

���Τ褦�ʴĶ��ѿ��ˤϰʲ��Τ�Τ�����ޤ���

  * HTTP_ACCEPT
  * HTTP_ACCEPT_CHARSET
  * HTTP_ACCEPT_ENCODING
  * HTTP_ACCEPT_LANGUAGE
  * HTTP_CACHE_CONTROL
  * HTTP_FROM
  * HTTP_HOST
  * HTTP_NEGOTIATE
  * HTTP_PRAGMA
  * HTTP_REFERER
  * HTTP_USER_AGENT

CGI �˴�Ϣ����Ķ��ѿ��˴ؤ��Ƥ�
[[url:http://www.w3.org/CGI/]] �⻲�Ȥ��Ƥ���������

==== ɸ����Ϥ� HTTP �إå��� HTML ����Ϥ���

  require "cgi"
#@#  cgi = CGI.new("html3")  # add HTML generation methods
  cgi = CGI.new("html3")  # HTML�����᥽�åɤ��ɲ�
  cgi.out() do
    cgi.html() do
      cgi.head{ cgi.title{"TITLE"} } +
      cgi.body() do
        cgi.form() do
          cgi.textarea("get_text") +
          cgi.br +
          cgi.submit
        end +
        cgi.pre() do
          CGI.escapeHTML(
            "params: " + cgi.params.inspect + "\n" +
            "cookies: " + cgi.cookies.inspect + "\n" +
            ENV.collect() do |key, value|
              key + " --> " + value + "\n"
            end.join("")
          )
        end
      end
    end
  end

  # HTML�����᥽�åɤ��ɲ�
  CGI.new("html3")    # html3.2
  CGI.new("html4")    # html4.0 (Strict)
  CGI.new("html4Tr")  # html4.0 Transitional
  CGI.new("html4Fr")  # html4.0 Frameset

==== �ե�����Υ��åץ���

[[ruby-list:25399]] �򻲾Ȥ��Ƥ���������

=== ���ե饤��⡼��

cgi �ˤϡ����ޥ�ɥ饤�󤫤� CGI ������ץȤ�ư��������λ��Ȥߡʥ��ե饤��⡼�ɡˤ�����ޤ���
���ޥ�ɥ饤�󤫤�ʲ��Τ褦�˼¹Ԥ���ȡ�

  $ ruby -r cgi some_script.rb
  (offline mode: enter name=value pairs on standard input)

��ʹ���Ƥ���Τǡ�

  q=hoge&v=foo

�ʤɤ����Ϥ��Ʋ������������꡼�����Ϥ��줿�ͤ����åȤ���ơ�������ץȤ��¹Ԥ���ޤ���

�ʤ���Windows �Ķ��ξ�硢�����ͤ����Ϥ��� Enter �򲡤������Ǥϼ¹Ԥ���ޤ��󡣥����ܡ��ɤ��� Ctrl + Z �����Ϥ���ɬ�פ�����ޤ���


=== HTML������Ƚ����ѥ᥽�å�
������ CGI ���֥������Ȥ���������ݡ������Ȥ��������ʸ�����Ϳ���뤳�Ȥˤ�äơ����Υ��֥������Ȥ� HTML �����ѤΥ᥽�åɤ��ɲä��뤳�Ȥ��Ǥ��ޤ��������Υ᥽�åɤ����Ѥ��뤳�Ȥˤ�ꡢ�֤��RubyŪ�ˡ�HTML ʸ�����Ϥ��뤳�Ȥ���ǽ�ˤʤ�ޤ���

  �㡧
#@#  cgi = CGI.new("html3")  # add HTML generation methods (for HTML3.2)
  cgi = CGI.new("html3")  # HTML3.2�˽�򤷤�HTML�����᥽�åɤ��ɲ�
  cgi.h1
    # <H1></h1>
  cgi.h1{ "content" }
    # <H1>content</H1>
  cgi.h1({ "class" => "foo", "attr" => "bar" }){ "content" }
    # <H1 class="foo" attr="bar">content</H1>

#@#  # add HTML generation methods
  # HTML�����᥽�åɤ��ɲ�
  CGI.new("html3")    # html3.2
  CGI.new("html4")    # html4.0 (Strict)
  CGI.new("html4Tr")  # html4.0 Transitional
  CGI.new("html4Fr")  # html4.0 Frameset

HTML �����᥽�åɤΰ����Ȥ��Ƥϡ�����Ū�� Hash ���֥������Ȥ�Ϳ������ʤ��뤤�ϲ���Ϳ�����ʤ��ˤ٤��Ǥ����������ʲ�����󤵤줿�᥽�åɤǤϡ��ƥ᥽�åɤΰ����η����˽��äơ� Hash ���֥������Ȱʳ��Τ�Τ��Ϥ����Ȥ�Ǥ��ޤ���


= class CGI < Object
include CGI::QueryExtension

== Class Methods

--- escape(string) -> String

Ϳ����줿ʸ����� URL ���󥳡��ɤ���ʸ����򿷤����������֤��ޤ���

@param string URL ���󥳡��ɤ�����ʸ�������ꤷ�ޤ���

��:
        require "cgi"

        p CGI.escape('@##')   #=> "%40%23%23"

        url = "http://www.example.com/register?url=" + 
          CGI.escape('http://www.example.com/index.rss')
        p url
        #=> "http://www.example.com/register?url=http%3A%2F%2Fwww.example.com%2Findex.rss"

--- unescape(string) -> String

Ϳ����줿ʸ����� URL �ǥ����ɤ���ʸ����򿷤����������֤��ޤ���

@param string URL ���󥳡��ɤ���Ƥ���ʸ�������ꤷ�ޤ���

        require "cgi"

        p CGI.unescape('%40%23%23')   #=> "@##"

        p CGI.unescape("http%3A%2F%2Fwww.example.com%2Findex.rss")
        #=> "http://www.example.com/index.rss"

--- escapeHTML(string) -> String

Ϳ����줿ʸ������� &"<> ����λ��Ȥ��ִ�����ʸ����򿷤����������֤��ޤ���

@param string ʸ�������ꤷ�ޤ���

        require "cgi"

        p CGI.escapeHTML("3 > 1")   #=> "3 &gt; 1"

        print('<script type="text/javascript">alert("�ٹ�")</script>')

        p CGI.escapeHTML('<script type="text/javascript">alert("�ٹ�")</script>')
        #=> "&lt;script type=&quot;text/javascript&quot;&gt;alert(&quot;�ٹ�&quot;)&lt;/script&gt;"

--- unescapeHTML(string) -> String

Ϳ����줿ʸ������μ��λ��ȤΤ�����&amp; &gt; &lt; &quot;
�ȿ��ͻ��꤬����Ƥ����� (&#0ffff �ʤ�) �򸵤�ʸ������ִ����ޤ���

@param string ʸ�������ꤷ�ޤ���

        require "cgi"

        p CGI.unescapeHTML("3 &gt; 1")   #=> "3 > 1"

--- escapeElement(string, *elements) -> String

��������ʹߤ˻��ꤷ��������ȤΥ�����������λ��Ȥ��ִ����ޤ���

@param string ʸ�������ꤷ�ޤ���

@param elements HTML ������̾�����İʾ���ꤷ�ޤ���ʸ���������ǻ��ꤹ�뤳�Ȥ����ޤ���

�㡧
        require "cgi"

        p CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

        p CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

--- unescapeElement(string, *element) -> String

��������Ǥ�����HTML���������פ����᤹��

@param string ʸ�������ꤷ�ޤ���

@param elements HTML ������̾�����İʾ���ꤷ�ޤ���ʸ���������ǻ��ꤹ�뤳�Ȥ����ޤ���

�㡧
        require "cgi"

        print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', "A", "IMG")
          # => "&lt;BR&gt;<A HREF="url"></A>"

        print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', %w(A IMG))
          # => "&lt;BR&gt;<A HREF="url"></A>"

--- rfc1123_date(time) -> String

Ϳ����줿����� [[RFC:1123]] �ե����ޥåȤ˽�򤷤�ʸ������Ѵ����ޤ���

@param time [[c:Time]] �Υ��󥹥��󥹤���ꤷ�ޤ���

�㡧
        require "cgi"

        CGI.rfc1123_date(Time.now)
          # => Sat, 1 Jan 2000 00:00:00 GMT

--- parse(query) -> Hash

Ϳ����줿������ʸ�����ѡ������ޤ���

@param query ������ʸ�������ꤷ�ޤ���

�㡧
        require "cgi"

        params = CGI.parse("query_string")
          # {"name1" => ["value1", "value2", ...],
          #  "name2" => ["value1", "value2", ...], ... }
#@# module QueryExtension �ɤ�����

--- pretty(string, shift = "  ") -> String

HTML ��ʹ֤˸��䤹������������ʸ������֤��ޤ���

@param string HTML ����ꤷ�ޤ���

@param shift ����ǥ�Ȥ˻��Ѥ���ʸ�������ꤷ�ޤ����ǥե���Ȥ�Ⱦ�Ѷ�����ĤǤ���

�㡧
        require "cgi"

        print CGI.pretty("<HTML><BODY></BODY></HTML>")
          # <HTML>
          #   <BODY>
          #   </BODY>
          # </HTML>

        print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
          # <HTML>
          #         <BODY>
          #         </BODY>
          # </HTML>

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

#@# nodoc
#@# --- CR
#@# 
#@# --- LF
#@# 
#@# --- EOL
#@# 
#@# --- REVISION
#@# 
#@# --- NEEDS_BINMODE
#@# 
#@# --- PATH_SEPARATOR
#@# 
#@# --- HTTP_STATUS
#@# 
#@# --- RFC822_DAYS
#@# 
#@# --- RFC822_MONTHS
#@#

= module CGI::QueryExtension

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

--- content_length -> String

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

--- server_port -> String

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

#@# = class CGI::Cookie < DelegateClass(Array)
= class CGI::Cookie < Array

���å�����ɽ�����饹�Ǥ���

        �㡧
        cookie1 = CGI::Cookie.new("name", "value1", "value2", ...)
        cookie1 = CGI::Cookie.new({"name" => "name", "value" => "value"})
        cookie1 = CGI::Cookie.new({'name'    => 'name',
                                   'value'   => ['value1', 'value2', ...],
                                   'path'    => 'path',   # optional
                                   'domain'  => 'domain', # optional
                                   'expires' => Time.now, # optional
                                   'secure'  => true      # optional
                                  })

        cgi.out({"cookie" => [cookie1, cookie2]}){ "string" }

        name    = cookie1.name
        values  = cookie1.value
        path    = cookie1.path
        domain  = cookie1.domain
        expires = cookie1.expires
        secure  = cookie1.secure

        cookie1.name    = 'name'
        cookie1.value   = ['value1', 'value2', ...]
        cookie1.path    = 'path'
        cookie1.domain  = 'domain'
        cookie1.expires = Time.now + 30
        cookie1.secure  = true

== Class Methods

--- new(name = "", *value) -> CGI::Cookie

���å������֥������Ȥ�������ޤ���

�������˥ϥå������ꤹ����ϡ��ʲ��Υ��������Ѳ�ǽ�Ǥ���

: name
  ���å�����̾������ꤷ�ޤ���ɬ�ܡ�
: value
  ���å������͡��ޤ����ͤΥꥹ�Ȥ���ꤷ�ޤ���
: path
  ���Υ��å�����Ŭ�Ѥ���ѥ�����ꤷ�ޤ����ǥե���ȤϤ��� CGI ������ץȤΥ١����ǥ��쥯�ȥ�Ǥ���
: domain
  ���Υ��å�����Ŭ�Ѥ���ɥᥤ�����ꤷ�ޤ���
: expires
  ���Υ��å�����ͭ�����¤� [[c:Time]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���
: secure
  ������ꤹ��ȡ����Υ��å����ϥ����奢���å����ˤʤ�ޤ���
  �ǥե���Ȥϵ��Ǥ��������奢���å����� HTTPS �λ��Τ���������ޤ���

@param name ���å�����̾����ʸ����ǻ��ꤷ�ޤ���
            ���å�����̾�����ͤ����ǤȤ���ϥå������ꤷ�ޤ���

@param value name ��ʸ����Ǥ����硢�ͤΥꥹ�Ȥ��İʾ���ꤷ�ޤ���

        �㡧
        cookie1 = CGI::Cookie.new("name", "value1", "value2", ...)
        cookie1 = CGI::Cookie.new({"name" => "name", "value" => "value"})
        cookie1 = CGI::Cookie.new({'name'    => 'name',
                                   'value'   => ['value1', 'value2', ...],
                                   'path'    => 'path',   # optional
                                   'domain'  => 'domain', # optional
                                   'expires' => Time.now, # optional
                                   'secure'  => true      # optional
                                  })

        cgi.out({"cookie" => [cookie1, cookie2]}){ "string" }

        name    = cookie1.name
        values  = cookie1.value
        path    = cookie1.path
        domain  = cookie1.domain
        expires = cookie1.expires
        secure  = cookie1.secure

        cookie1.name    = 'name'
        cookie1.value   = ['value1', 'value2', ...]
        cookie1.path    = 'path'
        cookie1.domain  = 'domain'
        cookie1.expires = Time.now + 30
        cookie1.secure  = true

--- parse(raw_cookie) -> Hash

���å���ʸ�����ѡ������ޤ���

@param raw_cookie ���Υ��å�����ɽ��ʸ�������ꤷ�ޤ���

        �㡧
        cookies = CGI::Cookie.parse("raw_cookie_string")
          # { "name1" => cookie1, "name2" => cookie2, ... }

== Instance Methods

--- name -> String

���å�����̾�����֤��ޤ���

--- name=(value)

���å�����̾���򥻥åȤ��ޤ���

@param value ̾������ꤷ�ޤ��� 

--- value -> Array

���å������ͤ��֤��ޤ���

--- value=(value)

���å������ͤ򥻥åȤ��ޤ���

@param value �ѹ�����ͤ���ꤷ�ޤ���

--- path -> String

���å�����Ŭ�Ѥ���ѥ����֤��ޤ���

--- path=(value)

���å�����Ŭ�Ѥ���ѥ��򥻥åȤ��ޤ���

@param value �ѥ�����ꤷ�ޤ���

--- domain -> String

���å�����Ŭ�Ѥ���ɥᥤ����֤��ޤ���

--- domain=(value)

���å�����Ŭ�Ѥ���ɥᥤ��򥻥åȤ��ޤ���

@param value �ɥᥤ�����ꤷ�ޤ���

--- expires -> Time

���å�����ͭ�����¤��֤��ޤ���

--- expires=(value)

���å�����ͭ�����¤򥻥åȤ��ޤ���

@param value ͭ�����¤� [[c:Time]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���

--- secure -> bool

���Ȥ������奢���å����Ǥ�����ϡ������֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

--- secure=(val)

�����奢���å����Ǥ��뤫�ɤ������ѹ����ޤ���

@param val ������ꤹ��ȼ��Ȥϥ����奢���å����ˤʤ�ޤ���

--- to_s -> String

���å�����ʸ����ɽ�����֤��ޤ���

= module CGI::TagMaker
#@#nodoc

== Instance Methods

--- nn_element_def(element)
#@todo

--- nOE_element_def(element, append = nil)
#@todo

--- nO_element_def(element)
#@todo

= module CGI::HtmlExtension

HTML ���������뤿��Υ᥽�åɤ��󶡤���⥸�塼��Ǥ���

��:
   cgi.a("http://www.example.com") { "Example" }
     # => "<A HREF=\"http://www.example.com\">Example</A>"

== Instance Methods

--- a(href = "") -> String
--- a(href = ""){ ... } -> String

a ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param href ʸ�������ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  a("http://www.example.com") { "Example" }
    # => "<A HREF=\"http://www.example.com\">Example</A>"

  a("HREF" => "http://www.example.com", "TARGET" => "_top") { "Example" }
    # => "<A HREF=\"http://www.example.com\" TARGET=\"_top\">Example</A>"

--- base(href = "") -> String

base ���Ǥ��������ޤ���

@param href ʸ�������ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���

��:
  base("http://www.example.com/cgi")
    # => "<BASE HREF=\"http://www.example.com/cgi\">"

--- blockquote(cite = nil) -> String
--- blockquote(cite = nil){ ... } -> String

blockquote ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param cite ���Ѹ�����ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  blockquote("http://www.example.com/quotes/foo.html") { "Foo!" }
    #=> "<BLOCKQUOTE CITE=\"http://www.example.com/quotes/foo.html\">Foo!</BLOCKQUOTE>

--- caption(align = nil) -> String
--- caption(align = nil){ ... } -> String

caption ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param align ���֤�ʸ����ǻ��ꤷ�ޤ���(top, bottom, left right �������ǽ�Ǥ�)
             °����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  caption("left") { "Capital Cities" }
    # => <CAPTION ALIGN=\"left\">Capital Cities</CAPTION>

--- checkbox(name = "", value = nil, checked = nil) -> String

�����פ� checkbox �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param checked checked °�����ͤ���ꤷ�ޤ���

��:
  checkbox("name", "value", true)
  # => "<INPUT CHECKED NAME=\"name\" TYPE=\"checkbox\" VALUE=\"value\">"

--- checkbox(attributes) -> String

�����פ� checkbox �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  checkbox("name" => "name", "value" => "value", "checked" => true)
  # => "<INPUT checked name=\"name\" TYPE=\"checkbox\" value=\"value\">"

--- checkbox_group(name = "", *values) -> String

�����פ� checkbox �Ǥ��� input ���ǤΥ��롼�פ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values value °���Υꥹ�Ȥ���ꤷ�ޤ���
              ���줾��ΰ�������ñ���ʸ����ξ�硢value °�����ͤȥ�٥��Ʊ����Τ����Ѥ���ޤ���
              ���줾��ΰ������������Ǥޤ��ϻ����Ǥ�����ξ�硢�ǽ����Ǥ� true �Ǥ���С�
              checked °���򥻥åȤ��ޤ�����Ƭ�����Ǥ� value °�����ͤˤʤ�ޤ���

��:
  checkbox_group("name", "foo", "bar", "baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="checkbox" NAME="name" VALUE="bar">bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

  checkbox_group("name", ["foo"], ["bar", true], "baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="checkbox" CHECKED NAME="name" VALUE="bar">bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

  checkbox_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="1">Foo
    # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="2">Bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="Baz">Baz

--- checkbox_group(attributes) -> String

�����פ� checkbox �Ǥ��� input ���ǤΥ��롼�פ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  checkbox_group({ "NAME" => "name",
                   "VALUES" => ["foo", "bar", "baz"] })

  checkbox_group({ "NAME" => "name",
                   "VALUES" => [["foo"], ["bar", true], "baz"] })

  checkbox_group({ "NAME" => "name",
                   "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- file_field(name = "", size = 20, maxlength = nil) -> String

�����פ� file �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
   file_field("name")
     # <INPUT TYPE="file" NAME="name" SIZE="20">

   file_field("name", 40)
     # <INPUT TYPE="file" NAME="name" SIZE="40">

   file_field("name", 40, 100)
     # <INPUT TYPE="file" NAME="name" SIZE="40" MAXLENGTH="100">

--- file_field(name = "", size = 20, maxlength = nil) -> String

�����פ� file �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
   file_field({ "NAME" => "name", "SIZE" => 40 })
     # <INPUT TYPE="file" NAME="name" SIZE="40">


--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded") -> String
--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded"){ ... } -> String

form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param method method °�����ͤȤ��� "get" �� "post" ����ꤷ�ޤ���

@param action action °�����ͤ���ꤷ�ޤ����ǥե���Ȥϸ��ߤ� CGI ������ץ�̾�Ǥ���

@param enctype enctype °�����ͤ���ꤷ�ޤ����ǥե���Ȥ� "application/x-www-form-urlencoded" �Ǥ���

��:
  form{ "string" }
    # <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

  form("get"){ "string" }
    # <FORM METHOD="get" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

  form("get", "url"){ "string" }
    # <FORM METHOD="get" ACTION="url" ENCTYPE="application/x-www-form-urlencoded">string</FORM>


--- form(attributes) -> String
--- form(attributes){ ... } -> String

form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  form({"METHOD" => "post", ENCTYPE => "enctype"}){ "string" }
    # <FORM METHOD="post" ENCTYPE="enctype">string</FORM>

@see [[m:CGI::HtmlExtension#multipart_form]]

--- hidden(name = "", value = nil) -> String
�����פ� hidden �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

��:
  hidden("name")
    # <INPUT TYPE="hidden" NAME="name">

  hidden("name", "value")
    # <INPUT TYPE="hidden" NAME="name" VALUE="value">

--- hidden(attributes) -> String
�����פ� hidden �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  hidden({ "NAME" => "name", "VALUE" => "reset", "ID" => "foo" })
    # <INPUT TYPE="hidden" NAME="name" VALUE="value" ID="foo">

--- html(attributes = {}) -> String
--- html(attributes = {}){ ... } -> String
�ȥåץ�٥�� html ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���
                  ����°���� "PRETTY" ��ʸ�����Ϳ����Ȥ���ʸ����ǥ���ǥ�Ȥ��� HTML ���������ޤ���
                  ����°���� "DOCTYPE" �ˤ� DOCTYPE ����Ȥ��ƻ��Ѥ���ʸ�����Ϳ���뤳�Ȥ��Ǥ��ޤ���

��:

  html{ "string" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML>string</HTML>

  html({ "LANG" => "ja" }){ "string" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML LANG="ja">string</HTML>

  html({ "DOCTYPE" => false }){ "string" }
    # <HTML>string</HTML>

  html({ "DOCTYPE" => '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">' }){ "string" }
    # <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN"><HTML>string</HTML>

  html({ "PRETTY" => "  " }){ "<BODY></BODY>" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    # <HTML>
    #   <BODY>
    #   </BODY>
    # </HTML>

  html({ "PRETTY" => "\t" }){ "<BODY></BODY>" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    # <HTML>
    #         <BODY>
    #         </BODY>
    # </HTML>

  html("PRETTY"){ "<BODY></BODY>" }
    # = html({ "PRETTY" => "  " }){ "<BODY></BODY>" }

  html(if $VERBOSE then "PRETTY" end){ "HTML string" }

--- image_button(src = "", name = nil, alt = nil) -> String
�����פ� image �� input ���Ǥ��������ޤ���

@param src src °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param alt alt °�����ͤ���ꤷ�ޤ���

��:
  image_button("url")
    # <INPUT TYPE="image" SRC="url">

  image_button("url", "name", "string")
    # <INPUT TYPE="image" SRC="url" NAME="name" ALT="string">

--- image_button(attributes) -> String
�����פ� image �� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  image_button({ "SRC" => "url", "ALT" => "string" })
    # <INPUT TYPE="image" SRC="url" ALT="string">

--- img(src = "", alt = "", width = nil, height = nil) -> String
img ���Ǥ��������ޤ���

@param src src °�����ͤ���ꤷ�ޤ���

@param alt alt °�����ͤ���ꤷ�ޤ���

@param width width °�����ͤ���ꤷ�ޤ���

@param height height °�����ͤ���ꤷ�ޤ���

��:
  img("src", "alt", 100, 50)
    # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

--- img(attributes) -> String
img ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  img({ "SRC" => "src", "ALT" => "alt", "WIDTH" => 100, "HEIGHT" => 50 })
    # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

--- multipart_form(action = nil, enctype = "multipart/form-data") -> String
--- multipart_form(action = nil, enctype = "multipart/form-data"){ ... } -> String

enctype °���� "multipart/form-data" �򥻥åȤ��� form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param action action °�����ͤ���ꤷ�ޤ���

@param enctype enctype °�����ͤ���ꤷ�ޤ���

��:
  multipart_form{ "string" }
    # <FORM METHOD="post" ENCTYPE="multipart/form-data">string</FORM>

--- multipart_form(attributes) -> String
--- multipart_form(attributes){ ... } -> String

enctype °���� "multipart/form-data" �򥻥åȤ��� form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  multipart_form("url"){ "string" }
    # <FORM METHOD="post" ACTION="url" ENCTYPE="multipart/form-data">string</FORM>

--- password_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� password �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
  password_field("name")
    # <INPUT TYPE="password" NAME="name" SIZE="40">

  password_field("name", "value")
    # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="40">

  password_field("password", "value", 80, 200)
    # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

--- password_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� password �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  password_field({ "NAME" => "name", "VALUE" => "value" })
    # <INPUT TYPE="password" NAME="name" VALUE="value">

--- popup_menu(name = "", *values) -> String
--- scrolling_list(name = "", *values) -> String

select ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values option ���Ǥ��������뤿��ξ�����İʾ���ꤷ�ޤ���
              ���줾�졢ʸ���󡢰����ǡ������ǡ������Ǥ��������ꤹ�뤳�Ȥ��Ǥ��ޤ���
              ʸ���󤫰����Ǥ�����Ǥ�����ϡ�value °�����ͤ� option ���Ǥ����Ƥˤʤ�ޤ���
              �����Ǥ�����Ǥ�����ϡ���� value °�����͡�option ���Ǥ����ơ����� option ���Ǥ�
              ������֤��ɤ�����ɽ�������ͤȤʤ�ޤ���
       
        �㡧
        popup_menu("name", "foo", "bar", "baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="foo">foo</OPTION>
          #   <OPTION VALUE="bar">bar</OPTION>
          #   <OPTION VALUE="baz">baz</OPTION>
          # </SELECT>

        popup_menu("name", ["foo"], ["bar", true], "baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="foo">foo</OPTION>
          #   <OPTION VALUE="bar" SELECTED>bar</OPTION>
          #   <OPTION VALUE="baz">baz</OPTION>
          # </SELECT>

        popup_menu("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- popup_menu(attributes) -> String
--- scrolling_list(attributes) -> String

select ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
        popup_menu({"NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                    "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })
          # <SELECT NAME="name" MULTIPLE SIZE="2">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- radio_button(name = "", value = nil, checked = nil) -> String

�����פ� radio �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param checked ���ʤ�� checked °�������ꤷ�ޤ���

��:
  radio_button("name", "value")
    # <INPUT TYPE="radio" NAME="name" VALUE="value">
 
  radio_button("name", "value", true)
    # <INPUT TYPE="radio" NAME="name" VALUE="value" CHECKED>

--- radio_button(attributes) -> String

�����פ� radio �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  radio_button({ "NAME" => "name", "VALUE" => "value", "ID" => "foo" })
    # <INPUT TYPE="radio" NAME="name" VALUE="value" ID="foo">

--- radio_group(name = "", *values) -> String
�����פ� radio �Ǥ��� input ���ǤΥꥹ�Ȥ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values value °���Υꥹ�Ȥ���ꤷ�ޤ���
              ���줾��ΰ�������ñ���ʸ����ξ�硢value °�����ͤȥ�٥��Ʊ����Τ����Ѥ���ޤ���
              ���줾��ΰ������������Ǥޤ��ϻ����Ǥ�����ξ�硢�ǽ����Ǥ� true �Ǥ���С�
              checked °���򥻥åȤ��ޤ�����Ƭ�����Ǥ� value °�����ͤˤʤ�ޤ���

��:
  radio_group("name", "foo", "bar", "baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="radio" NAME="name" VALUE="bar">bar
    # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz
  
  radio_group("name", ["foo&quot;], ["bar", true], "baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
    # <INPUT TYPE=&quot;radio" CHECKED NAME="name" VALUE="bar">bar
    # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz
  
  radio_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="1">Foo
    # <INPUT TYPE="radio" CHECKED NAME="name" VALUE="2">Bar
    # <INPUT TYPE="radio" NAME="name" VALUE="Baz">Baz
  
--- radio_group(name = "", *values) -> String
�����פ� radio �Ǥ��� input ���ǤΥꥹ�Ȥ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  radio_group({ "NAME" => "name",
                "VALUES" => ["foo", "bar", "baz"] })
  
  radio_group({ "NAME" => "name",
                "VALUES" => [["foo"], ["bar", true], "baz"] })
  
  radio_group({ "NAME" => "name",
                "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- reset(value = nil, name = nil) -> String
�����פ� reset �Ǥ��� input ���Ǥ��������ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

��:
  reset
    # <INPUT TYPE="reset">
  
  reset("reset")
    # <INPUT TYPE="reset" VALUE="reset">
  
--- reset(attributes) -> String
�����פ� reset �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

  reset({ "VALUE" => "reset", "ID" => "foo" })
    # <INPUT TYPE="reset" VALUE="reset" ID="foo">

--- submit(value = nil, name = nil) -> String
�����פ� submit �Ǥ��� input ���Ǥ��������ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

��:
  submit
    # <INPUT TYPE="submit">
  
  submit("ok")
    # <INPUT TYPE="submit" VALUE="ok">
  
  submit("ok", "button1")
    # <INPUT TYPE="submit" VALUE="ok" NAME="button1">
  
--- submit(attributes) -> String
�����פ� submit �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  submit({ "VALUE" => "ok", "NAME" => "button1", "ID" => "foo" })
    # <INPUT TYPE="submit" VALUE="ok" NAME="button1" ID="foo">

--- text_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� text �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
  text_field("name")
    # <INPUT TYPE="text" NAME="name" SIZE="40">
  
  text_field("name", "value")
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="40">
  
  text_field("name", "value", 80)
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80">
  
  text_field("name", "value", 80, 200)
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">
  
--- text_field(attributes) -> String
�����פ� text �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

  text_field({ "NAME" => "name", "VALUE" => "value" })
    # <INPUT TYPE="text" NAME="name" VALUE="value">

--- textarea(name = "", cols = 70, rows = 10) -> String
textarea ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param cols cols °�����ͤ���ꤷ�ޤ���

@param rows rows °�����ͤ���ꤷ�ޤ���

��:
   textarea("name")
     # = textarea({ "NAME" => "name", "COLS" => 70, "ROWS" => 10 })

--- textarea(attributes) -> String
textarea ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
   textarea("name", 40, 5)
     # = textarea({ "NAME" => "name", "COLS" => 40, "ROWS" => 5 })

= module CGI::Html3
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Fr
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Tr
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo
