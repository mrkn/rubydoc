�᥽�åɤΰѾ� (delegation) ��Ԥ���

Delegator ���饹�ϻ��ꤷ�����֥������Ȥ˥᥽�åɤμ¹Ԥ�Ѿ����롣
Delegator ���饹�����Ѥ�����Ϥ����Ѿ�����
__getobj__ �᥽�åɤ��������ưѾ���Υ��֥������Ȥ���ꤹ�롣

SimpleDelegator �� Delegator ��������ΰ�ĤǤ��ꡢ���󥹥ȥ饯����
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

  * [[unknown:Rubyist Magazine|URL:http://jp.rubyist.net/magazine/]]
  * [[unknown:ɸ��ź�ե饤�֥��Ҳ���� 6 ��۰Ѿ�|URL:http://jp.rubyist.net/magazine/?0012-BundledLibraries]]



= reopen Kernel

== Private Instance Methods

--- DelegateClass(superclass)

���饹 superclass �Υ��󥹥��󥹤إ᥽�åɤ�Ѿ����륯�饹��
����������Υ��饹���֤���



= class Delegator < Object

Ϳ����줿���֥������Ȥλ��ĥ᥽�åɤ˴ؤ���
�Ѿ��ѤΥ᥽�å�������󶡤��륯�饹��

���󥹥ȥ饯���ǻ��ꤵ�줿���֥������ȤΤ�ĥ��󥹥��󥹥᥽�åɤΤ�����
��ʬ�λ����ʤ��᥽�åɤˤĤ��ơ�
__getobj__ ���֤����֥������Ȥ˼¹Ԥ�Ѿ�����褦�᥽�åɤ�������롣

== Instance Methods

--- initialize(obj)

obj �Τ�ĥ��󥹥��󥹥᥽�åɤΤ�����
��ʬ�λ����ʤ��᥽�åɤˤĤ��ơ�
__getobj__ ���֤����֥������Ȥ˼¹Ԥ�Ѿ�����
�褦���󥹥��󥹥᥽�åɤ�������롣

--- __getobj__

�Ѿ���Υ��֥������Ȥ��֤���
�ǥե���ȤǤ� NotImplementError ��ȯ������Τǡ�
���֥��饹�Ǻ��������ɬ�פ����롣



= class SimpleDelegator < Delegator

Delegator ���饹�򤽤Τޤ����Ѥ�����
���ꤷ�����֥������Ȥ˥᥽�åɤ�Ѿ����륯�饹��

== Class Methods

--- new(obj)

obj ����ĥ᥽�åɤˤĤ��ơ��¹Ԥ� obj �˰Ѿ�����
���֥������Ȥ��������롣

== Instance Methods

--- __getobj__

�Ѿ���Υ��֥������Ȥ��֤���

--- __setobj__(obj)

�Ѿ���Υ��֥������Ȥ� obj ���ѹ����롣

�Ѿ�����᥽�åɤ�������������ˤΤ߹Ԥ��뤿�ᡢ
�����ΰѾ��襪�֥������Ȥ� obj �δ֤�
���󥹥��󥹥᥽�åɤ˰㤤�����äƤ⡢
�Ѿ����륤�󥹥��󥹥᥽�åɤκ�����ϹԤ��ʤ����Ȥ���ա�
