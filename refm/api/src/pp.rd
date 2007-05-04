���֥������Ȥʤɤ򸫤䤹�����Ϥ��뤿��Υ饤�֥��Ǥ���

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

���륯�饹�� pp �ν��Ϥ��Ѥ��������ϡ�
���Υ��饹�� pretty_print �᥽�åɤ��������ޤ���
���Υ᥽�åɤ� [[c:PP]] ���֥������Ȥ�����Ȥ��Ƽ��ޤ���

Pretty Print ���르�ꥺ��ϥ���ǥ�ȤȲ��Ԥ򡢥ĥ꡼��¤���뤳�Ȥˤ�äƷ��ꤷ�ޤ������Τ��ᡢ
pretty_print �᥽�åɤˤ����ơ��桼���ϰʲ��Τ��Ȥ�ץ���ह��ɬ�פ�����ޤ���

 * [[m:PrettyPrint#group]] ��ȤäƻҥΡ��ɤ�Ĥ��롣Ʊ���˻ҥΡ��ɤΥ���ǥ�Ȥο�������롣
 * [[m:PrettyPrint#breakable]] ��ȤäƲ��Ԥ��Ƥ��ɤ�������ꤹ�롣
 * [[m:PP#pp]] ��Ȥäƽ��Ϥ��������󥹥����ѿ��ʤɤ���Ϥ��롣
 * [[m:PrettyPrint#text]] ��Ȥäơ����Ϥ����䤹���ʤ�褦�ˡ�,�פʤɤν���ʸ����Ŭ���������롣

Ʊ���Ρ�����ǸƤФ줿 breakable �ϡ����Ԥ���ʤ������Ʊ���˲��Ԥ��ޤ���

�ʲ��� Hash �� Pretty Print �Υ������ޥ�������Ǥ���

  require 'pp'
  class Hash
    def pretty_print(q)
      q.group(2, "<hash>") do
        q.breakable
        first = true
        self.each{|k, v|
          unless first
            q.text(',')          
            q.breakable
          end        
          q.pp k
          q.text ' => '
          q.group(1) do          
            q.breakable ''
            if v.is_a?(String) and v.size > 10
              q.pp(v[0..9] + '...')
            else
              q.pp v
            end
          end
          first = false
        }
      end
      q.breakable
      q.text "</hash>"
    end
  
    def pretty_print_cycle(q)
      q.text(empty? ? '{}' : '{...}')
    end
  end
  
  h = {:a => 'a'*5, :b => 'b'*10, :c => 'c'*20, :d => 'd'*30}
  pp h
  
  #=> 
  <hash>
    :d => "dddddddddd...",
    :a => "aaaaa",
    :b => "bbbbbbbbbb",
    :c => "cccccccccc..."
  </hash>

= reopen Kernel
== Private Instance Methods
--- pp(obj)    -> nil
#@todo
obj �� [[m:$>]] �� pretty print �ǽ��Ϥ��ޤ���

#@since 1.8.5 
= reopen Object
== Instance Methods
--- pretty_inspect
#@todo

self �� pp ��ɽ�������Ȥ��η�̤�ʸ����Ȥ����֤��ޤ���
#@end

= class PP < PrettyPrint
���֥������Ȥʤɤ򸫤䤹�����Ϥ��뤿��Υ��饹�Ǥ���

== Class Methods
--- pp(obj, out = $>, width = 79)    -> object
#@todo
obj �� out ���� width �� pretty print ���ޤ���

PP.pp �� out ���֤��ޤ���

  str = PP.pp([[:a, :b], [:a, [[:a, [:a, [:a, :b]]], [:a, :b],]]], '', 20)
  puts str
  #=>
  [[:a, :b],
   [:a,
    [[:a,
      [:a, [:a, :b]]],
     [:a, :b]]]]

--- sharing_detection    -> boolean
#@todo

��ͭ���Хե饰���֤��ޤ����ǥե���Ȥ� false �Ǥ���

--- sharing_detection=(boolean_value)
#@todo

��ͭ���Хե饰�����ꤷ�ޤ���

--- singleline_pp(obj, out=$>)    -> object
#@todo
Outputs +obj+ to +out+ like PP.pp but with no indent and
newline.

PP.singleline_pp returns +out+.

== Instance Methods
--- pp(obj)    -> ()
#@todo

Object#pretty_print �� Object#pretty_print_cycle ��Ȥäơ�
obj �� pretty print �Хåե����ɲä��ޤ���

obj �����Ǥ˽��Ϥ���Ƥ����Ȥ��ˤ� [[m:Object#pretty_print_cycle]]
���Ȥ��ޤ�������ϥ��֥������Ȥλ��Ȥ�Ϣ�����롼�פ��Ƥ��뤳�Ȥ�
��̣���ޤ���

--- object_group(obj) { ... }    -> ()
#@todo

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  group(1, '#<' + obj.class.name, '>') { ... }

--- comma_breakable    -> ()
#@todo

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  text ','
  breakable

--- seplist(list, sep=nil, iter_method=:each)    -> ()
#@todo

Adds a separated list.
The list is separated by comma with breakable space, by default.

seplist iterates the +list+ using +iter_method+.
It yields each object to the block given for #seplist.
The procedure +separator_proc+ is called between each yields.

If the iteration is zero times, +separator_proc+ is not called at all.

If +separator_proc+ is nil or not given,
+lambda { comma_breakable }+ is used.
If +iter_method+ is not given, :each is used.

For example, following 3 code fragments has similar effect.

  q.seplist([1,2,3]) {|v| xxx v }

  q.seplist([1,2,3], lambda { comma_breakable }, :each) {|v| xxx v }

  xxx 1
  q.comma_breakable
  xxx 2
  q.comma_breakable
  xxx 3

= reopen Object
== Instance Methods

--- pretty_print(pp)    -> ()
#@todo

���̤Υ��֥������ȤΤ���Υǥե���Ȥ� pretty print �᥽�åɤǤ���
���Υ᥽�åɤϥ��󥹥����ѿ�����󤹤뤿���
pretty_print_instance_variables ��ƤӤޤ���

�������ޥ���(�����)���줿 inspect �� self �����ľ�硢
self.inspect �η�̤��Ȥ��ޤ���������ϲ��ԤΥҥ�Ȥ�����ޤ���

��äȤ�褯�Ȥ��뤤���Ĥ����Ȥ߹��ߥ��饹�ˤĤ��ơ�
PP �⥸�塼��Ϥ��餫����������줿 pretty_print() �᥽�åɤ�
���ؤΤ�����󶡤��Ƥ��ޤ���

--- pretty_print_cycle(pp)    -> ()
#@todo

���̤Υ��֥������Ȥ���������ΰ����Ǥ��뤳�Ȥ����Ф��줿�Ȥ��Τ����
�ǥե���Ȥ� pretty print �᥽�åɤǤ���

--- pretty_print_instance_variables    -> [String | Symbol]
#@todo

�����Ȥ��줿���󥹥����ѿ���̾����������֤��ޤ���

���Υ᥽�åɤϥ��󥹥����ѿ���̾���򥷥�ܥ뤫ʸ����Ȥ������Ǥ˻���
������֤��ʤ���Фʤ�ޤ���
 
 [:@a, :@b]

--- pretty_print_inspect    -> ()
#@todo
Is #inspect implementation using #pretty_print.
If you implement #pretty_print, it can be used as follows.

  alias inspect pretty_print_inspect

However, doing this requires that every class that #inspect is called on
implement #pretty_print, or a RuntimeError will be raised.
