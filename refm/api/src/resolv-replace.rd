#@if (version >= "1.6.0")
̾������ resolv ����Ѥ��뤿��Υ饤�֥��Ǥ���

require resolv

= redefine IPSocket

== Class Methods

--- getaddress(host)
#@todo

[[m:IPSocket.getaddress]]��̾������ [[lib:resolv]] �饤�֥���
�Ȥ��ޤ���

= redefine TCPSocket

== Class Methods

--- new(host, serv, *rest)
#@todo

[[m:TCPSocket.new]]�Υѥ�᡼�� local_host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

= redefine UDPSocket

== Instance Methods

--- bind(host, port)
#@todo

[[m:UDPSocket#bind]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

--- connect(host, port)
#@todo

[[m:UDPSocket#connect]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

--- send(mesg, flags, *rest)
#@todo

4 �����η����� [[m:UDPSocket#send]] �¹Ԥ����Ȥ����ѥ�᡼�� host ��̾������
[[lib:resolv]] �饤�֥���Ȥ��ޤ���

= redefine SOCKSSocket

== Class Methods

--- new(host, serv)
#@todo

[[m:SOCKSocket.new]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

#@end
