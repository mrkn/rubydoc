= class Test::Unit::AssertionFailedError < StandardError
Thrown by Test::Unit::Assertions when an assertion fails.

= module Test::Unit::Assertions


�Ƽ�� assert �᥽�åɤ��󶡤���⥸�塼��Ǥ���Test::Unit::TestCase �� include ����ƻȤ��ޤ���
[[lib:test/unit]] ��¾�Υ��饹�Ȥ���Ω���ơ��󶡤���Ƥ��� assert �᥽�åɤ�����Ȥ����Ȥ�Ǥ��ޤ���
[[m:Test::Unit::Assertions#assert_block]] ��Ȥ����Ȥˤ�ꡢ������ assert �᥽�åɤ�ä��뤳�Ȥ�Ǥ��ޤ���

assert �����Ԥ������ϡ��㳰 [[c:Test::Unit::AssertionFailedError]] ���ꤲ�ޤ���
�� assert �᥽�åɤκǸ�ΰ��� message �ϥƥ��Ȥ����Ԥ����Ȥ���ɽ�������
��å������Ǥ���


== Singleton Methods

--- use_pp=(value)
#@todo

Select whether or not to use the pretty-printer. If this option
is set to false before any assertions are made, pp.rb will not
be required.


== Instance Methods

--- assert(boolean, message=nil)

boolean �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_equal(expected, actual, message=nil)

expected == actual �ʤ�Хѥ����ޤ���[[m:Test::Unit::Assertions#assert_same]]
�Ȥΰ㤤����դ��Ʋ�������
[[m:Object#==]] �⻲�Ȥ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_not_equal(expected, actual, message="")

expected != actual �ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_instance_of(klass, object, message="")

object �� klass ��ľ�ܤΥ��󥹥��󥹤Ǥ���ʤ顢�ѥ����ޤ���
[[m:Object#instance_of?]]�⻲�Ȥ��Ʋ�������

[[m:Test::Unit::Assertions#assert_kind_of]] �Ȥΰ㤤����դ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_nil(object, message="")

object �� nil �ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_not_nil(object, message="")

object �� nil �Ǥʤ��ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_kind_of(klass, object, message="")

object.kind_of?(klass) �����ʤ�ѥ����ޤ���

���Τˤϡ�object �� klass �����Υ��֥��饹�Υ��󥹥��󥹤Ǥ���ʤ�ѥ����ޤ���
�ޤ���kalss ���⥸�塼��Ǥ�����ϡ�object �� klass �򥤥󥯥롼�ɤ������饹�����Υ��֥��饹��
���󥹥��󥹤Ǥ���ʤ�ѥ����ޤ���[[m:Object#kind_of?]] �򻲾Ȥ��Ʋ�������

[[m:Test::Unit::Assertions#assert_instance_of]] �Ȥΰ㤤����դ��Ʋ�������

@param klass ���饹���⥸�塼���Ϳ���ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_respond_to(object, method, message="")
#@todo

object.respond_to?(method) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_match(pattern, string, message="")
#@todo

string =~ pattern �����ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_no_match(regexp, string, message="")
#@todo

regexp !~ string �����ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_same(expected, actual, message="")
#@todo

actual.equal?(expected) �����ʤ�ѥ����ޤ���
[[m:Test::Unit::Assertions#assert_equal]] �Ȥΰ㤤����դ��Ʋ�������
[[m:Object#equal?]] �⻲�Ȥ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_not_same(expected, actual, message="")
#@todo

!actual.equal?(expected) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_operator(object1, operator, object2, message="")
#@todo

object1.send(operator, object2) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

#@since 1.8.1
--- assert_raise(expected_exception_klass, message="") { ... }
#@todo

�֥�å���¹Ԥ����㳰��ȯ�����������㳰��
expected_exception_klass ���饹�ʤ�Хѥ����ޤ���

assert �˥ѥ��������ϡ��ºݤ��ꤲ��줿�㳰���֤��ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

#@end

--- assert_raises(*args, &block)
#@todo

Alias of assert_raise.

Will be deprecated in 1.9, and removed in 2.0.

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- build_message(head, template=nil, *arguments)
#@todo

Builds a failure message. head is added before the template and
arguments replaces the '?'s positionally in the template.

--- assert_nothing_raised(*args) { ... }
#@todo

�֥�å���¹Ԥ����㳰�������ʤ���Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- flunk(message="Flunked")
#@todo

��˼��Ԥ��ޤ��������Ȥ����ƥ��Ȥ�񤯤ޤǤδ֡��ƥ��Ȥ��Ԥ����Ƥ����������ʤɤ˻Ȥ��ޤ���

@raise Test::Unit::AssertionFailedError ���ȯ�����ޤ���

--- assert_throws(expected_symbol, message="") { ... }
#@todo

�֥�å���¹Ԥ��� :expected_symbol �� throw ���줿��ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_nothing_thrown(message="") { ... }
#@todo

�֥�å���¹Ԥ��� throw ��������ʤ���Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_in_delta(expected_float, actual_float, delta, message="")
#@todo

(expected_float.to_f - actual_float.to_f).abs <= delta.to_f 
�����ʤ�ѥ����ޤ���

delta �����ο��Ǥʤ���Фʤ�ʤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_send(send_array, message="")
#@todo

send_array[0].__send__(send_array[1], *send_array[2..-1])
�����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���

--- assert_block(message="assert_block failed.") { ... }
#@todo

�֥�å���¹Ԥ������η�̤����ʤ�ѥ����ޤ���

������ assert �᥽�åɤ����������ˤ�Ȥ��ޤ���

  def deny(boolean, message = nil)
    message = build_message message, '<?> is not false or nil.', boolean
    assert_block message do
      not boolean
    end
  end

@raise Test::Unit::AssertionFailedError assert ���ѥ����ʤ��ä�����ȯ�����ޤ���
