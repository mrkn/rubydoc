
BDD ���˥ƥ��Ȥ�񤯤���Υ��饹��᥽�åɤ�������뤿��Υ饤�֥��Ǥ���

���Υ饤�֥��� [[c:Object]] �� BDD �Ѥθ����᥽�åɤ��ɲä��ޤ���
�ɲä����᥽�åɤ� [[c:MiniTest::Assertions]] ���������Ƥ���᥽�åɤؤ�
������åѡ��ˤʤäƤ��ޤ���

#@# message ����ꤹ��Ȥ������ʤ��Ȥˤʤ�

= reopen Module

== Public Instance Methods

--- infect_with_assertions(positive_prefix, negative_prefix, skip_regexp, map = {})
#@todo

BDD ���˥ƥ��Ȥ�񤯤���˻��Ѥ���᥽�åɷ���������ޤ���

@param positive_prefix assert ������Υץ�ե��å�������ꤷ�ޤ���

@param negative_prefix refute ������Υץ�ե��å�������ꤷ�ޤ���

@param skip_regexp ��������ɽ���˥ޥå������᥽�åɤ�������ޤ���

@param map �᥽�å�̾���Ѵ���§�Υϥå������ꤷ�ޤ���

= reopen Object

== Public Instance Methods

--- must_be_empty -> true
#@todo

���Ȥ����Ǥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@raise MiniTest::Assertion ���Ȥ� empty? �᥽�åɤ�����ʤ�����ȯ�����ޤ���
                           �ޤ������Ȥ����Ǥʤ����ˤ�ȯ�����ޤ���

@see [[m:MiniTest::Assertions#assert_empty]]

--- must_equal(expected) -> true
#@todo

���Ȥ�����оݤΥ��֥������Ȥ���������硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param expected ����оݤΥ��֥������Ȥ���ꤷ�ޤ���

@raise MiniTest::Assertion Ϳ����줿�����ͤȼºݤ��ͤ��������ʤ�����ȯ�����ޤ���

@see [[m:Object#==]]

--- must_be_within_delta(expected, delta = 0.001) -> true
--- must_be_close_to(expected, delta = 0.001) -> true
#@todo

���Ȥȴ����ͤκ��������ͤ�Ϳ����줿��ʬ�ʲ��Ǥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param expected �����ͤ���ꤷ�ޤ���

@param delta ���Ƥ��뺹ʬ����ꤷ�ޤ���

@raise MiniTest::Assertion Ϳ����줿�����ͤȼºݤ��ͤκ��������ͤ�Ϳ����줿��ʬ��ۤ������ȯ�����ޤ���

@see [[m:MiniTest::Assertions#assert_in_delta]]

--- must_be_within_epsilon(another, epsilon = 0.001) -> true
#@todo

#@# ???

@raise MiniTest::Assertion ???

@see [[m:MiniTest::Assertions#assert_in_epsilon]]

--- must_include(object) -> true
#@todo

���Ȥ�Ϳ����줿���֥������Ȥ��ޤޤ�Ƥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param object Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���

@raise MiniTest::Assertion ���Ȥ� include? �᥽�åɤ�����ʤ�����ȯ�����ޤ���
                           ���Ȥ�Ϳ����줿���֥������Ȥ��ޤޤ�Ƥ��ʤ�����ȯ�����ޤ���

@see [[m:MiniTest::Assertions#assert_includes]]

--- must_be_instance_of(klass) -> true
#@todo

���Ȥ�Ϳ����줿���饹�Υ��󥹥��󥹤Ǥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param klass Ǥ�դΥ��饹����ꤷ�ޤ���



--- must_be_kind_of
#@todo

--- must_match
#@todo

--- must_be_nil
#@todo

--- must_be
#@todo

--- must_raise
#@todo

--- must_respond_to
#@todo

--- must_be_same_as
#@todo

--- must_send
#@todo

--- must_throw
#@todo

--- wont_be_empty
#@todo

--- wont_equal
#@todo

--- wont_be_within_delta
--- wont_be_close_to
#@todo


--- wont_be_within_epsilon
#@todo

--- wont_include
#@todo

--- wont_be_instance_of
#@todo

--- wont_be_kind_of
#@todo

--- wont_match
#@todo

--- wont_be_nil
#@todo

--- wont_be
#@todo

--- wont_respond_to
#@todo

--- wont_be_same_as
#@todo


= reopen Kernel

== Private Instance Methods

--- describe(desc){ ... }

Ϳ����줿����ʸ����̾����������ƥƥ��ȥ��饹��������ޤ���

���饹������ϡ�Ϳ����줿�֥�å������Ƥˤʤ�ޤ���

@param desc �֥�å����Ф�����������ꤷ�ޤ���

= class MiniTest::Unit::TestCase
= class MiniTest::Spec < MiniTest::Unit::TestCase

BDD ���˥ƥ��Ȥ�񤯤���� [[c:MiniTest::Unit::TestCase]] ���Ф����åѡ����饹�Ǥ���

== Singleton Methods

--- new(name)

Ϳ����줿̾���Ǽ��Ȥ��������ޤ���

--- current -> MiniTest::Spec
#@todo

���߼¹���� [[c:MiniTest::Spec]] �Υ��󥹥��󥹤��֤��ޤ���

--- before(type = :each){ ... }
#@todo

�ƥƥ��Ȥ����ˤ˼¹Ԥ���֥�å�����Ͽ���ޤ���


--- after(type = :each){ ... }
#@todo

�ƥƥ��Ȥθ�˼¹Ԥ���֥�å�����Ͽ���ޤ���

--- it(desc){ ... }
#@todo

�ƥ��ȥ���������������ޤ���

Ϳ����줿�֥�å�����ĤΥƥ��ȥ��������������ޤ���
