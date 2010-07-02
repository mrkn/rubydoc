require runit/error

���Υ饤�֥��ϡ�
RubyUnit �Ȥθߴ������󶡤��뤿��������󶡤���Ƥ��ޤ���
���줫�鿷������˥åȥƥ��Ȥ�񤯤Ȥ���
[[lib:test/unit]] �饤�֥���ȤäƤ���������


= module RUNIT::Assert
include Test::Unit::Assertions

RubyUnit �Υ����������򽸤᤿�⥸�塼��Ǥ���

���Υ⥸�塼��� RubyUnit �Ȥθߴ����Τ���ˤΤ��󶡤���Ƥ��ޤ���
���줫���˥åȥƥ��Ȥ�񤯤Ȥ��� [[lib:test/unit]] ��ȤäƤ���������

== Module Functions

--- assert_equal_float(expected, actual, delta, message = "") -> ()

�����ͤȼºݤ��ͤκ��������ͤ�Ϳ����줿���и��ʲ��Ǥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param expected �����ͤ���ꤷ�ޤ���

@param actual �ºݤ��ͤ���ꤷ�ޤ���

@param delta ���Ƥ������и�����ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- assert_send(object, method, *args) -> ()

object.__send__(method, *args) �����Ǥ����硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param object Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���

@param method �ƤӽФ��᥽�å�̾����ꤷ�ޤ���

@param args �᥽�åɤ��Ϥ���������ꤷ�ޤ���

#@since 1.8.1
--- assert_not_nil(actual, message = "") -> ()
Ϳ����줿���֥������Ȥ� nil �Ǥʤ���硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param actual �������������֥������Ȥ���ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���
#@end

--- assert_respond_to(method, object, message = "") -> ()

Ϳ����줿���֥������Ȥ�Ϳ����줿�᥽�åɤ���ľ�硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param method �᥽�å�̾����ꤷ�ޤ���

@param object Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- assert_match(str, re, message = "") -> ()
--- assert_matches(str, re, message = "") -> ()

Ϳ����줿ʸ����Ϳ����줿����ɽ���˥ޥå������硢�����˥ѥ����ޤ���

@param str ʸ�������ꤷ�ޤ���

@param re ����ɽ������ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- assert_not_match(str, re, message = "") -> ()
Ϳ����줿ʸ����Ϳ����줿����ɽ���˥ޥå����ʤ���硢�����˥ѥ����ޤ���

@param str ʸ�������ꤷ�ޤ���

@param re ����ɽ������ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- assert_exception(exception, message = "") { ... } -> ()

Ϳ����줿�֥�å���ɾ�����Ϳ����줿�㳰��ȯ�������硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param exception �㳰���饹����ꤷ�ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- assert_no_exception(*args) { ... }
Ϳ����줿�֥�å���ɾ�����Ϳ����줿�㳰��ȯ�����ʤ���硢�����˥ѥ��������Ȥˤʤ�ޤ���

@param args �㳰���饹���İʾ���ꤷ�ޤ����Ǹ�ΰ�����ʸ�������ꤷ����硢����ϸ�����
            ���Ԥ����Ȥ��Υ�å������ˤʤ�ޤ���

--- assert_fail(message) -> ()

��˼��Ԥ��ޤ���

@param message �����˼��Ԥ����Ȥ��Υ�å���������ꤷ�ޤ���

--- setup_assert

���⤷�ޤ���

--- called_internally? -> bool

�����ǻ��Ѥ��ޤ���

