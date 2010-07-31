#@since 1.9.1
CGI �����Ѥ���桼�ƥ���ƥ��᥽�åɤ���������饤�֥��Ǥ���

= reopen CGI

== Class Methods
#@end
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
#@since 1.9.1
--- escape_html(string) -> String
#@end

Ϳ����줿ʸ������� &"<> ����λ��Ȥ��ִ�����ʸ����򿷤����������֤��ޤ���

@param string ʸ�������ꤷ�ޤ���

        require "cgi"

        p CGI.escapeHTML("3 > 1")   #=> "3 &gt; 1"

        print('<script type="text/javascript">alert("�ٹ�")</script>')

        p CGI.escapeHTML('<script type="text/javascript">alert("�ٹ�")</script>')
        #=> "&lt;script type=&quot;text/javascript&quot;&gt;alert(&quot;�ٹ�&quot;)&lt;/script&gt;"

--- unescapeHTML(string) -> String
#@since 1.9.1
--- unescape_html(string) -> String
#@end
Ϳ����줿ʸ������μ��λ��ȤΤ�����&amp; &gt; &lt; &quot;
�ȿ��ͻ��꤬����Ƥ����� (&#0ffff �ʤ�) �򸵤�ʸ������ִ����ޤ���

@param string ʸ�������ꤷ�ޤ���

        require "cgi"

        p CGI.unescapeHTML("3 &gt; 1")   #=> "3 > 1"

--- escapeElement(string, *elements) -> String
#@since 1.9.1
--- escape_element(string, *elements) -> String
#@end
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
#@since 1.9.1
--- unescape_element(string, *element) -> String
#@end

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

