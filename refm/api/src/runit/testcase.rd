require runit/testresult
require runit/testsuite
require runit/assert
require runit/error

���Υ饤�֥��� RubyUnit �Ȥθߴ������󶡤��뤿��������󶡤���Ƥ��ޤ���
���줫���˥åȥƥ��Ȥ�񤯤Ȥ���
[[lib:test/unit]] �饤�֥���ȤäƤ���������

= class RUNIT::TestCase < Test::Unit::TestCase
include RUNIT::Assert

== Class Methods

--- new(test_name, suite_name = RUNIT::TestCase.name) -> RUNIT::TestCase

���Ȥ��������ޤ���

--- suite -> RUNIT::TestSuite

�ƥ��ȥ������Ȥ���������֤��ޤ���

== Instance Methods

--- assert_equals(expected, actual, message = nil)

[[m:Test::Unit::Asserttions#assert_equal]] ����̾��

@param expected �����ͤ���ꤷ�ޤ���

@param actual �ºݤ��ͤ���ꤷ�ޤ���

@param message �����˼��Ԥ������Υ�å���������ꤷ�ޤ���

--- name -> String

̾�����֤��ޤ���

--- run(result) { .... } -> ()

�ƥ��Ȥ�¹Ԥ��ޤ���

@param result [[c:RUNIT::TestResult]] �Υ��󥹥��󥹤���ꤷ�ޤ���

