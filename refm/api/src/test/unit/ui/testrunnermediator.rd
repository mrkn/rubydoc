require test/unit
require test/unit/util/observable
require test/unit/testresult

�Ƽ� TestRunner ��������뤿��˻Ȥ��ޤ���

Unit �ƥ��Ȥ�Ԥ����������Υ桼���������Υ饤�֥��� require ����
ɬ�פϤ���ޤ���

= class Test::Unit::UI::TestRunnerMediator
include Test::Unit::Util::Observable

�Ƽ� TestRunner ��������뤿��Υ��饹�Ǥ���

== Class Methods
--- initialize(suite)

������ TestRunnerMediator ���֥������Ȥ����������֤��ޤ���

@param suite �¹Ԥ������ƥ��Ȥ���ä� Test::Unit::TestSuite ���֥������Ȥ�
             Ϳ���ޤ���

== Instance Methods

--- run_suite
��������Ϳ����줿 Test::Unit::TestSuite ���ݻ����Ƥ���ƥ��Ȥ�¹Ԥ��ޤ���
�¹Է�̤�ɽ�� Test::Unit::TestResult ���֥������Ȥ��֤��ޤ���

== Private Instance Methods

--- create_result
#@todo

A factory method to create the result the mediator
should run with. Can be overridden by subclasses if
one wants to use a different result.
