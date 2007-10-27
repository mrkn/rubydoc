require webrick/compat
require webrick/version
require webrick/config
require webrick/log
require webrick/server
require webrick/utils
require webrick/accesslog
require webrick/htmlutils
require webrick/httputils
require webrick/cookie
require webrick/httpversion
require webrick/httpstatus
require webrick/htprequest
require webrick/httpresponse
require webrick/httpserver
require webrick/httpservlet
require webrick/httpauth

����HTTP�����С��ե졼�����Ǥ���HTTP�����Ф���ñ�˺��ޤ���

WEBrick �ϥ����֥�åȤˤ�äƵ�ǽ���ޤ��������֥�åȤȤ�
�����Фε�ǽ�򥪥֥������Ȳ�������ΤǤ���
�ե�������ɤ߹�����֤���fork���ƥ�����ץȤ�¹Ԥ��롦�ƥ�ץ졼�Ȥ�Ŭ�Ѥ��� 
�ʤɡ��֥����Ф��ԤʤäƤ����͡��ʤ��ȡפ���ݲ������֥������Ȥˤ�����Τ�
�����֥�åȤǤ��������֥�åȤ� [[c:WEBrick::HTTPServlet::AbstractServlet]] ��
���֥��饹�Υ��󥹥��󥹤Ȥ��Ƽ�������ޤ���

WEBrick �ϥ��å��������ε�ǽ���󶡤��ޤ���

=== WEBrick �γ���

�ʲ��� Web �����ФȤ��ƴ�����ư��륹����ץȤǤ���

 require 'webrick'
 srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
                                 :BindAddress => '127.0.0.1',
                                 :Port => 20080})
 srv.mount('/view.cgi', WEBrick::HTTPServlet::CGIHandler, 'view.rb')
 srv.mount('/foo.html', WEBrick::HTTPServlet::FileHandler, 'hoge.html')
 trap("INT"){ srv.shutdown }
 srv.start

�֥饦���� http://127.0.0.1:20080/ �˥����������뤳�Ȥˤ�äƳ�ǧ�Ǥ��ޤ���
�ޤ� http://127.0.0.1:20080/view.cgi �˥�����������ȥ����ȥǥ��쥯�ȥ���֤���Ƥ���
view.rb ��CGI������ץȤȤ��Ƽ¹Ԥ���ޤ���http://127.0.0.1:20080/foo.html �˥������������
�����ȥǥ��쥯�ȥ겼�� hoge.html �����Ƥ�ɽ������ޤ��� 

��Υ�����ץȤǤϰʲ��Τ褦��ή��� view.rb �ϼ¹Ԥ���ޤ���

 (1) �����ФΥѥ� /view.cgi �� CGIHandler ���ޥ���Ȥˤ���ӤĤ����ޤ���
 (2) �ѥ� /view.cgi �˥������������뤿�Ӥ˥����Ф� 'view.rb' ������Ȥ��� CGIHandler ���֥������Ȥ��������ޤ���
 (3) �����Фϥꥯ�����ȥ��֥������Ȥ�����Ȥ��� CGIHandler#serve �᥽�åɤ�ƤӤޤ���
 (4) CGIHandler ���֥������Ȥ� view.rb �� CGI ������ץȤȤ��Ƽ¹Ԥ��ޤ���

���Τ褦�� WEBrick �Ǥ� Web �����Фε�ǽ������ʬ�������֥�åȤη����󶡤���Ƥ��ޤ���
�ޤ������֥�åȤ�������뤳�Ȥˤ�꿷���ʵ�ǽ�� Web �����Ф��ɲä��뤳�Ȥ�Ǥ��ޤ���

=== ���

 * [[url:http://www.webrick.org/]]
 * [[url:http://shogo.homelinux.org/~ysantoso/WebWiki/WEBrick.html]]
 * [[url:http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=WEBrick]]
 * Rubyist Magazine http://jp.rubyist.net/magazine/
   * WEBrick�ǥץ��������Ф��ä�ͷ�� http://jp.rubyist.net/magazine/?0002-WEBrickProxy
 * [[lib:webrick/ssl]]
 * [[lib:webrick/cgi]]

#@# �Խ�����ѤΥ��


 * [[lib:webrick/compat]]
 * [[lib:webrick/version]]
 * [[lib:webrick/config]]
 * [[lib:webrick/log]]
 * [[lib:webrick/server]]
 * [[lib:webrick/utils]]
 * [[lib:webrick/accesslog]]
 * [[lib:webrick/htmlutils]]
 * [[lib:webrick/httputils]]
 * [[lib:webrick/cookie]]
 * [[lib:webrick/httpversion]]
 * [[lib:webrick/httpstatus]]
 * [[lib:webrick/httprequest]]
 * [[lib:webrick/httpresponse]]
 * [[lib:webrick/httpserver]]
 * [[lib:webrick/httpservlet]]
 * [[lib:webrick/httpauth]]
