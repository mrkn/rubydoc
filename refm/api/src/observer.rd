Observer �ѥ�����򰷤�����Υ饤�֥��Ǥ���

= module Observable

Observer �ѥ�������󶡤���⥸�塼��Ǥ���

Mix-in �ˤ�� Observer �ѥ�������󶡤��ޤ���

Observable �⥸�塼��� include �������饹��
[[m:Observable#changed]] �᥽�åɤˤ�깹���ե饰��Ω�ơ�
[[m:Observable#notify_observers]] ���ƤӽФ�����
�����ե饰��Ω�äƤ�����ϥ��֥����Ф����Τ��ޤ�
(���֥����Ф� update �᥽�åɤ�ƤӽФ�)��
[[m:Observable#notify_observers]] �ΰ�����
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

--- add_observer(observer) -> Array

���֥����Ф���Ͽ���ޤ���

���֥����Ф���Ͽ������Ͽ����Ƥ��륪�֥����ФΥꥹ�Ȥ��֤��ޤ���

���֥����Ф� update �᥽�åɤ������Ƥ���ɬ�פ�����ޤ���

observer �� update �᥽�åɤ�����ʤ��Ȥ���
�㳰 [[c:NoMethodError]] ��ȯ�����ޤ���

@param observer ���������Τ�����륪�֥�����

@raise NoMethodError update�᥽�åɤ�����ʤ����֥������Ȥ򥪥֥����Ф˻��ꤷ������ȯ�����ޤ���

--- delete_observer(observer) -> object | nil

���֥����Ф������ޤ���

���ꤵ�줿���֥������Ȥ����֥����ФȤ�����Ͽ����Ƥ������ϡ�
�ꥹ�Ȥ��饪�֥������Ȥ��������������줿���֥������Ȥ��֤��ޤ���
��Ͽ����Ƥ��ʤ��ä����ϡ�nil ���֤��ޤ���

@param observer ������륪�֥�����

--- delete_observers -> Array

���֥����Ф򤹤٤ƺ�����ޤ���

��Ͽ����Ƥ��륪�֥����ФΥꥹ�Ȥ������ƤΥ��֥������Ȥ��������
���Ȥʤä����֥����ФΥꥹ�Ȥ��֤��ޤ���

--- count_observers -> Fixnum

��Ͽ����Ƥ��륪�֥����Фο����֤��ޤ���

--- changed(state = true) -> bool

�����ե饰��Ω�Ƥޤ���

�����ե饰����ꤵ�줿���Ƥ��ѹ������ѹ���ι����ե饰�ξ��֤��֤��ޤ���
����Ū�˰�������ꤷ�ơ������ե饰���������뤳�Ȥ����ޤ���

@param state �����ե饰��Ω�Ƥ����true�򡢽�����������false����ꤷ�ޤ���

--- changed? -> bool

�����ե饰�ξ��֤��֤��ޤ���

--- notify_observers(*arg) -> nil

���֥����Фع��������Τ��ޤ���

�����ե饰��Ω�äƤ������ϡ�
��Ͽ����Ƥ��륪�֥����Ф� update �᥽�åɤ�缡�ƤӽФ��ޤ���
Ϳ����줿�����Ϥ��� update �᥽�åɤ��Ϥ���ޤ���
Ϳ����줿�����ο�����Ͽ����Ƥ��륪�֥����Ф�update �᥽�åɤΰ����ο��˰㤤���������
�㳰[[c:ArgumentError]]��ȯ�����ޤ���
���ƤΥ��֥����Ф� update �᥽�åɤ�ƤӽФ��塢�����ե饰���������ޤ���

@raise ArgumentError Ϳ����줿�����ο�����Ͽ����Ƥ��륪�֥����Ф�update �᥽�åɤΰ����ο��˰㤤���������ȯ�����ޤ���

