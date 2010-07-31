#@since 1.8.1
require webrick/httprequest
require webrick/httpresponse
require webrick/config

���̤� CGI �Ķ��� [[lib:webrick]] �饤�֥��Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
�饤�֥��Ǥ��������Ф� WEBrick �Ǥʤ��Ƥ�Ȥ����Ȥ�����ޤ���

=== �Ȥ���

WEBrick �Υ����֥�åȤ��������Τ�Ʊ���褦�ˡ�[[c:WEBrick::CGI]] �Υ��֥��饹�ǥ᥽�å�
do_GET �� do_POST ��������뤳�Ȥˤ�ä� CGI ������ץȤ�񤭤ޤ���

������ץȤκǸ�� [[m:WEBrick::CGI#start]] �᥽�åɤ�Ƥ�ɬ�פ�����ޤ���
WEBrick::CGI#start �᥽�åɤ� service �᥽�åɤ�ƤӽФ���service �᥽�åɤϥꥯ�����Ȥ˱�����
do_XXX �᥽�åɤ�ƤӽФ��ޤ������Τ褦�ˤ��ƥ�����ץȤϼ¹Ԥ���ޤ���

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

==== do_XXX �᥽�å�

do_XXX �᥽�åɤ� XXX �ˤ� GET, HEAD, POST, PUT, DELETE, OPTIONS �����ѤǤ��ޤ���

[[c:WEBrick::CGI]] �Υ��֥��饹��������줿 do_XXX �᥽�åɤ� [[m:WEBrick::CGI#service]] �᥽�å�
���� HTTP �Υꥯ�����Ȥ˱����Ƽ�ưŪ�˸ƤӽФ���ޤ���
�ʤΤ� [[c:WEBrick::CGI]] �Υ��֥��饹�Ϥ����Υ᥽�åɤ�Ŭ�ڤ˼������ʤ���Фʤ�ޤ���
�����Υ᥽�åɤ��֤��ͤ��ä˵��ꤵ��Ƥ��ޤ���

[[c:WEBrick::CGI]] �Υ��֥��饹�Ǥϡ����饤����Ȥ��Ȥ���ǽ���Τ��� RFC ��������줿 HTTP ��
�᥽�åɤϤ��٤Ƽ�������ɬ�פ�����ޤ���
���饤����Ȥ���Υꥯ�����Ȥ˻Ȥ��ʤ���ʬ���äƤ���᥽�åɤϼ������ʤ��Ƥ⤫�ޤ��ޤ���
��������Ƥ��ʤ� HTTP �᥽�åɤǤ��ä���硢[[m:WEBrick::CGI#service]] �᥽�åɤ��㳰��ȯ�������ޤ���

do_XXX �᥽�åɤ��ƤФ줿�����Ǥϡ����饤����Ȥ���Υꥯ�����Ȥ˴ޤޤ�� Entity Body ���ɤ߹��ߤ�
�ޤ��Ԥ��Ƥ��ޤ���[[m:WEBrick::HTTPRequest#query]], [[m:WEBrick::HTTPRequest#body]] �ʤɤ�
�᥽�åɤ��ɤФ줿�������ɤ߹��ߤ��Ԥ��ޤ������饤����Ȥ������ʥǡ����������Ƥ��뤳�Ȥ��θ����
�桼���ϥץ���ߥ󥰤�Ԥ��٤��Ǥ���

do_XXX �᥽�åɤˤ���Ĥΰ���������ޤ���
�������ϡ����饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[c:WEBrick::HTTPRequest]] ���֥������ȤǤ���
��������ϡ����饤����ȤؤΥ쥹�ݥ󥹤�ɽ�� [[c:WEBrick::HTTPResponse]] ���֥������ȤǤ���

==== �ե�����ե�����ɤ��ͤ�����

�ե�����ե�����ɤ��ͤ� [[m:WEBrick::HTTPRequest#query]] �᥽�åɤ��֤� Hash ���֥������Ȥ�
��Ǽ����Ƥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.query               #=> Hash ���֤��ޤ���
     req.query['q']          
     req.query['num']       
   end
 end
 MyCGI.new.start()

Ʊ��̾���Υե�����ɤ�ʣ�������硢list �᥽�åɤ� each_data �᥽�åɤ�Ȥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.query['q'].list     #=> �ե�������ͤ��ݻ�����ʸ�����������֤��ޤ���
   end
 end
 MyCGI.new.start()

query �᥽�åɤ��֤� Hash ���֥������ȤΥ������ͤΤ����ͤ� [[c:WEBrick::HTTPUtils::FormData]] ���饹��
���󥹥��󥹤ˤʤ�ޤ���FormData ���饹�� String ���饹�Υ��֥��饹�Ǥ���


==== �ޥ���ѡ��ȥե�����ɤ��ͤ��������ʥե�����������

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     d = req.query['field_name']   #=> FormData ���饹�Υ��󥹥���
     d.name                        #=> "field_name"
     d.filename                    #=> �⤷����Хե�����̾���֤���
     d['content-type']             #=> �إå����ͤ� [] �᥽�åɤǼ�������
     d                             #=> �����Ƥ����ե���������
   end
 end
 MyCGI.new.start()


==== ���饤����Ȥ˥��å������Ϥ�

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     c1 = WEBrick::Cookie.new("name1", "val1")
     c1.expires = Time.now + 30
     res.cookies << c1
     
     c2 = WEBrick::Cookie.new("name2", "val2")
     c2.expires = Time.now + 30
     res.cookies << c2
   end
 end
 MyCGI.new.start()

==== ���饤����Ȥ��饯�å���������

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.cookies                                   #=> WEBrick::Cookie ���֥������Ȥ�����
     c = req.cookies.find{|c| c.name == "name1" }  #=> WEBrick::Cookie ���֥�������
   end
 end
 MyCGI.new.start()


==== CGI �˴�Ϣ����Ķ��ѿ����ͤ��������

CGI �˴�Ϣ����Ķ��ѿ����ͤ�ľ�� ENV ��������¾�ˡ�
WEBrick::HTTPRequest ���֥������Ȥγƥ᥽�åɤ������뤳�Ȥ��Ǥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.content_length
     req.content_type
     req.path_info
     req.query_string
     req.peeraddr
     req.host
     req.user
     req.request_method
     req.script_name
     req.port
   end
 end
 MyCGI.new.start()

=== ���

 * [[rfc:3875]]

= class WEBrick::CGI < Object

���̤� CGI �Ķ��� [[c:WEBrick]] �Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
���饹�Ǥ���

== Class Methods

--- new(config = {}, *options)    -> WEBrick::CGI

WEBrick::CGI ���֥������Ȥ��������Ƥ������ޤ���

@param config �������¸�����ϥå������ꤷ�ޤ���

config ��ͭ���ʥ����Ȥ����ͤϰʲ��ΤȤ���Ǥ���
�����Ϥ��٤� [[c:Symbol]] ���֥������ȤǤ���

: :ServerName     
 ������̾��ʸ����ǻ��ꤷ�ޤ����ǥե���ȤǤ� ENV["SERVER_SOFTWARE"] ���Ȥ��ޤ���
 ENV["SERVER_SOFTWARE"] �� nil �ξ��� "null" ���Ȥ��ޤ���
: :HTTPVersion
 HTTP �С������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥǻ��ꤷ�ޤ���
 �ǥե���ȤǤ� ENV["SERVER_PROTOCOL"] �� HTTP �С�����󤬻Ȥ��ޤ��� 
 ENV["SERVER_PROTOCOL"] �� nil �ξ�� HTTP �С������� 1.0 �Ǥ���
: :NPH            
 NPH ������ץȤȤ��Ƽ¹Ԥ������� true ����ꤷ�ޤ��������Ǥʤ����� false ����ꤷ�ޤ���
 �ǥե���Ȥ� false �Ǥ���
: :Logger 
 �����뤿��� [[c:WEBrick::BasicLog]] ���֥������Ȥ���ꤷ�ޤ����ǥե���ȤǤ�ɸ�२�顼���Ϥ�
 �������Ϥ���ޤ���
: :RequestTimeout
 �ꥯ�����Ȥ��ɤ߹�����Υ����ॢ���Ȥ��äǻ��ꤷ�ޤ����ǥե���Ȥ� 30 �äǤ���
: :Escape8bitURI
 �����ͤ� true �ξ�硢���饤����Ȥ���Υꥯ������ URI �˴ޤޤ�� 8bit �ܤ�Ω�ä�ʸ���򥨥������פ��ޤ���
 �ǥե���Ȥ� false �Ǥ��� 

@param options �桼�������Υ��饹��Ѿ����ƺ����������饹�� @options �Ȥ������󥹥����ѿ��Ȥ��ƻ��ѤǤ��ޤ���

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
--- logger     -> WEBrick::BasicLog 

���ꤵ��Ƥ�������֥������Ȥ��֤��ޤ���

�ǥե���ȤǤ� [[c:WEBrick::BasicLog]].new($stderr) �Ǥ���
#@end

--- service(req, res)     -> ()

���ꤵ�줿 [[c:WEBrick::HTTPRequest]] ���֥������� req �� [[m:WEBrick::HTTPRequest#request_method]] �˱����ơ�
���Ȥ� do_GET, do_HEAD, do_POST, do_OPTIONS... �����줫�Υ᥽�åɤ� req �� res ������Ȥ��ƸƤӤޤ���

�ä���ͳ��̵���¤� [[c:WEBrick::CGI]] �Υ��֥��饹�����Υ᥽�åɤ��������ɬ�פϤ���ޤ���

@param req ���饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[c:WEBrick::HTTPRequest]] ���֥������ȤǤ���

@param res ���饤����ȤؤΥ쥹�ݥ󥹤�ɽ�� [[c:WEBrick::HTTPResponse]] ���֥������ȤǤ���

@raise WEBrick::HTTPStatus::MethodNotAllowed ���ꤵ�줿
       [[c:WEBrick::HTTPRequest]] ���֥������� req �����Ȥ��������Ƥ�
       �ʤ�HTTP �Υ᥽�åɤǤ��ä����ȯ�����ޤ���

--- start(env = ENV, stdin = $stdin, stdout = $stdout)     -> ()

���Ȥ�������줿�����ӥ���¹Ԥ��ޤ���

start �᥽�åɤ� service �᥽�åɤ�ƤӽФ���service �᥽�åɤϥꥯ�����Ȥ˱�����
do_XXX �᥽�åɤ�ƤӽФ��ޤ������Τ褦�ˤ��� CGI ������ץȤϼ¹Ԥ���ޤ���

@param env CGI ������ץȤ�������ä� Meta-Variables (�Ķ��ѿ�)���ݻ������ϥå��夫��
           �����Ʊ�� [] �᥽�åɤ���ä����֥������Ȥ���ꤷ�ޤ���

@param stdin �ꥯ�����ȥǡ��������ϸ��� [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���

@param stdout �쥹�ݥ󥹥ǡ����ν������ [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���

= class WEBrick::CGI::CGIError < StandardError

CGI �˴ط������㳰���饹�Ǥ���

#@end
