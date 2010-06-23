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

#@since 1.9.1
--- new(file, thread_safe = false) -> PStore
#@else
--- new(file) -> PStore
#@end

�ե�����̾ file ���Ф��ƥǡ����١������ɤ߽񤭤��롣

�ǡ����١����򹹿�����Ȥ��˥Хå����åץե����뤬��������뤿�ᡢ
file �Τ���ǥ��쥯�ȥ�Ͻ񤭹��߲�ǽ�Ǥ���ɬ�פ�����ޤ���
#@since 1.8.2
�ǡ����١����ι�������������ȡ��Хå����åץե�����Ϻ������롣�Хå����åץե�����̾��
�ե�����̾�� ".tmp" ����� ".new" ���դ�����Ρ�
#@else
�Хå����åץե�����Ϻ�����줺�˻Ĥ롣�Хå����åץե�����̾�ϥե�����̾�θ�� "~" ���դ�����Ρ�
#@end

@param file �ǡ����١����ե�����̾��

#@since 1.9.1
@param thread_safe ������ꤹ��� [[c:Mutex]] ���Ѥ��ƥ���åɥ����դˤʤ�ޤ����ǥե���Ȥϵ��Ǥ���
#@end
== Instance Methods

#@since 1.8.0
--- transaction(read_only = false) {|pstore| ... } -> object

�ȥ�󥶥�����������ޤ���
���Υ֥�å�����ǤΤߥǡ����١������ɤ߽񤭤��Ǥ��ޤ���

�ɤ߹������ѤΥȥ�󥶥�����󤬻��Ѳ�ǽ�Ǥ���

@param read_only ������ꤹ��ȡ��ɤ߹������ѤΥȥ�󥶥������ˤʤ�ޤ���

@return �֥�å��ǺǸ��ɾ�������ͤ��֤��ޤ���

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

@param value ��Ǽ�����͡�

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

#@since 1.8.2
#@until 1.9.1
--- dump(table) -> String
#@# nodoc
ñ�ʤ� [[m:Marshal.#dump]] �Υ�åѡ��᥽�åɤǤ���

@param table �ϥå������ꤷ�ޤ���

@see [[m:Marshal.#load]]

--- load(content) -> object
#@# nodoc ư���ʤ��äݤ���
ñ�ʤ� [[m:Marshal.#load]] �Υ�åѡ��᥽�åɤǤ���

@param content �ǡ�������ꤷ�ޤ���

@see [[m:Marshal.#load]]

--- load_file(file) -> object
#@# nodoc

ñ�ʤ� [[m:Marshal.#load]] �Υ�åѡ��᥽�åɤǤ���

@param file �ե�����̾�� [[c:IO]] ���֥������Ȥ���ꤷ�ޤ���

@see [[m:Marshal.#load]]
#@end
#@end

#@since 1.9.1
--- ultra_safe -> bool
���Ǥ���С��ѥե����ޥ󥹤Ȱ��������˥ե����빹���ξ��ͤ��򤱤뤳�Ȥ��Ǥ��ޤ���
�ǥե���Ȥϵ��Ǥ���

���Υե饰�θ��̤�����Τϰ����Υץ�åȥե���������Ǥ���
(e.g. all POSIX platforms: Linux, MacOS X, FreeBSD, etc)

--- ultra_safe=(flag)
���򥻥åȤ���ȡ��ѥե����ޥ󥹤Ȱ��������˥ե����빹���ξ��ͤ��򤱤뤳�Ȥ��Ǥ��ޤ���

���Υե饰�θ��̤�����Τϰ����Υץ�åȥե���������Ǥ���
(e.g. all POSIX platforms: Linux, MacOS X, FreeBSD, etc)

@param flag �����ͤ���ꤷ�ޤ���


#@end

== Private Instance Methods

--- in_transaction -> ()

�ȥ�󥶥���������Ǥʤ�����㳰��ȯ�������ޤ���

== Constants
#@since 1.8.6
--- RDWR_ACCESS -> Fixnum
���������Ѥ�������Ǥ���

--- RD_ACCESS -> Fixnum
���������Ѥ�������Ǥ���

--- WR_ACCESS -> Fixnum
���������Ѥ�������Ǥ���
#@end
#@since 1.9.1
--- EMPTY_MARSHAL_CHECKSUM -> String
���������Ѥ�������Ǥ���

--- EMPTY_MARSHAL_DATA -> String
���������Ѥ�������Ǥ���

--- EMPTY_STRING -> String
���������Ѥ�������Ǥ���

#@end
= class PStore::Error < StandardError

[[c:PStore]] �����ȯ�������㳰�Ǥ���

#@since 1.9.1
= class PStore::DummyMutex < Object

���ߡ��Υߥ塼�ƥå��������Υ��饹��ȤäƤ⥹��åɥ����դˤϤʤ�ޤ���

== Instance Methods

--- synchronize{ ... } -> object

Ϳ����줿�֥�å���ɾ����������ǲ��⤷�ޤ���

#@end
