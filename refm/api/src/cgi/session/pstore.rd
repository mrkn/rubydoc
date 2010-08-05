require cgi/session

= class CGI::Session::PStore < Object

���å�������¸��Ȥ��� [[c:PStore]] ����Ѥ��ޤ���

== Class Methods

--- new(session, option = {}) -> CGI::Session::FileStore

���Ȥ��������ޤ���

[[c:CGI::Session]] ���饹�����ǻ��Ѥ��ޤ���
�桼��������Ū�˸ƤӽФ�ɬ�פϤ���ޤ���

@param session [[c:CGI::Session]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param option �ϥå������ꤷ�ޤ���

�ʲ���ʸ����򥭡��Ȥ��ƻ��ꤹ�뤳�Ȥ��Ǥ��ޤ���

: tmpdir
    ���å����ǡ������������ǥ��쥯�ȥ��̾������ꤷ�ޤ���
    �ǥե���Ȥ� [[m:Dir.tmpdir]] �Ǥ���

: prefix
    ���å����ǡ����Υե�����̾��Ϳ����ץ�ե��å�������ꤷ�ޤ���
    �ǥե���Ȥ϶�ʸ����Ǥ���

@raise CGI::Session::NoSession ���å���󤬽��������Ƥ��ʤ�����ȯ�����ޤ���

== Instance Methods

#@until 1.8.2
--- check_id(id) -> bool
#@# nodoc
#@end

--- close -> ()
#@# discard
���å����ξ��֤�ե��������¸���ƥե�������Ĥ��ޤ���

--- delete -> ()
#@# discard

���å����������ƥե�����������ޤ���

--- restore -> Hash

���å����ξ��֤�ե����뤫�����������ϥå�����֤��ޤ���

--- update -> ()
#@# discard

���å����ξ��֤�ե��������¸���ޤ���

#@until 1.8.5
= redefine CGI::Session

== Instance Methods

--- []=(key, value)

���ꤵ�줿�������ͤ����ꤷ�ޤ���

@param key ��������ꤷ�ޤ���

@param val �ͤ���ꤷ�ޤ���

#@end
