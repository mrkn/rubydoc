= class Test::Unit::AssertionFailedError < StandardError
Thrown by Test::Unit::Assertions when an assertion fails.

= module Test::Unit::Assertions

Test::Unit::TestCase �� include ����ƻȤ���⥸�塼��Ǥ���assert �᥽�åɤ��������
���ޤ���

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
#@todo

boolean �����ʤ� pass

--- assert_equal(expected, actual, message=nil)
#@todo

expected == actual �ʤ�� pass

--- assert_not_equal(expected, actual, message="")
#@todo

expected != actual �ʤ�� pass

--- assert_instance_of(klass, object, message="")
#@todo

klass == object.class �����ʤ� pass

--- assert_nil(object, message="")
#@todo

object.nil? �ʤ�� pass

--- assert_not_nil(object, message="")
#@todo

!object.nil? �ʤ�� pass

--- assert_kind_of(klass, object, message="")
#@todo

object.kind_of?(klass) �����ʤ� pass

--- assert_respond_to(object, method, message="")
#@todo

object.respond_to?(method) �����ʤ� pass

--- assert_match(pattern, string, message="")
#@todo

string =~ pattern �����ʤ�� pass

--- assert_no_match(regexp, string, message="")
#@todo

regexp !~ string �����ʤ�� pass

--- assert_same(expected, actual, message="")
#@todo

actual.equal?(expected) �����ʤ� pass

--- assert_not_same(expected, actual, message="")
#@todo

!actual.equal?(expected) �����ʤ� pass

--- assert_operator(object1, operator, object2, message="")
#@todo

object1.send(operator, object2) �����ʤ� pass

#@since 1.8.1
--- assert_raise(expected_exception_klass, message="") { ... }
#@todo

�֥�å���¹Ԥ����㳰��ȯ�����������㳰��
expected_exception_klass ���饹�ʤ�� pass
#@end

#@# bc-rdoc: detected missing name: assert_raises
--- assert_raises(*args, &block)
#@todo

Alias of assert_raise.

Will be deprecated in 1.9, and removed in 2.0.

#@# bc-rdoc: detected missing name: build_message
--- build_message(head, template=nil, *arguments)
#@todo

Builds a failure message. head is added before the template and
arguments replaces the '?'s positionally in the template.

--- assert_nothing_raised(*args) { ... }
#@todo

�֥�å���¹Ԥ����㳰�������ʤ���� pass

--- flunk(message="Flunked")
#@todo

��˼���

--- assert_throws(expected_symbol, message="") { ... }
#@todo

�֥�å���¹Ԥ��� :expected_symbol �� throw ���줿�� pass

--- assert_nothing_thrown(message="") { ... }
#@todo

�֥�å���¹Ԥ��� throw ��������ʤ���� pass

--- assert_in_delta(expected_float, actual_float, delta, message="")
#@todo

(expected_float.to_f - actual_float.to_f).abs <= delta.to_f 
�����ʤ� pass

delta �����ο��Ǥʤ���Фʤ�ʤ���

--- assert_send(send_array, message="")
#@todo

send_array[0].__send__(send_array[1], *send_array[2..-1])
�����ʤ� pass

--- assert_block(message="assert_block failed.") { ... }
#@todo

block �η�̤����ʤ� pass
