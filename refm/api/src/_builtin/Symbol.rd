= class Symbol < Object

����ܥ��ɽ�����饹������ܥ��Ǥ�դ�ʸ����Ȱ��а���б����륪�֥���
���ȤǤ���Ruby ������ץȤ����

  * :symbol
  * 'symbol'.intern

�Τ褦�ˤ��������ޤ�����ƥ��ǥ���ܥ��ɽ����硢`:' �θ��
�ϼ��̻ҡ��᥽�å�̾(`!',`?' �ʤɤ���������ޤ�)���ѿ�̾
(`$'�ʤɤ���Ƭ����ޤ�)��������Ǥ���黻�ҤΤ����줫��Ŭ�礹��
��Τ����񤯤��ȤϤǤ��ޤ���(�����Ǥʤ����ʸˡ���顼�ˤʤ�ޤ�)��

#@since 1.8.0
��:

  p :"foo#{"bar"}"
    => :foobar
  p :'foo#{"bar"}'
    => :"foo\#{\"bar\"}"
  p %s{foo#{"bar"}}
    => :"foo\#{\"bar\"}"
#@end

== Class Methods

#@since 1.8.0
--- all_symbols

����Ѥߤ����ƤΥ���ܥ륪�֥������Ȥ�������֤��ޤ���

��:

  p Symbol.all_symbols  # => [:RUBY_PLATFORM, :RUBY_VERSION, ...]

����ܥ�������ϥ���ѥ�����˹Ԥ���Τǰʲ��Τ褦�ˤ��Ƥ��̤�
���Ϥ���ޤ���

  a = Symbol.all_symbols
  :foo
  b = Symbol.all_symbols
  p b - a
  # => []
#@end

== Instance Methods

#@since 1.8.0
--- to_sym

self ���֤��ޤ���
#@end

--- id2name()
--- to_s

����ܥ���б�����ʸ������֤��ޤ���

�դˡ�ʸ������б����륷��ܥ������ˤ�
[[m:String#intern]] ��Ȥ��ޤ���

��:

  p :foo.id2name.intern == :foo
  => true

--- to_i

����ܥ���б������������֤��ޤ���

�դˤ������������б����륷��ܥ������ˤ�
[[m:Fixnum#id2name]] ��Ȥäư�öʸ���������ɬ�פ�
����ޤ���
#@since 1.8.0
ľ�ܥ���ܥ������ˤ�
[[m:Fixnum#to_sym]] ���Ȥ��ޤ�)
#@end

��:

   id = :foo.to_i
   p id                  # => 8881
   p id.id2name.intern   # => :foo
#@since 1.8.0
   p id.to_sym           # => :foo  (version 1.7)
#@end

Ruby�μ����Ǥ�ͽ��졢�ѿ�̾���᥽�å�̾�ʤɤ򤳤������Ǵ������Ƥ�
�ޤ������֥������Ȥ��б���������([[m:Object#__id__]] ������
��ޤ�)�� Symbol ���б������������̤Τ�ΤǤ���
