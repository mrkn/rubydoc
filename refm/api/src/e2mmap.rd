�㳰���饹������Υ��顼��å������ѥե����ޥåȤ��Ϣ�Ť��ޤ���

1. ���饹�������ǡ�Exception2MessageMapper �� extend ����С�
def_e2message �᥽�åɤ� def_exception �᥽�åɤ��Ȥ��ޤ���
�������㳰���饹�ȥ�å��������Ϣ�Ť��뤳�Ȥ��Ǥ��ޤ���

��:

  class Foo
    extend Exception2MessageMapper
    def_e2message ExistingExceptionClass, "message..."
    def_exception :NewExceptionClass, "message...", StandardError
    ...
  end

  foo = Foo.new
  foo.Fail ....

2. ���٤�Ȥ������㳰���饹�ϡ����饹������˥⥸�塼���������ơ�
����� include ���ƻȤ��ޤ���

��:

  module ErrorMod
    extend Exception2MessageMapper
    def_e2meggage ExistingExceptionClass, "message..."
    def_exception :NewExceptionClass, "message...", StandardError
    ...
  end
  class Foo
    include ErrorMod
    ...
  end
  
  foo = Foo.new
  foo.Fail ....

3. �㳰�����ꤷ�����饹�Υ��󥹥��󥹰ʳ������㳰��Ƥ֤��Ȥ�Ǥ��ޤ���

��:

  module ErrorMod
    extend Exception2MessageMapper
    def_e2message ExistingExceptionClass, "message..."
    def_exception :NewExceptionClass, "message...", StandardError
    ...
  end
  class Foo
    extend Exception2MessageMapper
    include ErrorMod
    ...
  end
  
  Foo.Fail NewExceptionClass, arg...
  Foo.Fail ExistingExceptionClass, arg...



= reopen Kernel

== Private Instance Methods

--- Raise(error, *args)
--- Fail(error, *args)
#@todo

error ���饹�Υ��顼��ȯ�������ޤ���

error �θ��³������ args ���ϡ��㳰���饹�˴�Ϣ�Ť���줿���顼
��å������ѥե����ޥåȤȹ�碌�ơ����顼��å������ΰ�����
�ʤ�ޤ����㤨�С�

  class Foo
    extend Exception2MessageMapper
    def_exception :NewExceptionClass, "message...%d, %d and %d"
    
    def foo
      Raise NewExceptionClass, 1, 2, 3
    end
  end

�Ȥ������������С�

  Foo.new().foo()

�Ȥ����᥽�åɤǡ�

  in `Raise': message...1, 2 and 3 (Foo::NewExceptionClass)

�Ȥ������顼��ȯ�����ޤ���

�ޤ���

  Foo.Raise Foo::NewExceptionClass, 1, 3, 5

�Ȥ����᥽�åɤǤ⡢

  in `Raise': message...1, 3 and 5 (Foo::NewExceptionClass)

�Ȥ����㳰��ȯ�����ޤ���



= module Exception2MessageMapper

== Singleton Methods
--- def_e2message(k, c, m)
#@todo

--- def_exception(k, n, m, s = StandardError)
#@todo

--- Raise(klass = E2MM, err = nil, *rest)
--- Fail(klass = E2MM, err = nil, *rest)
#@todo

== Instance Methods

--- Raise(err = nil, *rest)
--- Fail(err  = nil, *rest)
#@todo

--- fail(err = nil, *rest)
#@todo

--- def_e2message(exception, message_form)
#@todo

���Ǥ�¸�ߤ����㳰���饹 exception �ˡ�
���顼��å������ѥե����ޥå� message_form ���Ϣ�Ť��ޤ���
message_form �η����� sprintf() �� format ʸ�����Ʊ���Ǥ���

���Υե����ޥåȤ� Raise (�ޤ��Ϥ�����̾�� Fail)�ǻȤ��ޤ���

--- def_exception(exception_name, message_form, superclass)
#@todo

exception_name �Ȥ���̾�����㳰���饹����ޤ���
exception_name �ϥ���ܥ��Ϳ�����ޤ���

���Υ��饹�ϡ�superclass �����ꤵ��Ƥ����
���Υ��饹�Υ��֥��饹�ˡ�
���ꤵ��Ƥ��ʤ����� StandardError �Υ��֥��饹�ˤʤ�ޤ���

�����ơ����Υ��饹�� message_form �ǻ��ꤵ�줿
�ե����ޥåȤ��Ϣ�Ť��ޤ���
����� Raise (�ޤ��Ϥ�����̾�� Fail) �ǻȤ��ޤ���

= module Exception2MessageMapper::E2MM
Exception2MessageMapper ����̾�Ǥ���

= class Exception2MessageMapper::ErrNotRegisteredException < StandardError
