= module Mutex_m

����å�Ʊ�������Ǥ��� [[c:Mutex]] �Υ⥸�塼���ǤǤ������̤Υ��֥������Ȥ�
extend �ˤ�� Mutex �ˤ�������Ǥ��ޤ���

[[unknown:ruby-list:1991]]

#@# == ��

  require "mutex_m"
  obj = Object.new
  obj.extend(Mutex_m)
  obj.lock
  obj.unlock

== Instance Methods

--- mu_synchronize{ ... }
--- synchronize{ ... }
#@todo
Mutex_m ���å������֥�å���¹Ԥ��ޤ����¹Ը��ɬ�� Mutex_m 
�Υ�å���������ޤ���

--- mu_lock
--- lock
#@todo
Mutex_m ���å����ޤ������٤ˤҤȤĤΥ���åɤ�����å��Ǥ��ޤ���
���˥�å�����Ƥ��� mutex ���Ф��ƥ�å���Ԥ����Ȥ�������åɤ�
Mutex_m �Υ�å������������ޤǡ��¹Ԥ���ߤ���ޤ���

self ���֤��ޤ���

--- mu_locked?
--- locked?
#@todo
Mutex_m ����å�����Ƥ�����������֤��ޤ���

--- mu_try_lock
--- try_lock
#@todo
Mutex_m ���å����褦�Ȥ��ơ���å�������������硢�����֤��ޤ���
��å��Ǥ��ʤ��ä����ˤϥ֥�å����������֤��ޤ���

--- mu_unlock
--- unlock
#@todo
Mutex_m �Υ�å���������ޤ���
Mutex_m �Υ�å��Ԥ��ˤʤäƤ�������åɤμ¹ԤϺƳ�����ޤ���

self ����å�����Ƥ��ʤ���� nil ���֤��ޤ��������Ǥʤ����self ���֤��ޤ���
