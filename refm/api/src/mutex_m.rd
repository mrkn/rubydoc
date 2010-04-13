����å�Ʊ�������Ǥ��� Mutex �Υ⥸�塼���Ǥ��󶡤���饤�֥��Ǥ���

= module Mutex_m

����å�Ʊ�������Ǥ��� [[c:Mutex]] �Υ⥸�塼���ǤǤ������饹��
[[m:Module#include]] ���뤳�ȤǤ��Υ��饹�� Mutex ��ǽ��������뤳�Ȥ��Ǥ��ޤ���
�ޤ������̤Υ��֥������Ȥ� [[m:Object#extend]] �ˤ�� Mutex �ˤ�������Ǥ��ޤ���

���Υ⥸�塼��ˤ���å��Ϻ����Բ�ǽ�Ǥ���������ǽ��Ʊ���ʤ�ɬ�פʾ���
[[c:Sync_m]] �����Ѥ�ͤ��Ƥ���������

[[ruby-list:1991]]

=== ��
���饹�� [[m:Module#include]] ������
  class Foo
    include Mutex_m
    ...
  end
  obj = Foo.new
  obj.synchronize do 
    # ���ΰ�(critical section)
    ...
  end

���֥������Ȥ� [[m:Object#extend]] ������
  require "mutex_m"
  obj = Object.new
  obj.extend(Mutex_m)
  obj.lock
  # ���ΰ�(critical section)  
  ... 
  obj.unlock

== Instance Methods

--- mu_synchronize{ ... } -> object
--- synchronize{ ... } -> object

self �Υ�å�����������֥�å���¹Ԥ��ޤ����¹Ը��ɬ����å���������ޤ���

�֥�å��ǺǸ��ɾ�������ͤ��֤��ޤ���

#@until 1.9.1
--- mu_lock -> self
--- lock -> self
#@else
--- mu_lock -> ()
--- lock -> ()
#@end
self ���å����ޤ������٤ˤҤȤĤΥ���åɤ�����å��Ǥ��ޤ���
���˥�å�����Ƥ��� mutex ���Ф��ƥ�å���Ԥ����Ȥ�������åɤ�
��å������������ޤǡ��¹Ԥ���ߤ���ޤ���

#@until 1.9.1
self ���֤��ޤ���
#@end

--- mu_locked? -> bool
--- locked? -> bool
self ����å�����Ƥ�����������֤��ޤ���

--- mu_try_lock -> bool
--- try_lock -> bool
self ���å����褦�Ȥ��ơ�����������硢�����֤�����å������ޤ���

��å��Ǥ��ʤ��ä����ˤϥ֥�å����������֤��ޤ���

#@until 1.9.1
--- mu_unlock -> self | nil
--- unlock -> self | nil
#@else
--- mu_unlock -> ()
--- unlock -> ()
#@end
��å���������ޤ�����å��Ԥ��ˤʤäƤ�������åɤμ¹ԤϺƳ�����ޤ���

#@until 1.9.1
self ����å�����Ƥ��ʤ���� nil ���֤��ޤ��������Ǥʤ����self ���֤��ޤ���
#@else
@raise ThreadError ��å�����Ƥ��ʤ����� unlock ��Ƥ֤�ȯ�����ޤ�
#@end

