require webrick/httpauth/basicauth
require webrick/httpauth/digestauth
require webrick/httpauth/htpasswd
require webrick/httpauth/htdigest
require webrick/httpauth/htgroup

= module WEBrick::HTTPAuth

[[unknown:��ɮ���罸]]

[[url:http://shogo.homelinux.org/~ysantoso/webrickguide/html/HTTP_Authentication.html]]

== Module Functions

--- basic_auth(req, res, realm){|user, pass| ... }
Basic ǧ�ڤ�Ԥ����֥�å��� user, pass ������Ȥ��ƸƤФ졢
�֥�å��� true ���֤��ȥ桼����ǧ�ڤ������Ȥˤʤ롣
�֥�å��� false ���֤���ǧ�ڤ˼��Ԥ���
�㳰 WEBrick::HTTPStatus::Unauthorized ���ꤲ�롣

  srv.mount_proc('/basic_auth') {|req, res|
    HTTPAuth.basic_auth(req, res, "WEBrick's realm") {|user, pass|
      user == 'webrick' && pass == 'supersecretpassword'
    }
    res.body = "hoge"
  }

--- proxy_basic_auth(req, res, realm){|user, pass| ... }
�ץ����� [[c:WEBrick::HTTPProxyServer]] �Τ���� Basic ǧ�ڤ�Ԥ���
�֥�å��� user, pass ������Ȥ��ƸƤФ졢
�֥�å��� true ���֤��ȥ桼����ǧ�ڤ������Ȥˤʤ롣
�֥�å��� false ���֤���ǧ�ڤ˼��Ԥ����㳰
WEBrick::HTTPStatus::ProxyAuthenticationRequired ���ꤲ�롣
