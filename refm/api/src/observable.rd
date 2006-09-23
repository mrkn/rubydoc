= module Observable

=== ��Ū������
Mix-in �ˤ�� observer �ѥ�������󶡤��ޤ���

Observable �⥸�塼��� include �������饹��
Observable#changed �᥽�åɤˤ�깹���ե饰��Ω�ơ�
Observable#notify_observers ���ƤӽФ�����
�����ե饰��Ω�äƤ�����ϥ��֥����Ф����Τ��ޤ�
(���֥����Ф� update �᥽�åɤ�ƤӽФ�)��
Observable#notify_observers �ΰ�����
���Τޤޥ��֥����Ф� update �᥽�åɤ��Ϥ���ޤ���

=== ����ץ륳����
  require 'observer'
  class AObservable
    include Observable
    ...
  end
  class AObserver
    def update(arg)
      ...
    end
    ...
  end
  obj = AObservable.new
  observer = AObserver.new
  obj.add_observer(observer)
  obj.changed
  obj.notify_observers(args)

== Instance Methods

--- add_observer(observer)

���֥����Ф��ɲä��ޤ���
���֥����Ф� update �᥽�åɤ������Ƥ���ɬ�פ�����ޤ���

observer �� update �᥽�åɤ�����ʤ��Ȥ���
�㳰 NoMethodError ��ȯ�����ޤ���

--- delete_observer(observer)

���֥����Ф������ޤ���

--- delete_observers

���֥����Ф򤹤٤ƺ�����ޤ���

--- count_observers

���֥����Фο����֤��ޤ���

--- changed(state = true)

�����ե饰��Ω�Ƥޤ���

--- changed?

�����ե饰�ξ��֤��֤��ޤ���

--- notify_observers(*arg)

�����ե饰��Ω�äƤ����顢���֥����Ф� update �᥽�åɤ�ƤӽФ��ޤ���
Ϳ����줿�����Ϥ��� update �᥽�åɤ��Ϥ���ޤ���
�����ե饰�� false �ˤʤ�ޤ���
