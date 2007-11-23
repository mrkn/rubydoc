weak reference ��¸����ޤ���

= class WeakRef < Delegator

[[c:WeakRef]] ���֥������Ȥ�Ϳ����줿���֥������Ȥ�ݥ���Ȥ��ޤ�����
�ݥ������Υ��֥������Ȥ� GC ������ǽ��������ޤ���
�����������褦�Ȥ����Ȥ��˥��֥������Ȥ� GC ����Ƥ����
WeakRef::RefError ��ȯ�����ޤ���

see also: [[lib:delegate]]

=== ����ץ륳����

  require 'weakref'

  foo = Object.new
  ref = WeakRef.new(foo)
  ref.some_method_of_foo


== Class Methods

--- new(obj)
#@todo

obj �ؤ� weak reference ���������ޤ���

== Instance Methods

--- weakref_alive?
#@todo

������Υ��֥������Ȥ��ޤ������Ƥ���� true ���֤��ޤ���
GC����Ƥ���� false ���֤��ޤ���

--- __getobj__
#@todo
Return the object this WeakRef references. Raises WeakRef::RefError if the object has been
garbage collected. The object returned is the object to which method calls are 
delegated (see [[c:Delegator]]).

= class WeakRef::RefError < StandardError

GC ���줿���֥������Ȥ򻲾Ȥ��褦�Ȥ����Ȥ���ȯ�������㳰�Ǥ���
