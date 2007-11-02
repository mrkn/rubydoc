require webrick/httputils

= class WEBrick::Cookie < Object

Cookie ��ɽ�����饹�Ǥ���[[rfc:2109]] �˽�򤷤Ƥ��ޤ���
RFC2109 �� [[rfc:2965]] �ˤ���˴�����ޤ�������WEBrick::Cookie ���饹�� RFC2965 ���б����Ƥ��ޤ���

 * [[url:http://www.studyinghttp.net/translations#RFC2965]]  
 * [[url:http://www.studyinghttp.net/cookies]] 

== Class Methods

--- new(name, value)    -> WEBrick::Cookie
#@todo
������ [[c:WEBrick::Cookie]] ���֥������Ȥ����������֤��ޤ���
name �˥��å�����̾����value �˥��å������ݻ������ͤ�Ϳ���롣

@param name Cookie ��̾����ʸ����ǻ��ꤷ�ޤ���

@param value Cookie ���ͤ�ʸ����ǻ��ꤷ�ޤ���

--- parse(str)    -> [WEBrick::Cookie]

�桼��������������Ȥ��������Ƥ��� Cookie �إå����� str ��ѡ�������
������ [[c:WEBrick::Cookie]] ���֥������Ȥ�����������������֤��ޤ���
��°���η��������ͤ˽�򤷤Ƥ��뤫���ǧ���ޤ���

@param str Cookie ��ɽ��ʸ�������ꤷ�ޤ���

  require 'webrick'
  include WEBrick
  c = Cookie.parse('$Version="1"; Customer="WILE"; $Path="/foo"; P_Number="Rocket"; $Path="/foo/hoge"')
  p c[1].name, c[1].path
 
  #=> 
  "P_Number"
  "/foo/hoge"

#@since 1.8.4
--- parse_set_cookie(str)    -> WEBrick::Cookie
#@todo
�����Ф��������Ƥ��� Set-Cookie �إå����� str ��ѡ�������
������ [[c:WEBrick::Cookie]] ���֥������Ȥ��������֤��ޤ���

@param str Set-Cookie �إå����ͤ�ʸ����ǻ��ꤷ�ޤ���

  require 'webrick'
  include WEBrick
  c = Cookie.parse_set_cookie('Shipping="FedEx"; Version="1"; Path="/acme"')
  p c.name, c.value
  
  #=>
  "Shipping"
  "FedEx"

--- parse_set_cookies(str)    -> [WEBrick::Cookie]
#@todo

#@end

== Instance Methods

--- comment         -> String
--- comment=(value)

�����Ȥ�ʸ�����ɽ�����������Ǥ���

@param value �����Ȥ�ʸ����ǻ��ꤷ�ޤ���

--- domain         -> String
--- domain=(value)

�ɥᥤ��̾��ʸ�����ɽ�����������Ǥ���

@param value �ɥᥤ��̾��ɽ��ʸ�������ꤷ�ޤ���

--- expires    -> Time
--- expires=(value)

ͭ�����¤� [[c:Time]]���֥������Ȥ�ɽ�����������Ǥ���

@param value ͭ�����¤� [[c:Time]] ���֥������Ȥޤ���ʸ�������ꤷ�ޤ���

--- max_age          -> Integer
--- max_age=(value)

���å����μ�̿������(ñ�̤���)��ɽ�����������Ǥ���

@param value ���å����μ�̿�����������ǻ��ꤷ�ޤ���0 ��ľ�����˴����������̣���롣

--- name   -> String

Cookie ��̾����ʸ������֤��ޤ���

--- path          -> String
--- path=(value)

�ѥ�̾��ʸ�����ɽ�����������Ǥ���

@param value �ѥ�̾��ʸ����ǻ��ꤷ�ޤ���

--- secure         -> bool
--- secure=(value) -> bool

���å�����Secure°���򿿵��ͤ�ɽ�����������Ǥ���

@param value ���å�����Secure°���򿿵��ͤǻ��ꤷ�ޤ���

--- to_s    -> String

���å�����ʸ����ˤ����֤��ޤ���

--- value       -> String
--- value=(str)

���å������ͤ�ʸ�����ɽ�����������Ǥ���

@param str ���å������ͤ�ʸ����ǻ��ꤷ�ޤ���

--- version           -> Integer
--- version=(value)

Cookie �ΥС�������ֹ��������ɽ�����������Ǥ���

@param value Cookie �ΥС�������ֹ�������ǻ��ꤷ�ޤ���
