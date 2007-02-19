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
#@todo

String �Υۥ���̾ name �� IP ���ɥ쥹���å����åפ��ޤ���

getaddress �ϥ�å����å׷�̤κǽ�Υ��ɥ쥹���֤��ޤ���
getaddresses �ϥ�å����å׷�̤Υ��ɥ쥹�ꥹ�Ȥ��֤��ޤ���
each_address �ϥ�å����å׷�̤Υ��ɥ쥹���Ф��륤�ƥ졼���Ǥ���

��:
  Resolv.getaddress("www.ruby-lang.org").to_s #=> "210.251.121.214"

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}
#@todo

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
#@todo

String �Υۥ���̾ name �� IP ���ɥ쥹���å����åפ��ޤ���

���줾��[[m:Resolv.getaddress]], [[m:Resolv.getaddresses]], 
[[m:Resolv.each_address]] ��Ʊ����ǽ�Ǥ���

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}
#@todo

String �� IP ���ɥ쥹 address �Υۥ���̾���å����åפ��ޤ���

���줾��[[m:Resolv.getname]], [[m:Resolv.getnames]], 
[[m:Resolv.each_name]] ��Ʊ����ǽ�Ǥ���

== Constants

--- DefaultResolver
#@todo

--- AddressRegex
#@todo

= class Resolv::ResolvError < StandardError

= class Resolv::ResolvTimeout < StandardError

= class Resolv::Hosts < Object

/etc/hosts ����Ѥ���ۥ���̾�꥾��ФǤ���

== Class Methods

--- new(hosts = '/etc/hosts')
#@todo

== Instance Methods
--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|address| ...}
#@todo

address lookup methods.

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}
#@todo

hostnames lookup methods.

--- lazy_initialize
#@todo

new �ǻ��ꤵ�줿�ե��������Ƥ��ɤ߹��ߡ�̾�����Τ��������������������ޤ���

== Constants

--- DefaultFileName
#@todo

= class Resolv::DNS < Object

DNS stub resolver.

== Class Methods

--- new(resolv_conf = '/etc/resolv.conf')
#@todo

--- open(*args)
#@todo

== Instance Methods

--- getaddress(name)
--- getaddresses(name)
--- each_address(name) {|address| ...}
#@todo

address lookup methods.

name �� Resolv::Name �ޤ��� String �Ǥʤ���Фʤ�ޤ���
��å����å׷�̤� Resolv::IPv4 �ޤ��� Resolv::IPv6 �Υ��󥹥��󥹤Ȥʤ�ޤ���

--- getname(address)
--- getnames(address)
--- each_name(address) {|name| ...}
#@todo

hostnames lookup methods.

address �� Resolv::IPv4, Resolv::IPv6, String �Τ����줫�Ǥʤ���Фʤ�ޤ���
��å����å׷�̤� Resolv::Name �Υ��󥹥��󥹤Ȥʤ�ޤ���

--- getresource(name, typeclass)
--- getresources(name, typeclass)
--- each_resource(name, typeclass) {|resource| ...}
#@todo

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
#@todo

--- extract_resources(msg, name, typeclass)
#@todo

--- lazy_initialize
#@todo

== Constants

--- DNSThreadGroup
#@todo

--- Port
#@todo

--- UDPSize
#@todo

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

= class Resolv::DNS::Resource::IN::WKS < Resolv::DNS::Resource::WKS

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

= class Resolv::DNS::Resource < Resource::DNS::Query

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
