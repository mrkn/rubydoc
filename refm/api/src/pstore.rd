= class PStore < Object

Ruby�Υ��֥������Ȥ����ե�����˳�Ǽ���뤿��Υ��饹��
������ [[c:Marshal]] ��ȤäƤ��롣

=== �Ȥ���

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots
    ary = db["root"] = [1,2,3,4]
    ary[0] = [1,1.5]
  end

  db.transaction do
    p db["root"]
  end

�ǡ����١����˥����������뤿��ˤϡ�
transaction �Υ֥�å���Ǥ���ɬ�פ����롣
���󥿡��ե������� Hash �饤���Ǥ��롣

== Class Methods

--- new(file)
#@todo

�ե�����̾ file ���Ф��ƥǡ����١������ɤ߽񤭤��롣
file �Τ���ǥ��쥯�ȥ�Ͻ񤭹��߲�ǽ�Ǥ���ɬ�פ����롣
�ǡ����١����򹹿�����Ȥ��˥Хå����åץե����뤬��������뤿�ᡣ

#@if (version >= "1.8.2")
�ǡ����١����ι�������������ȡ��Хå����åץե�����Ϻ������롣�Хå����åץե�����̾��
�ե�����̾�� ".tmp" ����� ".new" ���դ�����Ρ�
#@else
#@#ruby 1.8.1 �ޤ�: 
�Хå����åץե�����Ϻ�����줺�˻Ĥ롣�Хå����åץե�����̾�ϥե�����̾�θ�� "~" ���դ�����Ρ�
#@end

== Instance Methods

#@if (version >= "1.8.0")
--- transaction {|pstore| ... }
--- transaction(read_only=false) {|pstore| ... }
#@todo

�ȥ�󥶥����������롣
���Υ֥�å�����Ǥ����ǡ����١������ɤ߽񤭤ϤǤ��ʤ���

1.8�Ǥ��ɤ߹������ѤΥȥ�󥶥�����󤬻��Ѳ�ǽ��
#@end

--- [](name)
#@todo

�롼��name���б������ͤ����롣
[[m:Hash#[] ]]��������

--- []=(name, value)
#@todo

�롼��name���б�������value�򥻥åȤ��롣
[[m:Hash#[]=]]��������

#@if (version >= "1.8.0")
--- fetch(name[, default])
#@todo

�롼��name���б������ͤ����롣
��������롼�Ȥ���Ͽ����Ƥ��ʤ����ˤϡ�
���� default ��Ϳ�����Ƥ���Ф����ͤ��֤���
Ϳ�����Ƥ��ʤ�����㳰 [[c:PStore::Error]] ��ȯ�����ޤ���
Hash#fetch��������
#@end

--- delete(name)
#@todo

�롼��name���б������ͤ������롣
[[m:Hash#delete]]��������

--- roots
#@todo

�롼�Ȥν����������֤���
[[m:Hash#keys]]��������

--- root?(name)
#@todo

name���롼�ȤǤ��뤫�ɤ�����
[[m:Hash#key?]]��������

--- path
#@todo

�ǡ����١����Υե�����̾�����롣

--- commit
#@todo

�ǡ����١������ɤ߽񤭤�λ���롣
���ʤ����transaction �֥�å�����ȴ���롣
�ǡ����١������ѹ���ȿ�Ǥ���롣

--- abort
#@todo

�ǡ����١������ɤ߽񤭤�λ���롣
transaction �֥�å�����ȴ���뤬���ǡ����١������ѹ���ȿ�Ǥ���ʤ���

== Private Instance Methods

--- in_transaction
#@todo

�ȥ�󥶥���������Ǥʤ�����㳰��ȯ�������롣

= class PStore::Error < StandardError

[[c:PStore]] �����ȯ�������㳰�Ǥ���
