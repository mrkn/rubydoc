= class DBM < Object

include Enumerable

NDBM �ե�����򥢥��������륯�饹���������ǡ����Ȥ��ʸ����Ǥʤ���Ф�
��ʤ��Ȥ������¤ȡ��ǡ������ե��������¸�����Ȥ�����������Ƥ�
Hash ���饹������Ʊ�ͤ˰������Ȥ��Ǥ��ޤ���

== Class Methods

--- open(dbname, mode = 0666, flags = nil) -> DBM
--- open(dbname, mode = 0666, flags = nil) {|db| ... } -> ()

dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ� mode �����ꤷ�ƥ����ץ󤷤ޤ���

mode �ξ�ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil ����ꤹ���
�ǡ����١�����¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺 nil ���֤��ޤ���

@param dbname �ǡ����١���̾
@param mode   �ǡ����١����Υ����ץ�⡼��
#@if (version >= "1.8.2")
@param flags  �ʲ��Τ����줫����ꤷ�ޤ���
: DBM::READER
  �ǡ����١������ɤ߹��ߤΤߤ�Ԥ�
: DBM::WRITER
  �ǡ����١����ο��������Ϥ����ɤ߽񤭤���
: DBM::WRCREAT
  �ǡ����١�����¸�ߤ��ʤ���п������������ɤ߽񤭤���
: DBM::NEWDB
  �ǡ����١������˿����������ƴ�¸�Υǡ������˴�����
#@end

== Instance Methods

--- [](key) -> String

key �򥭡��Ȥ����ͤ��֤��ޤ���

@param key ������

--- []=(key, value)

key �򥭡��Ȥ��ơ�value ���Ǽ���ޤ���
value �Ȥ��� nil ����ꤹ��ȡ�key ���Ф������Ǥ������ޤ���

@param key   ������
@param value �͡�

--- clear -> self

DBM �ե��������ˤ��ޤ���

--- close -> nil

DBM �ե�����򥯥������ޤ����ʸ�������㳰��ȯ�������ޤ���

#@since 1.8.3
--- closed? -> bool

DBM �ե����뤬�����Ĥ����Ƥ��뤫Ĵ�٤ޤ���

�����Ĥ����Ƥ���� true ���֤��ޤ��������Ǥʤ���� false ���֤��ޤ���

#@end

--- delete(key) -> String

key �򥭡��Ȥ������Ǥ������ޤ���

@return ����������Ǥ��ͤ��֤��ޤ���

@raise DBMError ���Ǥκ���˼��Ԥ�������ȯ�����ޤ���

--- reject! { |key, value|  ...  } -> self
--- delete_if { |key, value|  ...  } -> self

�֥�å���ɾ�������ͤ����Ǥ���г����������Ǥ������ޤ���

���Υ᥽�åɤ� self ���˲�Ū���ѹ����ޤ���


--- reject{ |key, value| ... } -> Hash

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

--- empty?() -> bool

�ǡ����١��������λ��������֤��ޤ���

--- has_key?(key) -> bool
--- key?(key) -> bool
--- include?(key) -> bool
--- member?(key) -> bool

key ���ǡ����١������¸�ߤ�����������֤��ޤ���

@param key ������

--- has_value?(value) -> bool
--- value?(value) -> bool

value ���ͤȤ����Ȥ��ǡ����١������¸�ߤ�����������֤��ޤ���

@param value �����������͡�

#@if (version < "1.9.0")
--- indexes(*keys) -> [String]
--- indices(*keys) -> [String]

�ư������ͤ򥭡��Ȥ������Ǥ��ͤ�ޤ�������֤��ޤ���

���Υ᥽�åɤ� obsolete �Ǥ���

@param keys ����������������ʣ�������ǽ��

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  p db1.indexes('a', 'b') #=> ["aaa", "bbbbbb"]

#@end

--- keys -> [String]

�ǡ����١������¸�ߤ��륭�����Ƥ�ޤ�������֤��ޤ���

--- length -> Integer
--- size -> Integer

�ǡ����١���������Ǥο����֤��ޤ���

���ߤμ����Ǥ����ǿ�������뤿��˥ǡ����١����������������ޤ���

--- shift -> String

�ǡ����١���������Ǥ��ļ��Ф����ǡ����١������������ޤ���

--- values -> [String]

�ǡ����١������¸�ߤ��������Ƥ�ޤ�������֤��ޤ���

--- replace(other) -> self

self �����Ƥ� other �����Ƥ��֤������ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  db2 = DBM.open('bbb.db', 0666, DBM::NEWDB)
  db2[:bb] = 'bbb'
  db2[:cc] = 'ccc'
  
  p db1.keys #=> ['b', 'a']
  
  db1.replace(db2)
  
  p db1.keys #=> ['bb', 'cc']
  p db2.keys #=> ['bb', 'cc']
  
  hash = {'x' => 'xxx', 'y' => 'yyy' }
  p db1               #=> #<DBM:0xb7c7eb08>
  p db1.replace(hash) #=> #<DBM:0xb7c7eb08>

--- fetch(key, ifnone = nil) -> String

�ǡ����١������饭����õ�����б��������Ǥ��ͤ��֤��ޤ���

@param key    ������
@param ifnone ���������Ĥ���ʤ��ä������֤��͡�

@raise IndexError ifnone ����ꤷ�Ƥ��ʤ��Ȥ������������Ĥ���ʤ��ä�����ȯ�����ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  p db1.fetch('a')                     #=> 'aaa'
  p db1.fetch('z', 'zzz')              #=> 'zzz'
  p db1.fetch('z'){|key| [:key, key] } #=> [:key, 'z']
  p db1.fetch('z')                     #=> IndexError ȯ��

@see [[m:Hash#fetch]]

--- store(key, value) -> String

key ���Ф��� value ���Ǽ���ޤ���

@param key   ������
@param value �͡�

@see [[m:DBM#[]=]]

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  p db1.store('c', 'ccc') #=> "ccc"


--- select{|key, value| ... } -> [Array]

�֥�å���ɾ�����ƿ��ˤʤä����ǤΤߤ�����˳�Ǽ�����֤��ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  
  p db1.select {|key, value| key == 'a' } #=> [["a", "aaa"]]


--- values_at(*keys) -> [String]

keys ���б������ͤ�����˳�Ǽ�����֤��ޤ���

@params keys ������ʣ�������ǽ�Ǥ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  
  p db1.values_at('a', 'b') #=> ["aaa", "bbbbbb"]


--- invert -> Hash

�ͤ��饭���ؤΥϥå�����֤��ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  p db1.invert  #=> {"bbbbbb" => "b", "aaa" => "a"}


--- update(other){|key, value| ... } -> self

self �� other �����Ƥ�ޡ������ޤ���

��ʣ���륭�����б������ͤ�other �����ƤǾ�񤭤���ޤ���

@param other each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ�ޤ���


  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  db2 = DBM.open('bbb.db', 0666, DBM::NEWDB)
  db2[:bb] = 'bbb'
  db2[:cc] = 'ccc'
  
  db1.update(db2)
  p db1.keys #=> ["bb", "cc", "b", "a"]

--- to_a -> [Array]

�������ͤΥڥ���������Ѵ������֤��ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'

  p db1.to_a #=> [["b", "bbbbbb"], ["a", "aaa"]]


--- to_hash -> Hash

self ��ϥå�����Ѵ������֤��ޤ���

  require 'dbm'
  
  db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  db1[:a] = 'aaa'
  db1[:b] = 'bbbbbb'
  p db1.to_hash #=> {"a"=>"aaa", "b"=>"bbbbbb"}

--- index(value) -> String | nil

value ��������ǤΥ������֤��ޤ���

���Ĥ���ʤ��ä����� nil ���֤��ޤ���

@param value �����������͡�

== Constants

#@since 1.8.2
--- READER

�ɤ߹��ߥ⡼�ɤǥ����ץ󤷤ޤ���

@see [[m:DBM#open]]

--- WRITER

�񤭹��ߥ⡼�ɤǥ����ץ󤷤ޤ���

@see [[m:DBM#open]]

--- WRCREAT

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ��ʤ��ä�����ޤ���

@see [[m:DBM#open]]

--- NEWDB

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ����������ƺ��ľ���ޤ���

@see [[m:DBM#open]]

#@end

--- VERSION

libdbm �ΥС�������ɽ��ʸ����Ǥ���

#@if (version < "1.8.7")
DB_VERSION_STRING �Ȥ�������� C �����٥���������Ƥ��ʤ�����
�ȥåץ�٥�� VERSION �����Ȥ���뤿��ٹ�ɽ������ޤ���
#@end
#@since 1.9.0
DB_VERSION_STRING �Ȥ�������� C �����٥���������Ƥ��ʤ�����
"unknown" �ˤʤ�ޤ���
#@end
