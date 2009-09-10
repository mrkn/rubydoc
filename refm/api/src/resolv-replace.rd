#@if (version >= "1.6.0")
require resolv

̾������ resolv ����Ѥ��뤿��Υ饤�֥��Ǥ���

= redefine IPSocket

== Class Methods

--- getaddress(host) -> String
[[m:IPSocket.getaddress]] ���֤�������
[[lib:resolv]] �饤�֥���Ȥ�̾����褷�ޤ���

@param host �ۥ���̾����ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

= redefine TCPSocket

== Class Methods

--- open(host, serv, [, local_host, local_service]) -> TCPSocket
--- new(host, serv, [, local_host, local_service]) -> TCPSocket
[[m:TCPSocket.new]] �Υѥ�᡼�� host �� local_host 
��̾������ [[lib:resolv]] �饤�֥���Ȥ��ޤ���

@param host           �ۥ���̾���ޤ��� octet decimal �ˤ�륤�󥿡��ͥåȥ��ɥ쥹�򼨤�ʸ�������ꤷ�ޤ���
@param service        /etc/services (�ޤ��� NIS) ����Ͽ����Ƥ��륵���ӥ�̾���ݡ����ֹ����ꤷ�ޤ���
@param local_host     �ۥ���̾���ޤ��� octet decimal �ˤ�륤�󥿡��ͥåȥ��ɥ쥹�򼨤�ʸ�������ꤷ�ޤ���
@param local_service  /etc/services (�ޤ��� NIS) ����Ͽ����Ƥ��륵���ӥ�̾���ݡ����ֹ����ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

= redefine UDPSocket

== Instance Methods

--- bind(host, port) -> Integer
[[m:UDPSocket#bind]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

@param host bind����ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@param port bind����ݡ��Ȥ���ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

--- connect(host, port) -> Integer
[[m:UDPSocket#connect]] �Υѥ�᡼�� host ��̾������ 
[[lib:resolv]] �饤�֥���Ȥ��ޤ���

@param host connect ����ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@param port connect ����ݡ��Ȥ���ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

--- send(mesg, flags[, dest_sockaddr]) -> Integer
--- send(mesg, flags, host, port) -> Integer
4 �����η����� [[m:UDPSocket#send]] �¹Ԥ����Ȥ���
�ѥ�᡼�� host ��̾������
[[lib:resolv]] �饤�֥���Ȥ��ޤ���

@param mesg ����ǡ�����ʸ�����Ϳ���ޤ���
@param flags �ե饰����ꤷ�ޤ���
@param host �ǡ�����������Υۥ��Ȥ���ꤷ�ޤ���
@param port �ǡ�����������Υݡ��Ȥ���ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

= redefine SOCKSSocket

== Class Methods

--- new(host, serv) -> SOCKSSocket
[[m:SOCKSSocket.new]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

@param host �ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@param serv �ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@raise SocketError ̾�����˼��Ԥ�������ȯ�����ޤ���

#@end
