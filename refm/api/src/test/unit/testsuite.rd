
= class Test::Unit::TestSuite < Object

ʣ���Υƥ��Ȥ�ҤȤĤˤޤȤ᤿���饹�Ǥ���TestSuite Ʊ�Τ�ޤȤ�ƤҤȤĤ�
TestSuite �ˤ��뤳�Ȥ�Ǥ��ޤ���
[[m:Test::Unit::TestSuite#run]] �ˤ��ޤȤ᤿�ƥ��Ȥ���٤�
�¹Ԥ��뤳�Ȥ��Ǥ��ޤ���

== Class Methods

--- new(name = "Unnamed TestSuite")

TestSuite �Υ��󥹥��󥹤����������֤��ޤ���

@param name TestSuite ��̾���Ǥ���ʸ�����Ϳ���ޤ���

== Instance Methods

--- <<(test)

�ƥ��Ȥ�ä��ޤ���self ���֤��ޤ���

@param test TestCase �� TestSuite �Υ��󥹥��󥹤�Ϳ���ޤ���

#@since 1.8.1
--- ==(other)
#@todo

It's handy to be able to compare TestSuite instances.

--- delete(test)

test��������������Ƥ򼫿Ȥ��������ޤ���test �����������Ǥ����Ĥ��ä����ϡ�test���֤��ޤ���
test ����������Τ��ʤ���� nil ���֤��ޤ�

@param test  TestCase �� TestSuite �Υ��󥹥��󥹤�Ϳ���ޤ���

#@end

--- empty?
�¹Ԥ��٤��ƥ��Ȥ����ʤ� true ���֤��ޤ��������Ǥʤ��ʤ� false ���֤��ޤ���


--- run(result) 
--- run(result) {|STARTED, name| ...}
#@todo

�ƥ��Ȥ�¹Ԥ��ޤ���TestSuite �˺ǽ�˲ä���줿�ƥ��Ȥ����˼¹Ԥ���ޤ���
���Ȥ� TestSuite ��ޤ�Ǥ�����ϡ��Ƶ�Ū�˥ƥ��Ȥ�¹Ԥ��ޤ���

--- size

�¹Ԥ���ƥ��Ȥ�������֤��ޤ���
�⤷���Ȥ�¾�� TestSuite ��ޤ�Ǥ�����ϡ����� TestSuite ��
���äƤ���ƥ��Ȥ�Ƶ�Ū�˹�פ��������֤��ޤ���

--- to_s
#@todo

Overridden to return the name given the suite at creation.

--- name
#@todo

--- tests
#@todo
