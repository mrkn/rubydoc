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
#@if (version == "1.8.0")
((- 1.8.1��ź�դ�cgi�ˤϡ�CGI#server_port�����0���֤��פȤ����Х�������ޤ��� -))
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

[[unknown:��ɮ���罸]]

[[ruby-list:25399]] �򻲾Ȥ��Ƥ���������

=== ���ե饤��⡼��

[[unknown:��ɮ���罸]]

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

--- escape(string) -> string
#@todo

string �� URL ���󥳡��ɤ���ʸ����򿷤����������֤��ޤ���

��:
        require "cgi"

        p CGI.escape('@##')   #=> "%40%23%23"

        url = "http://www.example.com/register?url=" + 
          CGI.escape('http://www.example.com/index.rss')
        p url
        #=> "http://www.example.com/register?url=http%3A%2F%2Fwww.example.com%2Findex.rss"

--- unescape(string) -> string
#@todo

string �� URL �ǥ����ɤ���ʸ����򿷤����������֤��ޤ���

        require "cgi"

        p CGI.unescape('%40%23%23')   #=> "@##"

        p CGI.unescape("http%3A%2F%2Fwww.example.com%2Findex.rss")
        #=> "http://www.example.com/index.rss"

--- escapeHTML(string) -> string
#@todo

string ��� &"<> ����λ��Ȥ˥��󥳡��ɤ���ʸ����򿷤����������֤��ޤ���

        require "cgi"

        p CGI.escapeHTML("3 > 1")   #=> "3 &gt; 1"

        print('<script type="text/javascript">alert("�ٹ�")</script>')

        p CGI.escapeHTML('<script type="text/javascript">alert("�ٹ�")</script>')
        #=> "&lt;script type=&quot;text/javascript&quot;&gt;alert(&quot;�ٹ�&quot;)&lt;/script&gt;"

--- unescapeHTML(string) -> string
#@todo

string ��μ��λ��ȤΤ�����&amp; &gt; &lt; &quot;
�ȿ��ͻ��꤬����Ƥ����� (&#0ffff �ʤ�) �����򳰤��ޤ���

        require "cgi"

        p CGI.unescapeHTML("3 &gt; 1")   #=> "3 > 1"

--- escapeElement(string, *elements) -> string
#@todo

elements �˻��ꤷ��������ȤΥ�����������λ��Ȥ��ִ����ޤ���

�㡧
        require "cgi"

        p CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

        p CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

--- unescapeElement(string, *element) -> string
#@todo
��������Ǥ�����HTML���������פ����᤹��

�㡧
        require "cgi"

        print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', "A", "IMG")
          # => "&lt;BR&gt;<A HREF="url"></A>"

        print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', %w(A IMG))
          # => "&lt;BR&gt;<A HREF="url"></A>"

--- rfc1123_date(time) -> string
#@todo

���� time �� [[RFC:1123]] �ե����ޥåȤ˽�򤷤�ʸ������Ѵ����ޤ���

�㡧
        require "cgi"

        CGI.rfc1123_date(Time.now)
          # => Sat, 1 Jan 2000 00:00:00 GMT

--- parse(query) -> object
#@todo

QUERY_STRING ��ѡ������ޤ���

�㡧
        require "cgi"

        params = CGI.parse("query_string")
          # {"name1" => ["value1", "value2", ...],
          #  "name2" => ["value1", "value2", ...], ... }
#@# module QueryExtension �ɤ�����

--- pretty(string, shift = "  ") -> string
#@todo

HTML ��ʹ֤˸��䤹���������ޤ���

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

--- header(headers = "text/html")
#@todo

HTTP �إå��� headers �˽��ä��������ޤ����� [[m:CGI#out]] �Ȱ㤤��ɸ����ϤˤϽ��Ϥ��ޤ����
[[m:CGI#out]] ��Ȥ鷺�˼��Ϥ� HTML ����Ϥ��������ʤɤ˻Ȥ��ޤ���
���Υ᥽�åɤ�ʸ���󥨥󥳡��ǥ��󥰤��Ѵ����ޤ���
[[ruby-list:35911]]

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

��

        cgi = CGI.new('html3')
        print cgi.header({"charset" => "shift_jis"})
        print "<html><head><title>TITLE</title></head>\r\n"
        print "<body>BODY</body></html>\r\n"

--- out(options = "text/html") { .... }
#@todo

HTTP �إå��ȡ��֥�å���Ϳ����줿ʸ�����ɸ����Ϥ˽��Ϥ��ޤ���

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

HEAD�ꥯ������ (REQUEST_METHOD == "HEAD") �ξ��� HTTP �إå��Τߤ���Ϥ��ޤ���

charset �� "iso-2022-jp"��"euc-jp"��"shift_jis" �Τ����줫��
�������ʸ���󥨥󥳡��ǥ��󥰤�ư�Ѵ�����language �� "ja"�ˤ��ޤ���
#@#((<ruby-list:35911>))

--- print(*strings)
#@todo

������ʸ�����ɸ����Ϥ˽��Ϥ��ޤ���

       �㡧
       cgi = CGI.new
       cgi.print "This line is a part of content body.\r\n"

== Constants

--- CR
#@todo

--- LF
#@todo

--- EOL
#@todo

--- REVISION
#@todo

--- NEEDS_BINMODE
#@todo

--- PATH_SEPARATOR
#@todo

--- HTTP_STATUS
#@todo

--- RFC822_DAYS
#@todo

--- RFC822_MONTHS
#@todo

= module CGI::QueryExtension

== Instance Methods

--- [](key)
#@todo

ʸ���� key ���б�����ѥ�᡼����������֤��ޤ���
key ���б�����ѥ�᡼�������Ĥ���ʤ��ä����ϡ�nil ���֤��ޤ�����[[m:CGI#params]]�������Ǥ���

�ե����फ�����Ϥ��줿�ͤ䡢URL �������ޤ줿 QUERY_STRING �Υѡ�����̤μ����ʤɤ˻��Ѥ��ޤ���

#@if (version >= "1.8.0")
((<ruby 1.8 feature>)): ��ư�� 1.6 ������ cgi ���礭���Ѳ����Ƥ��ޤ� ((- ���ε�ư��ήưŪ�ǡ�1.8.0, 1.8.1, 1.8.2 �ε�ư�Ϥ��٤ưۤʤ�ޤ���1.9.0�ε�ư��1.8.2��Ʊ�ͤǤ��ˡ� -)) ���᥽�åɤ��֤��ͤ�����Ǥʤ���ʸ���� ((- 1.8.1 �ޤǤϡ����Τ˸����� String �ǤϤ���ޤ��� -)) �ˤʤꡢ�����ȼ�ä� cgi[key][0] �Τ褦�ʽ������ѻߤ���ޤ������ޤ� key ���б�����ѥ�᡼����¸�ߤ��ʤ��ä���硢nil �ǤϤʤ� "" ���֤��褦�ˤʤäƤ��ޤ��� ruby 1.6 ��Ʊ����ư��˾����ϡ�[[m:CGI#params]]�����Ѥ��Ƥ���������

���η�̡����󥿡��ե��������ɤ��Ѥ�ä��Τ��ˤĤ��Ƥϡ��ʲ�����򻲹ͤˤ��Ƥ���������

      # with ruby 1.6 ---------------------------
      cgi = CGI.new
      cgi['developer']     # => ["Matz"] (Array)
      cgi['developer'][0]  # => "Matz" (String)
      cgi['']              # => nil

      # with ruby 1.8 ---------------------------
      cgi = CGI.new
      cgi['developer']     # => "Matz"
      cgi['developer'][0]  # => obsolete�ʷٹ𤬽Фޤ���
      cgi['']              # => ""

cgi['developer'].is_a?(String) # => 1.8.1�ޤǤ�false��1.8.2�ʹߤ�true
#@end

    [[unknown:��ɮ���罸]]

--- accept
#@todo

ENV['HTTP_ACCEPT']

--- accept_charset
#@todo

ENV['HTTP_ACCEPT_CHARSET']

--- accept_encoding
#@todo

ENV['HTTP_ACCEPT_ENCODING']

--- accept_language
#@todo

ENV['HTTP_ACCEPT_LANGUAGE']

--- auth_type
#@todo

ENV['AUTH_TYPE']

--- cache_control
#@todo

ENV['HTTP_CACHE_CONTROL']

--- content_length
#@todo

ENV['CONTENT_LENGTH']

--- content_type
#@todo

ENV['CONTENT_TYPE']

--- cookies
--- cookies=(value)
#@todo

--- from
#@todo

ENV['HTTP_FROM']

--- gateway_interface
#@todo

ENV['GATEWAY_INTERFACE']

--- has_key?(*args)
--- key?(*args)
--- include?(*args)
#@todo

--- host
#@todo

ENV['HTTP_HOST']

--- keys(*args)
#@todo

--- multipart?
#@todo

�ޥ���ѡ��ȥե�����ξ���true���֤�ޤ���

       �㡧
       cgi = CGI.new
       if cgi.multipart?
         field1=cgi['field1'].read
       else
         field1=cgi['field1']
       end

--- negotiate
#@todo

ENV['HTTP_NEGOTIATE']

--- params
#@todo

�ѥ�᡼�����Ǽ�����ϥå�����֤��ޤ���

�ե����फ�����Ϥ��줿�ͤ䡢URL�������ޤ줿 QUERY_STRING �Υѡ�����̤μ����ʤɤ˻��Ѥ��ޤ���

      cgi = CGI.new
      cgi.params['developer']     # => ["Matz"] (Array)
      cgi.params['developer'][0]  # => "Matz"
      cgi.params['']              # => nil

--- params=(hash)
#@todo

--- path_info
#@todo

ENV['PATH_INFO']

--- path_translated
#@todo

ENV['PATH_TRANSLATED']

--- pragma
#@todo

ENV['HTTP_PRAGMA']

--- query_string
#@todo

ENV['QUERY_STRING']

--- raw_cookie
#@todo

ENV["HTTP_COOKIE"]

--- raw_cookie2
#@todo

ENV["HTTP_COOKIE2"]

--- referer
#@todo

ENV['HTTP_REFERER']

--- remote_addr
#@todo

ENV['REMOTE_ADDR']

--- remote_host
#@todo

ENV['REMOTE_HOST']

--- remote_ident
#@todo

ENV['REMOTE_IDENT']

--- remote_user
#@todo

ENV['REMOTE_USER']

--- request_method
#@todo

ENV['REQUEST_METHOD']

--- script_name
#@todo

ENV['SCRIPT_NAME']

--- server_name
#@todo

ENV['SERVER_NAME']

--- server_port
#@todo

ENV['SERVER_PORT']

--- server_protocol
#@todo

ENV['SERVER_PROTOCOL']

--- server_software
#@todo

ENV['SERVER_SOFTWARE']

--- user_agent
#@todo

ENV['HTTP_USER_AGENT']

= module CGI::QueryExtension::Value

== Instance Methods

--- [](idx, *args)
#@todo

--- first
--- last
#@todo

--- set_params(params)
#@todo

--- to_a
--- to_ary
#@todo

#@# = class CGI::Cookie < DelegateClass(Array)
= class CGI::Cookie < Array

== Class Methods

--- new(name = "", *value)
#@todo

���å������֥������Ȥ�������ޤ���

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

--- parse(raw_cookie)
#@todo

���å���ʸ�����ѡ������ޤ���

        �㡧
        cookies = CGI::Cookie.parse("raw_cookie_string")
          # { "name1" => cookie1, "name2" => cookie2, ... }

== Instance Methods

--- name
--- name=(value)
--- value
--- value=(value)
--- path
--- path=(value)
--- domain
--- domain=(value)
--- expires
--- expires=(value)
--- secure
--- secure=(val)
#@todo

Cookie ���֥������ȤΥ��ȥ�ӥ塼�ȤǤ���

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

--- to_s
#@todo

= module CGI::TagMaker

== Instance Methods

--- nn_element_def(element)
#@todo

--- nOE_element_def(element, append = nil)
#@todo

--- nO_element_def(element)
#@todo

= module CGI::HtmlExtension

== Instance Methods

--- a(href = "")
#@todo
       
        �㡧
        a("url")
          # = a({ "HREF" => "url" })

--- base(href = "")
#@todo
       
        �㡧
        base("url")
          # = base({ "HREF" => "url" })

--- blockquote(cite = nil)
#@todo
       
        �㡧
        blockquote("url"){ "string" }
          # = blockquote({ "CITE" => "url" }){ "string" }

--- caption(align = nil)
#@todo
       
        �㡧
        caption("align"){ "string" }
          # = caption({ "ALIGN" => "align" }){ "string" }

--- checkbox(name = "", value = nil, checked = nil)
#@todo
       
        �㡧
        checkbox("name")
          # = checkbox({ "NAME" => "name" })

        checkbox("name", "value")
          # = checkbox({ "NAME" => "name", "VALUE" => "value" })

        checkbox("name", "value", true)
          # = checkbox({ "NAME" => "name", "VALUE" => "value", "CHECKED" => true })

--- checkbox_group(name = "", *values)
#@todo
       
        �㡧
        checkbox_group("name", "foo", "bar", "baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
          # <INPUT TYPE="checkbox" NAME="name" VALUE="bar">bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

        checkbox_group("name", ["foo"], ["bar", true], "baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
          # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="bar">bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

        checkbox_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="1">Foo
          # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="2">Bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="Baz">Baz

        checkbox_group({ "NAME" => "name",
                         "VALUES" => ["foo", "bar", "baz"] })

        checkbox_group({ "NAME" => "name",
                         "VALUES" => [["foo"], ["bar", true], "baz"] })

        checkbox_group({ "NAME" => "name",
                         "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- file_field(name = "", size = 20, maxlength = nil)
#@todo
       
        �㡧
        file_field("name")
          # <INPUT TYPE="file" NAME="name" SIZE="20">

        file_field("name", 40)
          # <INPUT TYPE="file" NAME="name" SIZE="40">

        file_field("name", 40, 100)
          # <INPUT TYPE="file" NAME="name" SIZE="40" MAXLENGTH="100">

        file_field({ "NAME" => "name", "SIZE" => 40 })
          # <INPUT TYPE="file" NAME="name" SIZE="40">

--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded")
#@todo
       
        �㡧
        form{ "string" }
          # <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form("get"){ "string" }
          # <FORM METHOD="get" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form("get", "url"){ "string" }
          # <FORM METHOD="get" ACTION="url" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form({"METHOD" => "post", ENCTYPE => "enctype"}){ "string" }
          # <FORM METHOD="post" ENCTYPE="enctype">string</FORM>

--- hidden(name = "", value = nil)
#@todo
       
        �㡧
        hidden("name")
          # <INPUT TYPE="hidden" NAME="name">

        hidden("name", "value")
          # <INPUT TYPE="hidden" NAME="name" VALUE="value">

        hidden({ "NAME" => "name", "VALUE" => "reset", "ID" => "foo" })
          # <INPUT TYPE="hidden" NAME="name" VALUE="value" ID="foo">

--- html(attributes = {})
#@todo
       
        �㡧

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

--- image_button(src = "", name = nil, alt = nil)
#@todo
       
        �㡧
        image_button("url")
          # <INPUT TYPE="image" SRC="url">

        image_button("url", "name", "string")
          # <INPUT TYPE="image" SRC="url" NAME="name" ALT="string">

        image_button({ "SRC" => "url", "ATL" => "strng" })
          # <INPUT TYPE="image" SRC="url" ALT="string">

--- img(src = "", alt = "", width = nil, height = nil)
#@todo
       
        �㡧
        img("src", "alt", 100, 50)
          # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

        img({ "SRC" => "src", "ALT" => "alt", "WIDTH" => 100, "HEIGHT" => 50 })
          # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

--- multipart_form(action = nil, enctype = "multipart/form-data")
#@todo
       
        �㡧
        multipart_form{ "string" }
          # <FORM METHOD="post" ENCTYPE="multipart/form-data">string</FORM>

        multipart_form("url"){ "string" }
          # <FORM METHOD="post" ACTION="url" ENCTYPE="multipart/form-data">string</FORM>

--- password_field(name = "", value = nil, size = 40, maxlength = nil)
#@todo
       
        �㡧
        password_field("name")
          # <INPUT TYPE="password" NAME="name" SIZE="40">

        password_field("name", "value")
          # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="40">

        password_field("password", "value", 80, 200)
          # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

        password_field({ "NAME" => "name", "VALUE" => "value" })
          # <INPUT TYPE="password" NAME="name" VALUE="value">

--- popup_menu(name = "", *values)
#@todo
       
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

        popup_menu({"NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                    "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })
          # <SELECT NAME="name" MULTIPLE SIZE="2">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- radio_button(name = "", value = nil, checked = nil)
#@todo
       
        �㡧
        radio_button("name", "value")
          # <INPUT TYPE="radio" NAME="name" VALUE="value">

        radio_button("name", "value", true)
          # <INPUT TYPE="radio" NAME="name" VALUE="value" CHECKED>

        radio_button({ "NAME" => "name", "VALUE" => "value", "ID" => "foo" })
          # <INPUT TYPE="radio" NAME="name" VALUE="value" ID="foo">

--- radio_group(name = "", *values)
#@todo
       
        �㡧
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

        radio_group({ "NAME" => "name",
                      "VALUES" => ["foo", "bar", "baz"] })

        radio_group({ "NAME" => "name",
                      "VALUES" => [["foo"], ["bar", true], "baz"] })

        radio_group({ "NAME" => "name",
                      "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- reset(value = nil, name = nil)
#@todo
       
        �㡧
        reset
          # <INPUT TYPE="reset">

        reset("reset")
          # <INPUT TYPE="reset" VALUE="reset">

        reset({ "VALUE" => "reset", "ID" => "foo" })
          # <INPUT TYPE="reset" VALUE="reset" ID="foo">

--- scrolling_list(name = "", *values)
#@todo
       
        �㡧

        scrolling_list({"NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                        "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })
          # <SELECT NAME="name" MULTIPLE SIZE="2">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- submit(value = nil, name = nil)
#@todo
       
        �㡧
        submit
          # <INPUT TYPE="submit">

        submit("ok")
          # <INPUT TYPE="submit" VALUE="ok">

        submit("ok", "button1")
          # <INPUT TYPE="submit" VALUE="ok" NAME="button1">

        submit({ "VALUE" => "ok", "NAME" => "button1", "ID" => "foo" })
          # <INPUT TYPE="submit" VALUE="ok" NAME="button1" ID="foo">

--- text_field(name = "", value = nil, size = 40, maxlength = nil)
#@todo
       
        �㡧
        text_field("name")
          # <INPUT TYPE="text" NAME="name" SIZE="40">

        text_field("name", "value")
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="40">

        text_field("name", "value", 80)
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80">

        text_field("name", "value", 80, 200)
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

        text_field({ "NAME" => "name", "VALUE" => "value" })
          # <INPUT TYPE="text" NAME="name" VALUE="value">

--- textarea(name = "", cols = 70, rows = 10)
#@todo
       
        �㡧
        textarea("name")
          # = textarea({ "NAME" => "name", "COLS" => 70, "ROWS" => 10 })

        textarea("name", 40, 5)
          # = textarea({ "NAME" => "name", "COLS" => 40, "ROWS" => 5 })

= module CGI::Html3

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Fr

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Tr

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo
