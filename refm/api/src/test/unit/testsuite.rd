
= class Test::Unit::TestSuite < Object

ʣ���Υƥ��Ȥ�ҤȤĤˤޤȤ᤿���饹�Ǥ���TestSuite Ʊ�Τ�ޤȤ�ƤҤȤĤ�
TestSuite �ˤ��뤳�Ȥ�Ǥ��ޤ���
[[m:Test::Unit::TestSuite#run]] �ˤ��ޤȤ᤿�ƥ��Ȥ���٤�
�¹Ԥ��뤳�Ȥ��Ǥ��ޤ����ƥ��Ȥ� TestSuite �زä���줿��˼¹Ԥ���ޤ���
���Ȥ� TestSuite ��ޤ�Ǥ�����ϡ��Ƶ�Ū�˥ƥ��Ȥ�¹Ԥ��ޤ���

== Class Methods

--- new(name = "Unnamed TestSuite")   -> Test::Unit::TestSuite

TestSuite �Υ��󥹥��󥹤����������֤��ޤ���

@param name �������� TestSuite ��̾���Ǥ���ʸ�����Ϳ���ޤ���

== Instance Methods

--- <<(test)    -> self

���Ȥ˥ƥ��Ȥ�ä��ޤ���self ���֤��ޤ���

@param test ���Ȥ˲ä��� TestCase �� TestSuite �Υ��󥹥��󥹤�Ϳ���ޤ���

#@since 1.8.1
--- ==(other)    -> bool
#@todo

It's handy to be able to compare TestSuite instances.

--- delete(test)    -> ()

test ��������������Ƥ򼫿Ȥ��������ޤ���test �����������Ǥ����Ĥ��ä����ϡ�test���֤��ޤ���
test ����������Τ��ʤ���� nil ���֤��ޤ�

@param test  ���Ȥ��������� TestCase �� TestSuite �Υ��󥹥��󥹤�Ϳ���ޤ���

#@end

--- empty?    -> bool
�¹Ԥ��٤��ƥ��Ȥ����ʤ� true ���֤��ޤ��������Ǥʤ��ʤ� false ���֤��ޤ���

--- run(result) {|STARTED, name| ...}    -> ()

���Υ᥽�åɤ�桼����ľ�ܸƤ֤��ȤϤ���ޤ���

���Ȥ����äƤ���ƥ��Ȥ�¹Ԥ��ޤ���
���Υ᥽�åɤ� TestRunner ���֥������Ȥ���ƤФ�ޤ���

�ƥ��Ȥ� TestSuite �زä���줿��˼¹Ԥ���ޤ���
���Ȥ� TestSuite ��ޤ�Ǥ�����ϡ��Ƶ�Ū�˥ƥ��Ȥ�¹Ԥ��ޤ���

@param result TestResult ���֥������Ȥ�Ϳ���ޤ���

--- size    -> Integer

�¹Ԥ���ƥ��Ȥ�������֤��ޤ���
�⤷���Ȥ�¾�� TestSuite ��ޤ�Ǥ�����ϡ����� TestSuite ��
���äƤ���ƥ��Ȥ�Ƶ�Ū�˹�פ��������֤��ޤ���

--- to_s    -> String
#@todo

Overridden to return the name given the suite at creation.

--- name    -> String
#@todo

--- tests    -> [ Test::Unit::TestSuite | Test::Unit::TestCase ]
#@todo
