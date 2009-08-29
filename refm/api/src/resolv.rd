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

--- DefaultResolver
[[c:Resolv]] �γƥ��饹�᥽�åɤ�ƤӤ������Ȥ���
���Ѥ����꥾��ФǤ���

--- ADDRESSREGEX
IP���ɥ쥹�˥ޥå���������ɽ���Ǥ���

= class Resolv::ResolvError < StandardError
̾�����˼��Ԥ����Ȥ���ȯ�������㳰�Υ��饹�Ǥ���

= class Resolv::ResolvTimeout < TimeoutError
̾����褬�����ॢ���Ȥ����Ȥ���ȯ�������㳰�Υ��饹�Ǥ���

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

--- lazy_initialize -> Resolv::Hosts

���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

== Constants

--- DefaultFileName

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

@param name �ۥ���̾��ʸ����⤷����Resolv::Name�Υ��󥹥��󥹤�Ϳ���ޤ���
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getaddresses(name) -> [Resolv::IPv4 | Resolv::IPv6]
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
��å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���

��å����åפ˼��Ԥ������϶��������֤���ޤ���

@param name �ۥ���̾��ʸ����⤷����Resolv::Name�Υ��󥹥��󥹤�Ϳ���ޤ���

--- each_address(name) {|name| ...} -> ()
�ۥ���̾ name �� IP ���ɥ쥹���å����åפ���
�ƥ�å����å׷�̤Υ��ɥ쥹���Ф��ƥ֥�å���ɾ�����ޤ���

@param name �ۥ���̾��ʸ����⤷����Resolv::Name�Υ��󥹥��󥹤�Ϳ���ޤ���

--- getname(address) -> Resolv::Name
IP ���ɥ쥹 address �Υۥ���̾���å����åפ���
��å����å׷�̤κǽ�Υۥ���̾���֤��ޤ���

@param address IP���ɥ쥹��ʸ���� Resolv::IPv4 �Υ��󥹥��󥹡�
               Resolv::IPv6 �Υ��󥹥��󥹡��Τ����줫Ϳ���ޤ���
               
@raise Resolv::ResolvError ��å����åפ˼��Ԥ����Ȥ���ȯ�����ޤ���

--- getnames(address) -> [Resolv::Name]
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
  * Resolv::DNS::Resource::IN::ANY
  * Resolv::DNS::Resource::IN::NS
  * Resolv::DNS::Resource::IN::CNAME
  * Resolv::DNS::Resource::IN::SOA
  * Resolv::DNS::Resource::IN::HINFO
  * Resolv::DNS::Resource::IN::MINFO
  * Resolv::DNS::Resource::IN::MX
  * Resolv::DNS::Resource::IN::TXT
  * Resolv::DNS::Resource::IN::A
  * Resolv::DNS::Resource::IN::WKS
  * Resolv::DNS::Resource::IN::PTR
  * Resolv::DNS::Resource::IN::AAAA

��å����å׷�̤� Resolv::DNS::Resource �ʤΥ��֥��饹�ˤΥ��󥹥��󥹤Ȥʤ�ޤ���
typeclass �� Resolv::DNS::Resource::IN::ANY �ʳ�����ꤷ�����ˤ�
���Υ��饹�Υ��󥹥��󥹤��֤��ޤ���

@param name ��å����å��оݤȤʤ�̾���� [[c:Resolv::Name]] �ޤ��� String �ǻ��ꤷ�ޤ���
@param typeclass �쥳���ɼ��̤���ꤷ�ޤ���
@raise Resolv::ResolvError getresource�ǥ�å����åפ˼��Ԥ�������ȯ�����ޤ���

--- close -> ()

DNS�꥾��Ф��Ĥ��ޤ���

--- extract_resources(msg, name, typeclass) {|resource| ...}

���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

DNS�����Ф�������� msg �� name �� typeclass �ǥե��륿��󥰤���
���η�̤�֥�å����Ϥ��ޤ���

@param msg DNS�����Ф����������Ϳ���ޤ���[[c:Resolv::DNS::Message]] �Υ��󥹥��󥹤�Ϳ���뤳�Ȥ��Ǥ��ޤ���
@param name �ե��륿��󥰤���̾������ꤷ�ޤ���
@param typeclass �ե��륿��󥰤���DNS�쥳���ɼ��̤�ɽ���ޤ���[[m:Resolv::DNS#getresource]] �� typeclass ��Ʊ�����饹��Ϳ���ޤ���
--- lazy_initialize -> Resolv::DNS

���Υ᥽�åɤϥ桼�����Ȥ��٤��ǤϤ���ޤ���

[[m:Resolv::DNS.new]] ��Ϳ��������ǥ��󥹥��󥹤�ºݤ˽�������ޤ���

== Constants

--- DNSThreadGroup

��������ϥ桼�����Ȥ��٤��ǤϤ���ޤ���

#@until 1.8.5
Resolv::DNS���������Ѥ���� [[c:ThreadGroup]] �Ǥ���
#@else
��������Ϥ�Ϥ����Ѥ���Ƥ��ޤ���
#@end

--- Port

�ǥե���Ȥ� DNS �ݡ����ֹ�Ǥ���

--- UDPSize

�ǥե���Ȥ� UDP �ѥ��åȥ������Ǥ���

= class Resolv::DNS::Requester < Object

== Class Methods

--- new
#@todo

== Instance Methods

--- close
--- delete(arg)
#@todo

= class Resolv::DNS::Requester::Sender

== Class Methods

--- new(msg, data, sock, queue)
#@todo

== Instance Methods

--- recv(msg)
#@todo

--- queue
#@todo

= class Resolv::DNS::Requester::UnconnectedUDP < Resolv::DNS::Requester

== Class Methods

--- new
#@todo

== Instance Methods

--- sender(msg, data, queue, host, port = Port)
#@todo

= class Resolv::DNS::Requester::UnconnectedUDP::Sender < Resolv::DNS::Requester::Sender

== Class Methods

--- new(msg, data, sock, host, port, queue)
#@todo

== Instance Methods

--- send
#@todo

= class Resolv::DNS::Requester::ConnectedUDP < Resolv::DNS::Requester

== Class Methods

--- new(host, port = Port)
#@todo

== Instance Methods

--- sender(msg, data, queue, host = @host, port = @port)
#@todo

= class Resolv::DNS::Requester::ConnectedUDP::Sender < Resolv::DNS::Requester::Sender

== Instance Methods

--- send
#@todo

= class Resolv::DNS::Requester::TCP < Resolv::DNS::Requester

== Class Methods

--- new(host, port = Port)
#@todo

== Instance Methods

--- sender(msg, data, queue, host = @host, port = @port)
#@todo

= class Resolv::DNS::Requester::TCP::Sender < Resolv::DNS::Requester::Sender

== Instance Methods

--- send
#@todo

= class Resolv::DNS::Requester::RequestError < StandardError

= class Resolv::DNS::Resource::Generic < Resolv::DNS::Resource

== Class Methods

--- new(data)
#@todo

--- create(type_value, class_value)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- data
#@todo

--- encode_rdata(msg)
#@todo

= class Resolv::DNS::Resource::DomainName < Resolv::DNS::Resource

== Class Methods

--- new(name)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- name
#@todo

--- encode_rdata(msg)
#@todo

= class Resolv::DNS::Resource::NS < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::CNAME < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::SOA < Resolv::DNS::Resource

== Class Methods

--- new(mname, rname, serial, refresh, retry_, expire, minimum)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- mname
#@todo

--- rname
#@todo

--- serial
#@todo

--- refresh
#@todo

--- retry
#@todo

--- expire
#@todo

--- minimum
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::PTR < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::HINFO < Resolv::DNS::Resource

== Class Methods

--- new(cpu, os)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- cpu
#@todo

--- os
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::MINFO < Resolv::DNS::Resource

== Class Methods

--- new(rmailbx, emailbx)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- rmailbx
#@todo

--- emailbx
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::MX < Resolv::DNS::Resource

== Class Methods

--- new(preference, exchange)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- preference
#@todo

--- exchange
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::TXT < Resolv::DNS::Resource

== Class Methods

--- new(first_string, *rest_strings)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- encode_rdata(msg)
#@todo

--- data
#@todo

--- strings
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::ANY < Resolv::DNS::Query 

== Constants

--- TypeValue
#@todo

= module Resolv::DNS::Resource::IN

== Constants

--- ClassValue
#@todo

= class Resolv::DNS::Resource::IN::NS < Resolv::DNS::Resource::NS

= class Resolv::DNS::Resource::IN::CNAME < Resolv::DNS::Resource::CNAME

= class Resolv::DNS::Resource::IN::SOA < Resolv::DNS::Resource::SOA

= class Resolv::DNS::Resource::IN::HINFO < Resolv::DNS::Resource::HINFO

= class Resolv::DNS::Resource::IN::MINFO < Resolv::DNS::Resource::MINFO

= class Resolv::DNS::Resource::IN::MX < Resolv::DNS::Resource::MX

= class Resolv::DNS::Resource::IN::TXT < Resolv::DNS::Resource::TXT

= class Resolv::DNS::Resource::IN::ANY < Resolv::DNS::Resource::ANY

== Constants

--- ClassValue
#@todo

= class Resolv::DNS::Resource::IN::A < Resolv::DNS::Resource

== Class Methods

--- new(address)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- address
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::IN::WKS < Resolv::DNS::Resource

== Class Methods

--- new(address, protocol, bitmap)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- address
#@todo

--- protocol
#@todo

--- bitmap
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

= class Resolv::DNS::Resource::IN::PTR < Resolv::DNS::Resource::PTR

= class Resolv::DNS::Resource::IN::AAAA < Resolv::DNS::Resource

== Class Methods

--- new(address)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- address
#@todo

--- encode_rdata(msg)
#@todo

== Constants

--- TypeValue
#@todo

#@if (version >= "1.8.3")

= class Resolv::DNS::Resource::IN::SRV < Resolv::DNS::Resource

== Class Methods

--- new(priority, weight, port, target)
#@todo

--- decode_rdata(msg)
#@todo

== Instance Methods

--- encode_rdata(msg)
#@todo

--- port
#@todo

--- priority
#@todo

--- target
#@todo

--- weight
#@todo

== Constants

--- TypeValue
#@todo

#@end

= module Resolv::DNS::OpCode

== Constants

--- Query
#@todo

--- IQuery
#@todo

--- Status
#@todo

--- Notify
#@todo

--- Update
#@todo

= module Resolv::DNS::RCode

== Constants

--- NoError
#@todo

--- FormErr
#@todo

--- ServFail
#@todo

--- NXDomain
#@todo

--- NotImp
#@todo

--- Refused
#@todo

--- YXDomain
#@todo

--- YXRRSet
#@todo

--- NXRRSet
#@todo

--- NotAuth
#@todo

--- NotZone
#@todo

--- BADVERS
#@todo

--- BADSIG
#@todo

--- BADKEY
#@todo

--- BADTIME
#@todo

--- BADMODE
#@todo

--- BADNAME
#@todo

--- BADALG
#@todo

= class Resolv::DNS::DecodeError < StandardError

= class Resolv::DNS::EncodeError < StandardError

= class Resolv::DNS::Config

== Class Methods

--- new(config_info = nil)
#@todo

--- default_config_hash(filename = '/etc/resolv.conf')
#@todo

--- parse_resolv_conf(filename)
#@todo

== Instance Methods

--- lazy_initialize
#@todo

--- generate_candidates(name)
#@todo

--- generate_timeouts
#@todo

--- resolv(name)
#@todo

--- single?
#@todo

== Constants

--- InitialTimeout
#@todo

= class Resolv::DNS::Config::NXDomain < Resolv::ResolvError

= class Resolv::DNS::Config::OtherResolvError < Resolv::ResolvError

= class Resolv::DNS::Message < Object

== Class Method

--- new(id = ((@@identifier += 1) & 0xffff))
#@todo

--- decode(m)
#@todo

== Instance Method

--- add_question(name, typeclass)
--- each_question
--- add_answer(name, ttl, data)
--- each_answer
--- add_authority(name, ttl, data)
--- each_authority
--- add_additional(name, ttl, data)
--- each_additional
--- each_resource
--- encode
#@todo

--- id
--- id=()
#@todo

--- qr
--- qr=()
#@todo

--- opcode
--- opcode=()
#@todo

--- aa
--- aa=()
#@todo

--- tc
--- tc=()
#@todo

--- rd
--- rd=()
#@todo

--- ra
--- ra=()
#@todo

--- rcode
--- rcode=()
#@todo

--- question
#@todo

--- answer
#@todo

--- authority
#@todo

--- additional
#@todo

= class Resolv::DNS::Message::MessageDecoder < Object

== Class Method

--- new(data)
#@todo

== Instance Method

--- get_bytes(len)
--- get_length16
--- get_label
--- get_labels(limit = nil)
--- get_name
--- get_question
--- get_rr
--- get_string
--- get_string_list
--- get_unpack(template)
#@todo

= class Resolv::DNS::Message::MessageEncoder < Object

== Class Methods

--- new
#@todo

== Instance Method

--- put_bytes(d)
--- put_label(d)
--- put_labels(d)
--- put_length16
--- put_name(d)
--- put_pack(template, *d)
--- put_string(d)
--- put_string_list(ds)
#@todo

--- to_s
#@todo

= class Resolv::DNS::Query < Object

== Class Methods

--- decode_rdata(msg)
#@todo

== Instance Method

--- encode_rdata(msg)
#@todo


= module Resolv::DNS::Label

== Class Methods

--- split(name)
#@todo

= class Resolv::DNS::Label::Str

== Class Methods

--- new(string)
#@todo

== Instance Methods

--- string
--- to_s
#@todo

--- downcase
#@todo

= class Resolv::DNS::Name < Object

== Class Methods

--- create(name)
#@todo

--- new(labels, absolute = true)
#@todo

== Instance Methods

--- to_a
--- to_s
--- []
--- absolute?
--- length
--- subdomain_of?(other)
#@todo

= class Resolv::DNS::Resource < Resolv::DNS::Query

== Class Methods

--- decode_rdata(msg)
--- get_class(type_value, class_value)
#@todo

== Instance Methods

--- encode_rdata(msg)
#@todo

== Constants

--- ClassHash
#@todo

--- ClassValue
#@todo

--- ClassInsensitiveTypes
#@todo

= class Resolv::IPv4 < Object

== Class Methods

--- create(address)
#@todo

"192.168.0.1" �Τ褦�� "." �Ƕ��ڤ�줿 IPv4 ɽ����ʸ���� address ����
Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

--- new(address)
#@todo

4 byte ��ʸ���� address ���� Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

== Instance Methods

--- address
#@todo

--- to_s
--- to_name
#@todo

== Constants

--- Regex
#@todo
#@#    regular expression for IPv4 address.

IPv4 �Υ��ɥ쥹������ɽ���Ǥ���

= class Resolv::IPv6 < Object

== Class Methods

--- create(address)
#@todo

�ʲ��Τ����줫�η�����ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���


  * 8Hex
  * CompressedHex
  * 6Hex4Dec
  * CompressedHex4Dec

--- new(address)
#@todo

16 byte ��ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���

== Instance Methods

--- address
#@todo

--- to_s
--- to_name
#@todo

== Constants

--- Regex
#@todo
#@#    regular expression for IPv6 address.
IPv6�Υ��ɥ쥹������ɽ���Ǥ���

--- Regex_6Hex4Dec
--- Regex_8Hex
--- Regex_CompressedHex
--- Regex_CompressedHex4Dec
#@todo

#@end
