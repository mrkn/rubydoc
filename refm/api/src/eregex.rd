eregex

=== ��Ū������

2�Ĥ�����ɽ���ˤ�� AND/OR ���󶡤��ޤ���

Regexp ���饹�� & �� | �Υ᥽�åɤ�����������줾��
2�Ĥ�����ɽ����ξ���˥ޥå�����п��Ȥʤ��� (RegAnd) ��
�����줫�˥ޥå�����п��Ȥʤ��� (RegOr) ���֤��ޤ���
RegAnd��RegOr �� =~ �Τߥ��ݡ��Ȥ��Ƥ��ޤ���

=== ����ץ륳����

  require 'eregex'
  p "abc" =~ /b/|/c/
  p "abc" =~ /b/&/c/

= reopen Regexp

#@# �Ȥ߹��ߥ��饹 Regexp���ĥ���Ƽ��Υ᥽�åɤ�������Ƥ��ޤ���

== Instance Methods

--- &(other)

RegAnd(self,other) ���֤��ޤ���

--- |(other)

RegOr(self,other) ���֤��ޤ���

= class RegAnd < Object

== Class Methods

--- new(reg1, reg2)

���󥹥ȥ饯���Ǥ���

== Instance Methods

--- =~(str)

str �� reg1 �� reg2 ��ξ���˥ޥå�����п����֤��ޤ���

= class RegOr < Object

== Class Methods

--- new(reg1, reg2)

���󥹥ȥ饯���Ǥ���

== Instance Methods

--- =~(str)

str �� reg1 �� reg2 �Τ����줫�˥ޥå�����п����֤��ޤ���
