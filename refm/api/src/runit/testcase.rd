require runit/testresult
require runit/testsuite
require runit/assert
require runit/error

���Υ饤�֥��� RubyUnit �Ȥθߴ������󶡤��뤿��������󶡤���Ƥ��ޤ���
���줫���˥åȥƥ��Ȥ�񤯤Ȥ���
[[lib:test/unit]] �饤�֥���ȤäƤ���������


= class RUNIT::TestCase < Test::Unit::TestCase

include RUNIT::AssertMixin

== Class Methods

--- new(test_name, suite_name = Test::Unit::TestCase.name)
#@todo

--- suite
#@todo

== Instance Methods

--- assert_equals(expected, really, message = nil)
#@todo

alias of assert_equal.

--- name
#@todo

--- run(result) { .... }
#@todo

