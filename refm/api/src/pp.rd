���֥������Ȥʤɤ򸫤䤹�����Ϥ��뤿��Υ饤�֥��Ǥ���

���Υ饤�֥��� require ����� [[m:Kernel.#pp]] ���������ޤ���
[[m:Kernel.#p]] �Τ����� [[m:Kernel.#pp]] ��Ȥ����Ȥˤ�ꡢ
Ŭ�ڤ˥���ǥ�ȤȲ��Ԥ��줿ʬ����䤹�����Ϥ����뤳�Ȥ�����ޤ���pp �饤�֥��ϡ�
�桼���������餷������������饹���Ф��Ƥ⸫�䤹��ɽ����
����褦�˺���Ƥ��ޤ��Τǡ�[[m:Kernel.#pp]] ��Ȥ����;�פʺ�Ȥ򤹤�
ɬ�פϤ���ޤ���

=== �ɤ��餬�ɤߤ䤹���Ǥ��礦��?

p �ˤ�� pretty-print ����Ƥʤ�����:
  #<PP:0x81a0d10 @stack=[], @genspace=#<Proc:0x81a0cc0>, @nest=[0], @newline="\n",
   @buf=#<PrettyPrint::Group:0x81a0c98 @group=0, @tail=0, @buf=[#<PrettyPrint::Gro
  up:0x81a0ba8 @group=1, @tail=0, @buf=[#<PrettyPrint::Text:0x81a0b30 @tail=2, @wi
  dth=1, @text="[">, #<PrettyPrint::Group:0x81a0a68 @group=2, @tail=1, @buf=[#<Pre
  ttyPrint::Text:0x81a09f0 @tail=1, @width=1, @text="1">], @singleline_width=1>, #
  <PrettyPrint::Text:0x81a0a7c @tail=0, @width=1, @text=",">, #<PrettyPrint::Break
  able:0x81a0a2c @group=2, @gensace=#<Proc:0x81a0cc0>, @newline="\n", @indent=1, @
  tail=2, @sep=" ", @width=1>, #<PrettyPrint::Group:0x81a09c8 @group=2, @tail=1, @
  buf=[#<PrettyPrint::Text:0x81a0950 @tail=1, @width=1, @text="2">], @singleline_w
  idth=1>, #<PrettyPrint::Text:0x81a0af4 @tail=0, @width=1, @text="]">], @singleli
  ne_width=6>], @singleline_width=6>, @sharing_detection=false>

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

���륯�饹�� pp �ν��Ϥ򥫥����ޥ������������ϡ�
���Υ��饹�� pretty_print �᥽�åɤ��������ޤ���
���Υ᥽�åɤ� [[c:PP]] ���֥������Ȥ�����Ȥ��� pp �¹Ի��˸ƤФ�ޤ���
�桼����ɽ�����������Ƥ�ɽ���ĥ꡼��
�����Ȥ���Ϳ����줿 [[c:PP]] ���֥������Ȥ�Ȥäưʲ��Τ褦�˺������ޤ���

  * [[m:PrettyPrint#group]] ��ȤäƻҥΡ��ɤ�Ĥ���ޤ���Ʊ���˻ҥΡ��ɤΥ���ǥ�Ȥο�������ޤ���
  * [[m:PrettyPrint#breakable]] ��ȤäƲ��Ԥ��Ƥ��ɤ�������ꤷ�ޤ���
  * [[m:PP#pp]] ��Ȥäƽ��Ϥ��������󥹥����ѿ��ʤɤ���Ϥ��ޤ���
  * [[m:PrettyPrint#text]] ��Ȥäơ����Ϥ����䤹���ʤ�褦�ˡ�,�פʤɤν���ʸ����Ŭ���������ޤ���

[[c:PP]] �� [[c:PrettyPrint]] �Υ��֥��饹�Ǥ��Τǡ���� PrettyPrint �Υ᥽�åɤȤ���Ƥ����Τ�
PP �Υ᥽�åɤǤ⤢��ޤ���

�ʲ��� Hash �� pretty printing �Υ������ޥ�������Ǥ���

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

= class PP < PrettyPrint
���֥������Ȥʤɤ򸫤䤹�����Ϥ��뤿��Υ��饹�Ǥ���

== Class Methods
--- pp(obj, out = $>, width = 79)    -> object

���ꤵ�줿���֥������� obj ������� out ���� width �ǽ��Ϥ��ޤ���
������ out ���֤��ޤ���

@param obj ɽ�����������֥������Ȥ���ꤷ�ޤ���

@param out ���������ꤷ�ޤ���<< �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

@param width �������������ꤷ�ޤ���

  str = PP.pp([[:a, :b], [:a, [[:a, [:a, [:a, :b]]], [:a, :b],]]], '', 20)
  puts str
  #=>
  [[:a, :b],
   [:a,
    [[:a,
      [:a, [:a, :b]]],
     [:a, :b]]]]

--- sharing_detection                 -> bool
--- sharing_detection=(boolean)

��ͭ���Хե饰��ɽ�����������Ǥ���
�ǥե���Ȥ� false �Ǥ���true �Ǥ����硢
[[m:PP.pp]] �ϰ��ٽ��Ϥ������֥������Ȥ�Ƥӽ��Ϥ����
[[m:Object#pretty_print_cycle]] ��Ȥ��ޤ���

@param boolean ��ͭ���Хե饰�� true �� false �ǻ��ꤷ�ޤ���

��:

  require 'pp'
  b = [1, 2, 3]
  a = [b, b]
    
  pp a                        #=> [[1, 2, 3], [1, 2, 3]]
  
  PP.sharing_detection = true
  pp a                        #=> [[1, 2, 3], [...]]


--- singleline_pp(obj, out=$>)    -> object

���ꤵ�줿���֥������� obj ������� out �˽��Ϥ��ޤ���
������������ǥ�Ȥ���Ԥ⤷�ޤ���
������ out ���֤��ޤ���

@param obj ɽ�����������֥������Ȥ���ꤷ�ޤ���

@param out ���������ꤷ�ޤ���<< �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

== Instance Methods
--- pp(obj)    -> ()

���ꤵ�줿���֥������� obj �� [[m:Object#pretty_print]] ��ȤäƼ��ȤΥХåե����ɲä��ޤ���

obj �����Ǥˡ����ߤΥΡ��ɤοƤˤ����ƽ��Ϥ���Ƥ������ˤϡ�
���ȤΥ롼�פ�¸�ߤ��Ƥ���Τǡ�[[m:Object#pretty_print]] �������
[[m:Object#pretty_print_cycle]] ���Ȥ��ޤ���

@param obj ɽ�����������֥������Ȥ���ꤷ�ޤ���

--- object_group(obj) { ... }    -> ()

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���
  group(1, '#<' + obj.class.name, '>') { ... }

@param obj ɽ�����������֥������Ȥ���ꤷ�ޤ���

@see [[m:PrettyPrint#group]]

--- comma_breakable    -> ()

�ʲ���������Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���
  text ','
  breakable

@see [[m:PrettyPrint#text]], [[m:PrettyPrint#breakable]]

--- seplist(list, sep = lambda { comma_breakable }, iter_method = :each){|e| ...}    -> ()

�ꥹ�Ȥγ����Ǥ򲿤��Ƕ��ڤ�Ĥġ����Ȥ��ɲä��Ƥ�������˻Ȥ��ޤ���

list �� iter_method �ˤ�äƥ��ƥ졼�Ȥ��������Ǥ�����Ȥ��ƥ֥�å���¹Ԥ��ޤ���
�ޤ������줾��Υ֥�å��μ¹Ԥι�֤� sep ���ƤФ�ޤ���

�Ĥޤꡢ�ʲ��Τդ��Ĥ�Ʊ�ͤǤ���

  q.seplist([1,2,3]) {|v| q.pp v }

  q.pp 1
  q.comma_breakable
  q.pp 2
  q.comma_breakable
  q.pp 3

@param list ���Ȥ��ɲä����������Ϳ���ޤ���iter_method ��Ŭ�ڤ˻��ꤹ��С�
            Enumerable �Ǥʤ��Ƥ⹽���ޤ���

@param sep ���ڤ�򼫿Ȥ��ɲä���֥�å���Ϳ���ޤ���list �����ƥ졼�Ȥ���ʤ��ʤ顢
           sep �Ϸ褷�ƸƤФ�ޤ���

@param iter_method list �򥤥ƥ졼�Ȥ���᥽�åɤ򥷥�ܥ��Ϳ���ޤ���

@see [[m:PP#comma_breakable]]

= reopen Object
== Instance Methods

--- pretty_print(pp)    -> ()

���̤Υ��֥������ȤΤ���Υǥե���Ȥ� pretty print �᥽�åɤǤ���
���Υ᥽�åɤϥ��󥹥����ѿ�����󤹤뤿���
[[m:Object#pretty_print_instance_variables]] ��ƤӤޤ���

�������ޥ���(�����)���줿 inspect �� self �����ľ�硢
self.inspect �η�̤��Ȥ��ޤ���������ϲ��ԤΥҥ�Ȥ�����ޤ���

��äȤ�褯�Ȥ��뤤���Ĥ����Ȥ߹��ߥ��饹�ˤĤ��ơ�
PP �⥸�塼��Ϥ��餫����������줿 pretty_print �᥽�åɤ�
���ؤΤ�����󶡤��Ƥ��ޤ���

@param pp [[c:PP]] ���֥������ȤǤ���

@see [[m:Object#inspect]]

--- pretty_print_cycle(pp)    -> ()

���̤Υ��֥������Ȥ���������ΰ����Ǥ��뤳�Ȥ����Ф��줿�Ȥ��Τ����
�ǥե���Ȥ� pretty print �᥽�åɤǤ���

@param pp [[c:PP]] ���֥������ȤǤ���

--- pretty_print_instance_variables    -> [String | Symbol]

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

= reopen Kernel
== Module Functions
--- pp(*obj)    -> nil

���ꤵ�줿���֥������� obj �� [[m:$>]] �� pretty print �ǽ��Ϥ��ޤ���

@param obj ɽ�����������֥������Ȥ���ꤷ�ޤ���

#@since 1.8.5 
= reopen Object
== Instance Methods
--- pretty_inspect    -> String

self �� pp ��ɽ�������Ȥ��η�̤�ʸ����Ȥ����֤��ޤ���
#@end
