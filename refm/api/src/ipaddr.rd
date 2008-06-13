#@since 1.8.0
IP���ɥ쥹�򰷤��饤�֥��Ǥ���

= class IPAddr < Object

IP ���ɥ쥹�򰷤��Τ���Υ��饹�Ǥ���

��:

  require 'ipaddr'
  
  ipaddr1 = IPAddr.new("3ffe:505:2::1")
  p ipaddr1   # => #<IPAddr: IPv6:3ffe:0505:0002:0000:0000:0000:0000:0001/ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>
  
  ipaddr3 = IPAddr.new("192.168.2.0/24")
  p ipaddr3   # => #<IPAddr: IPv4:192.168.2.0/255.255.255.0>

=== ����

  * [[unknown:rfc:3513]]

== Class Methods

--- new(addr = '::', family = Socket::AF_UNSPEC)
#@todo

������ IPAddr ���֥������Ȥ��������ޤ���
addr �� `address/prefixlen' �� 'address/mask' �ʤɤη���������դ��ޤ���
�ץ�ե��å���Ĺ��ޥ��������ꤵ���ȡ�
�ޥ������줿 IPAddr ���֥������Ȥ��֤��ޤ���
IPv6 ���ɥ쥹�ξ��ϡ�[ ] �ǰϤޤ�Ƥ��Ƥ⤫�ޤ��ޤ���
family �ϼ�ưŪ��Ƚ�ꤵ��ޤ���������Ū�˻��ꤹ�뤳�Ȥ�Ǥ��ޤ���

--- new_ntoh(addr)
#@todo

�ͥåȥ���Х��ȥ��������ΥХ����󤫤� IPAddr ���֥������Ȥ��������ޤ���

��:

  require 'ipaddr'
  p IPAddr.new_ntoh("\300\250\001\001")   # => <IPAddr: IPv4:192.168.1.1/255.255.255.255>

--- ntop(addr)
#@todo

�ͥåȥ���Х��ȥ��������ΥХ������ɽ�����줿 IP ���ɥ쥹��ʹ֤��ɤ��������Ѵ����ޤ���

== Instance Methods

--- &(ipaddr)
#@todo

¾�� IPAddr ���֥������ȤȤΥӥåȤ��Ȥ������Ѥˤ�ꡢ
������ IPAddr ���֥������Ȥ��������ޤ���

--- |(ipaddr)
#@todo

¾�� IPAddr ���֥������ȤȤΥӥåȤ��Ȥ������¤ˤ�ꡢ
������ IPAddr ���֥������Ȥ��������ޤ���

--- ~
#@todo

�ӥåȤ��Ȥ���������ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���
�������ޤ���

--- >>(num)
#@todo

�ӥåȤ��Ȥα����եȱ黻�ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���

--- <<(num)
#@todo

�ӥåȤ��Ȥκ����եȱ黻�ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���

--- ==(ipaddr)
#@todo

IPAddr ���֥�������Ʊ�Τ�������������Ӥ��ޤ���

��:

  require "ipaddr"
  p IPAddr.new("192.168.0.1") == IPAddr.new("192.168.0.1/24")   # => false

--- mask(a)
#@todo

�ޥ������줿������ IPAddr ���֥������Ȥ��֤��ޤ���
�����ˤϥץ�ե��å���Ĺ�ȥޥ�����ξ��������դ��ޤ�
(e.g. 8, 64, "255.255.255.0")��

--- include?(ipaddr)
--- ===(ipaddr)
#@todo

Ϳ����줿 IPAddr ���֥������Ȥ����Ȥ��ϰϤ����äƤ��뤫��Ƚ�ꤷ�ޤ���

--- to_i
#@todo

�������Ѵ����ޤ���

��:

  require "ipaddr"
  p IPAddr.new("0.0.1.0").to_i   # => 256

--- to_s
#@todo

ʸ������Ѵ����ޤ���

--- to_string
#@todo

ɸ��Ū��ʸ����ɽ�����Ѵ����ޤ���

--- hton
#@todo

�ͥåȥ�����������ΥХ�������Ѵ����ޤ���

--- ipv4?
#@todo

IPv4 �ʤ鿿���֤��ޤ���

--- ipv6?
#@todo

IPv6 �ʤ鿿���֤��ޤ���

--- ipv4_mapped?
#@todo

IPv4 �ͱ� IPv6 ���ɥ쥹�ʤ� �����֤��ޤ���

--- ipv4_compat?
#@todo

IPv4 �ߴ� IPv6 ���ɥ쥹�ʤ� �����֤��ޤ���

--- ipv4_mapped
#@todo

IPv4 ���ɥ쥹���� IPv4 �ͱ� IPv6 ���ɥ쥹��
������ IPAddr ���֥������Ȥ��֤��ޤ���

--- ipv4_compat
#@todo

IPv4 ���ɥ쥹���� IPv4 �ߴ� IPv6 ���ɥ쥹��
������ IPAddr ���֥������Ȥ��֤��ޤ���

--- native
#@todo

IPv4 �ͱ� IPv6 ���ɥ쥹�� IPv4 �ߴ� IPv6 ���ɥ쥹���顢
IPv4 ���ɥ쥹�ο����� IPAddr ���֥������Ȥ��֤��ޤ���
IPv4 �ߴ��Ǥ� IPv4 �Ȥ߹��ߤǤ�ʤ��ʤ� self ���֤��ޤ���

��:

  require "ipaddr"
  p IPAddr.new("0000:0000:0000:0000:0000:ffff:c0a8:0001").native
      # => #<IPAddr: IPv4:192.168.0.1/255.255.255.255>

--- reverse
#@todo

DNS �հ����Τ����ʸ������֤��ޤ���
IPv6 �ʤ� RFC3172 ��������줿�������֤��ޤ���

��:

  require "ipaddr"
  p IPAddr.new("192.168.0.1").reverse   # => "1.0.168.192.in-addr.arpa"

--- ip6_arpa
#@todo

IPv6 �ʤ� RFC3172 ��������줿������ DNS �հ����Τ����ʸ������֤��ޤ���
IPv4 �ξ����㳰��ȯ�����ޤ���

--- ip6_int
#@todo

IPv6 �ʤ� RFC1886 �ߴ������� DNS �հ����Τ����ʸ������֤��ޤ���
IPv4 �ξ����㳰��ȯ�����ޤ���

--- inspect
#@todo

--- family
#@todo

== Protected Instance Methods

--- set(addr, *family)
#@todo

--- mask!(mask)
#@todo

== Constants

--- IN4MASK
#@todo

--- IN6MASK
#@todo

--- IN6FORMAT
#@todo

#@end
