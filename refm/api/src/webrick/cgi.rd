#@since 1.8.1
require webrick/httprequest
require webrick/httpresponse
require webrick/config
#@#require stringio

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

#@since 1.8.3
--- [](key)
#@end

#@since 1.8.3
--- config
#@end

#@since 1.8.3
--- logger
#@end

--- service(req, res)

--- start(env=ENV, stdin=$stdin, stdout=$stdout)
������ץȤ�¹Ԥ��롣env �ˤϥ�����ץȤ��������٤��Ķ��ѿ���stdin �ˤ�
������ץȤ����ϸ���stdout �ˤϽ��������ꤹ�롣

= class WEBrick::CGI::CGIError < StandardError

= class WEBrick::CGI::Socket
include Enumerable

== Class Methods

--- new(config, env, stdin, stdout)

== Instance Methods

--- <<(data)

--- addr

--- cert

--- cipher

--- each {|line| ... }

--- gets(eol = WEBrick::LF)

--- peeraddr

--- peer_cert

--- peer_cert_chain

--- read(size = nil)

#@end
