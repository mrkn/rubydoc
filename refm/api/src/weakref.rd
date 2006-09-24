= class WeakRef < Delegator
require 'delegate'

=== ��Ū������

WeakRef ���饹�ˤ�� weak reference ��¸����ޤ���

WeakRef ���֥������Ȥ�Ϳ����줿���֥������Ȥ�ݥ���Ȥ��ޤ�����
�ݥ������Υ��֥������Ȥ� GC ������ǽ��������ޤ���
�����������褦�Ȥ����Ȥ��˥��֥������Ȥ� GC ����Ƥ����
WeakRef::RefError ��ȯ�����ޤ���

=== ����ץ륳����

  require 'weakref'
  foo = Object.new
  ref = WeakRef.new(foo)
  ref.some_method_of_foo

=== see also
  * [[lib:delegate]]

== Class Methods

--- new(obj)
obj �ؤ� weak reference ���������ޤ���

== Instance Methods

--- weakref_alive?

������Υ��֥������Ȥ��ޤ������Ƥ���� true ���֤��ޤ���

= class WeakRef::RefError < StandardError
GC ���줿���֥������Ȥ򻲾Ȥ��褦�Ȥ����Ȥ���ȯ�������㳰�Ǥ���
