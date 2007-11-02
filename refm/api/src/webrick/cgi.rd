#@since 1.8.1
require webrick/httprequest
require webrick/httpresponse
require webrick/config

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
#@todo
CGI ���֥������Ȥ��������롣

== Instance Methods

#@since 1.8.3
--- [](key)
#@todo
#@end

#@since 1.8.3
--- config
#@todo
#@end

#@since 1.8.3
--- logger
#@todo
#@end

--- service(req, res)
#@todo

--- start(env=ENV, stdin=$stdin, stdout=$stdout)
#@todo
������ץȤ�¹Ԥ��롣env �ˤϥ�����ץȤ��������٤��Ķ��ѿ���stdin �ˤ�
������ץȤ����ϸ���stdout �ˤϽ��������ꤹ�롣

= class WEBrick::CGI::CGIError < StandardError

= class WEBrick::CGI::Socket
include Enumerable

== Class Methods

--- new(config, env, stdin, stdout)
#@todo

== Instance Methods

--- <<(data)
#@todo

--- addr
#@todo

--- cert
#@todo

--- cipher
#@todo

--- each {|line| ... }
#@todo

--- gets(eol = WEBrick::LF)
#@todo

--- peeraddr
#@todo

--- peer_cert
#@todo

--- peer_cert_chain
#@todo

--- read(size = nil)
#@todo

#@end
