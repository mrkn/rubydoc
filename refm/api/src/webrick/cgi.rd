#@since 1.8.1
require webrick/httprequest
require webrick/httpresponse
require webrick/config

���̤� CGI �Ķ��� [[c:WEBrick]] �Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
�饤�֥��Ǥ��������Ф� WEBrick �Ǥʤ��Ƥ�Ȥ����Ȥ�����ޤ���

�����֥�åȤ��������Τ�Ʊ���褦�ˡ�[[c:WEBrick::CGI]] �Υ��֥��饹�ǥ᥽�å�
do_GET �� do_POST ��������뤳�Ȥˤ�ä� CGI ������ץȤ�񤭤ޤ���

[[m:WEBrick::CGI#start]] ��Ǹ��ɬ���ƤӤޤ���
WEBrick::CGI#start �᥽�åɤ� service �᥽�åɤ�ƤӽФ���service �᥽�åɤϥꥯ�����Ȥ˱�����
do_XXX �᥽�åɤ�ƤӽФ��ޤ������Τ褦�ˤ��� CGI ������ץȤϼ¹Ԥ���ޤ���

��:

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

=== ���

 * [[rfc:3875]]

= class WEBrick::CGI < Object

���̤� CGI �Ķ��� [[c:WEBrick]] �Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
���饹�Ǥ���

== Class Methods

--- new(config={}, *options)    -> WEBrick::CGI
#@todo

CGI ���֥������Ȥ��������Ƥ������ޤ���

@param config �������¸�����ϥå������ꤷ�ޤ���

config ��ͭ���ʥ����Ȥ����ͤϰʲ��ΤȤ���Ǥ���

: :ServerName     
 ������̾��ʸ����ǻ��ꤷ�ޤ���
: :HTTPVersion
 HTTP �С������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥǻ��ꤷ�ޤ���
: :RunOnCGI
 CGI ������ץȤȤ��Ƽ¹Ԥ���Ƥ��뤫��Ƚ�ꤹ�뤿��˻Ȥ��ޤ���
: :NPH            
 NPH ������ץȤȤ��Ƽ¹Ԥ������� true �����ꤷ�ޤ���

== Instance Methods

#@since 1.8.3
--- [](key)    -> object

���ꤵ�줿 key ���б��������Ȥ������ͤ��֤��ޤ���

@param key ����̾�� Symbol ���֥������Ȥǻ��ꤷ�ޤ���

#@end

#@since 1.8.3
--- config     -> Hash

���Ȥ�������ݻ������ϥå�����֤��ޤ���

@see [[m:WEBrick::CGI.new]]
#@end

#@since 1.8.3
--- logger     -> WEBrick::Log

���ꤵ��Ƥ�������֥������Ȥ��֤��ޤ���

�ǥե���ȤǤ� WEBrick::BasicLog.new($stderr) �Ǥ���
#@end

--- do_GET(req, res)        -> ()
--- do_HEAD(req, res)       -> ()
--- do_POST(req, res)       -> ()
--- do_PUT(req, res)        -> ()
--- do_DELETE(req, res)     -> ()
--- do_OPTIONS(req, res)    -> ()

���Ȥ� service �᥽�åɤ��� HTTP �Υꥯ�����Ȥ˱�����
�ƤФ��᥽�åɤǤ���WEBrick::CGI �Υ��֥��饹�Ϥ����Υ᥽�åɤ�Ŭ�ڤ˼�����
�ʤ���Ф����ޤ����֤��ͤ��ä˵��ꤵ��Ƥ��ޤ���

���饤����Ȥ��Ȥ���ǽ���Τ��� RFC ��������줿 HTTP �Υ᥽�åɤϤ��٤Ƽ�������ɬ�פ�����ޤ���
���饤����Ȥ���Υꥯ�����Ȥ˻Ȥ��ʤ���ʬ���äƤ���᥽�åɤϼ������ʤ��Ƥ⤫�ޤ��ޤ���
��������Ƥ��ʤ� HTTP �᥽�åɤǤ��ä���硢���Ȥ� service �᥽�åɤ�
�㳰��ȯ�������ޤ���

--- service(req, res)     -> ()

���ꤵ�줿 [[c:WEBrick::HTTPRequest]] ���֥������� req �� [[m:WEBrick::HTTPRequest#request_method]] �˱����ơ�
���Ȥ� do_GET, do_HEAD, do_POST, do_OPTIONS... �����줫�Υ᥽�åɤ� req �� res ������Ȥ��ƸƤӤޤ���

�ä���ͳ��̵���¤� WEBrick::CGI �Υ��֥��饹�����Υ᥽�åɤ��������ɬ�פϤ���ޤ���

@param req ���饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[m:WEBrick::HTTPRequest]] ���֥������ȤǤ���

@param res ���饤����ȤؤΥ쥹�ݥ󥹤�ɽ�� [[m:WEBrick::HTTPResponse]] ���֥������ȤǤ���

@raise WEBrick::HTTPStatus::MethodNotAllowed
       ���ꤵ�줿 [[c:WEBrick::HTTPRequest]] ���֥�������  req �����Ȥ��������Ƥ��ʤ�
       HTTP �Υ᥽�åɤǤ��ä����ȯ�����ޤ���

--- start(env = ENV, stdin = $stdin, stdout = $stdout)     -> ()

���Ȥ�������줿�����ӥ���¹Ԥ��ޤ���

start �᥽�åɤ� service �᥽�åɤ�ƤӽФ���service �᥽�åɤϥꥯ�����Ȥ˱�����
do_XXX �᥽�åɤ�ƤӽФ��ޤ������Τ褦�ˤ��� CGI ������ץȤϼ¹Ԥ���ޤ���

@param env CGI ������ץȤ�������ä� Meta-Variables (�Ķ��ѿ�)���ݻ������ϥå��夫��
           �����Ʊ�� [] �᥽�åɤ���ä����֥������Ȥ���ꤷ�ޤ���

@param stdin �ꥯ�����ȥǡ��������ϸ��� [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���

@param stdout �쥹�ݥ󥹥ǡ����ν������ [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���

= class WEBrick::CGI::CGIError < StandardError

#@end
