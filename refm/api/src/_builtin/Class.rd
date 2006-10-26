= class Class < Module

���饹�Υ��饹��������Τ˸����С��ġ��Υ��饹�Ϥ��줾��᥿���饹�ȸ�
�Ф��̾���Τʤ����饹�򥯥饹�Ȥ��ƻ��äƤ��ơ�Class �Ϥ��Υ᥿
���饹�Υ��饹�Ǥ������δط��Ͼ���ʣ���Ǥ�����Ruby �����Ѥ���ˤ�����
�Ƥ��ä˽��פǤϤ���ޤ���

���饹�ϡ��⥸�塼��Ȥ�

  * ���󥹥��󥹤�����Ǥ���
  * [[m:Module#include]] �ˤ�� Mix-in ���Ǥ��ʤ�

�Ȥ����㤤������ޤ���������ʳ��ΤۤȤ�ɤε�ǽ�� [[c:Module]] �����
������Ƥ��ޤ���Module �Υ᥽�åɤΤ���

  * [[m:Module#module_function]]
  * [[m:Module#extend_object]]
  * [[m:Module#append_features]]

�� Class �Ǥ�̤����ˤ���Ƥ��ޤ���

== Class Methods

--- new([superclass])
#@if (version >= "1.7.0")
--- new([superclass]) {|klass| ... }
#@end

������̾�����դ��Ƥ��ʤ� superclass �Υ��֥��饹���������ޤ���
superclass ����ά���줿���ˤ�Object �Υ��֥��饹������
���ޤ���

̾���Τʤ����饹�ϡ��ǽ��̾�������ݤ���������Ƥ������̾��
���������Ĥ��ä����̾�򥯥饹̾�Ȥ��ޤ���

��:

  p foo = Class.new   # => #<Class:0x401b90f8>
  p foo.name          # => ""
  Foo = foo           # ������ p foo ����� "Foo" ����
  Bar = foo
  p foo.name          # => "Bar"  ("Foo" �ˤʤ뤫 "Bar" �ˤʤ뤫������)

#@if (version >= "1.7.0")
�֥�å���Ϳ������������������饹��֥�å��ΰ������Ϥ������饹
�Υ���ƥ����Ȥǥ֥�å���¹Ԥ��ޤ������ξ��������������饹����
���ޤ���

  klass = Class.new(super)
  klass.module_eval {|m| ... }
  klass

��Ʊ���Ǥ����֥�å��μ¹Ԥ� Module#initialize ���Ԥ��ޤ���
#@end

== Instance Methods

#@if (version >= "1.7.0")
--- allocate

���饹�Υ��󥹥��󥹤����������֤��ޤ��������������֥������Ȥ�
(�̾�)���饹�Υ��󥹥��󥹤Ǥ��뤳�Ȱʳ��ˤϲ�������������ޤ���
#@end

--- new( ... )

���饹�Υ��󥹥��󥹤����������֤��ޤ������Υ᥽�åɤΰ����ϥ֥�å�������
�ޤ� [[m:Object#initialize]] ���Ϥ���ޤ���

#@if (version >= "1.7.0")
version 1.7 �Ǥϡ�new �ϡ�allocate �ǥ���
�����󥹤���������initialize �ǽ������Ԥ��᥽�åɤǤ���
#@end

--- superclass

���饹�Υ����ѡ����饹���֤��ޤ���

== Private Instance Methods

--- inherited(subclass)

���饹�Υ��֥��饹��������줿�����������������줿���֥��饹�����
�˥��󥿥ץ꥿����ƤӽФ���ޤ������Υ᥽�åɤ��ƤФ�륿���ߥ󥰤�
���饹���ʸ�μ¹�ľ���Ǥ���

��:

  class Foo
    def Foo.inherited(subclass)
      puts "class \"#{self}\" was inherited by \"#{subclass}\""
    end
  end
  class Bar < Foo
    puts "executing class body"
  end
  
  # => class "Foo" was inherited by "Bar"
       executing class body
