require webrick/httputils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPServlet::HTTPServletError < StandardError
#@todo

= class WEBrick::HTTPServlet::AbstractServlet < Object

�����֥�åȤ���ݥ��饹�Ǥ��������� AbstractServlet �Υ��֥��饹�ǹԤ��ޤ���

�����֥�åȤϰʲ��Τ褦�˻Ȥ��ޤ���[[c:WEBrick::HTTPServlet::CGIHandler]] ��
[[lib:webrick/httpservlet/cgihandler]] ���󶡤���Ƥ��륵���֥�åȤǤ���
CGIHandler �� AbstractServlet �Υ��֥��饹�Ǥ���

 require 'webrick'
 srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
                                 :BindAddress => '127.0.0.1',
                                 :Port => 20080})
 srv.mount('/view.cgi', WEBrick::HTTPServlet::CGIHandler, 'view.rb')
 trap("INT"){ srv.shutdown }
 srv.start

��Υ�����ץȤǤϰʲ��Τ褦��ή��� view.rb �ϼ¹Ԥ���ޤ���

 (1) �����ФΥѥ� /view.cgi �� CGIHandler ���ޥ���Ȥˤ���ӤĤ����ޤ���
 (2) �ѥ� /view.cgi �˥������������뤿�Ӥ˥�����(WEBrick::HTTPServer ���֥�������)�� 'view.rb' 
     ������Ȥ��� CGIHandler ���֥������Ȥ��������ޤ���
 (3) �����Фϥꥯ�����ȥ��֥������Ȥ�����Ȥ��� CGIHandler#service �᥽�åɤ�ƤӤޤ���
 (4) CGIHandler ���֥������Ȥ� view.rb �� CGI ������ץȤȤ��Ƽ¹Ԥ��ޤ���

���Τ褦�� [[c:WEBrick]] �Ǥ� Web �����Фε�ǽ������ʬ�������֥�åȤη����󶡤���Ƥ��ޤ���
�ޤ������֥�åȤ�������뤳�Ȥˤ�꿷���ʵ�ǽ�� Web �����Ф��ɲä��뤳�Ȥ�Ǥ��ޤ���

== Class Methods

--- new(server, *options)    -> WEBrick::HTTPServlet::AbstractServlet

�����֥�åȤ����������֤��ޤ���
[[c:WEBrick::HTTPServer]] ���֥������Ȥ� server �˼��Ȥ���ꤷ�ƥ����֥�åȤ��������ޤ���

@param server �����֥�åȤ��������� WEBrick::HTTPServer ���֥������Ȥ���ꤷ�ޤ���

@param options [[m:WEBrick::HTTPServer#mount]] ��3�����ʹߤ˻��ꤵ�줿�ͤ����Τޤ�Ϳ�����ޤ���

--- get_instance(server, *options)    -> WEBrick::HTTPServlet::AbstractServlet

new(server, *options) ��ƤӽФ��ƥ����֥�åȤ����������֤��ޤ���
[[c:WEBrick::HTTPServer]] ���֥������ȤϼºݤˤϤ��� get_instance �᥽�åɤ�ƤӽФ���
�����֥�åȤ��������ޤ���

�ä���ͳ��̵���¤� AbstractServlet �Υ��֥��饹�����Υ᥽�åɤ���������ɬ�פϤ���ޤ���

@param server [[m:WEBrick::HTTPServer#mount]] ��3�����ʹߤ˻��ꤵ�줿�ͤ����Τޤ�Ϳ�����ޤ���

@param options [[m:WEBrick::HTTPServer#mount]] ��3�����ʹߤ˻��ꤵ�줿�ͤ����Τޤ�Ϳ�����ޤ���

== Instance Methods

--- service(req, res)    -> ()

���ꤵ�줿 [[c:WEBrick::HTTPRequest]] ���֥������� req �� [[m:WEBrick::HTTPRequest#request_method]] �˱����ơ�
���Ȥ� do_GET, do_HEAD, do_POST, do_OPTIONS... �����줫�Υ᥽�åɤ� req �� res ������Ȥ��ƸƤӤޤ���

[[m:WEBrick::HTTPServer]] ���֥������Ȥϥ��饤����Ȥ���Υꥯ�����Ȥ����뤿�Ӥ�
�����֥�åȥ��֥������Ȥ������� service �᥽�åɤ�ƤӤޤ���

�ä���ͳ��̵���¤� AbstractServlet �Υ��֥��饹�����Υ᥽�åɤ��������ɬ�פϤ���ޤ���

@param req ���饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[m:WEBrick::HTTPRequest]] ���֥������ȤǤ���

@param res ���饤����ȤؤΥ쥹�ݥ󥹤�ɽ�� [[m:WEBrick::HTTPResponse]] ���֥������ȤǤ���

@raise WEBrick::HTTPStatus::MethodNotAllowed 
       ���ꤵ�줿 [[c:WEBrick::HTTPRequest]] ���֥�������  req �����Ȥ��������Ƥ��ʤ� 
       HTTP �Υ᥽�åɤǤ��ä����ȯ�����ޤ���


--- do_GET(req, res)        -> ()
--- do_HEAD(req, res)       -> ()
--- do_POST(req, res)       -> ()
--- do_PUT(req, res)        -> ()
--- do_DELETE(req, res)     -> ()
--- do_OPTIONS(req, res)    -> ()

���Ȥ� service �᥽�åɤ��� HTTP �Υꥯ�����Ȥ˱�����
�ƤФ��᥽�åɤǤ���AbstractServlet �Υ��֥��饹�Ϥ����Υ᥽�åɤ�Ŭ�ڤ˼�����
�ʤ���Ф����ޤ����֤��ͤ��ä˵��ꤵ��Ƥ��ޤ���

���饤����Ȥ��Ȥ���ǽ���Τ��� RFC ��������줿 HTTP �Υ᥽�åɤϤ��٤Ƽ�������ɬ�פ�����ޤ���
���饤����Ȥ���Υꥯ�����Ȥ˻Ȥ��ʤ���ʬ���äƤ���᥽�åɤϼ������ʤ��Ƥ⤫�ޤ��ޤ���
��������Ƥ��ʤ� HTTP �᥽�åɤǤ��ä���硢���Ȥ� service �᥽�åɤ�
�㳰��ȯ�������ޤ���

��:

  require 'webrick'
  class HogeServlet < WEBrick::HTTPServlet::AbstractServlet 
    def do_GET(req, res)
       res.body = 'hoge'
    end
  end

  srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
                                  :BindAddress => '127.0.0.1',
                                  :Port => 20080})
  srv.mount('/', HogeServlet)
  trap("INT"){ srv.shutdown }
  srv.start
