#@until 1.9.1
= class Test::Unit::AssertionFailedError < StandardError
�����������˼��Ԥ������� [[c:Test::Unit::Assertions]] ���� raise ����ޤ���
#@end

= module Test::Unit::Assertions


�Ƽ�� assert �᥽�åɤ��󶡤���⥸�塼��Ǥ���

Test::Unit::TestCase �� include ����ƻȤ��ޤ���
[[lib:test/unit]] ��¾�Υ��饹�Ȥ���Ω���ơ��󶡤���Ƥ��� assert �᥽�åɤ�����Ȥ����Ȥ�Ǥ��ޤ���
[[m:Test::Unit::Assertions#assert_block]] ��Ȥ����Ȥˤ�ꡢ������ assert �᥽�åɤ�ä��뤳�Ȥ�Ǥ��ޤ���

#@since 1.9.1
assert �����Ԥ������ϡ��㳰 [[c:MiniTest::Assertion]] ���ꤲ�ޤ���
#@else
assert �����Ԥ������ϡ��㳰 [[c:Test::Unit::AssertionFailedError]] ���ꤲ�ޤ���
#@end
�� assert �᥽�åɤκǸ�ΰ��� message �ϥƥ��Ȥ����Ԥ����Ȥ���ɽ�������
��å������Ǥ���


== Singleton Methods

--- use_pp=(value)

���Ϥ� [[lib:pp]] ����Ѥ��뤫�ɤ�������ꤷ�ޤ���������ꤷ������
[[lib:pp]] �� require ����ޤ���

@param value [[lib:pp]] ����Ѥ��뤫�ɤ�����

== Instance Methods

--- assert(boolean, message=nil)    -> ()

boolean �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_equal(expected, actual, message=nil)    -> ()

expected == actual �ʤ�Хѥ����ޤ���

[[m:Test::Unit::Assertions#assert_same]]�Ȥΰ㤤����դ��Ʋ�������
[[m:Object#==]] �⻲�Ȥ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_not_equal(expected, actual, message="")    -> ()

expected != actual �ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_instance_of(klass, object, message="")    -> ()

object �� klass ��ľ�ܤΥ��󥹥��󥹤Ǥ���ʤ顢�ѥ����ޤ���
[[m:Object#instance_of?]]�⻲�Ȥ��Ʋ�������

[[m:Test::Unit::Assertions#assert_kind_of]] �Ȥΰ㤤����դ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_nil(object, message="")    -> ()

object �� nil �ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_not_nil(object, message="")    -> ()

object �� nil �Ǥʤ��ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_kind_of(klass, object, message="")    -> ()

object.kind_of?(klass) �����ʤ�ѥ����ޤ���

���Τˤϡ�object �� klass �����Υ��֥��饹�Υ��󥹥��󥹤Ǥ���ʤ�ѥ����ޤ���
�ޤ���klass ���⥸�塼��Ǥ�����ϡ�object �� klass �򥤥󥯥롼�ɤ������饹�����Υ��֥��饹��
���󥹥��󥹤Ǥ���ʤ�ѥ����ޤ���[[m:Object#kind_of?]] �򻲾Ȥ��Ʋ�������

[[m:Test::Unit::Assertions#assert_instance_of]] �Ȥΰ㤤����դ��Ʋ�������

@param klass ���饹���⥸�塼���Ϳ���ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_respond_to(object, method, message="")    -> ()
#@todo

object.respond_to?(method) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_match(pattern, string, message="")    -> ()
#@todo

string =~ pattern �����ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_no_match(regexp, string, message="")    -> ()
#@todo

regexp !~ string �����ʤ�Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_same(expected, actual, message="")    -> ()
#@todo

actual.equal?(expected) �����ʤ�ѥ����ޤ���

[[m:Test::Unit::Assertions#assert_equal]] �Ȥΰ㤤����դ��Ʋ�������
[[m:Object#equal?]] �⻲�Ȥ��Ʋ�������

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_not_same(expected, actual, message="")    -> ()
#@todo

!actual.equal?(expected) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_operator(object1, operator, object2, message="")    -> ()
#@todo

object1.send(operator, object2) �����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

#@since 1.8.1

--- assert_raise(klass1, klass2, ..., message = "") { ... }    -> object

�֥�å���¹Ԥ����㳰��ȯ�����������㳰��
klass1, klass2,... �Τ����줫�Υ��饹�Υ��󥹥��󥹤ʤ�Хѥ����ޤ���

assert �˥ѥ��������ϡ��ºݤ��ꤲ��줿�㳰���֤��ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

#@end

--- assert_raises(*args, &block)    -> object

[[m:Test::Unit::Assertions#assert_raise]] �Υ����ꥢ���Ǥ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- build_message(head, template=nil, *arguments)

�ƥ��Ȥ����Ԥ����Ȥ���ɽ��������å�������������ޤ���

@param head template������������å�����������ɽ������ʸ�������ꤷ�ޤ���

@param template ���������å������Υƥ�ץ졼�Ȥ�ʸ����ǻ��ꤷ�ޤ���

@param arguments template ��� '?' ���֤������륪�֥������Ȥ�����ǻ��ꤷ�ޤ���

@return ����������å�������Test::Unit::Assertions::AssertionMessage��
        ���󥹥��󥹤��֤��ޤ���

head �� template �������ɲä���ޤ���template �˻��ꤷ��ʸ����� '?' ��
�ޤޤ�Ƥ������ϡ�arguments �˻��ꤷ�����֥������ȤǤ��줾���֤�����
���ޤ���

--- assert_nothing_raised(message = "") { ... }
--- assert_nothing_raised(klass1, klass2, ..., message = "") { ... }

�֥�å���¹Ԥ����㳰�������ʤ���Хѥ����ޤ���

�֥�å���¹Ԥ���ȯ�������㳰�� klass1, klass2, ..., �Τ����줫�Υ��饹��
���󥹥��󥹤Ǥ�����ϡ�assert �ϼ��԰����ȤʤꡢTest::Unit::AssertionFailedError 
���ꤲ�ޤ��������Ǥʤ����ϡ����顼�����Ȥʤ�ȯ�������㳰��Ƥ��ꤲ�ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- flunk(message="Flunked")    -> ()
#@todo

��˼��Ԥ��ޤ���

�����Ȥ����ƥ��Ȥ�񤯤ޤǤδ֡��ƥ��Ȥ��Ԥ����Ƥ����������ʤɤ˻Ȥ��ޤ���

@raise Test::Unit::AssertionFailedError ���ȯ�����ޤ���

--- assert_throws(expected_symbol, message="") { ... }    -> ()
#@todo

�֥�å���¹Ԥ��� :expected_symbol �� throw ���줿��ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_nothing_thrown(message="") { ... }    -> ()
#@todo

�֥�å���¹Ԥ��� throw ��������ʤ���Хѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_in_delta(expected_float, actual_float, delta, message="")    -> ()
#@todo

(expected_float.to_f - actual_float.to_f).abs <= delta.to_f 
�����ʤ�ѥ����ޤ���

delta �����ο��Ǥʤ���Фʤ�ʤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_send(send_array, message="")    -> ()
#@todo

send_array[0].__send__(send_array[1], *send_array[2..-1])
�����ʤ�ѥ����ޤ���

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���

--- assert_block(message="assert_block failed.") { ... }    -> ()
#@todo

�֥�å���¹Ԥ������η�̤����ʤ�ѥ����ޤ���

������ assert �᥽�åɤ����������ˤ�Ȥ��ޤ���

  def deny(boolean, message = nil)
    message = build_message message, '<?> is not false or nil.', boolean
    assert_block message do
      not boolean
    end
  end

@raise Test::Unit::AssertionFailedError assert �����Ԥ�������ȯ�����ޤ���
