= module Precision

���٤��Ķ�ݿ��ͥ��饹�Τ���� Mix-in�� �����Ǥ������٤Ȥϼ¿��ζ��
���ɤ����̣���ޤ�����ݿ��ͥ��饹��ʣ�ǿ�������ʤɤ���鼫�Ȥ��¿���
�ޤޤ�ʤ��褦�� ���饹�˥��󥯥롼�ɤ��٤��ǤϤ���ޤ���

== Singleton Methods

#@since 1.7.0
--- included(module_or_class)

Precision �����󥯥롼�ɤ��줿���˸ƤФ�ޤ����ܺ٤�
[[m:Module#included]] �򻲾Ȥ��Ƥ���������

���Υ᥽�åɤϡ�Precision �򥤥󥯥롼�ɤ��륯�饹��⥸�塼
����Ф��ƥ᥽�å� induced_from ��ưŪ��������뤿��ˤ���
�ޤ���
#@#    ((-ruby 1.6 �����ϡ������
#@#    [[m:Module#append_feature]] ���������뤳��
#@#    �Ǽ¸����Ƥ��ޤ���-))
#@end

--- induced_from(number)

number ��ʬ�Υ��饹���Ѵ�������̤��֤��ޤ��� �ǥե���Ȥ�
����ϡ��㳰 [[c:TypeError]] ��ȯ��������Τǡ�Mix-in �������饹��
���Υ᥽�åɤ���������ɬ�פ�����ޤ���������ˡ�
[[m:Precision#prec]] ��Ȥ��ȡ� ̵�¥롼�פˤʤ��
ǽ��������ޤ���

== Instance Methods

--- prec(klass)

self ������ klass ���Ѵ�������̤��֤��ޤ����ǥե����
������Ǥ� klass.induced_from(self) ��ƤӽФ������η�
�̤��֤��ޤ���

���������٥��饹����Ȥ����Ȥ߹��ߥ��饹��
[[m:Precision#Precision.induced_from]] ���ѹ�����ΤǤϤʤ�������
prec �κ�������б�����٤��Ǥ���

--- prec_i

self �� [[c:Integer]] ���Ѵ����ޤ���prec(Integer) ����
���Ǥ���

--- prec_f

self �� [[c:Float]] ���Ѵ����ޤ���prec(Float) ��������
����
