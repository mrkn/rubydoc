complex

=== ChangeLog

*[2002-04-03] ���� by [[unknown:����|URL:mailto:sugawah@attglobal.net]]
*[2003-04-29] Complex#polar�ε��Ҥ������������ƥ���ɽ���˽��� by [[unknown:pastor|URL:mailto:pastor@fmc.rikkyo.ne.jp]]

#@#@# imported by aamine
= class Complex < Numeric

#@# [2002-04-03]  by [[unknown:����|URL:mailto:sugawah@attglobal.net]]

ʣ�ǿ��򰷤����饹

�Ȥ��� Usage

Complex ��Ȥ�����ˤ� require 'complex' ����ɬ�פ�����ޤ���
���Υ饤�֥��� require ����ȡ������ Math �⥸�塼�뤬ʣ�ǿ��б��˳�ĥ����ޤ���

  require 'complex'

�ޤ���ź�ե饤�֥��Υ٥��ȥ륯�饹 [[c:Vector]]������ӡ�
���󥯥饹 [[c:Matrix]] ���ɤ߹���Ǥ���Ȥ���
Vector �� Matrix �����ǤȤ��ơ�ʣ�ǿ���Ȥ����Ȥ��Ǥ��ޤ���
Vector ����� Matrix �Τ��줾��ι��ܤ򻲾Ȥ��Ƥ���������

  require 'matrix'
  require 'complex'

== Class Methods

--- new(r,i)
--- r,i=0)
--- new!(r,i=0)

������ r������ i ��ʣ�ǿ����������ޤ���

== Instance Methods

--- +(c)
ʣ�ǿ� c ��ä�����̤��֤��ޤ���

--- -(c)
ʣ�ǿ� c �򸺤�����̤��֤��ޤ���

--- *(c)
ʣ�ǿ� c ��褸����̤��֤��ޤ���

--- /(c)
ʣ�ǿ� c �ǽ�������̤��֤���

--- %(c)
ʣ�ǿ� c �ǽ�����;��(����Ʊ�Ρ�����Ʊ�Τα黻���)���֤��ޤ���

--- **(c)
ʣ�ǿ� c �Ǥ٤��褷����̤��֤��ޤ���

--- divmod -- obsolete
���Υ᥽�åɤ��ѻߤ���ޤ�����

--- abs
ʣ�ǿ��������ͤ��֤��ޤ���

--- abs2
ʣ�ǿ��������ͤ� 2 ����֤��ޤ���

--- arg
ʣ�ǿ����гѤ��֤��ޤ���
#@# (�Ͱ��?��

--- polar
ʣ�ǿ��ζ˺�ɸɽ�������ʤ�������� [self.abs,self.arg] ���֤��ޤ���

--- conjugate
����ʣ�ǿ����֤��ޤ���

--- real
�������֤��ޤ���

--- image
�������֤��ޤ���

--- <=>(c)
c �Ȥ���ӷ�̤��֤��ޤ���

--- ==(c)
c ����������С������֤��ޤ���

--- to_i
���� [[c:Integer]] ���Ѵ����ޤ���

--- to_f
��ư�������� [[c:Float]] ���Ѵ����ޤ���

--- to_r
ͭ���� [[c:Rational]] ���Ѵ����ޤ���

== Constants

--- I
����ñ�̡�
