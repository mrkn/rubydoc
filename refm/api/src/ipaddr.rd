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

  * [[RFC:3513]]

== Class Methods

--- new(addr = '::', family = Socket::AF_UNSPEC) -> IPAddr

������ IPAddr ���֥������Ȥ��������ޤ���

@param addr 0 ���� [[m:IPAddr::IN6MASK]] �ޤǤο��ͤ�������ޤ��� 
            �ޤ���'address', 'address/prefixlen', 'address/mask' �η���������դ��ޤ���
            �ץ�ե��å���Ĺ��ޥ��������ꤵ���ȡ�
            �ޥ������줿 IPAddr ���֥������Ȥ��֤��ޤ���
            IPv6 ���ɥ쥹�ξ��ϡ�[ ] �ǰϤޤ�Ƥ��Ƥ⤫�ޤ��ޤ���

@param family family �ϼ�ưŪ��Ƚ�ꤵ��ޤ���������Ū�˻��ꤹ�뤳�Ȥ�Ǥ��ޤ���

@raise ArgumentError family �� Socket::AF_UNSPEC �ξ���ȯ�����ޤ���

@raise ArgumentError family �˥��ݡ��Ȥ���Ƥ��ʤ� address family ����ꤷ������ȯ�����ޤ���


--- new_ntoh(addr) -> IPAddr

�ͥåȥ���Х��ȥ��������ΥХ����󤫤� IPAddr ���֥������Ȥ��������ޤ���

@param addr �ͥåȥ���Х��ȥ��������ΥХ�����

��:

  require 'ipaddr'
  p IPAddr.new_ntoh("\300\250\001\001")   # => <IPAddr: IPv4:192.168.1.1/255.255.255.255>

--- ntop(addr)

�ͥåȥ���Х��ȥ��������ΥХ������ɽ�����줿 IP ���ɥ쥹��ʹ֤��ɤ��������Ѵ����ޤ���

@param addr �ͥåȥ���Х��ȥ��������ΥХ�����


== Instance Methods

--- &(ipaddr) -> IPAddr

¾�� IPAddr ���֥������ȤȤΥӥåȤ��Ȥ������Ѥˤ�ꡢ
������ IPAddr ���֥������Ȥ��������ޤ���

@param ipaddr ¾�� IPAddr ���֥������ȡ�
#@since 1.8.7
              �ޤ������ͤ�ʸ���������դ��ޤ���
#@end

--- |(ipaddr) -> IPAddr

¾�� IPAddr ���֥������ȤȤΥӥåȤ��Ȥ������¤ˤ�ꡢ
������ IPAddr ���֥������Ȥ��������ޤ���

@param ipaddr ¾�� IPAddr ���֥������ȡ�
#@since 1.8.7
              �ޤ������ͤ�ʸ���������դ��ޤ���
#@end

--- ~ -> IPAddr

�ӥåȤ��Ȥ���������ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���

--- >>(num) -> IPAddr

�ӥåȤ��Ȥα����եȱ黻�ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���

@param num �����եȤ�������

--- <<(num) -> IPAddr

�ӥåȤ��Ȥκ����եȱ黻�ˤ�ꡢ������ IPAddr ���֥������Ȥ��������ޤ���

@param num �����եȤ�������


--- ==(ipaddr) -> bool

IPAddr ���֥�������Ʊ�Τ�������������Ӥ��ޤ���

@param ipaddr ����оݤ� IPAddr ���֥������ȡ�
#@since 1.8.7
              �ޤ������ͤ�ʸ���������դ��ޤ���
#@end

��:

  require "ipaddr"
  p IPAddr.new("192.168.0.1") == IPAddr.new("192.168.0.1/24")   # => false

--- mask(prefixlen)  -> IPAddr

�ޥ������줿������ IPAddr ���֥������Ȥ��֤��ޤ���
�����ˤϥץ�ե��å���Ĺ�ȥޥ�����ξ��������դ��ޤ�
(e.g. 8, 64, "255.255.255.0")��

@param prefixlen �ץ�ե��å���Ĺ�ޤ��ϥޥ�����ɽ�����ͤ�ʸ����

--- include?(ipaddr) -> bool
--- ===(ipaddr)      -> bool

Ϳ����줿 IPAddr ���֥������Ȥ����Ȥ��ϰϤ����äƤ��뤫��Ƚ�ꤷ�ޤ���

@param ipaddr �ϰϤ����äƤ��뤫�ɤ���Ĵ�٤��оݤȤʤ� IPAddr ���֥������ȡ�
#@since 1.8.7
              �ޤ������ͤ�ʸ���������դ��ޤ���
#@end

--- to_i -> Integer

�������Ѵ����ޤ���

��:

  require "ipaddr"
  p IPAddr.new("0.0.1.0").to_i   # => 256

--- to_s -> String

ʸ������Ѵ����ޤ���

  addr6 = IPAddr.new('::1')
  addr6.to_s       #=> "::1"
  addr6.to_string  #=> "0000:0000:0000:0000:0000:0000:0000:0001"

@see [[m:IPAddr#to_string]]

--- to_string -> String

ɸ��Ū��ʸ����ɽ�����Ѵ����ޤ���

  addr6 = IPAddr.new('::1')
  addr6.to_s       #=> "::1"
  addr6.to_string  #=> "0000:0000:0000:0000:0000:0000:0000:0001"

@see [[m:IPAddr#to_s]]

--- hton -> String

�ͥåȥ�����������ΥХ�������Ѵ����ޤ���

--- ipv4? -> bool

IPv4 �ʤ鿿���֤��ޤ���

--- ipv6? -> bool

IPv6 �ʤ鿿���֤��ޤ���

--- ipv4_mapped? -> bool

IPv4 �ͱ� IPv6 ���ɥ쥹�ʤ� �����֤��ޤ���

--- ipv4_compat? -> bool

IPv4 �ߴ� IPv6 ���ɥ쥹�ʤ� �����֤��ޤ���

--- ipv4_mapped -> IPAddr

IPv4 ���ɥ쥹���� IPv4 �ͱ� IPv6 ���ɥ쥹��
������ IPAddr ���֥������Ȥ��֤��ޤ���

--- ipv4_compat -> IPAddr

IPv4 ���ɥ쥹���� IPv4 �ߴ� IPv6 ���ɥ쥹��
������ IPAddr ���֥������Ȥ��֤��ޤ���

--- native -> self | IPAddr

IPv4 �ͱ� IPv6 ���ɥ쥹�� IPv4 �ߴ� IPv6 ���ɥ쥹���顢
IPv4 ���ɥ쥹�ο����� IPAddr ���֥������Ȥ��֤��ޤ���
IPv4 �ߴ��Ǥ� IPv4 �Ȥ߹��ߤǤ�ʤ��ʤ� self ���֤��ޤ���

��:

  require "ipaddr"
  p IPAddr.new("0000:0000:0000:0000:0000:ffff:c0a8:0001").native
      # => #<IPAddr: IPv4:192.168.0.1/255.255.255.255>

--- reverse -> String

DNS �հ����Τ����ʸ������֤��ޤ���
IPv6 �ʤ� [[RFC:3172]] ��������줿�������֤��ޤ���

��:

  require "ipaddr"
  p IPAddr.new("192.168.0.1").reverse   # => "1.0.168.192.in-addr.arpa"

--- ip6_arpa -> String

IPv6 �ʤ� [[RFC:3172]] ��������줿������ DNS �հ����Τ����ʸ������֤��ޤ���
IPv4 �ξ����㳰��ȯ�����ޤ���

--- ip6_int -> String

IPv6 �ʤ� [[RFC:1886]] �ߴ������� DNS �հ����Τ����ʸ������֤��ޤ���
IPv4 �ξ����㳰��ȯ�����ޤ���

--- inspect -> String

���֥������Ȥ�ʹ֤��ɤ��������Ѵ�����ʸ������֤��ޤ���

--- family -> Integer

���Υ��֥������ȤΥ��ɥ쥹�ե��ߥ���֤��ޤ���

@see [[c:Socket]]

#@since 1.8.7
--- <=>(other) -> nil | Integer

self �� other ����Ӥ��ޤ���

@param other ����оݤ� IPAddr ���֥������ȡ�

@return self �� other �Υ��ɥ쥹�ե��ߥ꤬���פ��ʤ����� nil ���֤��ޤ���
        ���ɥ쥹�ե��ߥ꤬���פ�����ϡ�ξ���ο���ɽ���� [[m:Integer#<=>]]
        ����Ӥ�����̤��֤��ޤ���

@see [[m:Integer#<=>]]

--- succ -> IPAddr

���� IPAddr ���֥������Ȥ��֤��ޤ���

  ipaddr = IPAddr.new('192.168.1.1')
  p ipaddr.succ.to_s #=> "192.168.1.2"

--- to_range -> Range

self �� IP ���ɥ쥹�ȥ��֥ͥåȥޥ����Ǽ����Ǥ��� IP ���ɥ쥹���ϰϤ�
[[c:Range]] ���֥������ȤȤ����֤��ޤ���

��:

  IPAddr.new('192.168.1.1').to_range
  #=> #<IPAddr: IPv4:192.168.1.1/255.255.255.255>..#<IPAddr: IPv4:192.168.1.1/255.255.255.255>
  IPAddr.new('::1').to_range
  #=> #<IPAddr: IPv6:0000:0000:0000:0000:0000:0000:0000:0001/ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>..
  #   #<IPAddr: IPv6:0000:0000:0000:0000:0000:0000:0000:0001/ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>

#@end

#@since 1.9.2
--- eql?(other) -> bool

���Ȥ� other �����������Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

@see [[m:Object#eql?]]

--- hash -> Integer

�ϥå����ͤ��֤��ޤ���

@see [[m:Object#hash]]

#@end

== Protected Instance Methods

--- set(addr, *family) -> self

���Υ��֥������Ȥ� IP ���ɥ쥹�ȥ��ɥ쥹�ե��ߥ�򥻥åȤ��Ƽ��Ȥ��֤��ޤ���

@param addr ���åȤ��� IP ���ɥ쥹�ο���ɽ����

@param family ���åȤ��륢�ɥ쥹�ե��ߥꡣ

--- mask!(mask) -> self

Ϳ����줿 mask ����Ѥ��Ƥ��Υ��֥������Ȥ� IP ���ɥ쥹���˲�Ū���ѹ����ޤ���

@param mask �ץ�ե��å���Ĺ��ɽ��ʸ���󤫡����֥ͥåȥޥ�����ɽ��ʸ����

== Constants

--- IN4MASK

IPv4 ���ɥ쥹�ξ��˻��Ѥ���ޥ����͡�

  0xffffffff

--- IN6MASK

IPv6 ���ɥ쥹�ξ��˻��Ѥ���ޥ����͡�

  0xffffffffffffffffffffffffffffffff

--- IN6FORMAT

IPv6 ���ɥ쥹��狼��䤹��ɽ�����뤿��Υե����ޥå�ʸ����

  "%.4x:%.4x:%.4x:%.4x:%.4x:%.4x:%.4x:%.4x"

#@end
