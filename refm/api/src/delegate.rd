#@since 1.8.0
�᥽�åɤΰѾ� (delegation) ��Ԥ���

[[c:Delegator]] ���饹�ϻ��ꤷ�����֥������Ȥ˥᥽�åɤμ¹Ԥ�Ѿ����롣
[[c:Delegator]] ���饹�����Ѥ�����Ϥ����Ѿ�����
[[m:Delegator#__getobj__]] �᥽�åɤ��������ưѾ���Υ��֥������Ȥ���ꤹ�롣

[[c:SimpleDelegator]] �� [[c:Delegator]] ��������ΰ�ĤǤ��ꡢ���󥹥ȥ饯����
�Ϥ��줿���֥������Ȥ˥᥽�åɤμ¹Ԥ�Ѿ����롣

�ؿ� DelegateClass(supperclass) �� superclass ���饹��
���֥������Ȥ�ҤȤĤȤꡢ���Υ��֥������Ȥ˥��󥹥��󥹥᥽�åɤ�Ѿ���
�륯�饹����������֤���

see also: [[m:Object#method_missing]]

//emlist{
require 'delegate'

foo = Object.new
def foo.test
  p 25
end
foo2 = SimpleDelegator.new(foo)
foo2.test   # => 25

class ExtArray < DelegateClass(Array)
  def initialize
    super([])
  end
end
a = ExtArray.new
p a.class   # => ExtArray
a.push 25
p a         # => [25]
//}

=== ����

  * Rubyist Magazine[[url:http://jp.rubyist.net/magazine/]]
  * ɸ��ź�ե饤�֥��Ҳ���� 6 ��۰Ѿ�[[url:http://jp.rubyist.net/magazine/?0012-BundledLibraries]]



= reopen Kernel

== Private Instance Methods

--- DelegateClass(superclass)

���饹 superclass �Υ��󥹥��󥹤إ᥽�åɤ�Ѿ����륯�饹��
����������Υ��饹���֤���



= class Delegator < Object

#@since 1.9.0

include Delegator::MethodDelegation

#@end

Ϳ����줿���֥������Ȥλ��ĥ᥽�åɤ˴ؤ���
�Ѿ��ѤΥ᥽�å�������󶡤��륯�饹��

���󥹥ȥ饯���ǻ��ꤵ�줿���֥������ȤΤ�ĥ��󥹥��󥹥᥽�åɤΤ�����
��ʬ�λ����ʤ��᥽�åɤˤĤ��ơ�
[[m:Delegator#__getobj__]] ���֤����֥������Ȥ˼¹Ԥ�Ѿ�����褦�᥽�åɤ�������롣

== Class Methods

#@if (version <= '1.8.6')

--- new(obj)

obj �Τ�ĥ��󥹥��󥹥᥽�åɤΤ�����
��ʬ�λ����ʤ��᥽�åɤˤĤ��ơ�
[[m:Delegator#__getobj__]] ���֤����֥������Ȥ˼¹Ԥ�Ѿ�����
�褦���󥹥��󥹥᥽�åɤ�������롣

#@end

== Instance Methods

#@since 1.8.0

--- __getobj__

�Ѿ���Υ��֥������Ȥ��֤���
�ǥե���ȤǤ� [[c:NotImplementError]] ��ȯ������Τǡ�
���֥��饹�Ǻ��������ɬ�פ����롣

#@end

#@since 1.8.1
#@if (version < "1.9.0")
--- marshal_dump

--- marshal_load(obj)

#@end
#@end

#@since 1.8.3
#@if (version < "1.9.0")
--- method_missing(m, *args)

--- respond_to?(m)

#@end
#@end

#@include(delegate/SimpleDelegator)

#@since 1.9.0
#@include(delegate/Delegator__MethodDelegation)
#@end

#@end
