2 �Ĥ�����ɽ���ˤ�� AND/OR ���󶡤��ޤ���

Regexp ���饹�� & �� | �Υ᥽�åɤ�����������줾��
2�Ĥ�����ɽ����ξ���˥ޥå�����п��Ȥʤ��� (RegAnd) ��
�����줫�˥ޥå�����п��Ȥʤ��� (RegOr) ���֤��ޤ���
RegAnd��RegOr �� =~ �Τߥ��ݡ��Ȥ��Ƥ��ޤ���

=== ������

  require 'eregex'
  p "abc" =~ /b/|/c/
  p "abc" =~ /b/&/c/



= reopen Regexp

#@# �Ȥ߹��ߥ��饹 Regexp���ĥ���Ƽ��Υ᥽�åɤ�������Ƥ��ޤ���

== Instance Methods

--- &(other)

[[m:RegAnd.new]](self, other) ���֤��ޤ���

--- |(other)

[[m:RegOr.new]](self, other) ���֤��ޤ���



= class RegAnd < Object

== Class Methods

--- new(re1, re2)

������ RegAnd ���֥������Ȥ��������ޤ���

== Instance Methods

--- =~(str)

str �� re1 �� re2 ��ξ���˥ޥå�����п����֤��ޤ���



= class RegOr < Object

== Class Methods

--- new(re1, re2)

������ RegOr ���֥������Ȥ��������ޤ���

== Instance Methods

--- =~(str)

str �� re1 �� re2 �Τ����줫�˥ޥå�����п����֤��ޤ���
