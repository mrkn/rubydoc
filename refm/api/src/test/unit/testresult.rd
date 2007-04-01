require test/unit/util/observable

= class Test::Unit::TestResult < Object
include Test::Unit::Util::Observable

�ƥ��Ȥη�̤��ݻ����뤿��Υ��饹�Ǥ���

[[c:Test::Unit::Failure]] ���֥������Ȥ� [[c:Test::Unit::Error]] ���֥������Ȥ�
����ơ��桼����ɽ�����뤿��˻Ȥ��ޤ���

== Class Methods

--- new    -> Test::Unit::TestResult

���Υ᥽�åɤ�桼����ľ�ܸƤ֤��ȤϤ���ޤ���

���� TestResult ���֥������Ȥ��֤��ޤ���

== Instance Methods

--- run_count    -> Integer
���ޤǤ˼¹Ԥ�Ͽ�����ƥ��ȥ᥽�åɤο����֤��ޤ���

--- assertion_count    -> Integer
���ޤǤ˼¹Ԥ�Ͽ���� assert �ο����֤��ޤ���

--- error_count    -> Integer

���ޤǤ˵�Ͽ�����ƥ��ȤΥ��顼�ο����֤��ޤ���

--- failure_count    -> Integer

���ޤǤ˵�Ͽ�������Ԥ����ƥ��Ȥο����֤��ޤ���

--- passed?    -> bool

���٤ƤΥƥ��Ȥ����������ʤ� true ���֤��ޤ���
�����Ǥʤ��ʤ� false ���֤��ޤ���

--- to_s    -> String

�¹Ԥ����ƥ��ȥ᥽�åɤο��� assert �ο����ƥ��Ȥμ��ԡ����顼���줾��β����
�ʹ֤��ɤߤ䤹��ʸ����ˤ����֤��ޤ���
