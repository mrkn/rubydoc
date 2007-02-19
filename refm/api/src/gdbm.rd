= class GDBM < Object

include Enumerable

GDBM �ե�����򥢥��������륯�饹���������ǡ����Ȥ��ʸ����Ǥʤ���Ф�
��ʤ��Ȥ������¤ȡ��ǡ������ե��������¸�����Ȥ�����������Ƥ�
Hash ���饹������Ʊ�ͤ˰������Ȥ��Ǥ��ޤ���

== Class Methods

--- new(dbname[, mode[, flags]])
--- open(dbname[, mode[, flags]])
--- open(dbname[, mode[, flags]]) {|db| ...}
#@todo

dbname �ǻ��ꤷ���ǡ����١�����⡼�ɤ�
mode �����ꤷ�ƥ����ץ󤷤ޤ���mode �ξ�
ά�ͤ� 0666 �Ǥ���mode �Ȥ��� nil �����
����ȥǡ����١�����¸�ߤ��ʤ����ˤϿ����ʥǡ����١������餺
nil ���֤��ޤ���

flags �ˤϡ�GDBM::FAST, GDBM::SYNC, GDBM::NOLOCK ��
�������¤���ꤷ�ޤ����ǥե�����ͤϻ���ʤ�(�Ĥޤ�0)�Ǥ���

#@if (version >= "1.8.2")
flags ��
GDBM::READER, GDBM::WRITER, GDBM::WRCREAT, GDBM::NEWDB
�Τɤ줫��Ϳ�����ɤ߽񤭤Υ⡼�ɤ����Ǥ��ޤ���
������ɤ����ꤷ�ʤ��ä����ˤϡ�
GDBM::WRCREAT, GDBM::WRITER, GDBM::READER �ν�ǻ�ޤ���
#@end

�֥�å�����ꤷ����硢�����ץ󤷤� GDBM ���֥������Ȥ�
�����˥֥�å���¹Ԥ��ޤ����¹Ը� GDBM ���֥������Ȥ򥯥���
����open �᥽�åɤϥ֥�å��η�̤��֤��ޤ�������Ϥ��礦��
�ʲ���Ʊ���Ǥ���

  dbm = GDBM.open(file)
  begin
    yield dbm
  ensure
    dbm.close
  end

== Instance Methods

--- [](key)
#@todo

key �򥭡��Ȥ����ͤ��֤��ޤ���

--- []=(key, value)
#@todo

key �򥭡��Ȥ��ơ�value ���Ǽ���ޤ���

--- cachesize=(size)
#@todo

�����Υ���å���Υ���������ꤷ�ޤ����ܤ����� [[man:gdbm]] �� GDBM_CACHESIZE �ι�򻲾Ȥ���������

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
--- delete(key) {|key| ... }
#@todo

key �򥭡��Ȥ�����ܤ������ޤ���

���ꤷ��������¸�ߤ��ʤ���� nil ���֤��ޤ������ΤȤ�
�֥�å�����ꤷ�Ƥ���С��֥�å���ɾ�����ޤ���

--- delete_if { |key, value|  ...  }
--- reject! { |key, value|  ...  }
#@todo

�֥�å���ɾ�������ͤ����Ǥ���г���������ܤ������ޤ���

--- each {|key, value|  ...  }
--- each_pair {|key, value|  ...  }
#@todo

�����Ǥ��Ф��륤�ƥ졼���Ǥ���

--- each_key {|key|  ...  }
#@todo

���Ƥ� key ���Ф��Ʒ����֤����ƥ졼���Ǥ���

--- each_value {|value|  ...  }
#@todo

���Ƥ� value ���Ф��Ʒ����֤����ƥ졼���Ǥ���

--- empty?
#@todo

�ǡ����١��������λ��������֤��ޤ���

--- fastmode=(bool)
--- syncmode=(bool)
#@todo

�����ץ󤷤Ƥ��� GDBM ���֥������ȤΥ⡼�ɤ��ѹ����ޤ������������
GDBM::FAST��GDBM::SYNC �򻲾Ȥ��Ƥ���������

--- fetch(key[,ifnone])
--- fetch(key) {|key| ... }
#@todo

[[m:Hash#fetch]] ��Ʊ���Ǥ���

--- has_key?(key)
--- key?(key)
--- include?(key)
--- member?(key)
#@todo

key ���ǡ����١������¸�ߤ�����������֤��ޤ���

--- has_value?(key)
--- value?(value)
#@todo

value ���ͤȤ����Ȥ��ǡ����١������¸�ߤ�����������֤��ޤ���

--- index(val)
#@todo

[[m:Hash#index]] ��Ʊ���Ǥ���

#@if (version < "1.9.0")
--- indexes(key_1, ... )
--- indices(key_1, ... )
#@todo

���Υ᥽�åɤ�obsolete�Ǥ���

�ư������ͤ򥭡��Ȥ������Ǥ�ޤ�������֤��ޤ���
#@end

--- invert
#@todo

�ͤ��饭���ؤΥϥå�����֤��ޤ���

--- keys
#@todo

�ǡ����١������¸�ߤ��륭�����Ƥ�ޤ�������֤��ޤ���

--- length
--- size
#@todo

�ǡ����١���������Ǥο����֤��ޤ���(���:���ߤμ¸��Ǥ����ǿ����
���뤿��˥ǡ����١����������������ޤ�)

--- reject {|key, value| ... }
#@todo

self.to_hash.reject ��Ʊ���Ǥ����ϥå�����֤��ޤ���

--- reorganize
#@todo

GDBM �Ǥϡ����Ǥκ����ԤäƤ� DB �ե�����Υ������ϸ������ޤ���(��
���ˤ�äƶ������ΰ�ϼ��γ�Ǽ�Τ���˼�äƤ�����ޤ���)�����Υ�
���åɤ�ƤӽФ����Ȥ� DBM �ե�����򿷵��˺��ľ��̵�̤��ΰ��ʤ�
�����Ȥ��Ǥ��ޤ���

���̤κ����Ԥä��Ȥ��ˡ��ǥ��������ڡ���������Τ���˻��Ѥ��ޤ���

--- replace(other)
#@todo

DBM �����Ƥ� other �����Ƥ��֤������ޤ���
other �� each_pair �᥽�åɤ���ĥ��֥������Ȥ�
�ʤ���Фʤ�ޤ���

--- select
#@todo

--- shift
#@todo

�ǡ����١���������Ǥ��ļ��Ф����ǡ����١������������ޤ���

--- store(key, val)
#@todo

self[key]=val ��Ʊ���Ǥ���key ���Ф��� val ���Ǽ���ޤ���

--- sync
#@todo

���Ǥ��ѹ���ե������ȿ�Ǥ��ޤ���FAST �⡼��
(GDBM#open() ����3������GDBM::FAST �����)�ΤȤ�������̣������ޤ���

��) GNU gdbm version 1.8 �ʹߤ�� FAST �⡼�ɤ��ǥե���Ȥˤʤ�ޤ�����

--- to_a
#@todo

DBM �γ����Ǥ��Ǽ����������֤��ޤ����֤���������1�Ĥ����Ǥ�
[key, val] �Ǥ���(�Ĥޤ������������֤��ޤ�)��

--- to_hash
#@todo

DBM �γ����Ǥ��Ǽ�����ϥå�����֤��ޤ���

--- update(other)
#@todo

DBM �� other �����Ƥ�ޡ������ޤ�����ʣ���륭�����б������ͤ�
other �����ƤǾ�񤭤���ޤ���

other �� each_pair �᥽�åɤ���ĥ��֥������ȤǤʤ���Фʤ��
����

--- values
#@todo

�ǡ����١������¸�ߤ��������Ƥ�ޤ�������֤��ޤ���

== Constants

--- VERSION
#@todo

libgdbm �ΥС����������ʸ����Ǥ���


--- FAST
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߤη�̤����ǥ�������Υե�����ˤ�����ȿ�Ǥ��ʤ��ʤ�ޤ���
���Υ⡼�ɤΤȤ��˷�̤�����Ū�˥ե������ȿ�Ǥ�����ˤ� GDBM#sync
�᥽�åɤ�ƤӤޤ���libgdbm version 1.8.0 �ʹߤǤϤ��Υ⡼�ɤ��ǥե����
�Ǥ���

--- SYNC
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�񤭹��ߤη�̤����ǥ�������Υե�����ˤ�����ȿ�Ǥ���ޤ���
libgdbm version 1.8.0 �����Υǥե���ȥ⡼�ɤǤ���

��������� libgdbm version 1.8.0 �ʹߤ��ͭ���Ǥ���

--- NOLOCK
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���

�̾¾�Υץ����� DB �򥪡��ץ󤷤Ƥ������˥����ץ��Ԥ���
Errno::EWOULDBLOCK(�ޤ��� Errno::EAGAIN) �㳰��ȯ�����ޤ������Υե饰��
���ꤷ�Ƥ���С�¾�Υץ����������ץ󤷤Ƥ������Ǥ�Ʊ�������ץ󤹤�
���Ȥ��Ǥ��ޤ���

��������� libgdbm version 1.8.0 �ʹߤ��ͭ���Ǥ���

#@if (version >= "1.8.2")
--- READER
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���
�ɤ߹��ߥ⡼�ɤǥ����ץ󤷤ޤ���
#@end

#@if (version >= "1.8.2")
--- WRITER
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���
�񤭹��ߥ⡼�ɤǥ����ץ󤷤ޤ���
#@end

#@if (version >= "1.8.2")
--- WRCREAT
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���
�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ��ʤ��ä�����ޤ���
#@end

#@if (version >= "1.8.2")
--- NEWDB
#@todo

[[m:GDBM.open]] ����3�����˻��ꤷ�ޤ���
�񤭹��ߥ⡼�ɤǡ����Ǥ˥ե����뤬¸�ߤ����������Ƥ�����ľ���ޤ���
#@end
