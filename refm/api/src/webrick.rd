����HTTP�����С��ե졼������HTTP�����Ф���ñ�˺��ޤ���

WEBrick �ϥ����֥�åȤˤ�äƵ�ǽ���ޤ��������֥�åȤȤϲ��������饤����Ȥ������������Ƥ�������HTTP�����Ф��ºݤ˹Ԥʤ����Ȥ� �ե�������ɤ߹�����֤���fork���ƥ�����ץȤ�¹Ԥ��롦�ƥ�ץ졼�Ȥ�Ŭ�Ѥ��� �ʤ��͡��Ǥ������Ρ֥����Ф��ԤʤäƤ����͡��ʤ��ȡפ���ݲ������Τ������֥�åȤǤ���

�����֥�åȤ�Ruby�Υ��֥������ȤȤ��Ƽ�������ޤ���
����Ū�ˤ� [[c:WEBrick::HTTPServlet::AbstractServlet]] ��
���֥��饹�Υ��󥹥��󥹤Ǥ���

WEBrick �ϥ��å��������ε�ǽ���󶡤��ޤ���

 * [[url:http://www.webrick.org/]]
 * [[url:http://shogo.homelinux.org/~ysantoso/WebWiki/WEBrick.html]]
 * [[url:http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=WEBrick]]
 * Rubyist Magazine http://jp.rubyist.net/magazine/
   * WEBrick�ǥץ��������Ф��ä�ͷ�� http://jp.rubyist.net/magazine/?0002-WEBrickProxy
 * [[lib:webrick/ssl]]
 * [[lib:webrick/cgi]]

#@include(webrick/GenericServer)
#@include(webrick/HTTPServer)
#@include(webrick/HTTPProxyServer)
#@include(webrick/HTTPResponse)
#@include(webrick/HTTPRequest)
#@#include(webrick/HTTPStatus)
#@include(webrick/HTTPAuth)
#@include(webrick/HTTPAuth__BasicAuth)
#@include(webrick/HTTPAuth__DigestAuth)
#@include(webrick/HTTPAuth__Htpasswd)
#@include(webrick/HTTPAuth__Htdigest)
#@include(webrick/HTTPAuth__Htgroup)
#@#  * WEBrick::HTTPUtils
#@#  * WEBrick::HTTPUtils::FormData
#@include(webrick/HTTPVersion)
#@include(webrick/Cookie)
#@include(webrick/Log)
#@#  * WEBrick::AccessLog
#@#* WEBrick::HTTPServlet
#@include(webrick/HTTPServlet__AbstractServlet)
#@include(webrick/HTTPServlet__FileHandler)
#@include(webrick/HTTPServlet__CGIHandler)
#@include(webrick/HTTPServlet__ProcHandler)
#@#    * WEBrick::HTTPServlet::ERBHandler
