����åɴ֥��塼������ѿ�(condition variable)���󶡤���饤�֥��Ǥ���

���Υ饤�֥���[[c:Thread]]���ĥ���ޤ���ruby���󥿥ץ꥿��
�ǥХå����ץ�����դ�([[m:$DEBUG]]��)�Ǽ¹Ԥ����Ȥ��ˤϡ�
[[m:Thread.abort_on_exception]]��true�ˤ��ޤ�

#@#((-���餤: 2001-02-11
#@#$DEBUG�����ξ�硢ruby���󥿥ץ꥿������ abort_on_exception �� true �ˤ���
#@#�Ȥ���Ʊ��ư��ˤ���Τǡ����ε�ǽ��ɬ�פʤ��ΤǤϤʤ�����-))��
#@#�ޤ���[[c:Thread]]���饹�˰ʲ��Υ��饹�᥽�åɤ��ɲ�������ޤ���

= reopen Thread
== Class Methods
#@until 1.9.1
--- Thread.exclusive { ... }
#@todo
#@# 1.9.1 �ʹߤ� prelude.rb ���������Ƥ���Τ� _builtin/Thread �˰�ư���ޤ�����
�֥�å��¹��桢Thread���ڤ��ؤ���Ԥ��ޤ���

#@end

#@include(thread/ConditionVariable)
#@until 1.9.1
#@include(thread/Mutex)
#@end
#@include(thread/Queue)
#@include(thread/SizedQueue)
