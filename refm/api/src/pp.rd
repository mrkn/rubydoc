require prettyprint

Pretty-printer

=== �ɤ��餬�ɤߤ䤹���Ǥ��礦��?

p �ˤ�� pretty-print ����Ƥʤ�����:
  #<PP:0x81a0d10 @stack=[], @genspace=#<Proc:0x81a0cc0>, @nest=[0], @newline="\n", @buf=#<PrettyPrint::Group:0x81a0c98 @group=0, @tail=0, @buf=[#<PrettyPrint::Group:0x81a0ba8 @group=1, @tail=0, @buf=[#<PrettyPrint::Text:0x81a0b30 @tail=2, @width=1, @text="[">, #<PrettyPrint::Group:0x81a0a68 @group=2, @tail=1, @buf=[#<PrettyPrint::Text:0x81a09f0 @tail=1, @width=1, @text="1">], @singleline_width=1>, #<PrettyPrint::Text:0x81a0a7c @tail=0, @width=1, @text=",">, #<PrettyPrint::Breakable:0x81a0a2c @group=2, @genspace=#<Proc:0x81a0cc0>, @newline="\n", @indent=1, @tail=2, @sep=" ", @width=1>, #<PrettyPrint::Group:0x81a09c8 @group=2, @tail=1, @buf=[#<PrettyPrint::Text:0x81a0950 @tail=1, @width=1, @text="2">], @singleline_width=1>, #<PrettyPrint::Text:0x81a0af4 @tail=0, @width=1, @text="]">], @singleline_width=6>], @singleline_width=6>, @sharing_detection=false>

pp �ˤ�� pretty-print ���줿����:
  #<PP:0x40d0688
   @buf=
    #<PrettyPrint::Group:0x40d064c
     @buf=
      [#<PrettyPrint::Group:0x40d05d4
        @buf=
         [#<PrettyPrint::Text:0x40d0598 @tail=2, @text="[", @width=1>,
          #<PrettyPrint::Group:0x40d0534
           @buf=[#<PrettyPrint::Text:0x40d04f8 @tail=1, @text="1", @width=1>],
           @group=2,
           @singleline_width=1,
           @tail=1>,
          #<PrettyPrint::Text:0x40d053e @tail=0, @text=",", @width=1>,
          #<PrettyPrint::Breakable:0x40d0516
           @genspace=#<Proc:0x40d0656>,
           @group=2,
           @indent=1,
           @newline="\n",
           @sep=" ",
           @tail=2,
           @width=1>,
          #<PrettyPrint::Group:0x40d04e4
           @buf=[#<PrettyPrint::Text:0x40d04a8 @tail=1, @text="2", @width=1>],
           @group=2,
           @singleline_width=1,
           @tail=1>,
          #<PrettyPrint::Text:0x40d057a @tail=0, @text="]", @width=1>],
        @group=1,
        @singleline_width=6,
        @tail=0>],
     @group=0,
     @singleline_width=6,
     @tail=0>,
   @genspace=#<Proc:0x40d0656>,
   @nest=[0],
   @newline="\n",
   @sharing_detection=false,
   @stack=[]>


=== ���ϤΥ������ޥ���

���ʤ��Υ��饹�� pritty print �򥫥����ޥ������������ϡ�
���Υ��饹�� pretty_print(pp) �᥽�åɤ��������ޤ���
���Υ᥽�åɤϰ�����ҤȤļ��ޤ������� pp �� [[c:PP]] ���饹�Υ��󥹥��󥹤Ǥ���
���Υ᥽�åɤϽ��Ϥ˺ݤ��� [[m:PP#text]], [[m:PP#breakable]], [[m:PP#nest]], [[m:PP#group]] ����� [[m:PP#pp]] ��Ȥ��ޤ�������4�᥽�åɤ˴ؤ��Ƥ�PP�οƥ��饹��PrettyPrint���������Ƥ��ޤ���[[m:PrettyPrint#text]], [[m:PrettyPrint#breakable]], [[m:PrettyPrint#nest]], [[m:PrettyPrint#group]] �򻲾Ȥ��Ƥ���������

= reopen Kernel
== Private Instance Methods
--- pp(obj)
#@todo
obj �� $> �� pretty print �ǽ��Ϥ��ޤ���
nil ���֤��ޤ���

#@since 1.8.5 
= reopen Object
== Instance Methods
--- pretty_inspect
#@todo

self �� pp ��ɽ�������Ȥ��η�̤�ʸ����Ȥ����֤��ޤ���
#@end

= class PP < PrettyPrint

== Class Methods
--- pp(obj[, out[, width]])
#@todo
obj �� out ���� width �� pretty print ���ޤ���

out ���ά�������ϡ�$> �����ꤵ�줿��ΤȤߤʤ���ޤ���
width ���ά�������ϡ�79 �����ꤵ�줿��ΤȤߤʤ���ޤ���

PP.pp �� out ���֤��ޤ���

  str = PP.pp([[:a, :b], [:a, [[:a, [:a, [:a, :b]]], [:a, :b],]]], '', 20)
  puts str
  #=>
  [[:a, :b],
   [:a,
    [[:a,
      [:a, [:a, :b]]],
     [:a, :b]]]]

--- sharing_detection
#@todo

��ͭ���Хե饰�� boolean ���ʤ�� true �� false ���֤��ޤ���
�ǥե���Ȥ� false �Ǥ���

--- sharing_detection=(boolean_value)
#@todo

��ͭ���Хե饰�����ꤷ�ޤ���

--- singleline_pp(obj, out=$>)
#@todo
Outputs +obj+ to +out+ like PP.pp but with no indent and
newline.

PP.singleline_pp returns +out+.

== Instance Methods
--- pp(obj)
#@todo

Object#pretty_print �� Object#pretty_print_cycle ��Ȥäơ�
obj �� pretty print �Хåե����ɲä��ޤ���

obj �����Ǥ˽��Ϥ���Ƥ����Ȥ��ˤ� Object#pretty_print_cycle
���Ȥ��ޤ�������ϥ��֥������Ȥλ��Ȥ�Ϣ�����롼�פ��Ƥ��뤳�Ȥ�
��̣���ޤ���

--- object_group(obj) { ... }
#@todo

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  group(1, '#<' + obj.class.name, '>') { ... }

--- comma_breakable
#@todo

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  text ','
  breakable

= reopen Object
== Instance Methods

--- pretty_print(pp)
#@todo

���̤Υ��֥������ȤΤ���Υǥե���Ȥ� pretty print �᥽�åɤǤ���
���Υ᥽�åɤϥ��󥹥����ѿ�����󤹤뤿���
pretty_print_instance_variables ��ƤӤޤ���

�������ޥ���(�����)���줿 inspect �� self �����ľ�硢
self.inspect �η�̤��Ȥ��ޤ���������ϲ��ԤΥҥ�Ȥ�����ޤ���

��äȤ�褯�Ȥ��뤤���Ĥ����Ȥ߹��ߥ��饹�ˤĤ��ơ�
PP �⥸�塼��Ϥ��餫����������줿 pretty_print() �᥽�åɤ�
���ؤΤ�����󶡤��Ƥ��ޤ���

--- pretty_print_cycle(pp)
#@todo

���̤Υ��֥������Ȥ���������ΰ����Ǥ��뤳�Ȥ����Ф��줿�Ȥ��Τ����
�ǥե���Ȥ� pretty print �᥽�åɤǤ���

--- pretty_print_instance_variables
#@todo

�����Ȥ��줿���󥹥����ѿ���̾����������֤��ޤ���

���Υ᥽�åɤϥ��󥹥����ѿ���̾���򥷥�ܥ뤫ʸ����Ȥ������Ǥ˻���
������֤��ʤ���Фʤ�ޤ���
 
 [:@a, :@b]

