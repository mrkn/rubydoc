2 �Ĥ�����ɽ���ˤ�� AND/OR ���󶡤��ޤ���

���Υ饤�֥��ϥ��󥻥ץȼ¾��ѤΤ������Τ褦�ʤ�ΤǤ���

[[c:Regexp]] ���饹�� & �� | �Υ᥽�åɤ�����������줾��
2�Ĥ�����ɽ����ξ���˥ޥå�����п��Ȥʤ��� ([[c:RegAnd]]) ��
�����줫�˥ޥå�����п��Ȥʤ��� ([[c:RegOr]]) ���֤��ޤ���
[[c:RegAnd]]��[[c:RegOr]] �� =~ �Τߥ��ݡ��Ȥ��Ƥ��ޤ���

=== ������

  require 'eregex'
  p "abc" =~ /b/|/c/
  p "abc" =~ /b/&/c/



= reopen Regexp

#@# �Ȥ߹��ߥ��饹 Regexp���ĥ���Ƽ��Υ᥽�åɤ�������Ƥ��ޤ���

== Instance Methods

--- &(other) -> RedAnd

[[m:RegAnd.new]](self, other) ���֤��ޤ���

@param other ����ɽ�����֥������ȡ�

--- |(other) -> RegOr

[[m:RegOr.new]](self, other) ���֤��ޤ���

@param other ����ɽ�����֥������ȡ�

= class RegAnd < Object

��Ĥ�����ɽ�����������ݻ����륯�饹�Ǥ���

== Class Methods

--- new(re1, re2) -> RegAnd

������ RegAnd ���֥������Ȥ��������ޤ���

@param re1 ����ɽ�����֥������ȡ�

@param re2 ����ɽ�����֥������ȡ�

== Instance Methods

--- =~(str) -> bool

str ���������ݻ����Ƥ�������ɽ����ξ���˥ޥå�����п����֤��ޤ���

@param str ʸ����

= class RegOr < Object

��Ĥ�����ɽ�����������ݻ����륯�饹�Ǥ���

== Class Methods

--- new(re1, re2) -> RegOr

������ RegOr ���֥������Ȥ��������ޤ���

@param re1 ����ɽ�����֥������ȡ�

@param re2 ����ɽ�����֥������ȡ�

== Instance Methods

--- =~(str) -> bool

str �� �������ݻ����Ƥ��뤤���줫������ɽ���˥ޥå�����п����֤��ޤ���

@param str ʸ����
