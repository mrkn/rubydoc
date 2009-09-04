#@if (version >= "1.6.0")
require socket
require timeout

DNS�ˤ��̾������Ԥ��饤�֥��Ǥ��� Ruby �ǽ񤫤�Ƥ��뤿�� thread-aware �Ǥ��ꡢ�����¿���Υۥ���̾���褹�뤳�Ȥ��Ǥ��ޤ���

DNS �⥸�塼���Ȥ����Ȥǡ����ޤ��ޤʥ꥽������ľ�ܥ�å����åפǤ��ޤ���

�ʤ���ñ�˥ۥ���̾���� IP ���ɥ쥹�������������Ǥ���С�
[[lib:socket]] �饤�֥��� [[m:IPSocket.getaddress]] �ʤɤ����ѤǤ��ޤ���

=== ��:
  Resolv.getaddress("www.ruby-lang.org")
  Resolv.getname("210.251.121.214").to_s
  Resolv::DNS.new.getresources("www.ruby-lang.org", Resolv::DNS::Resource::IN::A).collect {|r| r.address}
  Resolv::DNS.new.getresources("ruby-lang.org", Resolv::DNS::Resource::IN::MX).collect {|r| [r.exchange.to_s, r.preference]}


=== Bugs
#@#NIS is not supported.
NIS �ϥ��ݡ��Ȥ���Ƥ��ޤ���


= class Resolv < Object
�꥾��Ф�ɽ�����饹�Ǥ���
���Υ��饹���Τϼºݤˤ�̾�����򤻤���
[[m:Resolv.new]] ��Ϳ����줿�꥾��Ф˽��
��礻�뤳�Ȥ������ޤ���

���Υ��饹�Υ��饹�᥽�åɤ�̾�����򤷤����ˤϡ�
������ /etc/hosts, DNS �ν����礻�ޤ���

�����礻������ǡ�����꥾��Ф�1�İʾ��
��̤��֤�����硢����ʹߤΥ꥾��Фˤ�
�䤤��碌�򤷤ޤ���

== Class Methods
--- new(resolvers = [Hosts.new, DNS.new]) -> Resolv
resolvers ��Ϳ�����꥾��Ф��������Ƭ������
̾�������褦�ʡ��������꥽��Х��֥������Ȥ��֤��ޤ���

resolvers �γ����Ǥ� each_address �� each_name �Ȥ���
�᥽�åɤ���äƤ��ʤ���Фʤ�ޤ���

@param resolvers �꥾��Ф�����

--- getaddress(name) -> String
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

  Resolv.getaddress("localhost") #=> "127.0.0.1"
  Resolv.getaddress("www.ruby-lang.org") #=> "221.186.184.68"

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getaddresses(name) -> [String]
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���
��å����åפ˼��Ԥ������϶��������֤���ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- each_address(name) {|address| ...} -> ()
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
�ƥ�å����å׷�̤Υ��ɥ쥹���Ф��ƥ֥�å���ɾ�����ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- getname(address) -> String
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤κǽ�Υۥ���̾��ʸ������֤��ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

  Resolv.getname("221.186.184.68") #=> "carbon.ruby-lang.org"

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getnames(address) -> [String]
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤Υۥ���̾�ꥹ�Ȥ��֤��ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

--- each_name(address) {|name| ...} -> ()
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
�ƥ�å����å׷�̤Υۥ���̾���Ф��ƥ֥�å���ɾ�����ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

== Instance Methods

--- getaddress(name) -> String
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getaddresses(name) -> [String]
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���

��å����åפ˼��Ԥ������϶��������֤���ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- each_address(name) {|name| ...} -> ()
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
�ƥ�å����å׷�̤Υ��ɥ쥹���Ф��ƥ֥�å���ɾ�����ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- getname(address) -> String
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤κǽ�Υۥ���̾��ʸ������֤��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getnames(address) -> [String]
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤Υۥ���̾�ꥹ�Ȥ��֤��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

--- each_name(address) {|name| ...} -> ()
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
�ƥ�å����å׷�̤Υۥ���̾���Ф��ƥ֥�å���ɾ�����ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

== Constants

--- DefaultResolver -> Resolv
[[c:Resolv]] �γƥ��饹�᥽�åɤ�ƤӤ������Ȥ���
���Ѥ����꥾��ФǤ���

--- ADDRESSREGEX -> Regexp
IP���ɥ쥹�˥ޥå���������ɽ���Ǥ���

= class Resolv::ResolvError < StandardError
̾�����˼��Ԥ����Ȥ���ȯ�������㳰�Υ��饹�Ǥ���

#@# = class Resolv::ResolvTimeout < TimeoutError
#@# ̾����褬�����ॢ���Ȥ����Ȥ���ȯ�������㳰�Υ��饹�Ǥ���
#@# 
#@# �����㳰�ϥ饤�֥�������� rescue �����
#@# Resolv::ResolvError ���Ѵ������Τǡ��桼����
#@# ���Ѥ��ʤ��Ϥ��Ǥ���

= class Resolv::Hosts < Object

/etc/hosts (Windows �Ǥ���� 
%SystemRoot%\System32\drivers\etc\hosts �ʤ�)
����Ѥ���ۥ���̾�꥾��ФǤ���

== Class Methods

--- new(hosts = DefaultFileName) -> Resolv::Hosts
hosts �Ȥ����ե�����̾�Υե��������󸻤Ȥ���
�꥾��Ф����������֤��ޤ���

@param hosts �ۥ��Ⱦ��󤬽񤫤줿�ե������̾����ʸ�����Ϳ���ޤ���

== Instance Methods

--- getaddress(name) -> String
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getaddresses(name) -> [String]
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���

��å����åפ˼��Ԥ������϶��������֤���ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- each_address(name) {|name| ...} -> ()
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
�ƥ�å����å׷�̤Υ��ɥ쥹���Ф��ƥ֥�å���ɾ�����ޤ���

@param name �ۥ���̾��ʸ�����Ϳ���ޤ���

--- getname(address) -> String
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤κǽ�Υۥ���̾��ʸ������֤��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getnames(address) -> [String]
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤Υۥ���̾�ꥹ�Ȥ��֤��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

--- each_name(address) {|name| ...} -> ()
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
�ƥ�å����å׷�̤Υۥ���̾���Ф��ƥ֥�å���ɾ�����ޤ���

��å����åפ� /etc/hosts, DNS �ν�ǹԤ��ޤ���

@param address IP���ɥ쥹��ʸ�����Ϳ���ޤ���

#@# --- lazy_initialize -> Resolv::Hosts

#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# [[m:Resolv::Hosts.new]] �ǻ��ꤷ���ե�������ɤߤ��ߡ�
#@# ��å����åץơ��֥���������ޤ���

== Constants

--- DefaultFileName -> String

�����ƥ�ɸ��Ρ�
�ۥ��Ⱦ��󤬽񤫤줿�ե������̾���Ǥ���


= class Resolv::DNS < Object

���Υ��饹�� DNS �����Ѥ���̾�����򤹤�꥾��Ф�
ɽ���ޤ���

���Υ��饹�ϼºݤˤϲ��̤Υ��饹�˽�������ꤷ�ޤ���

DNS�ˤĤ��Ƥϰʲ��򻲾Ȥ��Ƥ���������
  * STD0013
  * [[RFC:1035]]
  * [[url:ftp://ftp.isi.edu/in-notes/iana/assignments/dns-parameters]]
  * etc.

== Class Methods

#@until 1.8.1
--- new(resolv_conf = '/etc/resolv.conf') -> Resolv::DNS
#@else
--- new(resolv_conf = nil) -> Resolv::DNS
#@end

������ DNS �꥾��Ф��������ޤ���

#@since 1.8.2
resolv_conf �� nil �ξ���
/etc/resolv.conf �⤷���ϥץ�åȥե������ͭ��
DNS��������Ѥ��ޤ���
resolv_conf ��ʸ����ξ��� /etc/resolv.conf ��
Ʊ���ե����ޥåȤΥե��������������Ѥ��ޤ���
resolv_conf ���ϥå���ξ��ϡ�:nameserver, :search, :ndots
�Ȥ������������Ѳ�ǽ�Ǥ���
���줾��ΰ�̣�� [[man:resolv.conf(5)]] �򻲾Ȥ��Ƥ���������

   Resolv::DNS.new(:nameserver => ['210.251.121.21'],
                   :search => ['ruby-lang.org'],
                   :ndots => 1)
#@end

#@until 1.8.1
@param resolv_conf DNS������ե�����̾��ʸ�����Ϳ���ޤ�
#@else
@param resolv_conf DNS�������Ϳ���ޤ���
#@end

--- open(*args)
--- open(*args){|dns| ...}

������ DNS �꥾��Ф��������ޤ���
�֥�å���Ϳ�����������������꥾��Фǥ֥�å���ƤӤ�����
�֥�å���λ���˥꥾��Ф��Ĥ��ޤ���

�֥�å���Ϳ���ʤ��ä����� [[m:Resolv::DNS.new]] ��
Ʊ���Ǥ���

@param args DNS�������Ϳ���ޤ�����̣�� [[m:Resolv::DNS.new]] 
            �ΰ�����Ʊ���Ǥ���

== Instance Methods

--- getaddress(name) -> Resolv::IPv4 | Resolv::IPv6
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���

@param name �ۥ���̾��ʸ����⤷����[[c:Resolv::DNS::Name]]�Υ��󥹥��󥹤�Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getaddresses(name) -> [Resolv::IPv4 | Resolv::IPv6]
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���

��å����åפ˼��Ԥ������϶��������֤���ޤ���

@param name �ۥ���̾��ʸ����⤷����[[c:Resolv::DNS::Name]]�Υ��󥹥��󥹤�Ϳ���ޤ���

--- each_address(name) {|name| ...} -> ()
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
�ƥ�å����å׷�̤Υ��ɥ쥹���Ф��ƥ֥�å���ɾ�����ޤ���

@param name �ۥ���̾��ʸ����⤷����[[c:Resolv::DNS::Name]]�Υ��󥹥��󥹤�Ϳ���ޤ���

--- getname(address) -> Resolv::DNS::Name
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤κǽ�Υۥ���̾���֤��ޤ���

@param address IP���ɥ쥹��ʸ���� Resolv::IPv4 �Υ��󥹥��󥹡�
               Resolv::IPv6 �Υ��󥹥��󥹡��Τ����줫Ϳ���ޤ���
               
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getnames(address) -> [Resolv::DNS::Name]
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤Υۥ���̾�ꥹ�Ȥ��֤��ޤ���

@param address IP���ɥ쥹��ʸ���� Resolv::IPv4 �Υ��󥹥��󥹡�
               Resolv::IPv6 �Υ��󥹥��󥹡��Τ����줫Ϳ���ޤ���

--- each_name(address) {|name| ...} -> ()
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
�ƥ�å����å׷�̤Υۥ���̾���Ф��ƥ֥�å���ɾ�����ޤ���

@param address IP���ɥ쥹��ʸ���� Resolv::IPv4 �Υ��󥹥��󥹡�
               Resolv::IPv6 �Υ��󥹥��󥹡��Τ����줫Ϳ���ޤ���

--- getresource(name, typeclass) -> object
--- getresources(name, typeclass) -> [object]
--- each_resource(name, typeclass) {|resource| ...} -> ()

name���б�����DNS�꥽�����쥳���ɤ�������ޤ���

getresource �Ϻǽ�˸��Ĥ��ä��꥽������
getresources �ϸ��Ĥ��ä��꥽�������Ƥ��֤��ޤ���
each_resource �ϸ��Ĥ��ä��꥽������֥�å����Ϥ��ޤ���

typeclass �ϰʲ��Τ����줫�Ǥ���
  * [[c:Resolv::DNS::Resource::IN::ANY]]
  * [[c:Resolv::DNS::Resource::IN::NS]]
  * [[c:Resolv::DNS::Resource::IN::CNAME]]
  * [[c:Resolv::DNS::Resource::IN::SOA]]
  * [[c:Resolv::DNS::Resource::IN::HINFO]]
  * [[c:Resolv::DNS::Resource::IN::MINFO]]
  * [[c:Resolv::DNS::Resource::IN::MX]]
  * [[c:Resolv::DNS::Resource::IN::TXT]]
  * [[c:Resolv::DNS::Resource::IN::A]]
  * [[c:Resolv::DNS::Resource::IN::WKS]]
  * [[c:Resolv::DNS::Resource::IN::PTR]]
  * [[c:Resolv::DNS::Resource::IN::AAAA]]
  * [[c:Resolv::DNS::Resource::IN::SRV]]

��å����å׷�̤� Resolv::DNS::Resource �ʤΥ��֥��饹�ˤΥ��󥹥��󥹤Ȥʤ�ޤ���
typeclass �� Resolv::DNS::Resource::IN::ANY �ʳ�����ꤷ�����ˤ�
���Υ��饹�Υ��󥹥��󥹤��֤��ޤ���

@param name ��å����å��оݤȤʤ�̾���� [[c:Resolv::DNS::Name]] �ޤ��� String �ǻ��ꤷ�ޤ���
@param typeclass �쥳���ɼ��̤���ꤷ�ޤ���
@raise Resolv::ResolvError getresource�ǥ�å����åפ˼��Ԥ�������ȯ�����ޤ���

--- close -> ()

DNS�꥾��Ф��Ĥ��ޤ���

#@# --- extract_resources(msg, name, typeclass) {|resource| ...}

#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# DNS�����Ф�������� msg �� name �� typeclass �ǥե��륿��󥰤���
#@# ���η�̤�֥�å����Ϥ��ޤ���

#@# @param msg DNS�����Ф����������Ϳ���ޤ���[[c:Resolv::DNS::Message]] �Υ��󥹥��󥹤�Ϳ���뤳�Ȥ��Ǥ��ޤ���
#@# @param name �ե��륿��󥰤���̾������ꤷ�ޤ���
#@# @param typeclass �ե��륿��󥰤���DNS�쥳���ɼ��̤�ɽ���ޤ���[[m:Resolv::DNS#getresource]] �� typeclass ��Ʊ�����饹��Ϳ���ޤ���
#@# --- lazy_initialize -> Resolv::DNS

#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# [[m:Resolv::DNS.new]] ��Ϳ��������ǥ��󥹥��󥹤�ºݤ˽�������ޤ���

== Constants

#@# --- DNSThreadGroup

#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# #@until 1.8.5
#@# Resolv::DNS���������Ѥ���� [[c:ThreadGroup]] �Ǥ���
#@# #@else
#@# ��������Ϥ�Ϥ����Ѥ���Ƥ��ޤ���
#@# #@end

--- Port -> Integer

�ǥե���Ȥ� DNS �ݡ����ֹ�Ǥ���

--- UDPSize -> Integer

�ǥե���Ȥ� UDP �ѥ��åȥ������Ǥ���

#@# = class Resolv::DNS::Requester < Object

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# DNS�����Ф˥ꥯ�����Ȥ����륯�饹�Υ١������饹�Ȥʤ륯�饹�Ǥ���
#@# �Ѿ��������Ѥ��ޤ���

#@# == Class Methods

#@# --- new

#@# == Instance Methods

#@# --- close
#@# --- delete(arg)
#@# #@todo

#@# = class Resolv::DNS::Requester::Sender

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Class Methods

#@# --- new(msg, data, sock, queue)
#@# #@todo

#@# == Instance Methods

#@# --- recv(msg)
#@# #@todo

#@# --- queue
#@# #@todo

#@# = class Resolv::DNS::Requester::UnconnectedUDP < Resolv::DNS::Requester

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Class Methods

#@# --- new
#@# #@todo

#@# == Instance Methods

#@# --- sender(msg, data, queue, host, port = Port)
#@# #@todo

#@# = class Resolv::DNS::Requester::UnconnectedUDP::Sender < Resolv::DNS::Requester::Sender
#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Class Methods

#@# --- new(msg, data, sock, host, port, queue)
#@# #@todo

#@# == Instance Methods

#@# --- send
#@# #@todo

#@# = class Resolv::DNS::Requester::ConnectedUDP < Resolv::DNS::Requester

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Class Methods

#@# --- new(host, port = Port)
#@# #@todo

#@# == Instance Methods

#@# --- sender(msg, data, queue, host = @host, port = @port)
#@# #@todo

#@# = class Resolv::DNS::Requester::ConnectedUDP::Sender < Resolv::DNS::Requester::Sender
#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Instance Methods

#@# --- send
#@# #@todo

#@# = class Resolv::DNS::Requester::TCP < Resolv::DNS::Requester

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Class Methods

#@# --- new(host, port = Port)
#@# #@todo

#@# == Instance Methods

#@# --- sender(msg, data, queue, host = @host, port = @port)
#@# #@todo

#@# = class Resolv::DNS::Requester::TCP::Sender < Resolv::DNS::Requester::Sender

#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# == Instance Methods

#@# --- send
#@# #@todo

= class Resolv::DNS::Requester::RequestError < StandardError

DNS �����ФؤΥꥯ�����Ȥ˼��Ԥ�������ȯ�������㳰�Υ��饹�Ǥ���

= class Resolv::DNS::Resource::Generic < Resolv::DNS::Resource
����DNS�꥽������ݥ��饹�Ǥ���

== Class Methods

#@# --- new(data) -> Resolv::DNS::Resource::Generic
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# Resolv::DNS::Resource::Generic �Υ��󥹥��󥹤���������
#@# �֤��ޤ���

#@# --- create(type_value, class_value) -> object
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::Generic
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���


== Instance Methods

#@# --- data -> object
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@# DNS �꥽�����Υǡ������֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

= class Resolv::DNS::Resource::DomainName < Resolv::DNS::Resource
DNS�꥽�����Υɥᥤ��̾��ɽ����ݥ��饹�Ǥ���

== Class Methods

#@# --- new(name) -> Resolv::DNS::Resource::DomainName
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# #@todo


#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::DomainName
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Instance Methods

--- name -> Resolv::DNS::Name
�ɥᥤ��̾���֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

= class Resolv::DNS::Resource::NS < Resolv::DNS::Resource::DomainName

DNS �꥽������ NS (������(authoritative)�͡��ॵ����) �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� NS �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::NS]] ��Ȥ��٤��Ǥ���

#@# == Constants
#@#
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@#
#@# DNS�Υ����꡼�����פ� NS ���б����������ͤǤ���

= class Resolv::DNS::Resource::CNAME < Resolv::DNS::Resource::DomainName

DNS �꥽������ CNAME �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� CNAME �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::CNAME]] ��Ȥ��٤��Ǥ���

#@# == Constants
#@#
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@#
#@# DNS�Υ����꡼�����פ� CNAME ���б����������ͤǤ���


= class Resolv::DNS::Resource::SOA < Resolv::DNS::Resource

DNS �꥽������ SOA (Start Of Authority) �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� SOA �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::SOA]] ��Ȥ��٤��Ǥ���

== Class Methods

--- new(mname, rname, serial, refresh, retry_, expire, minimum)
Resolv::DNS::Resource::SOA �Υ��󥹥��󥹤����������֤��ޤ���

@param mname �оݤΥ�����Υޥ�����������ե����뤬¸�ߤ���ۥ���̾
@param rname �оݤΥɥᥤ��̾�δ�����̾
@param serial ������ե�����ΥС������
@param refresh �ץ饤�ޥꥵ���Ф���ι����򥻥�����ꥵ���Ф�
               �����å���������(��ñ��)
@param retry ��������ꥵ���Ф��ץ饤�ޥꥵ���Ф���ξ��󹹿�
             �˼��Ԥ������Υ�ȥ饤������(��ñ��)
@param expire �ץ饤�ޥꥵ���Ф�����������������ͭ������(��ñ��)
@param minimum �꥽�����쥳���ɤκǾ� TTL (��ñ��)


#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::SOA
#@# 
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Instance Methods

--- mname -> Resolv::DNS::Name
�оݤΥ�����Υޥ�����������ե����뤬¸�ߤ���ۥ���̾���֤��ޤ���

--- rname -> Resolv::DNS::Name
�оݤΥɥᥤ��̾�δ�����̾���֤��ޤ���

--- serial -> Integer
������ե�����ΥС��������֤��ޤ���

--- refresh -> Integer
�ץ饤�ޥꥵ���Ф���ι����򥻥�����ꥵ���Ф������å�����
���٤���ñ�̤��֤��ޤ���

--- retry -> Integer
��������ꥵ���Ф��ץ饤�ޥꥵ���Ф���ξ��󹹿��˼��Ԥ�������
���ø�˥�ȥ饤���뤫���֤��ޤ���

--- expire -> Integer
�ץ饤�ޥꥵ���Ф����������������򥻥�����ꥵ���Ф�
���ô�ͭ���ʤ�ΤȤ����ݻ����뤫���֤��ޤ���

--- minimum -> Integer
�꥽�����쥳���ɤ� TTL ���ͤȤ��ƻȤ���Ǿ����ÿ���
�֤��ޤ���


#@# --- encode_rdata(msg) -> ()
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# #@todo

#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ SOA ���б����������ͤǤ���

= class Resolv::DNS::Resource::PTR < Resolv::DNS::Resource::DomainName
DNS �꥽������ PTR �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� PTR �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::PTR]] ��Ȥ��٤��Ǥ���


#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ PTR ���б����������ͤǤ���

= class Resolv::DNS::Resource::HINFO < Resolv::DNS::Resource
DNS �꥽������ HINFO �쥳����
��ɽ����ݥ��饹�Ǥ���

���Υ쥳���ɤϥۥ��ȤΥϡ��ɥ������ȥ��եȥ������ξ����
�ݻ����Ƥ��ޤ���

[[m:Resolv::DNS#getresource]] �� HINFO �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::HINFO]] ��Ȥ��٤��Ǥ���

== Class Methods

--- new(cpu, os) -> Resolv::DNS::Resource::HINFO
Resolv::DNS::Resource::HINFO �Υ��󥹥��󥹤��������ޤ���

@param cpu CPU ̾
@aaram os OS ̾

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::HINFO
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# #@todo

== Instance Methods

--- cpu -> String
�ۥ��ȤǻȤ��� CPU ̾(�ϡ��ɥ�����̾)���֤��ޤ���

--- os -> String
�ۥ��ȤǻȤ��� OS ̾���֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# #@todo
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ HINFO ���б����������ͤǤ���

= class Resolv::DNS::Resource::MINFO < Resolv::DNS::Resource

DNS �꥽������ MINFO �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� MINFO �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::MINFO]] ��Ȥ��٤��Ǥ���

== Class Methods

--- new(rmailbx, emailbx) -> Resolv::DNS::Resource::MINFO
Resolv::DNS::Resource::MINFO �Υ��󥹥��󥹤��������ޤ���

@param rmailbx ���Υ᡼��ꥹ�ȥɥᥤ��̾
@param emailbx

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::MINFO
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Instance Methods

--- rmailbx -> String
�᡼��󥰥ꥹ�Ȥ⤷���ϥ᡼��ܥå�����
��Ǥ�ԤΥɥᥤ��̾���֤��ޤ���

--- emailbx -> String
�᡼��󥰥ꥹ�Ȥ⤷���ϥ᡼��ܥå�����
���顼��������᡼��ܥå����Υɥᥤ��̾��
�֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ MINFO ���б����������ͤǤ���

= class Resolv::DNS::Resource::MX < Resolv::DNS::Resource

DNS �꥽������ MX �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� MX �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::MX]] ��Ȥ��٤��Ǥ���

== Class Methods

--- new(preference, exchange)

@param preference MX��ͥ����
@param exchange MX�Υۥ���

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::MX
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# #@todo 

== Instance Methods

--- preference -> Integer
����MX�쥳���ɤ�ͥ���٤��֤��ޤ���

--- exchange -> Resolv::DNS::Name
MX�Υۥ���̾���֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# #@todo
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ MX ���б����������ͤǤ���

= class Resolv::DNS::Resource::TXT < Resolv::DNS::Resource
DNS �꥽������ TXT �쥳����
��ɽ����ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �� TXT �쥳���ɤ�����������
[[c:Resolv::DNS::Resource::IN::TXT]] ��Ȥ��٤��Ǥ���


== Class Methods

--- new(first_string, *rest_strings) -> Resolv::DNS::Resource::TXT
Resolv::DNS::Resource::TXT�Υ��󥹥��󥹤��������ޤ���

@param first_string �쥳���ɤκǽ��ʸ����
@param rest_strings �쥳���ɤλĤ��ʸ����

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::TXT
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Instance Methods

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

--- data -> String
TXT �쥳���ɤκǽ��ʸ������֤��ޤ���

--- strings -> [String]
TXT �쥳���ɤ�ʸ�����������֤��ޤ���

#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ MX ���б����������ͤǤ���

= class Resolv::DNS::Resource::ANY < Resolv::DNS::Query 
DNS �Τ��٤ƤΥ��饹���Ф��륯���꡼��ɽ�魯
��ݥ��饹�Ǥ���

[[m:Resolv::DNS#getresource]] �Ǥ�
[[c:Resolv::DNS::Resource::IN::ANY]] ��Ȥ��٤��Ǥ���

#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ ANY ���б����������ͤǤ���

= module Resolv::DNS::Resource::IN
DNS �Υ��󥿡��ͥåȥ��饹�꥽������ɽ���⥸�塼��Ǥ���

���󥿡��ͥåȥ��饹�꥽���������Ѥ��� class ��
mixin�������Ѥ��ޤ���

#@# == Constants
#@# 
#@# --- ClassValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ��饹 IN ���б����������ͤǤ���

= class Resolv::DNS::Resource::IN::NS < Resolv::DNS::Resource::NS
DNS �꥽�����Υ��饹 IN�������� NS ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::CNAME < Resolv::DNS::Resource::CNAME
DNS �꥽�����Υ��饹 IN�������� CNAME ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::SOA < Resolv::DNS::Resource::SOA
DNS �꥽�����Υ��饹 IN�������� SOA ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::HINFO < Resolv::DNS::Resource::HINFO
DNS �꥽�����Υ��饹 IN�������� HINFO ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::MINFO < Resolv::DNS::Resource::MINFO
DNS �꥽�����Υ��饹 IN�������� MINFO ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::MX < Resolv::DNS::Resource::MX
DNS �꥽�����Υ��饹 IN�������� MX ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::TXT < Resolv::DNS::Resource::TXT
DNS �꥽�����Υ��饹 IN�������� TXT ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::ANY < Resolv::DNS::Resource::ANY
DNS �����꡼�Υ��饹 IN�������� ANY ���б�����
���饹�Ǥ���

#@# == Constants
#@# 
#@# --- ClassValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ��饹 IN ���б����������ͤǤ���

= class Resolv::DNS::Resource::IN::A < Resolv::DNS::Resource
DNS �꥽�����Υ��饹 IN�������� A ���б�����
���饹�Ǥ���

IPv4���ɥ쥹�꥽������ɽ���ޤ���

== Class Methods

--- new(address) -> Resolv::DNS::Resource::IN::A
Resolv::DNS::Resource::IN::A �Υ��󥹥��󥹤�
�������ޤ���

@param address IPv4���ɥ쥹

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::IN::A
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
== Instance Methods

--- address -> Resolv::IPv4
IPv4���ɥ쥹���֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# DNS �Υ����꡼������ A ���б����������ͤǤ���


= class Resolv::DNS::Resource::IN::WKS < Resolv::DNS::Resource
DNS �꥽�����Υ��饹 IN�������� WKS ���б�����
���饹�Ǥ���

== Class Methods

--- new(address, protocol, bitmap) -> Resolv::DNS::Resource::IN::WKS
Resolv::DNS::Resource::IN::WKS �Υ��󥹥��󥹤��������ޤ���

@param address IPv4���ɥ쥹
@param protocol IP�ץ�ȥ����ֹ�
@param bitmap �ӥåȥޥå�

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::IN::WKS
#@# #@todo

== Instance Methods

--- address -> Resolv::IPv4
IPv4���ɥ쥹���֤��ޤ���

--- protocol -> Integer
IP�ץ�ȥ����ֹ���֤��ޤ���

�㤨�� 6 �� TCP ���б����ޤ���

--- bitmap -> String
���Υۥ��Ȥ����Ѳ�ǽ�ʥ����ӥ��Υӥåȥޥåפ��֤��ޤ���

�㤨�� [[m:Resolv::DNS::Resource::IN::WKS#protocol]] �� 6 (TCP)
�ξ�硢26���ܤΥӥåȤϥݡ���25�Υ����ӥ�(SMTP)���б����Ƥ��ޤ���
���ΥӥåȤ�Ω�äƤ���ʤ�� SMTP �����Ѳ�ǽ�Ǥ��ꡢ
�����Ǥʤ�������ѤǤ��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# #@todo

= class Resolv::DNS::Resource::IN::PTR < Resolv::DNS::Resource::PTR
DNS �꥽�����Υ��饹 IN�������� PTR ���б�����
���饹�Ǥ���

= class Resolv::DNS::Resource::IN::AAAA < Resolv::DNS::Resource
DNS �꥽�����Υ��饹 IN�������� AAAA ���б�����
���饹�Ǥ���

IPv6���ɥ쥹�꥽������ɽ���ޤ���

== Class Methods

--- new(address) -> Resolv::DNS::Resource::IN::AAAA
Resolv::DNS::Resource::IN::AAAA �Υ��󥹥��󥹤�
�������ޤ���

@param address IPv6���ɥ쥹

#@# --- decode_rdata(msg) -> Resolv::DNS::Resource::IN::AAAA
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Instance Methods

--- address -> Resolv::IPv6
IPv6���ɥ쥹���֤��ޤ���

#@# --- encode_rdata(msg) -> ()
#@# #@todo
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# == Constants
#@# 
#@# --- TypeValue
#@# #@todo

#@if (version >= "1.8.3")

= class Resolv::DNS::Resource::IN::SRV < Resolv::DNS::Resource
DNS �꥽�����Υ��饹 IN�������� SRV ���б�����
���饹�Ǥ���

[[RFC:2782]] ���������Ƥ��ޤ���
���Ѳ�ǽ�ʥ����ӥ��Υۥ���̾�ȥݡ����ֹ����ꤹ��쥳���ɤǤ���

== Class Methods

--- new(priority, weight, port, target) -> Resolv::DNS::Resource::IN::SRV
Resolv::DNS::Resource::IN::SRV �Υ��󥹥��󥹤��������ޤ���

@param priority �ۥ��Ȥ�ͥ����
@param weight
@param port �ݡ����ֹ�
@param target �ۥ���̾

#@# --- decode_rdata(msg)
#@# #@todo

== Instance Methods

#@# --- encode_rdata(msg)
#@# #@todo

--- port -> Integer
�оݤΥ����ӥ����оݤΥۥ��Ȥˤ�����ݡ����ֹ���֤��ޤ���

--- priority -> Integer
�ۥ��Ȥ�ͥ���̤��֤��ޤ���

���饤����Ȥ����Ѳ�ǽ�ʥۥ��Ȥ���ǺǤ� priority ��
���������ͤΥۥ��Ȥ����Ѥ��ʤ���Фʤ�ޤ���

priority ��Ʊ���ʤ�� [[m:Resolv::DNS::Resource::IN::SRV#wight]]
����������褦�˥ۥ��Ȥ����֤٤��Ǥ���

�֤��ͤ��ϰϤ� 0 ���� 65535 �ޤǤ������ͤǤ���

--- target -> Resolv::DNS::Name
�оݤΥۥ��ȤΥۥ���̾���֤��ޤ���

--- weight -> Integer
�����Ф����򤹤뤿��ΡֽŤߡפǤ���

[[m:Resolv::DNS::Resource::IN::SRV#priority]] ��Ʊ������
���ι��ܤ����Ѥ���ޤ���
�Ťߤ����㤷����Ψ�ǥۥ��Ȥ����򤹤٤��Ǥ���
�֤��ͤ��ϰϤ� 0 ���� 65535 �ޤǤ������Ǥ���
����褬��Ĥ����ʤ����Ĥޤ����򤹤�ɬ�פ��ʤ����ˤ�
�����ͤϿʹ֤��ɤߤ䤹���褦 0 �ˤ��٤��Ǥ���


#@# == Constants
#@# 
#@# --- TypeValue
#@# #@todo

#@end

#@# = module Resolv::DNS::OpCode
#@# ���Υ⥸�塼��ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# == Constants
#@# 
#@# --- Query
#@# #@todo
#@# 
#@# --- IQuery
#@# #@todo
#@# 
#@# --- Status
#@# #@todo
#@# 
#@# --- Notify
#@# #@todo
#@# 
#@# --- Update
#@# #@todo
#@# 
#@# = module Resolv::DNS::RCode
#@# 
#@# == Constants
#@# 
#@# --- NoError
#@# #@todo
#@# 
#@# --- FormErr
#@# #@todo
#@# 
#@# --- ServFail
#@# #@todo
#@# 
#@# --- NXDomain
#@# #@todo
#@# 
#@# --- NotImp
#@# #@todo
#@# 
#@# --- Refused
#@# #@todo
#@# 
#@# --- YXDomain
#@# #@todo
#@# 
#@# --- YXRRSet
#@# #@todo
#@# 
#@# --- NXRRSet
#@# #@todo
#@# 
#@# --- NotAuth
#@# #@todo
#@# 
#@# --- NotZone
#@# #@todo
#@# 
#@# --- BADVERS
#@# #@todo
#@# 
#@# --- BADSIG
#@# #@todo
#@# 
#@# --- BADKEY
#@# #@todo
#@# 
#@# --- BADTIME
#@# #@todo
#@# 
#@# --- BADMODE
#@# #@todo
#@# 
#@# --- BADNAME
#@# #@todo
#@# 
#@# --- BADALG
#@# #@todo

= class Resolv::DNS::DecodeError < StandardError
DNS��å������Υǥ����ɤ˼��Ԥ����Ȥ���ȯ������
�㳰�Υ��饹�Ǥ���

DNS�����Ф���α���������Ū���������ʤ����ʤɤ�
ȯ�����ޤ���

= class Resolv::DNS::EncodeError < StandardError
DNS��å������Υ��󥳡��ɤ˼��Ԥ����Ȥ���ȯ������
�㳰�Υ��饹�Ǥ���

�̾盧�Υ��顼��ȯ�����ޤ���
�⤷ȯ�������ʤ�Х饤�֥��ΥХ��Ǥ����ǽ��������ޤ���


#@# = class Resolv::DNS::Config
#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# 
#@# == Class Methods
#@# 
#@# --- new(config_info = nil)
#@# #@todo
#@# 
#@# --- default_config_hash(filename = '/etc/resolv.conf')
#@# #@todo
#@# 
#@# --- parse_resolv_conf(filename)
#@# #@todo
#@# 
#@# == Instance Methods
#@# 
#@# --- lazy_initialize
#@# #@todo
#@# 
#@# --- generate_candidates(name)
#@# #@todo
#@# 
#@# --- generate_timeouts
#@# #@todo
#@# 
#@# --- resolv(name)
#@# #@todo
#@# 
#@# --- single?
#@# #@todo
#@# 
#@# == Constants
#@# 
#@# --- InitialTimeout
#@# #@todo

#@# = class Resolv::DNS::Config::NXDomain < Resolv::ResolvError
#@# ��礻���ɥᥤ��̾��¸�ߤ��ʤ����Ȥ򼨤��㳰��
#@# 
#@# �饤�֥�������ǰ����٤�����桼���ϻȤ�ʤ��Ϥ���
#@# 

= class Resolv::DNS::Config::OtherResolvError < Resolv::ResolvError
DNS �����Ф���α��������顼�Ǥ��ä�����ȯ�������㳰�Ǥ���

Resolv::DNS�γƥ᥽�åɤ������㳰��ȯ���������ǽ��������ޤ���

#@# = class Resolv::DNS::Message < Object
#@# ���Υ��饹�ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# == Class Method
#@# 
#@# --- new(id = ((@@identifier += 1) & 0xffff))
#@# #@todo
#@# 
#@# --- decode(m)
#@# #@todo
#@# 
#@# == Instance Method
#@# 
#@# --- add_question(name, typeclass)
#@# --- each_question
#@# --- add_answer(name, ttl, data)
#@# --- each_answer
#@# --- add_authority(name, ttl, data)
#@# --- each_authority
#@# --- add_additional(name, ttl, data)
#@# --- each_additional
#@# --- each_resource
#@# --- encode
#@# #@todo
#@# 
#@# --- id
#@# --- id=()
#@# #@todo
#@# 
#@# --- qr
#@# --- qr=()
#@# #@todo
#@# 
#@# --- opcode
#@# --- opcode=()
#@# #@todo
#@# 
#@# --- aa
#@# --- aa=()
#@# #@todo
#@# 
#@# --- tc
#@# --- tc=()
#@# #@todo
#@# 
#@# --- rd
#@# --- rd=()
#@# #@todo
#@# 
#@# --- ra
#@# --- ra=()
#@# #@todo
#@# 
#@# --- rcode
#@# --- rcode=()
#@# #@todo
#@# 
#@# --- question
#@# #@todo
#@# 
#@# --- answer
#@# #@todo
#@# 
#@# --- authority
#@# #@todo
#@# 
#@# --- additional
#@# #@todo
#@# 
#@# = class Resolv::DNS::Message::MessageDecoder < Object
#@# 
#@# == Class Method
#@# 
#@# --- new(data)
#@# #@todo
#@# 
#@# == Instance Method
#@# 
#@# --- get_bytes(len)
#@# --- get_length16
#@# --- get_label
#@# --- get_labels(limit = nil)
#@# --- get_name
#@# --- get_question
#@# --- get_rr
#@# --- get_string
#@# --- get_string_list
#@# --- get_unpack(template)
#@# #@todo
#@# 
#@# = class Resolv::DNS::Message::MessageEncoder < Object
#@# 
#@# == Class Methods
#@# 
#@# --- new
#@# #@todo
#@# 
#@# == Instance Method
#@# 
#@# --- put_bytes(d)
#@# --- put_label(d)
#@# --- put_labels(d)
#@# --- put_length16
#@# --- put_name(d)
#@# --- put_pack(template, *d)
#@# --- put_string(d)
#@# --- put_string_list(ds)
#@# #@todo
#@# 
#@# --- to_s
#@# #@todo

= class Resolv::DNS::Query < Object

DNS�������ɽ����ݥ��饹�Ǥ���

#@# == Class Methods
#@# 
#@# --- decode_rdata(msg)
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# == Instance Method
#@# 
#@# --- encode_rdata(msg)
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# 
#@# = module Resolv::DNS::Label
#@# �桼�������Υ⥸�塼���Ȥ�ɬ�פϤʤ��Ǥ��礦��
#@# 
#@# �ɥᥤ��̾���갷������Υ桼�ƥ���ƥ��⥸�塼��Ǥ���
#@# [[c:Resolv::DNS::Name]] ����Ȥ��ޤ���
#@# 
#@# == Class Methods
#@# 
#@# --- split(name) -> [Resolv::DNS::Label::Str]
#@# ʸ���� name ��ʬ�䤷�ơ� [[c:Resolv::DNS::Label::Str]] ��������֤��ޤ���
#@# 
#@# @paarm name �ɥᥤ��̾��ʸ����
#@# 
#@# = class Resolv::DNS::Label::Str
#@# �桼�������Υ��饹��Ȥ�ɬ�פϤʤ��Ǥ��礦��
#@# 
#@# �ɥᥤ��̾��ɥåȤ�ʬ�䤷�������Ǥ�ɽ�����饹�Ǥ���
#@# 
#@# ʸ���������ʸ���Ⱦ�ʸ����Ʊ��뤹�뤿���¸�ߤ��륯�饹�Ǥ���
#@# 
#@# == Class Methods
#@# 
#@# --- new(string) -> Resolv::DNS::Label::Str
#@# ʸ���� string ���� [[c:Resolv::DNS::Label::Str]]�Υ��󥹥��󥹤��������ޤ���
#@# 
#@# @param string 
#@# 
#@# == Instance Methods
#@# 
#@# --- string -> String
#@# --- to_s -> String
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# [[m:Resolv::DNS::Label::Str.new]] �ǰ�����Ϳ����ʸ������֤��ޤ���
#@# 
#@# --- downcase -> String
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# [[m:Resolv::DNS::Label::Str.new]] �ǰ�����Ϳ����ʸ�����ʸ���ˤ����֤��ޤ���
#@# 

= class Resolv::DNS::Name < Object
�ɥᥤ��̾��ɽ�����饹�Ǥ���

== Class Methods

--- create(name) -> Resolv::DNS::Name
ʸ���� name ���� Resolv::DNS::Name �Υ��󥹥��󥹤��������ޤ���

@param name �ɥᥤ��̾��ʸ���󡣺Ǹ��"."���֤������Хѥ������������Ǥʤ�������Хѥ������Ȥߤʤ���ޤ���

--- new(labels, absolute = true) -> Resolv::DNS::Name
Resolv::DNS::Name�Υ��󥹥��󥹤��������ޤ���
labels �� [[c:Resolv::DNS::Label::Str]] �������Ϳ���ޤ���

@param labels �ɥᥤ��̾�� [[c:Resolv::DNS::Label::Str]] ������Ȥ���Ϳ���ޤ���
@param absolute �ɥᥤ��̾�����Хѥ��Ǥ��뤫�ɤ����� �����ͤ�Ϳ���ޤ���

@see [[m:Resolv::DNS::Name.create]]

== Instance Methods

#@# --- to_a -> [Resolv::DNS::Label::Str]
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 

--- to_s -> String
�ɥᥤ��̾��ʸ����Ȥ����֤��ޤ���

���Хѥ������Ǥ��äƤ��֤����ʸ����ˤϺǸ�ΥɥåȤϴޤޤ�ޤ���

#@# --- [](i) -> Resolv::DNS::Label::Str
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 

--- absolute? -> bool
���Хѥ������Ǥ��뤫�ɤ������֤��ޤ���

#@# --- length
#@# ���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

--- subdomain_of?(other) -> bool
other �� self �Υ��֥ɥᥤ��Ǥ��뤫�ɤ������֤��ޤ���

=== ��
  domain = Resolv::DNS::Name.create("y.z")
  p Resolv::DNS::Name.create("w.x.y.z").subdomain_of?(domain) #=> true
  p Resolv::DNS::Name.create("x.y.z").subdomain_of?(domain) #=> true
  p Resolv::DNS::Name.create("y.z").subdomain_of?(domain) #=> false
  p Resolv::DNS::Name.create("z").subdomain_of?(domain) #=> false
  p Resolv::DNS::Name.create("x.y.z.").subdomain_of?(domain) #=> false
  p Resolv::DNS::Name.create("w.z").subdomain_of?(domain) #=> false
  

= class Resolv::DNS::Resource < Resolv::DNS::Query
DNS�꥽������ɽ����ݥ��饹�Ǥ���

#@# == Class Methods
#@# 
#@# --- decode_rdata(msg)
#@# --- get_class(type_value, class_value)
#@# #@todo
#@# 
#@# == Instance Methods
#@# 
#@# --- encode_rdata(msg)
#@# #@todo
#@# 
#@# == Constants
#@# 
#@# --- ClassHash
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# --- ClassValue
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 
#@# --- ClassInsensitiveTypes
#@# ��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���
#@# 

= class Resolv::IPv4 < Object
IPv4�Υ��ɥ쥹��ɽ�����饹�Ǥ���

== Class Methods

--- create(address) -> Resolv::IPv4

"192.168.0.1" �Τ褦�� "." �Ƕ��ڤ�줿 IPv4 ɽ����ʸ���� address ����
Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

@param address IPv4 ɽ����ʸ����

--- new(address) -> Resolv::IPv4

4 byte ��ʸ���� address ���� Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

@param address 4 byte �ΥХ��ʥ���� IPv4 �Υ��ɥ쥹
@see [[m:Resolv::IPv4.create]] 


== Instance Methods

--- address -> String
4byte �Х������ IPv4 ���ɥ쥹���֤��ޤ���

--- to_s -> String
�ɥåȤǶ��ڤ�줿 IPv4 ���ɥ쥹ʸ������֤��ޤ���

--- to_name -> Resolv::DNS::Name
"x.y.z.w.in-addr.arpa." �Ȥ������Υɥᥤ��̾���֤��ޤ���

== Constants

--- Regex -> Regexp
IPv4 �Υ��ɥ쥹������ɽ���Ǥ���

= class Resolv::IPv6 < Object
IPv6 �Υ��ɥ쥹��ɽ�����饹�Ǥ���

== Class Methods

--- create(address)
�ʲ��Τ����줫�η�����ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���


  * 8Hex
  * CompressedHex
  * 6Hex4Dec
  * CompressedHex4Dec

@param address human readable �� IPv6 ���ɥ쥹��ʸ����ɽ��

--- new(address)
16 byte ��ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���

@param address IPv6���ɥ쥹��ɽ�� 16 byte ��ʸ����(�Х�����)
@see [[m:Resolv::IPv6.create]]

== Instance Methods

--- address -> String
IPv6���ɥ쥹��ɽ�� 16 byte ��ʸ����(�Х�����)���֤��ޤ���

--- to_s -> String
IPv6 ���ɥ쥹��ʸ����ɽ�����֤��ޤ���

--- to_name -> Resolv::DNS::Name
"h.g.f.e.d.c.b.a.ip6.arpa." �Ȥ��� DNS ̾���֤��ޤ���


== Constants

--- Regex -> Regexp
IPv6�Υ��ɥ쥹������ɽ���Ǥ���
[[m:Resolv::IPv6::Regex_6Hex4Dec]],
[[m:Resolv::IPv6::Regex_8Hex]],
[[m:Resolv::IPv6::Regex_CompressedHex]],
[[m:Resolv::IPv6::Regex_CompressedHex4Dec]],
�Τ����줫�ȥޥå�����ʸ����ȥޥå����ޤ���

--- Regex_6Hex4Dec -> Regexp
--- Regex_8Hex -> Regexp
--- Regex_CompressedHex -> Regexp
--- Regex_CompressedHex4Dec -> Regexp
IPv6�γ�ʸ����ɽ���ȥޥå���������ɽ���Ǥ������
  * a:b:c:d:e:f:w.x.y.z
  * a:b:c:d:e:f:g:h
  * a::b
  * a::b:w.x.y.z
�Ȥ���ʸ����ȥޥå����ޤ���

#@end
