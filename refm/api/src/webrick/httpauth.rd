require webrick/httpauth/basicauth
require webrick/httpauth/digestauth
require webrick/httpauth/htpasswd
require webrick/httpauth/htdigest
require webrick/httpauth/htgroup

= module WEBrick::HTTPAuth

�桼��ǧ�ڤε�ǽ���󶡤���⥸�塼��Ǥ���

== Module Functions

--- basic_auth(req, res, realm){|user, pass| ... }     -> nil

Basic ǧ�ڤ�Ԥ�����Υ᥽�åɤǤ���

�֥�å��� user, pass ������Ȥ��ƸƤФ졢
�֥�å��� true ���֤���ǧ�ڤ������������Ȥˤʤ�ޤ���
�֥�å��� false ���֤���ǧ�ڤ˼��Ԥ����Ȥߤʤ���
�㳰 WEBrick::HTTPStatus::Unauthorized ���ꤲ�ޤ���

@param req ���饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[c:WEBrick::HTTPRequest]] ���֥������Ȥ���ꤷ�ޤ���

@param res [[c:WEBrick::HTTPResponse]] ���֥������Ȥ���ꤷ�ޤ���

@param realm ǧ�ڤΥ����ʸ����ǻ��ꤷ�ޤ���

  srv.mount_proc('/basic_auth') {|req, res|
    HTTPAuth.basic_auth(req, res, "WEBrick's realm") {|user, pass|
      user == 'webrick' && pass == 'supersecretpassword'
    }
    res.body = "hoge"
  }

--- proxy_basic_auth(req, res, realm){|user, pass| ... }     -> nil

�ץ������� Basic ǧ�ڹԤ�����Υ᥽�åɤǤ���

�֥�å��� user, pass ������Ȥ��ƸƤФ졢
�֥�å��� true ���֤��ȥ桼����ǧ�ڤ������Ȥˤʤ�ޤ���
�֥�å��� false ���֤���ǧ�ڤ˼��Ԥ����㳰
WEBrick::HTTPStatus::ProxyAuthenticationRequired ���ꤲ�ޤ���

@param req ���饤����Ȥ���Υꥯ�����Ȥ�ɽ�� [[c:WEBrick::HTTPRequest]] ���֥������Ȥ���ꤷ�ޤ���

@param res [[c:WEBrick::HTTPResponse]] ���֥������Ȥ���ꤷ�ޤ���

@param realm ǧ�ڤΥ����ʸ����ǻ��ꤷ�ޤ���
