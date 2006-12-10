#@if (version >= "1.6.0")
= class Resolv < Object

Ruby �ǽ񤫤줿�꥾���(̾�����)�饤�֥�ꡣ
Ruby �ǽ񤫤�Ƥ��뤿�� thread-aware �Ǥ��ꡢ
�����¿���Υۥ���̾���褹�뤳�Ȥ��Ǥ��ޤ���

DNS �⥸�塼���Ȥ����Ȥǡ����ޤ��ޤʥ꥽������ľ�ܥ�å����åפǤ��ޤ���

�ʤ���ñ�˥ۥ���̾���� IP ���ɥ쥹�������������Ǥ���С�
[[lib:socket]] �饤�֥��� [[m:IPSocket.getaddress]] �ʤɤ����ѤǤ��ޤ���

[[unknown:��ɮ���罸]]

=== ��:
  Resolv.getaddress("www.ruby-lang.org")
  Resolv.getname("210.251.121.214").to_s
  Resolv::DNS.new.getresources("www.ruby-lang.org", Resolv::DNS::Resource::IN::A).collect {|r| r.address}
  Resolv::DNS.new.getresources("ruby-lang.org", Resolv::DNS::Resource::IN::MX).collect {|r| [r.exchange.to_s, r.preference]}


=== Bugs
#@#NIS is not supported.
NIS �ϥ��ݡ��Ȥ���Ƥ��ޤ���

== Class Methods
--- new(resolvers = [Hosts.new, DNS.new])

#@todo

--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|address| ...}

String �Υۥ���̾ name �� IP ���ɥ쥹���å����åפ��ޤ���

getaddress �ϥ�å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���
getaddresses �ϥ�å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���
each_address �ϥ�å����å׷�̤Υ��ɥ쥹���Ф��륤�ƥ졼���Ǥ���

��:
  Resolv.getaddress("www.ruby-lang.org").to_s #=> "210.251.121.214"

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}

String �� IP ���ɥ쥹 address �Υۥ���̾���å����åפ��ޤ���

getname �ϥ�å����å׷�̤κǽ�Υۥ���̾���֤��ޤ���
getnames �ϥ�å����å׷�̤Υۥ���̾�ꥹ�Ȥ��֤��ޤ���
each_name �ϥ�å����å׷�̤Υ��ɥ쥹���Ф��륤�ƥ졼���Ǥ���

��:
  Resolv.getname("210.251.121.214").to_s #=> "helium.ruby-lang.org"

== Instance Methods

--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|name| ...}

String �Υۥ���̾ name �� IP ���ɥ쥹���å����åפ��ޤ���

���줾��[[m:Resolv.getaddress]], [[m:Resolv.getaddresses]], 
[[m:Resolv.each_address]] ��Ʊ����ǽ�Ǥ���

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}

String �� IP ���ɥ쥹 address �Υۥ���̾���å����åפ��ޤ���

���줾��[[m:Resolv.getname]], [[m:Resolv.getnames]], 
[[m:Resolv.each_name]] ��Ʊ����ǽ�Ǥ���

= class Resolv::Hosts < Object

/etc/hosts ����Ѥ���ۥ���̾�꥾��ФǤ���

== Class Methods

--- new(hosts = '/etc/hosts')

== Instance Methods
--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|address| ...}

address lookup methods.

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}

hostnames lookup methods.

= class Resolv::DNS < Object

DNS stub resolver.

== Class Methods
--- new(resolv_conf = '/etc/resolv.conf')

== Instance Methods
--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|address| ...}

address lookup methods.

name �� Resolv::Name �ޤ��� String �Ǥʤ���Фʤ�ޤ���
��å����å׷�̤� Resolv::IPv4 �ޤ��� Resolv::IPv6 �Υ��󥹥��󥹤Ȥʤ�ޤ���

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}

hostnames lookup methods.

address �� Resolv::IPv4, Resolv::IPv6, String �Τ����줫�Ǥʤ���Фʤ�ޤ���
��å����å׷�̤� Resolv::Name �Υ��󥹥��󥹤Ȥʤ�ޤ���

--- getresource(name, typeclass)
--- getresources(name, typeclass)
--- each_resource(name, typeclass) {|resource| ...}

They lookup DNS resources of name.
name �� Resolv::Name �ޤ��� String �Ǥʤ���Фʤ�ޤ���

typeclass �ϰʲ��Τ����줫�Ǥ���
  * Resolv::DNS::Resource::IN::ANY
  * Resolv::DNS::Resource::IN::NS
  * Resolv::DNS::Resource::IN::CNAME
  * Resolv::DNS::Resource::IN::SOA
  * Resolv::DNS::Resource::IN::HINFO
  * Resolv::DNS::Resource::IN::MINFO
  * Resolv::DNS::Resource::IN::MX
  * Resolv::DNS::Resource::IN::TXT
  * Resolv::DNS::Resource::IN::ANY
  * Resolv::DNS::Resource::IN::A
  * Resolv::DNS::Resource::IN::WKS
  * Resolv::DNS::Resource::IN::PTR
  * Resolv::DNS::Resource::IN::AAAA

��å����å׷�̤� Resolv::DNS::Resource �ʤΥ��֥��饹�ˤΥ��󥹥��󥹤Ȥʤ�ޤ���

= class Resolv::DNS::Resource::IN::NS < Resolv::DNS::Resource::NS

== Instance Methods

--- name

= class Resolv::DNS::Resource::IN::CNAME < Resolv::DNS::Resource::CNAME

== Instance Methods

--- name

= class Resolv::DNS::Resource::IN::SOA < Resolv::DNS::Resource::SOA

== Instance Methods

--- mname

--- rname

--- serial

--- refresh

--- retry

--- expire

--- minimum

= class Resolv::DNS::Resource::IN::HINFO < Resolv::DNS::Resource::HINFO

== Instance Methods

--- cpu

--- os

= class Resolv::DNS::Resource::IN::MINFO < Resolv::DNS::Resource::MINFO

== Instance Methods

--- rmailbx

--- emailbx

= class Resolv::DNS::Resource::IN::MX < Resolv::DNS::Resource::MX

== Instance Methods

--- preference

--- exchange

= class Resolv::DNS::Resource::IN::TXT < Resolv::DNS::Resource::TXT

== Instance Methods

--- data

= class Resolv::DNS::Resource::IN::A < Resolv::DNS::Resource::A

== Instance Methods

--- address

= class Resolv::DNS::Resource::IN::WKS < Resolv::DNS::Resource::WKS

== Instance Methods

--- address

--- protocol

--- bitmap

= class Resolv::DNS::Resource::IN::PTR < Resolv::DNS::Resource::PTR

== Instance Methods

--- name

= class Resolv::DNS::Resource::IN::AAAA < Resolv::DNS::Resource::AAAA

== Instance Methods

--- address

= class Resolv::DNS::Name < Object

== Class Methods

--- create(name)

== Instance Methods

--- to_s

= class Resolv::DNS::Resource < Object

= class Resolv::IPv4 < Object

== Class Methods

--- create(address)

== Instance Methods

--- to_s
--- to_name

== Constants

--- Regex
#@#    regular expression for IPv4 address.

IPv4 �Υ��ɥ쥹������ɽ���Ǥ���

= class Resolv::IPv6 < Object

== Class Methods

--- create(address)

== Instance Methods

--- to_s
--- to_name

== Constants

--- Regex
#@#    regular expression for IPv6 address.
IPv6�Υ��ɥ쥹������ɽ���Ǥ���

#@end
