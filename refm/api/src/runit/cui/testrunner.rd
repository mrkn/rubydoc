���Υ饤�֥��� RubyUnit �Ȥθߴ������󶡤��뤿��������󶡤���Ƥ��ޤ���
���줫���˥åȥƥ��Ȥ�񤯤Ȥ���
[[lib:test/unit]] �饤�֥���ȤäƤ���������

= class RUNIT::CUI::TestRunner < Test::Unit::UI::Console::TestRunner

CUI �ǥƥ��Ȥ�¹Ԥ��뤿��Υ��饹�Ǥ���

== Class Methods

--- new -> RUNIT::CUI::TestRunner

���Ȥ��������ޤ���

--- run(suite) -> ()

Ϳ����줿�ƥ��ȥ������Ȥ�¹Ԥ��ޤ���

@param suite �ƥ��ȥ������Ȥ�Ϳ���ޤ���

--- quiet_mode=(bool)

���򥻥åȤ���Ƚ��Ϥ��Ť��ˤʤ�ޤ���

@param bool ������ꤹ��ȡ����Ϥ��Ť��ˤʤ�ޤ���

== Instance Methods

--- run(suite, quiet_mode = @@quiet_mode) -> ()

Ϳ����줿�ƥ��ȥ������Ȥ�¹Ԥ��ޤ���

@param suite �ƥ��ȥ������Ȥ���ꤷ�ޤ���

@param quiet_mode ������ꤹ��ȡ����Ϥ��Ť��ˤʤ�ޤ���

--- create_mediator(suite)

Ϳ����줿�ƥ��ȥ������Ȥ�Ȥäƥƥ��Ȥ����Ԥ�������ޤ���

@param suite �ƥ��ȥ������Ȥ���ꤷ�ޤ���

--- create_result -> RUNIT::TestResult

�ƥ��Ȥμ¹Է�̤�������ޤ���


