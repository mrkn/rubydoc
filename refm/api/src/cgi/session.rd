CGI �Υ��å���������Ԥ��饤�֥�ꡣ

���å����Ȥϡ�HTTP �ΰ�Ϣ�Υꥯ�����Ȥȥ쥹�ݥ󥹤�°����٤�
����ƥ����� (����) �Τ��Ȥ򤤤��ޤ���
���å��������ˤϽ����̤� [[lib:cgi]] �饤�֥�꤬�󶡤���
���å�������Ѥ��Ƥ⤤���Ǥ�����
���� cgi/session ����Ѥ����������狼��䤹���Ǥ��礦��
���å�������� Hash �饤���ʥ��󥿡��ե������Ǥ���

���å����ϥ��å���� ID �ȥץ���ब��Ͽ����
���å������󤫤鹽������ޤ���
�ǥե���ȤǤ� CGI::Session::FileStore �����Ѥ��졢
��Ͽ�Ǥ���Τ�ʸ����ΤߤǤ���

���å�������� CGI::Session::FileStore ��
CGI::Session::PStore ����Ѥ�������
�����ФΥ�����ե�����˵�Ͽ���졢
����Υꥯ�����Ȼ������Ѥ���ޤ���
�ǥե���ȤǤ�����Ū������Ԥʤ�ʤ��Ƥ�
�ץ���ཪλ���˥��å�������ϥե��������¸����ޤ���
���å������˿������ե����뤬��������ޤ���

���饤����Ȥˤϥ��å���������б����륻�å���� ID ��
���å������뤤�� form �� hidden input �Ȥ����Ϥ����Ȥˤʤ�ޤ���
���å����ϥǥե���ȤǤ� expires �����ꤵ��Ƥ��ʤ�����ˡ�
�֥饦����λ���������Ǿ��Ǥ��ޤ���

=== �Ȥ��� (����)

  require 'cgi/session'
  cgi = CGI.new
  session = CGI::Session.new(cgi)

[[m:CGI::Session.new]] �� [[c:CGI]] ���֥������Ȥ��Ϥ��ޤ������饤����Ȥ����Ϥ��줿
���å���� ID �ϥ��å����������꡼�Ȥ��� cgi �˳�Ǽ����Ƥ��뤿�ᡢ�ռ�����ɬ�פϤ���ޤ���

=== �Ȥ��� (���å��������Ͽ����)

  session['name'] = "value"

CGI::Session ���֥������Ȥ� Hash �Τ褦�ʤ�Τǡ��������б������ͤ�Ͽ���ޤ���
�ǥե���ȤǤϥץ���ཪλ���˥��å�������ϥե�����˵�Ͽ����ޤ���

=== �Ȥ��� (���å������������)

  name = session['name']

�̤� CGI �Ǥ��Υ��å����������Ф��Ȥ��ϡ����Τ褦�ˤ��ޤ���

=== �Ȥ��� (�إå�����)

�إå����Ϥ� [[m:CGI#out]]��[[m:CGI#header]] ��ȤäƤ���¤�
�̾��̤�ǹ����ޤ���
cgi/session ������Ū�˥��å�������Ѥ��Ƥ��ޤ�����
�����Υ᥽�åɤ����ݤ򸫤Ƥ����Τǡ��ռ��򤹤�ɬ�פϤ���ޤ���

=== umask ��

umask �ͤ� 0022 �ʤ��
���å�������ե�����Υѡ��ߥå���� 644 �ˤʤ�Τǡ�
Ǥ�դΥ桼�������Υ��å�������ե�����򸫤뤳�Ȥ��Ǥ��ޤ���
���줬���ʾ��� CGI::Session ���֥��������������� umask �ͤ����ꤷ�Ƥ���������

#@if (version >= "1.8.2")
���å�������ե������ 0600 �Ǻ��������褦�ˤʤ�ޤ�����
#@end

=== CGI::HtmlExtension#form �ν���

[[m:CGI::Session.new]] ��� [[m:CGI::HtmlExtension#form]] �ϡ����å���� ID ��������������ե�����ɤ�ư���Ϥ���褦�ˤʤ�ޤ���CGI::Session.new �ϡ�����ˤ�ä��������줿�ե�����ե�������ͤ򡢥��å���� ID �Ȥ��Ƽ�ưǧ�����ޤ���

CGI::HtmlExtension#form ��Ȥ���<INPUT TYPE="submit"> �ǥڡ������ܤ򤹤�褦�ˤ���С����å������Ȥ��ʤ��Ķ��ǤΥ��å����ݻ������ѤǤ��ޤ���

  #!/usr/bin/ruby
  require 'cgi'
  require 'cgi/session'

  cgi = CGI.new('html3')
  File.umask(0077)
  session = CGI::Session.new(cgi)
  cgi.out('charset'=>'euc-jp') {
    html = cgi.html {
      cgi.head { cgi.title {'Form Demo'} }
      cgi.body {
        cgi.form('action'=>"#{CGI.escapeHTML(cgi.script_name)}") {
          cgi.p {
            '���ʤ���̾���ϡ�' +
            cgi.text_field('name') +
            cgi.hidden('cmd', 'hello') +
            cgi.submit('�Ǥ���')
          }
        }
      }
    }
    CGI.pretty(html)
  }
  #=>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
  <HTML>
    <BODY>
      <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded" action="/sample.rb">
        <P>
          ���ʤ���̾���ϡ�
          <INPUT NAME="name" SIZE="40" TYPE="text">
          <INPUT NAME="cmd" TYPE="hidden" VALUE="hello">
          <INPUT TYPE="submit" VALUE="�Ǥ���">
        </P>
        <INPUT TYPE="HIDDEN" NAME="_session_id" VALUE="bc315cc069266e21">    # ����
      </FORM>
    </BODY>
  </HTML>

=== ������

����̾�������Ϥ���Ȥ������Ĥ򤹤�����ΤĤޤ�ʤ� CGI ������ץȡ�

������������

  #!/usr/bin/ruby
  require 'kconv'
  require 'cgi'
  require 'cgi/session'
  
  class SessionDemo
    def initialize
      @cgi = CGI.new
      File.umask(0077)                                # ���å����ե������ï�ˤ��ɤޤ줿���ʤ���
      @session = CGI::Session.new(@cgi)               # ���å����Ϥ��������������롣
      @cmd = "#{@cgi['cmd'].first}"                   # ruby 1.8 �Ǥ�ư���褦��(warning �ϽФޤ�)
      @cmd = 'start' if @cmd.empty?
      @header = { "type" => "text/html", "charset" => "euc-jp" }
      
      __send__("cmd_#{@cmd}")
    end
    
    def cmd_start
      @cgi.out(@header) {
        <<-END
        <html><head><title>CGI::Session Demo</title></head>
        <body>
         <form action="#{CGI.escapeHTML(ENV['SCRIPT_NAME'])}" method="get">
         <p>
         ���ʤ���̾���ϡ�
         <input type="text" name="name">
         <input type="hidden" name="cmd" value="hello">
         <input type="submit" value="�Ǥ���">
         </p>
         </form>
        </body></html>
        END
      }
    end
    
    def cmd_hello
      name = Kconv.toeuc(@cgi['name'].first)
      @session['name'] = name                         # ���å����˵���
      @cgi.out(@header) {                             # ���å�������ϱ��쥯�å������ݻ�����뤿�ᡢCGI#out�ǽ���
        <<-END
        <html><head><title>CGI::Session Demo</title></head>
        <body>
         <p>����ˤ��ϡ�#{CGI.escapeHTML(name)}����</p>
         <p><a href="#{CGI.escapeHTML(ENV['SCRIPT_NAME'])}?cmd=bye">[����]</a></p>
        </body></html>
        END
      }
    end
    
    def cmd_bye
      name = @session['name']                         # ���å����ǡ���������Ф�
      @cgi.out(@header) {
        <<-END
        <html><head><title>CGI::Session Demo</title></head>
        <body>
         <p>#{CGI.escapeHTML(name)}���󡢤��褦�ʤ�</p>
         <p><a href="#{CGI.escapeHTML(ENV['SCRIPT_NAME'])}">[���]</a></p>
        </body></html>
        END
      }
    end
  end
  
  SessionDemo.new

=== ����URL

  * [[url:http://www.shugo.net/article/webdb2/#label:13]]
  * [[url:http://www.modruby.net/doc/faq.ja.jis.html#label-13]]
  * [[url:http://www.ruby-doc.org/stdlib/libdoc/cgi/rdoc/index.html]]



= class CGI::Session < Object

== Class Methods

--- new(cgi[, aHash])

���å���󥪥֥������Ȥ򿷤����������֤��ޤ���
���ץ����Ȥ��� [[c:Hash]] ���֥������� aHash ��Ϳ���뤳�Ȥ��Ǥ��ޤ���

��:

  CGI::Session.new(cgi, {"new_session" => true})

�ʲ���ʸ���� aHash �Υ����Ȥ���ǧ������ޤ���

  * "session_path"
    ���å�����b path �Ȥ��ƻȤ��ޤ���
    (default: File.dirname(ENV["SCRIPT_NAME"]),
    ������ץȤ� URI �� path ���κǸ�Υ���å���ޤ�)

  * "session_key"
    ���å����� <FORM type=hidden> �� name �Ȥ��ƻȤ��ޤ���
    (default: "_session_id")

  * "session_id"
    ���å���� ID �Ȥ��ƻȤ��ޤ���
    �ǥե���ȤΥǡ����١����Ǥ��� FileStore ���Ѥ�����,
    �ͤϱѿ�����������ʤ�ʸ�����̵����Фʤ�ޤ���
    ���Υ��ץ�������ꤹ��ȥꥯ�����Ȥ˥��å���� ID ���ޤޤ�Ƥ�̵�뤷�ޤ���
    (default: ���������������ޤ�)

  * "new_session"
    �ͤ� true �ΤȤ��϶���Ū�˿��������å�����Ϥ�ޤ���
#@if (version >= "1.8.2")
    �ʲ��� ((<ruby 1.8.2 feature>)) �Ǥ���

    �ͤ� false �ΤȤ��ϡ��ꥯ�����Ȥ˥��å���� ID ���ޤޤ�Ƥ��ʤ�����
    �㳰 ArgumentError ��ȯ�����ޤ���

    �ͤ��ʤ��Ȥ��ϡ��ꥯ�����Ȥ˥��å���� ID ��
    �ޤޤ�Ƥ�����Ϥ������Ѥ����ޤޤ�Ƥ��ʤ����Ͽ��������å�����Ϥ�ޤ���
#@end

    (default: �ͤʤ�)

  * "database_manager"
    �ǡ����١������饹����ꤷ�ޤ���
    (defalut: CGI::Session::FileStore)

  * CGI::Session::FileStore
    �ƥ����ȥե������Ȥ��ޤ���ʸ����ǡ������������ޤ���

  * CGI::Session::MemoryStore
    �����Υϥå����Ȥ��ޤ���Ruby ���󥿥ץ꥿����¸������Τ�ͭ���Ǥ���
    #@# mod_ruby �Ѥäƻ�����...

  * CGI::Session::PStore
    Marshal �ե����ޥåȤ�Ȥ��������뷿�Υǡ�������¸�Ǥ��ޤ���
    cgi/session/pstore �ˤ�ä��󶡤���뵡ǽ�Τ��ᡢ���Υ饤�֥����ɤ߹��ޤʤ�������ѤǤ��ޤ���

  * "tmpdir"
    CGI::Session::FileStore �����å����ǡ������������ǥ��쥯�ȥ��̾������ꤷ�ޤ���
    (default: ENV["TMP"] || "/tmp")

#@if (version >= "1.8.0")
    ((<ruby 1.8 feature>)): default �� [[m:tmpdir#Dir.tmpdir]] �ˤʤ�ޤ�����
#@end

  * "prefix"
    CGI::Session::FileStore �����å����ǡ����Υե�����̾��Ϳ����ץ�ե��å�����
    (default: "")

#@if (version >= "1.8.2")
  * "suffix"
    CGI::Session::FileStore �����å����ǡ����Υե�����̾��Ϳ���륵�ե��å�����
    (default: "") ((<ruby 1.8.2 feature>))
#@end

  * "no_hidden"
    [[unknown:��ɮ���罸]]

  * "no_cookies"
    [[unknown:��ɮ���罸]]

  * "session_expires"
    ���å�����ͭ�����֡�
    [[c:Time]] ���֥������Ȥ�Ϳ����ȡ����å����Ϥ��������ޤ��˴����줺�˻Ĥ�ޤ���
    (default: �֥饦���ν�λ��Ʊ�����˴�����ޤ�)

  * "session_domain"
    [[unknown:��ɮ���罸]]

  * "session_secure"
    [[unknown:��ɮ���罸]]

  * "session_path"
    [[unknown:��ɮ���罸]]

== Instance Methods

--- [](key)

���ꤵ�줿�������ͤ��֤��ޤ���

�ͤ����ꤵ��Ƥ��ʤ���� nil ���֤��ޤ���

--- []=(key, val)

���ꤵ�줿�������ͤ����ꤷ�ޤ���

--- update

�ǡ����١������饹�� update �᥽�åɤ�ƤӽФ��ơ�
���å�������򥵡��Ф���¸���ޤ���

MemoryStore �ξ��ϲ��⤷�ޤ���

--- close

�ǡ����١������饹�� close �᥽�åɤ�ƤӽФ��ơ�
���å�������򥵡��Ф���¸�������å���󥹥ȥ졼���򥯥������ޤ���
#@# mod_ruby �ʤɤ� CGI::Session �����Ѥ����硢����Ū�� close ����ɬ�פ����롣������ http://www.modruby.net/doc/faq.ja.jis.html#label-13

--- delete

�ǡ����١������饹�� delete �᥽�åɤ�ƤӽФ��ơ�
���å����򥹥ȥ졼�����������ޤ���

FileStore�ξ��ϥ��å����ե�����������ޤ���
���å����ե����������Ū�˺�����ʤ���лĤäƤ��ޤ���



= class CGI::Session::FileStore < Object
#@todo



= class CGI::Session::MemoryStore < Object
#@todo



= class CGI::Session::PStore < Object
#@todo
