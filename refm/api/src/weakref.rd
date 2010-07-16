weak reference ��¸����ޤ���

= class WeakRef < Delegator

weak reference ��¸����륯�饹�Ǥ���

[[c:WeakRef]] ���֥������Ȥ�Ϳ����줿���֥������Ȥ�ݥ���Ȥ��ޤ�����
�ݥ������Υ��֥������Ȥ� GC ������ǽ��������ޤ���
�����������褦�Ȥ����Ȥ��˥��֥������Ȥ� GC ����Ƥ����
[[c:WeakRef::RefError]] ��ȯ�����ޤ���

[[lib:delegate]] �⻲�Ȥ��Ƥ���������

=== ����ץ륳����

  require 'weakref'

  foo = Object.new
  ref = WeakRef.new(foo)
  ref.some_method_of_foo


== Class Methods

--- new(orig) -> WeakRef

Ϳ����줿���֥������Ȥ�ȤäƼ��Ȥ��������ޤ���

@param orig Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���

== Instance Methods

--- weakref_alive? -> bool

������Υ��֥������Ȥ��ޤ������Ƥ���п����֤��ޤ���
GC ����Ƥ���е����֤��ޤ���

--- __getobj__ -> object

���Ȥλ�����Υ��֥������Ȥ��֤��ޤ���

@raise WeakRef::RefError GC �ѤߤΥ��֥������Ȥ򻲾Ȥ�������ȯ�����ޤ���

@see [[lib:delegate]]

#@since 1.8.6
--- __setobj__(obj)

Ϳ����줿���֥������Ȥ򼫿Ȥλ�����Ȥ��ƥ��åȤ��ޤ���

@param obj Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���
#@end

#@until 1.8.1
== Constants
--- ID_MAP -> Hash

���֥������Ȥ򥭡������Ȥ�������ͤȤ����ϥå���Ǥ���

--- ID_REV_MAP -> Hash

���Ȥ򥭡������֥������Ȥ��ͤȤ����ϥå���Ǥ���

#@end
= class WeakRef::RefError < StandardError

GC ���줿���֥������Ȥ򻲾Ȥ��褦�Ȥ����Ȥ���ȯ�������㳰�Ǥ���
