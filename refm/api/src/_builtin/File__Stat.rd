= class File::Stat < Object

include Comparable

�ե�����ξ�����Ǽ�������֥������ȤΥ��饹��

[[c:FileTest]] ��Ʊ̾�Υ⥸�塼��ؿ���������Ϥ����Ʊ��Ư���򤷤ޤ���������
�ե�����̾������˼�뤫���� Stat ���ȤˤĤ���Ƚ�ꤹ�������㤤�ޤ���

== Class Methods

--- new(path)

path �˴ؤ��� File::Stat ���֥������Ȥ����������֤��ޤ���
[[m:File.stat]] ��Ʊ���Ǥ���

== Instance Methods

--- <=>(o)

�ե�����κǽ������������Ӥ��ޤ���self �� other ����
������������ο������������ 0 ��Ť������ο����֤��ޤ���

--- ftype
�ե�����Υ����פ�ɽ��ʸ������֤��ޤ���ʸ����ϰʲ��Τ�����
�����줫�Ǥ���

  "file"
  "directory"
  "characterSpecial"
  "blockSpecial"
  "fifo"
  "link"
  "socket"
  
  "unknown"

#@# ���餤 2002-01-06: ���ΤȤ��� "unknown" ���֤����ȤϤʤ��Ϥ���
#@# �⤷���Τ褦�ʤ��Ȥ�����С��Х����򤷤������ɤ��Ȼפ��롣
#@# Solaris �� Door �Ȥ��� unknown �ˤʤ롩

�ʲ���°���᥽�åɤϡ������ƥ�ˤ�äƥ��ݡ��Ȥ���Ƥ��ʤ���� 0 ���֤�ޤ���
#@if (version >= "1.8.0")
1.8.0 �ʹߤǤ� nil ���֤�ޤ���
#@end

--- dev
�ǥХ����ֹ�(�ե����륷���ƥ�)

#@since 1.8.2
--- dev_major
dev �� major �ֹ���
--- dev_minor
dev �� minor �ֹ���
#@end

--- ino
i-node �ֹ�
--- mode
�ե�����⡼��
--- nlink
�ϡ��ɥ�󥯤ο�
--- uid
�����ʡ��Υ桼��ID
--- gid
�����ʡ��Υ��롼��ID
--- rdev
�ǥХ���������(���ڥ����ե�����Τ�)
--- rdev_major
rdev �� major �ֹ���
--- rdev_minor
rdev �� minor �ֹ���
--- size
�ե����륵����(�Х���ñ��)
--- blksize
˾�ޤ���I/O�Υ֥�å�������
--- blocks
������Ƥ��Ƥ���֥�å���
--- atime
�ǽ�������������
--- mtime
�ǽ���������
--- ctime
�ǽ������ѹ�����
(���֤��ѹ��Ȥ� chmod �ʤɤˤ���Τǡ�Unix �Ǥ� i-node ���ѹ����̣���ޤ�)

--- directory?
�ǥ��쥯�ȥ�λ��˿�
--- readable?
�ɤ߹��߲�ǽ�ʻ��˿�
--- readable_real?
�¥桼��/�¥��롼�פˤ�ä��ɤ߹��߲�ǽ�ʻ��˿�
--- writable?
�񤭹��߲�ǽ�ʻ��˿�
--- writable_real?
�¥桼��/�¥��롼�פˤ�äƽ񤭹��߲�ǽ�ʻ��˿�
--- executable?
�¸��桼��/���롼��ID�Ǽ¹ԤǤ�����˿�
--- executable_real?
�¥桼��/���롼��ID�Ǽ¹ԤǤ�����˿�
--- file?
�̾�ե�����λ��˿�
--- zero?
��������0�Ǥ�����˿�
--- size?
������(0�λ��ˤϵ�)
--- owned?
��ʬ�Τ�ΤǤ�����˿�
--- grpowned?
���롼��ID���¹ԥ��롼��ID�����������˿�

--- pipe?
̾���Ĥ��ѥ���(FIFO)�λ��˿�
--- symlink?
����ܥ�å���󥯤Ǥ�����˿�
--- socket?
�����åȤλ��˿�

--- blockdev?
�֥�å����ڥ����ե�����λ��˿�
--- chardev?
����饯�����ڥ����ե�����λ��˿�

--- setuid?
setuid����Ƥ�����˿�
--- setgid?
setgid����Ƥ�����˿�
--- sticky?
sticky�ӥåȤ�Ω�äƤ�����˿�

#@since 1.9.0
--- world_readable?
#@todo
--- world_writable? 
#@todo
#@end
