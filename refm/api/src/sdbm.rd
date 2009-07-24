SDBM �� Ruby ������ץȤ��鰷������Υ饤�֥��Ǥ���

SDBM �� DBM ��Ʊ���褦��Ư���ϥå���ǡ����١����Υ饤�֥��Ǥ���

[[lib:dbm]] �Ȥۤ�Ʊ���Ǥ����������Υ饤�֥��˰�¸���ʤ��ΤǤɤδĶ�
�Ǥ�¹ԤǤ���Ȥ�������������ޤ���

�������ͤ˻��ѤǤ��륵�����ˤ����¤�����ޤ���
��Ĥ����ǤΥ����������� + �� + ��������(16�Х���)��
��פ� 1024 �Х��ȤޤǤǤ���

@see [[lib:dbm]], [[lib:gdbm]]

= class SDBM < Object
include Enumerable

SDBM �ե�����򥢥��������륯�饹��

�������ǡ����Ȥ��ʸ����Ǥʤ���Фʤ�ʤ��Ȥ������¤ȡ�
�ǡ������ե��������¸�����Ȥ�����������Ƥ� [[c:Hash]] ���饹��
����Ʊ�ͤ˰������Ȥ��Ǥ��ޤ���

@see [[c:Hash]]

== Class Methods

--- new(dbname, mode = 0666) -> SDBM
--- open(dbname, mode = 0666) -> SDBM
--- open(dbname, mode = 0666) {|db| ... } -> ()

dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ� mode �����ꤷ�ƥ����ץ󤷤ޤ���
mode �ξ�ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil ����ꤹ��ȥǡ����١�����
¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺 nil ���֤��ޤ���

== Instance Methods

--- [](key) -> String

key �򥭡��Ȥ����ͤ��֤��ޤ���

@param key ������

--- []=(key, value)

key �򥭡��Ȥ��ơ�value ���Ǽ���ޤ���

value �Ȥ��� nil ����ꤹ��ȡ�key ���Ф�����ܤ������ޤ���

@param key ������
@param value ��Ǽ�����͡�

--- clear -> self

DBM �ե��������ˤ��ޤ���

--- close -> nil

DBM �ե�����򥯥������ޤ���

�ʸ�������㳰��ȯ�������ޤ���

#@since 1.8.3
--- closed? -> bool

DBM �ե����뤬�����Ĥ����Ƥ��뤫�ɤ������֤��ޤ���

�����Ĥ����Ƥ���� true ���֤��ޤ���
�����Ǥʤ���� false ���֤��ޤ���

#@end

--- delete(key) -> String

key �򥭡��Ȥ�����ܤ������ޤ���

@param key ������

@return ����������Ǥ��ͤ��֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.delete('a') #=> 'aaa'


--- reject! { |key, value|  ...  }   -> self
--- delete_if { |key, value|  ...  } -> self

�֥�å���ɾ�������ͤ����Ǥ���г���������ܤ������ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1                                    #=> #<SDBM:0xb7cc96f8>
  p db1.reject!{ |key, value| key == 'a' } #=> #<SDBM:0xb7cc96f8>


--- reject {|key, value| ... } -> Hash

�֥�å���ɾ�������ͤ����Ǥ���г����������Ǥ������ޤ���

  self.to_hash.reject{|key, value| ... }

��Ʊ���Ǥ���

@see [[m:Hash#reject]]

--- each {|key, value|  ...  } -> self
--- each_pair {|key, value|  ...  } -> self

�����Ǥ��Ф��륤�ƥ졼����

--- each_key {|key|  ...  } -> self

���Ƥ� key ���Ф��Ʒ����֤����ƥ졼����

--- each_value {|value|  ...  } -> self

���Ƥ� value ���Ф��Ʒ����֤����ƥ졼����

--- empty? -> bool

�ǡ����١��������λ��������֤��ޤ���

--- has_key?(key) -> bool
--- key?(key) -> bool
--- include?(key) -> bool
--- member?(key) -> bool

key ���ǡ����١������¸�ߤ�����������֤��ޤ���

@param key ����������������

--- has_value?(value) -> bool
--- value?(value) -> bool

value ���ͤȤ����Ȥ��ǡ����١������¸�ߤ�����������֤��ޤ���

@param value �����������͡�

#@until 1.9.1
--- indexes(*keys) -> [[String]]
--- indices(*keys) -> [[String]]

�ư������ͤ򥭡��Ȥ������Ǥ�ޤ�������֤��ޤ���

���Υ᥽�åɤ� obsolete �Ǥ���

@param keys ���������������Ǥ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.indexes('a', 'b') #=> ["aaa", "bbb"]

#@end

--- keys -> [String]

�ǡ����١������¸�ߤ��륭�����Ƥ�ޤ�������֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  p db1.keys #=> ["a", "b","c"]

--- length -> Integer
--- size   -> Integer

�ǡ����١���������Ǥο����֤��ޤ���

===== ���

���ߤμ¸��Ǥ����ǿ�������뤿��˥ǡ����١����������������ޤ���

--- shift -> [String]

�ǡ����١���������Ǥ��ļ��Ф����ǡ����١������������ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  p db1.shift #=> ["a", "aaa"]

--- values -> [String]

�ǡ����١������¸�ߤ��������Ƥ�ޤ�������֤��ޤ���

--- replace(other) -> self

self �����Ƥ� other �����Ƥ��֤������ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  db2 = SDBM.open('bbb.gdbm', 0666)
  db2['c'] = 'ccc'
  db2['d'] = 'ddd'
  hash = { 'x' => 'xxx', 'y' => 'yyy'}
  
  p db1               #=> #<SDBM:0xb7c304d0>
  p db1.to_hash       #=> {"a"=>"aaa", "b"=>"bbb", "c"=>"ccc"}
  p db1.replace(db2)  #=> #<SDBM:0xb7c304d0>
  p db1.to_hash       #=> {"c"=>"ccc", "d"=>"ddd"}
  p db1.replace(hash) #=> #<SDBM:0xb7c304d0>
  p db1.to_hash       #=> {"x"=>"xxx", "y"=>"yyy"}


--- fetch -> String

�ǡ����١��������б����륭����õ���Ƥ������Ǥ��ͤ��֤��ޤ���

@param key     õ�����륭����
@param ifnone  �б����륭�������Ĥ���ʤ��ä������֤��͡�

@raise IndexError ifnone �����ꤵ��Ƥ��ʤ��Ȥ��ˡ��б����륭����
                  ���Ĥ���ʤ��ä�����ȯ�����ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.fetch('a')                             #=> "aaa"
  p db1.fetch('z', 'zzz')                      #=> "zzz"
  p db1.fetch('z'){|key| [:key, key] }         #=> [:key, "z"]
  p db1.fetch('z', 'zzz'){|key| [:key, key] }  #=> "zzz"
  p db1.fetch('z')                             #=> IndexError ȯ��


--- store(key, val) -> [String]

key ���Ф��� val ���Ǽ���ޤ���

@see [[m#SDBM#[]=]]

--- select{|key, value| ... } -> [[String]]

�֥�å���ɾ�����ƿ��ˤʤä����ǤΤߤ�����˳�Ǽ�����֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1.clear
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.select{ |key, value| key == 'a' } #=> [["a", "aaa"]]
  p db1.select{ |key, value| key != 'a' } #=> [["c", "ccc"], ["b", "bbb"]]

--- values_at(*keys) -> [String]

keys ���б������ͤ�����˳�Ǽ�����֤��ޤ���

@param keys ������ʣ�������ǽ�Ǥ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.values_at('a', 'b')  #=> ["aaa", "bbb"]

--- invert -> Hash

�ͤ��饭���ؤΥϥå�����֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1.clear
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.invert #=> {"aaa"=>"a", "bbb"=>"b", "ccc"=>"c"}

--- update -> self

self �� other �����Ƥ�ޡ������ޤ���

��ʣ���륭�����б������ͤ�other �����ƤǾ�񤭤���ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1.clear
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  db2 = SDBM.open('bbb.gdbm', 0666)
  db2.clear
  db2['c'] = 'ccc'
  db2['d'] = 'ddd'
  hash = { 'x' => 'xxx', 'y' => 'yyy'}
  
  p db1               #=> #<SDBM:0xb7d19554>
  p db1.to_hash       #=> {"a"=>"aaa", "b"=>"bbb", "c"=>"ccc"}
  p db1.update(db2)   #=> #<SDBM:0xb7d19554>
  p db1.to_hash       #=> {"a"=>"aaa", "b"=>"bbb", "c"=>"ccc", "d"=>"ddd"}
  p db1.update(hash)  #=> #<SDBM:0xb7d19554>
  p db1.to_hash       #=> {"a"=>"aaa", "x"=>"xxx", "b"=>"bbb", "y"=>"yyy", "c"=>"ccc", "d"=>"ddd"}

--- to_a -> [[String]]

self �γ����Ǥ��Ǽ����������֤��ޤ���

�֤���������1�Ĥ����Ǥ� [key, value] �Ǥ���
�Ĥޤ������������֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1.clear
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.to_a #=> [["a", "aaa"], ["b", "bbb"], ["c", "ccc"]]

--- to_hash -> Hash

self �γ����Ǥ��Ǽ�����ϥå�����֤��ޤ���

  require 'sdbm'
  
  db1 = SDBM.open('aaa.gdbm', 0666)
  db1.clear
  db1['a'] = 'aaa'
  db1['b'] = 'bbb'
  db1['c'] = 'ccc'
  
  p db1.to_hash #=> {"a"=>"aaa", "b"=>"bbb", "c"=>"ccc"}


--- index(val) -> String

�� val ���б����륭�����֤��ޤ���

�б��������Ǥ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���
�������륭����ʣ��¸�ߤ����硢�ɤΥ������֤���������Ǥ���

@see [[m:Hash#index]]

= class SDBMError < StandardError

SDBM �����ǻ��Ѥ����㳰���饹�Ǥ���


