�Ƽ� TestRunner ��������뤿��˻Ȥ��ޤ���

Unit �ƥ��Ȥ�Ԥ����������Υ桼���������Υ饤�֥��� require ����
ɬ�פϤ���ޤ���

= module Test::Unit::UI
�Ƽ� TestRunner ��������뤿��Υ⥸�塼��Ǥ���

== Constants

#@since 1.8.1
--- SILENT
--- PROGRESS_ONLY
--- NORMAL
--- VERBOSE
#@todo
#@end

= module Test::Unit::UI::TestRunnerUtilities
== Instance Methods
--- run(suite, output_level=NORMAL)    -> Test::Unit::TestResult
#@todo

������ TestRunner ���������ơ�Ϳ����줿 TestSuite �Υƥ��Ȥ�¹Ԥ��ޤ���

@param suite �¹Ԥ������ƥ��Ȥ��ݻ����Ƥ��� TestSuite ���֥������Ȥ�
TestCase ���֥������Ȥ�Ϳ���ޤ���

@param output_level ���ϥ�٥����ꤷ�ޤ�������Ǥ���Τϰʲ���4�ĤǤ���
 * Test::Unit::UI::SILENT 
 * Test::Unit::UI::PROGRESS_ONLY
 * Test::Unit::UI::NORMAL
 * Test::Unit::UI::VERBOSE

--- start_command_line_test    -> Test::Unit::TestResult
#@todo
Takes care of the ARGV parsing and suite
determination necessary for running one of the
TestRunners from the command line.
