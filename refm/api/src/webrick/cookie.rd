#@#require time
require webrick/httputils

= class WEBrick::Cookie < Object

=== ����

[[c:WEBrick::Cookie]]���饹�����ꤵ�줿�ͤ���������Τ��ɤ�����̩�˳�ǧ���ʤ���

[[c:WEBrick::Cookie]]���饹��RFC2109�μ����Ǥ��롣
RFC2109��RFC2965�ˤ���˴����줿����
[[c:WEBrick::Cookie]]���饹��RFC2965�����Ƥ��б����Ƥ��ʤ���

=== ����

 *[[url:http://www.mars.dti.ne.jp/~torao/rfc/rfc2109-ja.txt]]
  RFC2109�����ܸ�����
 *[[url:http://www.studyinghttp.net/translations#RFC2965]]
  RFC2965�����ܸ�����
 *[[url:http://www.studyinghttp.net/cookies]]
  ���å����λȤ�����
 *[[url:http://shogo.homelinux.org/~ysantoso/webrickguide/html/Cookie.html]]
  WEBrick::Cookie�β���(�Ѹ�)��

== Class Methods

--- new(name, value)
#@todo
������[[c:WEBrick::Cookie]]���֥������Ȥ��������롣
name�˥��å�����̾����value�˥��å������ݻ������ͤ�Ϳ���롣

--- parse(str)
#@todo
Ϳ����줿ʸ����str���ᡢ������[[c:WEBrick::Cookie]]���֥������Ȥ�������������Ȥ����֤���

#@since 1.8.4
--- parse_set_cookie(str)
#@todo
#@end

== Instance Methods

--- comment
#@todo
�����Ȥ��֤���

--- comment=(value)
#@todo
�����Ȥ����ꤹ�롣
value��ʸ����

--- domain
#@todo
�ɥᥤ��̾���֤���

--- domain=(value)
#@todo
�ɥᥤ��̾�����ꤹ�롣
value��ʸ����

--- expires
#@todo
ͭ�����¤�[[c:Time]]���֥������Ȥ��֤���

--- expires=(value)
#@todo
ͭ�����¤����ꤹ�롣
value��[[c:Time]]���֥������Ȥޤ���ʸ����

--- max_age
#@todo
���å����μ�̿���֤���

--- max_age=(value)
#@todo
���å����μ�̿����ñ�̤����ꤹ�롣
value������������0��ľ�����˴����������̣���롣

--- name
#@todo
̾�����֤���

--- path
#@todo
�ѥ�̾���֤���

--- path=(value)
#@todo
�ѥ�̾�����ꤹ�롣
value��ʸ����

--- secure
#@todo
���å�����Secure°�����֤���

--- secure=(value)
#@todo
���å�����Secure°�������ꤹ�롣
value�Ͽ����͡�

--- to_s
#@todo
���å�����ʸ���󲽤��롣

--- value
#@todo
���å������ݻ������ͤ��֤���

--- value=(str)
#@todo
���å������ݻ������ͤ����ꤹ�롣
str��ʸ����

--- version
#@todo
�С�������ֹ���֤���

--- version=(value)
#@todo
�С�������ֹ�����ꤹ�롣
value��������
