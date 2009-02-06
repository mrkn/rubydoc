�㳰���饹������Υ��顼��å������ѥե����ޥåȤ��Ϣ�Ť��뤿��Υ饤�֥��Ǥ���

=== �Ȥ���

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

= module Exception2MessageMapper
alias Exception2MessageMapper::E2MM

�㳰���饹������Υ��顼��å������ѥե����ޥåȤ��Ϣ�Ť��뤿��Υ⥸�塼��Ǥ���

== Singleton Methods
--- def_e2message(klass, exception_class, message_format) -> Class
���Ǥ�¸�ߤ����㳰���饹 exception_class �ˡ�
���顼��å������ѥե����ޥå� message_format ���Ϣ�Ť��ޤ���

@param klass �쳬�ؾ�Ȥʤ륯�饹̾����ꤷ�ޤ���

@param exception_class ��å���������Ͽ�����㳰���饹����ꤷ�ޤ���

@param message_format ��å������Υե����ޥåȤ���ꤷ�ޤ���
                    [[m:Kernel.#sprintf]] �Υե����ޥå�ʸ�����Ʊ����������ѤǤ��ޤ���

@return exception_class ���֤��ޤ���

--- def_exception(klass, exception_name, message_format, superklass = StandardError) -> Class

exception_name �Ȥ���̾�����㳰���饹��������ޤ���

@param klass �쳬�ؾ�Ȥʤ륯�饹̾����ꤷ�ޤ���

@param exception_name �㳰���饹��̾���򥷥�ܥ�ǻ��ꤷ�ޤ���

@param message_format ��å������Υե����ޥåȤ���ꤷ�ޤ���
                    [[m:Kernel.#sprintf]] �Υե����ޥå�ʸ�����Ʊ����������ѤǤ��ޤ���

@param superklass ��������㳰���饹�Υ����ѡ����饹����ꤷ�ޤ���
                  ��ά����� [[c:StandardError]] ����Ѥ��ޤ���

@return ��������㳰���饹���֤��ޤ���

--- Raise(klass = E2MM, exception_class = nil, *rest) -> ()
--- Fail(klass = E2MM, exception_class = nil, *rest)  -> ()

��Ͽ����Ƥ���������Ѥ��ơ��㳰��ȯ�������ޤ���

@param klass �쳬�ؾ�Ȥʤ륯�饹̾����ꤷ�ޤ���

@param exception_class �㳰���饹��

@param rest ��å��������������͡�

@raise Exception2MessageMapper::ErrNotRegisteredException ���ꤵ�줿�㳰���饹���б������å�������¸�ߤ��ʤ�����ȯ�����ޤ���

#@until 1.9.1
--- fail(err = nil, *rest) -> ()

���Υ᥽�åɤϸ����ߴ����Τ�����Ѱդ���Ƥ��ޤ���

��Ͽ����Ƥ���������Ѥ��ơ��㳰��ȯ�������ޤ���

@param exception_class �㳰���饹��

@param rest ��å��������������͡�

@raise Exception2MessageMapper::ErrNotRegisteredException ���ꤵ�줿�㳰���饹���б������å�������¸�ߤ��ʤ�����ȯ�����ޤ���

--- extend_to(b) -> Class

���Υ᥽�åɤϸ����ߴ����Τ�����Ѱդ���Ƥ��ޤ���

@param b [[c:Binding]] ���֥������ȡ�

#@end

== Instance Methods

--- Raise(err = nil, *rest) -> ()
--- Fail(err = nil, *rest)  -> ()
��Ͽ����Ƥ���������Ѥ��ơ��㳰��ȯ�������ޤ���

@param exception_class �㳰���饹��

@param rest ��å��������������͡�

@raise Exception2MessageMapper::ErrNotRegisteredException ���ꤵ�줿�㳰���饹���б������å�������¸�ߤ��ʤ�����ȯ�����ޤ���

��:

  class Foo
    extend Exception2MessageMapper
    p def_exception :NewExceptionClass, "message...%d, %d and %d" # =>
    
    def foo
      Raise NewExceptionClass, 1, 2, 3
    end
  end
  
  Foo.new().foo() #=> in `Raise': message...1, 2 and 3 (Foo::NewExceptionClass)
                  #   �Ȥ����㳰��ȯ�����ޤ���
  
  Foo.Raise Foo::NewExceptionClass, 1, 3, 5  #=> in `Raise': message...1, 3 and 5 (Foo::NewExceptionClass)
                                             #   �Ȥ����㳰��ȯ�����ޤ���

--- fail(err = nil, *rest) -> ()
��Ͽ����Ƥ���������Ѥ��ơ��㳰��ȯ�������ޤ���

@param exception_class �㳰���饹��

@param rest ��å��������������͡�

@raise Exception2MessageMapper::ErrNotRegisteredException ���ꤵ�줿�㳰���饹���б������å�������¸�ߤ��ʤ�����ȯ�����ޤ���

--- def_e2message(exception_class, message_format) -> Class

���Ǥ�¸�ߤ����㳰���饹 exception_class �ˡ�
���顼��å������ѥե����ޥå� message_format ���Ϣ�Ť��ޤ���

���Υե����ޥåȤ� [[m:Exception2MessageMapper#Raise]],
[[m:Exception2MessageMapper#Fail]] �ǻ��Ѥ��ޤ���

@param exception_class ��å���������Ͽ�����㳰���饹����ꤷ�ޤ���

@param message_format ��å������Υե����ޥåȤ���ꤷ�ޤ���
                    [[m:Kernel.#sprintf]] �Υե����ޥå�ʸ�����Ʊ����������ѤǤ��ޤ���

@return exception_class ���֤��ޤ���


--- def_exception(exception_name, message_format, superclass = StandardError) -> Class

exception_name �Ȥ���̾�����㳰���饹��������ޤ���

@param exception_name ��������㳰���饹��̾���򥷥�ܥ�ǻ��ꤷ�ޤ���

@param message_format ��å������Υե����ޥåȡ�

@param superclass ��������㳰�Υ����ѡ����饹����ꤷ�ޤ���
                  ��ά����� [[c:StandardError]] ����Ѥ��ޤ���


= class Exception2MessageMapper::ErrNotRegisteredException < StandardError

��Ͽ����Ƥ��ʤ��㳰�� [[m:Exception2MessageMapper#Raise]] �ǻ��Ѥ��줿����ȯ�����ޤ���
