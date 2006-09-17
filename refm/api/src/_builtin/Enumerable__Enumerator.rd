= class Enumerable::Enumerator < Object

include Enumerable

each �ʳ��Υ᥽�åɡ��Ĥޤ� each_byte ���� enumerate �Ǥ���
�褦�ˤ��뤿��Υ�åѡ����饹��

== Class Methods

--- new(obj, method = :each, *args)

���֥������� obj �ˤĤ��ơ� each ������� method �Ȥ���
̾���Υ᥽�åɤ�ȤäƷ����֤����֥������Ȥ����������֤��ޤ���
args ����ꤹ��ȡ� method �θƤӽФ������Ϥ���ޤ���

��:

  str = "xyz"

  enum = Enumerable::Enumerator.new(str, :each_byte)
  p enum.map {|b| '%02x' % b }   # => ["78", "79", "7a"]

== Methods

--- each {...}

�������Υѥ�᡼���˽��äƷ����֤��ޤ���



= reopen Object

== Methods

--- to_enum(method = :each, *args)
--- enum_for(method = :each, *args)

Enumerable::Enumerator.new(self, method, *args) ���֤��ޤ���

��:

  str = "xyz"

  enum = str.enum_for(:each_byte)
  a = enum.map {|b| '%02x' % b } #=> ["78", "79", "7a"]

  # protects an array from being modified
  a = [1, 2, 3]
  some_method(a.to_enum)



= reopen Enumerable

== Methods

--- each_slice(n) {...}

n ���Ǥ��Ĥˤ櫓�ƥ֥�å����Ϥ��Ʒ����֤��ޤ���

��:

  (1..10).each_slice(3) {|a| p a}
      # => [1, 2, 3]
      #    [4, 5, 6]
      #    [7, 8, 9]
      #    [10]

--- enum_slice(n)

Enumerable::Enumerator.new(self, :each_slice, n) ���֤��ޤ���

--- each_cons(n) {...}

Ϣ³���� n ���Ǥ��Ĥ������֥�å����Ϥ��Ʒ����֤���

��:

  (1..10).each_cons(3) {|a| p a}
      # => [1, 2, 3]
      #    [2, 3, 4]
      #    [3, 4, 5]
      #    [4, 5, 6]
      #    [5, 6, 7]
      #    [6, 7, 8]
      #    [7, 8, 9]
      #    [8, 9, 10]

--- enum_cons(n)

Enumerable::Enumerator.new(self, :each_cons, n) ���֤��ޤ���

--- enum_with_index

Enumerable::Enumerator.new(self, :each_with_index) ���֤��ޤ���
