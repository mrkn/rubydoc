Ruby�Υ��֥������Ȥ����ե�����˳�Ǽ���뤿��Υ饤�֥��Ǥ���

= class PStore < Object

Ruby�Υ��֥������Ȥ����ե�����˳�Ǽ���뤿��Υ��饹�Ǥ���
������ [[c:Marshal]] ��ȤäƤ��ޤ���

=== �Ȥ���

�ǡ����١����˥����������뤿��ˤϡ�
transaction �Υ֥�å���Ǥ���ɬ�פ�����ޤ���
���󥿡��ե������� [[c:Hash]] �˻��Ƥ��ޤ���

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    ary[0] = [1,1.5]
  end
  
  db.transaction do
    p db["root"]     # => [[1, 1.5], 2, 3, 4]
  end


== Class Methods

--- new(file) -> PStore

�ե�����̾ file ���Ф��ƥǡ����١������ɤ߽񤭤��롣

file �Τ���ǥ��쥯�ȥ�Ͻ񤭹��߲�ǽ�Ǥ���ɬ�פ����롣
�ǡ����١����򹹿�����Ȥ��˥Хå����åץե����뤬��������뤿�ᡣ

@param file �ǡ����١����ե�����̾��

#@since 1.8.2
�ǡ����١����ι�������������ȡ��Хå����åץե�����Ϻ������롣�Хå����åץե�����̾��
�ե�����̾�� ".tmp" ����� ".new" ���դ�����Ρ�
#@else
�Хå����åץե�����Ϻ�����줺�˻Ĥ롣�Хå����åץե�����̾�ϥե�����̾�θ�� "~" ���դ�����Ρ�
#@end

== Instance Methods

#@since 1.8.0
--- transaction(read_only = false) {|pstore| ... } -> ()

�ȥ�󥶥�����������ޤ���
���Υ֥�å�����ǤΤߥǡ����١������ɤ߽񤭤��Ǥ��ޤ���

�ɤ߹������ѤΥȥ�󥶥�����󤬻��Ѳ�ǽ�Ǥ���

@param read_only ������ꤹ��ȡ��ɤ߹������ѤΥȥ�󥶥������ˤʤ�ޤ���

@raise PStore::Error read_only �򿿤ˤ����Ȥ��ˡ��ǡ����١������ѹ����褦��������ȯ�����ޤ���

��:

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    ary[0] = [1,1.5]
  end
  
  db.transaction(true) do |pstore|
    pstore["root"] = 'aaa' # => �������㳰ȯ��
  end


#@end

--- [](name) -> object

�롼��name���б������ͤ����롣

@param name õ������롼�ȡ�

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

@see [[m:Hash#[] ]]

--- []=(name, value)

�롼�� name ���б������� value �򥻥åȤ��롣

@param name �롼�ȡ�

@aram value ��Ǽ�����͡�

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

@see [[m:Hash#[]=]]

#@since 1.8.0
--- fetch(name, default = PStore::Error) -> object

�롼��name���б������ͤ����롣

��������롼�Ȥ���Ͽ����Ƥ��ʤ����ˤϡ�
���� default ��Ϳ�����Ƥ���Ф����ͤ��֤���
Ϳ�����Ƥ��ʤ�����㳰 [[c:PStore::Error]] ��ȯ�����ޤ���

@param name õ������롼�ȡ�

@param default name ���б�����롼�Ȥ���Ͽ����Ƥ��ʤ������֤��ͤ���ꤹ�롣

@raise PStore::Error name ���б�����롼�Ȥ���Ͽ����Ƥ��ʤ����ġ�
                     default ��Ϳ�����Ƥ��ʤ�����ȯ�����ޤ���
                     �ޤ����ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

��:

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    ary[0] = [1,1.5]
  end
  
  db.transaction(true) do |pstore|
    pstore.fetch("root")        # => [[1, 1.5], 2, 3, 4]
    pstore.fetch("root", 'aaa') # => [[1, 1.5], 2, 3, 4]
    pstore.fetch("not_root")    # => �㳰ȯ��
  end

@see [[m:Hash#fetch]], [[m:PStore#[] ]]
#@end

--- delete(name) -> object
#@todo

�롼��name���б������ͤ������ޤ���

@param name õ������롼�ȡ�

@return ��������ͤ��֤��ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

��:

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    ary[0] = [1,1.5]
  end
  
  db.transaction do |pstore|
    pstore.delete("root")       # => [[1, 1.5], 2, 3, 4]
    pstore.delete("root")       # => nil
  end

@see [[m:Hash#delete]]

--- roots -> Array

�롼�Ȥν����������֤��ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

@see [[m:Hash#keys]]

--- root?(name) -> bool

�롼�� name ���ǡ����١����˳�Ǽ����Ƥ�����˿����֤��ޤ���

@param name õ������롼�ȡ�

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

@see [[m:Hash#key?]]

--- path -> String

�ǡ����١����Υե�����̾�����ޤ���

--- commit -> ()

�ǡ����١������ɤ߽񤭤�λ���ޤ���

transaction �֥�å�����ȴ�����ǡ����١������ѹ���ȿ�Ǥ���ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

��:

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    db.commit
    ary[0] = [1,1.5] # => �����ϼ¹Ԥ���ʤ���
  end
  
  db.transaction do |pstore|
    pstore["root"]       # => [[1, 2, 3, 4]
  end

--- abort -> ()

�ǡ����١������ɤ߽񤭤�λ���롣

transaction �֥�å�����ȴ���ޤ������ǡ����١������ѹ���ȿ�Ǥ���ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ���

��:

  require 'pstore'
  db = PStore.new("/tmp/foo")
  db.transaction do
    p db.roots       # => []
    ary = db["root"] = [1,2,3,4]
    db.abort
    ary[0] = [1,1.5] # => �����ϼ¹Ԥ���ʤ���
  end
  
  db.transaction do |pstore|
    pstore["root"]       # => nil
  end

== Private Instance Methods

--- in_transaction -> ()

�ȥ�󥶥���������Ǥʤ�����㳰��ȯ�������ޤ���

= class PStore::Error < StandardError

[[c:PStore]] �����ȯ�������㳰�Ǥ���
