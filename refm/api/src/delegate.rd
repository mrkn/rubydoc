#@since 1.8.0
�᥽�åɤΰѾ� (delegation) ��Ԥ�����Υ饤�֥��Ǥ���

[[c:Delegator]] ���饹�ϻ��ꤷ�����֥������Ȥ˥᥽�åɤμ¹Ԥ�Ѿ����ޤ���
[[c:Delegator]] ���饹�����Ѥ�����Ϥ����Ѿ�����
[[m:Delegator#__getobj__]] �᥽�åɤ��������ưѾ���Υ��֥������Ȥ���ꤷ�ޤ���


[[c:SimpleDelegator]] �� [[c:Delegator]] ��������ΰ�ĤǤ��ꡢ
���󥹥ȥ饯�����Ϥ��줿���֥������Ȥ˥᥽�åɤμ¹Ԥ�Ѿ����ޤ���


[[m:Kernel#DelegateClass]] �� �������Ϥ��줿���饹�Υ��󥹥��󥹤�ҤȤĤȤꡢ
���Υ��֥������Ȥ˥��󥹥��󥹥᥽�åɤ�Ѿ����륯�饹����������֤��ޤ���

=== ����

  * Rubyist Magazine - ɸ��ź�ե饤�֥��Ҳ���� 6 ��۰Ѿ� [[url:http://jp.rubyist.net/magazine/?0012-BundledLibraries]]


= reopen Kernel

== Private Instance Methods

--- DelegateClass(superclass) -> object

���饹 superclass �Υ��󥹥��󥹤إ᥽�åɤ�Ѿ����륯�饹���������
���Υ��饹���֤��ޤ���

@param superclass �Ѿ���Ȥʤ륯�饹

��:

//emlist{
require 'delegate'

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


= class Delegator < Object

#@since 1.9.1

include Delegator::MethodDelegation

#@end

���֥��饹�˥᥽�åɰѾ��λ��Ȥߤ��󶡤�����ݥ��饹��

�᥽�åɰѾ���Ԥ����ϡ��ܥ��饹��Ѿ���[[m:Delegator#__getobj__]]����������ɬ�פ�����ޤ���

����Ū�ʻ�����ˤĤ��Ƥϡ�[[c:SimpleDelegator]]�򻲾Ȥ��Ƥ���������

== Class Methods

#@if (version <= '1.8.6')

--- new(obj) -> object

�Ѿ���Ԥ��᥽�åɤ�������ޤ���

obj �Τ�ĥ��󥹥��󥹥᥽�åɤΤ�����
�����֥������Ȥ��������Ƥ��ʤ��᥽�åɤˤĤ��ơ�
[[m:Delegator#__getobj__]] ���֤����֥������Ȥ�
�᥽�åɰѾ���Ԥ����饹�᥽�åɤ�������ޤ���

@param obj �Ѿ���Ԥ��᥽�åɤ���ꤹ�뤿��˻��Ѥ��륪�֥�������

#@end

== Instance Methods

#@since 1.8.0
#@until 1.9.1

--- __getobj__ -> object

�Ѿ���Υ��֥������Ȥ��֤��ޤ���

�ܥ᥽�åɤϡ����֥��饹�Ǻ��������ɬ�פ����ꡢ
�ǥե���ȤǤ� [[c:NotImplementError]] ��ȯ�����ޤ���

@raise NotImplementError ���֥��饹�ˤ��ܥ᥽�åɤ����������Ƥ��ʤ�����ȯ�����ޤ���

#@end
#@end

#@since 1.8.1
#@until 1.9.1
--- marshal_dump -> object

���ꥢ�饤���������򥵥ݡ��Ȥ��뤿���[[m:Delegator#__getobj__]] ���֤����֥������Ȥ��֤��ޤ���

--- marshal_load(obj) -> object

���ꥢ�饤�����줿���֥������Ȥ��顢[[m:Delegator#__getobj__]] ���֤����֥������Ȥ�Ƹ����ޤ���

@param obj [[m:Delegator#marshal_dump]]������ͤΥ��ԡ�

#@end
#@end

#@since 1.8.3
#@until 1.9.1
--- method_missing(m, *args) -> object

�Ϥ��줿�᥽�å�̾�Ȱ�����Ȥäơ�[[m:Delegator#__getobj__]] ���֤����֥������Ȥإ᥽�åɰѾ���Ԥ��ޤ���

@param m �᥽�åɤ�̾���ʥ���ܥ��

@param args �᥽�åɤ��Ϥ��줿����

@return �Ѿ���Υ᥽�åɤ�����֤���

@see [[m:Object#method_missing]]

--- respond_to?(m) -> bool

[[m:Delegator#__getobj__]] ���֤����֥������Ȥ� �᥽�å� m ����ĤȤ������֤��ޤ���

@param m �᥽�å�̾

@see [[m:Object#respond_to?]]

#@end
#@end

#@include(delegate/SimpleDelegator)

#@since 1.9.1
#@include(delegate/Delegator__MethodDelegation)
#@end

#@end
