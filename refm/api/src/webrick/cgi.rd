���̤� CGI �Ķ��� WEBrick �Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
���饹�������Ф� WEBrick �Ǥʤ��Ƥ�Ȥ����Ȥ�����롣

[[lib:webrick]]

[[c:WEBrick::HTTPServlet::AbstractServlet]] ��Ʊ���褦�˥᥽�å� do_GET ��
do_POST ���������뤳�Ȥˤ�ä� CGI ������ץȤ�񤯡�

���̤� WEBrick::CGI �Υ��֥��饹��������ơ����Υ��饹���Ф��ƥ᥽�å� do_XXX ��
������롣

 #!/usr/local/bin/ruby
 require 'webrick/cgi'

 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     res["content-type"] = "text/plain"
     ret = "hoge\n"
     res.body = ret
   end
 end

 MyCGI.new.start()

= class WEBrick::CGI < Object

== Class Methods

--- new(config={}, *options)
CGI ���֥������Ȥ��������롣

== Instance Methods

--- start(env=ENV, stdin=$stdin, stdout=$stdout)
������ץȤ�¹Ԥ��롣env �ˤϥ�����ץȤ��������٤��Ķ��ѿ���stdin �ˤ�
������ץȤ����ϸ���stdout �ˤϽ��������ꤹ�롣
