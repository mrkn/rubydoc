= module GC

GC �� Ruby ���󥿥ץ꥿�Ρ֥��߽���(Garbage Collection)�פ�����
����⥸�塼��Ǥ���

== Module Functions

--- disable

�����١������쥯�Ȥ�ػߤ��ޤ���

����ζػ߾��֤��֤��ޤ�(�ػߤ���Ƥ����ʤ� true, GC ��ͭ���Ǥ��ä��ʤ顢
false)��

--- enable

�����١������쥯�Ȥ���Ĥ��ޤ���

����ζػ߾��֤��֤��ޤ�(�ػߤ���Ƥ����ʤ� true, GC ��ͭ���Ǥ��ä��ʤ顢
false)��

--- start

�����١������쥯�Ȥ򳫻Ϥ��ޤ���

nil ���֤��ޤ���

#@if (version >= "1.9.0")
--- stress
--- stress=(bool)

((<ruby 1.9 feature>))

GC.stress ���������ꤵ��Ƥ���֤ϡ�GC ��Ԥ��뤹�٤Ƥε���� GC ��Ԥ��ޤ���
#@end

== Instance Methods

--- garbage_collect

�����١������쥯�Ȥ򳫻Ϥ��ޤ����ʲ���Ʊ��Ư���򤷤ޤ���

  GC.start

nil ���֤��ޤ���
