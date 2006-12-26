#@if (version >= "1.6.0")

require socket
require resolv

= redefine IPSocket

== Class Methods

--- getaddress(host)

[[m:IPSocket.getaddress]]��̾������ [[lib:resolv]] �饤�֥���
�Ȥ��ޤ���

= redefine TCPSocket

== Class Methods

--- new(host, serv, *rest)

[[m:TCPSocket.new]]�Υѥ�᡼�� local_host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

= redefine UDPSocket

== Instance Methods

--- bind(host, port)

[[m:UDPSocket#bind]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

--- connect(host, port)

[[m:UDPSocket#connect]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

--- send(mesg, flags, *rest)

4 �����η����� [[m:UDPSocket#send]] �¹Ԥ����Ȥ����ѥ�᡼�� host ��̾������
[[lib:resolv]] �饤�֥���Ȥ��ޤ���

= redefine SOCKSSocket

== Class Methods

--- new(host, serv)

[[m:SOCKSocket.new]]�Υѥ�᡼�� host ��̾������ [[lib:resolv]] 
�饤�֥���Ȥ��ޤ���

#@end
