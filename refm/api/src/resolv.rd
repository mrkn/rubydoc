#@if (version >= "1.6.0")

require socket
require timeout
require fcntl
require thread

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

== Constants

--- DefaultResolver

--- AddressRegex

= class Resolv::ResolvError < StandardError

= class Resolv::ResolvTimeout < StandardError

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

--- lazy_initialize

new �ǻ��ꤵ�줿�ե��������Ƥ��ɤ߹��ߡ�̾�����Τ��������������������ޤ���

== Constants

--- DefaultFileName

= class Resolv::DNS < Object

DNS stub resolver.

== Class Methods

--- new(resolv_conf = '/etc/resolv.conf')

--- open(*args)

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

--- close

--- extract_resources(msg, name, typeclass)

--- lazy_initialize

== Constants

--- DNSThreadGroup

--- Port

--- UDPSize

= class Resolv::DNS::Requester < Object

== Class Methods

--- new

== Instance Methods

--- close
--- delete(arg)

= class Resolv::DNS::Requester::Sender

== Class Methods

--- new(msg, data, sock, queue)

== Instance Methods

--- recv(msg)

--- queue

= class Resolv::DNS::Requester::UnconnectedUDP < Resolv::DNS::Requester

== Class Methods

--- new

== Instance Methods

--- sender(msg, data, queue, host, port = Port)

= class Resolv::DNS::Requester::UnconnectedUDP::Sender < Resolv::DNS::Requester::Sender

== Class Methods

--- new(msg, data, sock, host, port, queue)

== Instance Methods

--- send

= class Resolv::DNS::Requester::ConnectedUDP < Resolv::DNS::Requester

== Class Methods

--- new(host, port = Port)

== Instance Methods

--- sender(msg, data, queue, host = @host, port = @port)

= class Resolv::DNS::Requester::ConnectedUDP::Sender < Resolv::DNS::Requester::Sender

== Instance Methods

--- send

= class Resolv::DNS::Requester::TCP < Resolv::DNS::Requester

== Class Methods

--- new(host, port = Port)

== Instance Methods

--- sender(msg, data, queue, host = @host, port = @port)

= class Resolv::DNS::Requester::TCP::Sender < Resolv::DNS::Requester::Sender

== Instance Methods

--- send

= class Resolv::DNS::Requester::RequestError < StandardError

= class Resolv::DNS::Resource::Generic < Resolv::DNS::Resource

== Class Methods

--- new(data)

--- create(type_value, class_value)

--- decode_rdata(msg)

== Instance Methods

--- data

--- encode_rdata(msg)

= class Resolv::DNS::Resource::DomainName < Resolv::DNS::Resource

== Class Methods

--- new(name)

--- decode_rdata(msg)

== Instance Methods

--- name

--- encode_rdata(msg)

= class Resolv::DNS::Resource::NS < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue

= class Resolv::DNS::Resource::CNAME < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue

= class Resolv::DNS::Resource::SOA < Resolv::DNS::Resource

== Class Methods

--- new(mname, rname, serial, refresh, retry_, expire, minimum)

--- decode_rdata(msg)

== Instance Methods

--- mname

--- rname

--- serial

--- refresh

--- retry

--- expire

--- minimum

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::PTR < Resolv::DNS::Resource::DomainName

== Constants

--- TypeValue

= class Resolv::DNS::Resource::HINFO < Resolv::DNS::Resource

== Class Methods

--- new(cpu, os)

--- decode_rdata(msg)

== Instance Methods

--- cpu

--- os

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::MINFO < Resolv::DNS::Resource

== Class Methods

--- new(rmailbx, emailbx)

--- decode_rdata(msg)

== Instance Methods

--- rmailbx

--- emailbx

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::MX < Resolv::DNS::Resource

== Class Methods

--- new(preference, exchange)

--- decode_rdata(msg)

== Instance Methods

--- preference

--- exchange

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::TXT < Resolv::DNS::Resource

== Class Methods

--- new(first_string, *rest_strings)

--- decode_rdata(msg)

== Instance Methods

--- encode_rdata(msg)

--- data

--- strings

== Constants

--- TypeValue

= class Resolv::DNS::Resource::ANY < Resolv::DNS::Query 

== Constants

--- TypeValue

= module Resolv::DNS::Resource::IN

== Constants

--- ClassValue

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

= class Resolv::DNS::Resource::IN::A < Resolv::DNS::Resource

== Class Methods

--- new(address)

--- decode_rdata(msg)

== Instance Methods

--- address

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::IN::WKS < Resolv::DNS::Resource::WKS

== Class Methods

--- new(address, protocol, bitmap)

--- decode_rdata(msg)

== Instance Methods

--- address

--- protocol

--- bitmap

--- encode_rdata(msg)

== Constants

--- TypeValue

= class Resolv::DNS::Resource::IN::PTR < Resolv::DNS::Resource::PTR

= class Resolv::DNS::Resource::IN::AAAA < Resolv::DNS::Resource

== Class Methods

--- new(address)

--- decode_rdata(msg)

== Instance Methods

--- address

--- encode_rdata(msg)

== Constants

--- TypeValue

#@if (version >= "1.8.3")

= class Resolv::DNS::Resource::IN::SRV < Resolv::DNS::Resource

== Class Methods

--- new(priority, weight, port, target)

--- decode_rdata(msg)

== Instance Methods

--- encode_rdata(msg)

--- port

--- priority

--- target

--- weight

== Constants

--- TypeValue

#@end

= module Resolv::DNS::OpCode

== Constants

--- Query

--- IQuery

--- Status

--- Notify

--- Update

= module Resolv::DNS::RCode

== Constants

--- NoError

--- FormErr

--- ServFail

--- NXDomain

--- NotImp

--- Refused

--- YXDomain

--- YXRRSet

--- NXRRSet

--- NotAuth

--- NotZone

--- BADVERS

--- BADSIG

--- BADKEY

--- BADTIME

--- BADMODE

--- BADNAME

--- BADALG

= class Resolv::DNS::DecodeError < StandardError

= class Resolv::DNS::EncodeError < StandardError

= class Resolv::DNS::Config

== Class Methods

--- new(config_info = nil)

--- default_config_hash(filename = '/etc/resolv.conf')

--- parse_resolv_conf(filename)

== Instance Methods

--- lazy_initialize

--- generate_candidates(name)

--- generate_timeouts

--- resolv(name)

--- single?

== Constants

--- InitialTimeout

= class Resolv::DNS::Config::NXDomain < Resolv::ResolvError

= class Resolv::DNS::Config::OtherResolvError < Resolv::ResolvError

= class Resolv::DNS::Message < Object

== Class Method

--- new(id = ((@@identifier += 1) & 0xffff))

--- decode(m)

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

--- id
--- id=()

--- qr
--- qr=()

--- opcode
--- opcode=()

--- aa
--- aa=()

--- tc
--- tc=()

--- rd
--- rd=()

--- ra
--- ra=()

--- rcode
--- rcode=()

--- question

--- answer

--- authority

--- additional

= class Resolv::DNS::Message::MessageDecoder < Object

== Class Method

--- new(data)

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

= class Resolv::DNS::Message::MessageEncoder < Object

== Class Methods

--- new

== Instance Method

--- put_bytes(d)
--- put_label(d)
--- put_labels(d)
--- put_length16
--- put_name(d)
--- put_pack(template, *d)
--- put_string(d)
--- put_string_list(ds)

--- to_s

= class Resolv::DNS::Query < Object

== Class Methods

--- decode_rdata(msg)

== Instance Method

--- encode_rdata(msg)


= module Resolv::DNS::Label

== Class Methods

--- split(name)

= class Resolv::DNS::Label::Str

== Class Methods

--- new(string)

== Instance Methods

--- string
--- to_s

--- downcase

= class Resolv::DNS::Name < Object

== Class Methods

--- create(name)

--- new(labels, absolute = true)

== Instance Methods

--- to_a
--- to_s
--- []
--- absolute?
--- length
--- subdomain_of?(other)

= class Resolv::DNS::Resource < Resource::DNS::Query

== Class Methods

--- decode_rdata(msg)
--- get_class(type_value, class_value)

== Instance Methods

--- encode_rdata(msg)

== Constants

--- ClassHash

--- ClassValue

--- ClassInsensitiveTypes

= class Resolv::IPv4 < Object

== Class Methods

--- create(address)

"192.168.0.1" �Τ褦�� "." �Ƕ��ڤ�줿 IPv4 ɽ����ʸ���� address ����
Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

--- new(address)

4 byte ��ʸ���� address ���� Resolv::IPv4 �Υ��󥹥��󥹤��������ޤ���

== Instance Methods

--- address

--- to_s
--- to_name

== Constants

--- Regex
#@#    regular expression for IPv4 address.

IPv4 �Υ��ɥ쥹������ɽ���Ǥ���

= class Resolv::IPv6 < Object

== Class Methods

--- create(address)

�ʲ��Τ����줫�η�����ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���

#@todo

  * 8Hex
  * CompressedHex
  * 6Hex4Dec
  * CompressedHex4Dec

--- new(address)

16 byte ��ʸ���� address ���� Resolv::IPv6 �Υ��󥹥��󥹤��������ޤ���

== Instance Methods

--- address

--- to_s
--- to_name

== Constants

--- Regex
#@#    regular expression for IPv6 address.
IPv6�Υ��ɥ쥹������ɽ���Ǥ���

--- Regex_6Hex4Dec
--- Regex_8Hex
--- Regex_CompressedHex
--- Regex_CompressedHex4Dec

#@end
