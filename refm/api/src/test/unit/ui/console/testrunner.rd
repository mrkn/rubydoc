require test/unit/ui/testrunnerutilities
require test/unit/ui/testrunnermediator

���󥽡����ǥ�˥åȥƥ��Ȥ�¹Ԥ�����̤�ɽ�����뤿���
�饤�֥��Ǥ���

= class Test::Unit::UI::Console::TestRunner < Object
extend Test::Unit::UI::TestRunnerUtilities

���󥽡����ǥ�˥åȥƥ��Ȥ�¹Ԥ�����̤�ɽ�����뤿���
���饹�Ǥ���

== Class Methods

--- new(suite, output_level=NORMAL, io=STDOUT)
#@todo

Creates a new TestRunner for running the passed suite. If quiet_mode
is true, the output while running is limited to progress dots,
errors and failures, and the final result. io specifies where
runner output should go to; defaults to STDOUT.

== Instance Methods

--- start

�ƥ��Ȥ�¹Ԥ�����������Ϳ����줿 io �˷�̤���Ϥ��ޤ���
