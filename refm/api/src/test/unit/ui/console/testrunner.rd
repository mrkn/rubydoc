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

TestRunner ���֥������Ȥ����������֤��ޤ���

@param suite �¹Ԥ������ƥ��Ȥ��ݻ����Ƥ��� TestSuite ���֥������Ȥ�
             TestCase ���֥������Ȥ�Ϳ���ޤ���

@param output_level ���ϥ�٥����ꤷ�ޤ�������Ǥ���Τϰʲ���4�ĤǤ���
 * Test::Unit::UI::SILENT 
 * Test::Unit::UI::PROGRESS_ONLY
 * Test::Unit::UI::NORMAL
 * Test::Unit::UI::VERBOSE

@param io ��̤���Ϥ��뤿��� [[c:IO]] ���֥������Ȥ�Ϳ���ޤ���

== Instance Methods

--- start    -> Test::Unit::TestResult 

�ƥ��Ȥ�¹Ԥ�����������Ϳ����줿 io �˷�̤���Ϥ��ޤ���
�ƥ��ȷ�̤��ݻ����� Test::Unit::TestResult ���֥������Ȥ��֤��ޤ���
