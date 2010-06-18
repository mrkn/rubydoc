GDBM(GNU �ǡ����١������ޥ͡�����) �� Ruby ������ץȤ��鰷������Υ饤�֥��Ǥ���

GDBM �� dbm ����� ndbm �ߴ���ǽ��ޤ�Ǥ��ޤ���
�����륭�����ͤΥ����������¤Ϥ���ޤ���

@see [[lib:dbm]], [[lib:sdbm]], [[man:gdbm(3)]]

= class GDBM < Object

include Enumerable

GDBM �ե�����򥢥��������륯�饹��

�������ǡ����Ȥ��ʸ����Ǥʤ���Фʤ�ʤ��Ȥ������¤ȡ�
�ǡ������ե��������¸�����Ȥ�����������Ƥ� [[c:Hash]] ���饹��
����Ʊ�ͤ˰������Ȥ��Ǥ��ޤ���

== Class Methods

--- new(dbname, mode = 0666, flags = 0) -> GDBM

dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ� mode �����ꤷ�ƥ����ץ󤷤ޤ���

@param dbname �ǡ����١�����̾������ꤷ�ޤ���

@param mode ��ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil ����ꤹ��ȥǡ����١�����
            ¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺 nil ���֤��ޤ���

@param flags flags �ˤϡ�[[m:GDBM::FAST]], [[m:GDBM::SYNC]], [[m:GDBM::NOLOCK]]
             �������¤���ꤷ�ޤ����ǥե�����ͤϻ���ʤ�(�Ĥޤ�0)�Ǥ���
#@if (version >= "1.8.2")
             flags �� [[m:GDBM::READER]], [[m:GDBM::WRITER]], [[m:GDBM::WRCREAT]], [[m:GDBM::NEWDB]]
             �Τ����줫��Ϳ�����ɤ߽񤭤Υ⡼�ɤ����Ǥ��ޤ���
             ������ɤ����ꤷ�ʤ��ä����ˤϡ�
             [[m:GDBM::WRCREAT]], [[m:GDBM::WRITER]], [[m:GDBM::READER]] �ν�ǻ�ޤ���
#@end

--- open(dbname, mode = 0666, flags = 0) -> GDBM
--- open(dbname, mode = 0666, flags = 0) {|db| ... } -> object

dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ� mode �����ꤷ�ƥ����ץ󤷤ޤ���

�֥�å�����ꤷ����硢�����ץ󤷤� GDBM ���֥������Ȥ�
�����˥֥�å���¹Ԥ��ޤ����¹Ը� GDBM ���֥������Ȥ򥯥���
����open �᥽�åɤϥ֥�å��η�̤��֤��ޤ���

@param dbname �ǡ����١�����̾������ꤷ�ޤ���

@param mode ��ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil ����ꤹ��ȥǡ����١�����
            ¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺 nil ���֤��ޤ���

@param flags flags �ˤϡ�[[m:GDBM::FAST]], [[m:GDBM::SYNC]], [[m:GDBM::NOLOCK]]
             �������¤���ꤷ�ޤ����ǥե�����ͤϻ���ʤ�(�Ĥޤ�0)�Ǥ���
#@if (version >= "1.8.2")
             flags �� [[m:GDBM::READER]], [[m:GDBM::WRITER]], [[m:GDBM::WRCREAT]], [[m:GDBM::NEWDB]]
             �Τ����줫��Ϳ�����ɤ߽񤭤Υ⡼�ɤ����Ǥ��ޤ���
             ������ɤ����ꤷ�ʤ��ä����ˤϡ�
             [[m:GDBM::WRCREAT]], [[m:GDBM::WRITER]], [[m:GDBM::READER]] �ν�ǻ�ޤ���
#@end

   require 'gdbm'
   GDBM.open("fruitstore.db") do |gdbm|
     gdbm.each_pair do |key, value|
       print "#{key}: #{value}\n"
     end
   end


== Instance Methods

--- [](key) -> String

key �򥭡��Ȥ����ͤ��֤��ޤ���

@param key ������

--- []=(key, value)

key �򥭡��Ȥ��ơ�value ���Ǽ���ޤ���

@param key ������
@param value ��Ǽ�����͡�

--- cachesize=(size)

�����Υ���å���Υ���������ꤷ�ޤ���

�ܤ����� [[man:gdbm(3)]] �� GDBM_CACHESIZE �ι�򻲾Ȥ���������

@param size �����������Υ���å��奵������

@see [[man:gdbm(3)]]

--- clear -> self

DBM �ե��������ˤ��ޤ���

--- close -> nil

DBM �ե�����򥯥������ޤ���

�ʸ�������㳰 [[c:RuntimeError]] ��ȯ�������ޤ���

#@since 1.8.3
--- closed? -> bool

DBM �ե����뤬�����Ĥ����Ƥ��뤫�ɤ������֤��ޤ���

�����Ĥ����Ƥ���� true ���֤��ޤ���
�����Ǥʤ���� false ���֤��ޤ���

#@end

--- delete(key) -> nil
--- delete(key) {|key| ... } -> ()

key �򥭡��Ȥ�����ܤ������ޤ���

���ꤷ��������¸�ߤ��ʤ���� nil ���֤��ޤ���
���ΤȤ��֥�å�����ꤷ�Ƥ���С��֥�å���ɾ�����ޤ���

--- delete_if { |key, value|  ...  } -> self
--- reject! { |key, value|  ...  } -> self

�֥�å���ɾ�������ͤ����Ǥ���г���������ܤ������ޤ���

���Υ᥽�åɤ� self ���˲�Ū���ѹ����ޤ���

--- each {|key, value|  ...  } -> self
--- each_pair {|key, value|  ...  } -> self

�����Ǥ��Ф��륤�ƥ졼���Ǥ���

--- each_key {|key|  ...  } -> self

���Ƥ� key ���Ф��Ʒ����֤����ƥ졼���Ǥ���

--- each_value {|value|  ...  } -> self

���Ƥ� value ���Ф��Ʒ����֤����ƥ졼���Ǥ���

--- empty? -> bool

�ǡ����١��������λ��������֤��ޤ���

--- fastmode=(bool)

�����ץ󤷤Ƥ��� GDBM ���֥������ȤΥ⡼�ɤ��ѹ����ޤ���

���Υ��ץ����ϥǥե���Ȥ� on �Ǥ���
���Υ��ץ����� obsolete �Ǥ���

���Υ��ץ���� on �ΤȤ��ϡ�GDBM �ϥǥ������ؤν񤭹��ߤ��Ԥ�����
��������³���ޤ���

@param bool �����˥��åȤ���⡼�ɡ�


@see [[m:GDBM::FAST]], [[m:GDBM#syncmode=]]

--- syncmode=(bool)

�����ץ󤷤Ƥ��� GDBM ���֥������ȤΥ⡼�ɤ��ѹ����ޤ���

���Υ��ץ����ϥǥե���Ȥ� off �Ǥ���

���Υ��ץ���� on �ΤȤ��ϡ�GDBM �ϥǡ����١������ѹ����Ȥ�
�ǡ����١����ξ��֤�Ʊ�����ޤ���

@param bool �����˥��åȤ���⡼�ɡ�

@see  [[m:GDBM::SYNC]], [[m:GDBM#fastmode=]]

--- fetch(key, ifnone = nil){|key| ... } -> object

�ǡ����١��������б����륭����õ���Ƥ������Ǥ��ͤ��֤��ޤ���

@param key     õ�����륭����
@param ifnone  �б����륭�������Ĥ���ʤ��ä������֤��͡�

@raise IndexError ifnone �����ꤵ��Ƥ��ʤ��Ȥ��ˡ��б����륭����
                  ���Ĥ���ʤ��ä�����ȯ�����ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  
  p db1.fetch('a')                            #=> 'aaa'
  p db1.fetch('z', 'zzz')                     #=> 'zzz'
  p db1.fetch('z'){|key| [:key, key] }        #=> [:key, 'z']
  p db1.fetch('z', 'zzz'){|key| [:key, key] } #=> 'zzz'
  p db1.fetch('z')                            #=> IndexError ȯ��

@see [[m:Hash#fetch]]

--- has_key?(key) -> bool
--- key?(key) -> bool
--- include?(key) -> bool
--- member?(key) -> bool

key ���ǡ����١������¸�ߤ�����������֤��ޤ���

--- has_value?(value) -> bool
--- value?(value) -> bool

value ���ͤȤ������Ǥ��ǡ����١������¸�ߤ�����������֤��ޤ���

@param value �����������͡�

--- index(val) -> String

�� val ���б����륭�����֤��ޤ���

�б��������Ǥ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���
�������륭����ʣ��¸�ߤ����硢�ɤΥ������֤���������Ǥ���

@see [[m:Hash#index]]

#@until 1.9.1
--- indexes(*keys) -> [String]
--- indices(*keys) -> [String]

�ư������ͤ򥭡��Ȥ������Ǥ��ͤ�ޤ�������֤��ޤ���

���Υ᥽�åɤ�obsolete�Ǥ���

@param keys ���������������Ǥ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  p db1.indexes('a', 'b') #=> ["aaa", "bbb"]


#@end

--- invert -> Hash

�ͤ��饭���ؤΥϥå�����֤��ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  p db1.invert #=> {"aaa"=>"a", "bbb"=>"b"}


#@since 1.9.1
--- key(value) -> String

Ϳ����줿�ͤ��б����륭�����֤��ޤ���

�ͤ��б����륭����ʣ��������Ϻǽ�˸��Ĥ��ä��������֤��ޤ���

@param value ������õ�������ͤ���ꤷ�ޤ���

#@end

--- keys -> [String]

�ǡ����١������¸�ߤ��륭�����Ƥ�ޤ�������֤��ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  p db1.keys #=> ["a", "b"]


--- length -> Integer
--- size   -> Integer

�ǡ����١���������Ǥο����֤��ޤ���

���ߤμ¸��Ǥ����ǿ�������뤿��˥ǡ����١����������������ޤ���

--- reject {|key, value| ... } -> Hash


�֥�å���ɾ�������ͤ����Ǥ���г����������Ǥ������ޤ���

  self.to_hash.reject{|key, value| ... }

��Ʊ���Ǥ���

@see [[m:Hash#reject]]

--- reorganize -> self

DB �ե�����κ�������Ԥ��ޤ���

GDBM �Ǥϡ����Ǥκ����ԤäƤ� DB �ե�����Υ������ϸ������ޤ���(��
���ˤ�äƶ������ΰ�ϼ��γ�Ǽ�Τ���˼�äƤ�����ޤ�)��
���Υ᥽�åɤ�ƤӽФ����Ȥ� DBM �ե�����򿷵��˺��ľ��̵�̤��ΰ��ʤ�
�����Ȥ��Ǥ��ޤ���

���̤κ����Ԥä��Ȥ��ˡ��ǥ��������ڡ���������Τ���˻��Ѥ��ޤ���

--- replace(other) -> self

self �����Ƥ� other �����Ƥ��֤������ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db2 = GDBM.open('bbb.gdbm', 0666, GDBM::NEWDB)
  db2['c'] = 'ccc'
  db2['d'] = 'ddd'
  hash = { 'x' => 'xxx', 'y' => 'yyy'}
  
  p db1               #=> #<GDBM:0xb7d1c8a8>
  p db1.replace(db2)  #=> #<GDBM:0xb7d1c8a8>
  p db1.replace(hash) #=> #<GDBM:0xb7d1c8a8>


--- select{|key, value| ... } -> [[String]]

�֥�å���ɾ�����ƿ��ˤʤä����ǤΤߤ�����˳�Ǽ�����֤��ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.select{ |key, value| key == 'a' } #=> [["a", "aaa"]]
  p db1.select{ |key, value| key != 'a' } #=> [["c", "ccc"], ["b", "bbb"]]

@see [[m:Hash#select]]

--- shift -> [String]

�ǡ����١���������Ǥ��ļ��Ф����ǡ����١������������ޤ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  
  p db1.shift #=> ["a", "aaa"]

--- store(key, val) -> [String]

key ���Ф��� val ���Ǽ���ޤ���

@see [[m:GDBM#[]=]]

--- sync -> self

���Ǥ��ѹ���ե������ȿ�Ǥ��ޤ���

FAST �⡼��([[m:GDBM.open]] ����3������ [[m:GDBM::FAST]] �����)�ΤȤ�������̣������ޤ���

==== ���
GNU gdbm version 1.8 �ʹߤ�� FAST �⡼�ɤ��ǥե���Ȥˤʤ�ޤ�����

--- to_a -> [[String]]

self �γ����Ǥ��Ǽ����������֤��ޤ���

�֤���������1�Ĥ����Ǥ� [key, value] �Ǥ���
�Ĥޤ������������֤��ޤ���

--- to_hash -> Hash

self �γ����Ǥ��Ǽ�����ϥå�����֤��ޤ���

--- update(other) -> self

self �� other �����Ƥ�ޡ������ޤ���

��ʣ���륭�����б������ͤ�other �����ƤǾ�񤭤���ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���

--- values -> [String]

�ǡ����١������¸�ߤ��������Ƥ�ޤ�������֤��ޤ���

--- values_at(*keys) -> [String]

keys ���б������ͤ�����˳�Ǽ�����֤��ޤ���

@param keys ������ʣ�������ǽ�Ǥ���

  require 'gdbm'
  
  db1 = GDBM.open('aaa.gdbm', 0666, GDBM::NEWDB)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.values_at('a', 'b') #=> ["aaa", "bbb"]
  p db1.values_at('x', 'y') #=> [nil, nil]


== Constants

--- VERSION

libgdbm �ΥС����������ʸ����Ǥ���


--- FAST

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߤη�̤����ǥ�������Υե�����ˤ�����ȿ�Ǥ��ʤ��ʤ�ޤ���
���Υ⡼�ɤΤȤ��˷�̤�����Ū�˥ե������ȿ�Ǥ�����ˤ� [[m:GDBM#sync]]
�᥽�åɤ�ƤӤޤ���libgdbm version 1.8.0 �ʹߤǤϤ��Υ⡼�ɤ��ǥե����
�Ǥ���

--- SYNC

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߤη�̤����ǥ�������Υե�����ˤ�����ȿ�Ǥ���ޤ���
libgdbm version 1.8.0 �����Υǥե���ȥ⡼�ɤǤ���

��������� libgdbm version 1.8.0 �ʹߤ��ͭ���Ǥ���

--- NOLOCK

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�̾¾�Υץ����� DB �򥪡��ץ󤷤Ƥ������˥����ץ��Ԥ���
[[c:Errno::EWOULDBLOCK]](�ޤ��� [[c:Errno::EAGAIN]]) �㳰��ȯ�����ޤ���
���Υե饰����ꤷ�Ƥ���С�¾�Υץ����������ץ󤷤Ƥ������Ǥ�Ʊ��
�����ץ󤹤뤳�Ȥ��Ǥ��ޤ���

��������� libgdbm version 1.8.0 �ʹߤ��ͭ���Ǥ���

#@since 1.8.2
--- READER

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�ɤ߹��ߥ⡼�ɤǥ����ץ󤷤ޤ���

--- WRITER

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߥ⡼�ɤǥ����ץ󤷤ޤ���

--- WRCREAT

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ��ʤ��ä�����ޤ���


--- NEWDB

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ����������Ƥ�����ľ���ޤ���
#@end


= class GDBMError < StandardError

GDBM �����ǻ��Ѥ����㳰���饹�Ǥ���

= class GDBMFatalError < StandardError

GDBM �����ǻ��Ѥ����㳰���饹�Ǥ���
