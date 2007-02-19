= class DBM < Object

include Enumerable

NDBM �ե�����򥢥��������륯�饹���������ǡ����Ȥ��ʸ����Ǥʤ���Ф�
��ʤ��Ȥ������¤ȡ��ǡ������ե��������¸�����Ȥ�����������Ƥ�
Hash ���饹������Ʊ�ͤ˰������Ȥ��Ǥޤ���

#@#=== �Ȥ�����

#@#  require 'dbm'

== Class Methods

--- open(dbname[, mode[, flags]])
--- open(dbname[, mode[, flags]]) {|db| ...}
#@todo


dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ�
mode �����ꤷ�ƥ����ץ󤷤ޤ���mode �ξ�
ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil �����
����ȥǡ����١�����¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺
nil ���֤��ޤ���

#@if (version >= "1.8.2")
flags ���������Ǥ��ޤ���
flags �ˤϰʲ��Τ����줫����ꤷ�ޤ���
  * DBM::READER : �ǡ����١������ɤ߹��ߤΤߤ�Ԥ�
  * DBM::WRITER : �ǡ����١����ο��������Ϥ����ɤ߽񤭤���
  * DBM::WRCREAT : �ǡ����١�����¸�ߤ��ʤ���п������������ɤ߽񤭤���
  * DBM::NEWDB : �ǡ����١������˿����������ƴ�¸�Υǡ������˴�����
#@end

== Instance Methods

--- [](key)
#@todo

key �򥭡��Ȥ����ͤ��֤��ޤ���

--- []=(key, value)
#@todo

key �򥭡��Ȥ��ơ�value ���Ǽ���ޤ���
value �Ȥ��� nil ����ꤹ��ȡ�key ����
������ܤ������ޤ���

--- clear
#@todo

DBM �ե��������ˤ��ޤ���

--- close
#@todo

DBM �ե�����򥯥������ޤ����ʸ�������㳰��ȯ�������ޤ���

#@since 1.8.3
--- closed?
#@todo


#@end

--- delete(key)
#@todo

key �򥭡��Ȥ�����ܤ������ޤ���

--- reject! { |key, value|  ...  }
--- delete_if { |key, value|  ...  }
#@todo

�֥�å���ɾ�������ͤ����Ǥ���г���������ܤ������ޤ���

--- reject
#@todo


--- each {|key, value|  ...  }
--- each_pair {|key, value|  ...  }
#@todo

�����Ǥ��Ф��륤�ƥ졼����

--- each_key {|key|  ...  }
#@todo

���Ƥ� key ���Ф��Ʒ����֤����ƥ졼����

--- each_value {|value|  ...  }
#@todo

���Ƥ� value ���Ф��Ʒ����֤����ƥ졼����

--- empty?()
#@todo

�ǡ����١��������λ��������֤��ޤ���

--- has_key?(key)
--- key?(key)
--- include?(key)
--- member?(key)
#@todo

key ���ǡ����١������¸�ߤ�����������֤��ޤ���

--- has_value?(value)
--- value?(value)
#@todo

value ���ͤȤ����Ȥ��ǡ����١������¸�ߤ�����������֤��ޤ���

#@if (version < "1.9.0")
--- indexes(key_1, ... )
--- indices(key_1, ... )
#@todo

���Υ᥽�åɤ� obsolete �Ǥ���

�ư������ͤ򥭡��Ȥ������Ǥ�ޤ�������֤��ޤ���

#@end

--- keys
#@todo

�ǡ����١������¸�ߤ��륭�����Ƥ�ޤ�������֤��ޤ���

--- length
--- size
#@todo

�ǡ����١���������Ǥο����֤��ޤ���(���:���ߤμ¸��Ǥ����ǿ����
���뤿��˥ǡ����١����������������ޤ�)

--- shift
#@todo

�ǡ����١���������Ǥ��ļ��Ф����ǡ����١������������ޤ���

--- values
#@todo

�ǡ����١������¸�ߤ��������Ƥ�ޤ�������֤��ޤ���

--- replace(other)
#@todo


--- fetch
#@todo

--- store
#@todo

--- select
#@todo

--- values_at
#@todo

--- invert
#@todo

--- update
#@todo

--- to_a
#@todo

--- to_hash
#@todo

--- index 
#@todo

== Constants

#@if (version >= "1.8.2")
--- READER
#@todo

�ɤ߹��ߥ⡼�ɤǥ����ץ󤷤ޤ���
#@end

#@if (version >= "1.8.2")
--- WRITER
#@todo

�񤭹��ߥ⡼�ɤǥ����ץ󤷤ޤ���
#@end

#@if (version >= "1.8.2")
--- WRCREAT
#@todo

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ��ʤ��ä�����ޤ���
#@end

#@if (version >= "1.8.2")
--- NEWDB
#@todo

�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ����������ƺ��ľ���ޤ���
#@end

--- VERSION
#@todo
