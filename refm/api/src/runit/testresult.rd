���Υ饤�֥��� RubyUnit �Ȥθߴ������󶡤��뤿��������󶡤���Ƥ��ޤ���
���줫���˥åȥƥ��Ȥ�񤯤Ȥ���
[[lib:test/unit]] �饤�֥���ȤäƤ���������


= class RUNIT::TestResult < Test::Unit::TestResult

�ƥ��Ȥμ¹Է�̤��Ǽ���륯�饹�Ǥ���

== Instance Methods

--- errors -> Array

���顼��ȯ�������ƥ��ȥ�������������֤��ޤ���

--- failures -> Array

���Ԥ����ƥ��ȥ�������������֤��ޤ���

--- succeed? -> bool

�������Ƥ�����ϡ������֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

--- failure_size -> Integer

���Ԥ���������֤��ޤ���

--- run_asserts -> Integer

�����������η�����֤��ޤ���

--- error_size -> Integer

���顼��ȯ������������֤��ޤ���

--- run_tests -> Integer

�ƥ��Ȥη�����֤��ޤ���

--- add_failure(failure) -> ()

���Ԥ����ƥ��Ȥ��ɲä��ޤ���

@param failure ���Ԥ����ƥ��Ȥ���ꤷ�ޤ���

--- add_error(error) -> ()

���顼��ȯ�������ƥ��Ȥ��ɲä��ޤ���

@param error ���顼��ȯ�������ƥ��Ȥ���ꤷ�ޤ���

