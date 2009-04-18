#@# Author: Keiju ISHITSUKA

irb �� Interactive Ruby ��ά�Ǥ���
irb ��Ȥ��ȡ�Ruby �μ���ɸ�����Ϥ����ñ�����ϡ��¹Ԥ��뤳�Ȥ��Ǥ��ޤ���

=== irb �λȤ���

Ruby �����ΤäƤ���� irb ��Ȥ��Τϴ�ñ�Ǥ���
irb ���ޥ�ɤ�¹Ԥ���ȡ��ʲ��Τ褦�ʥץ��ץȤ�ɽ��ޤ���

  $ irb
  irb(main):001:0>

���Ȥ� Ruby �μ������Ϥ�������ǡ����μ����¹Ԥ��졢��̤�ɽ������ޤ���

  irb(main):001:0> 1+2
  3
  irb(main):002:0> class Foo
  irb(main):003:1>   def foo
  irb(main):004:2>     print 1
  irb(main):005:2>   end
  irb(main):006:1> end
  nil
  irb(main):007:0> 

�ޤ� irb ���ޥ�ɤ� [[lib:readline]] �饤�֥��ˤ��б����Ƥ��ޤ���
readline �饤�֥�꤬���󥹥ȡ��뤵��Ƥ�����ˤ�
��ưŪ�˥��ޥ�ɥ饤���Խ�������ε�ǽ���Ȥ���褦�ˤʤ�ޤ���

=== irb �Υ��ޥ�ɥ饤�󥪥ץ����

  irb [options] file_name opts
  options:
  -f                ~/.irbrc ���ɤ߹��ޤʤ�
  -m                bc �⡼�� (ʬ���ȹ���η׻����Ǥ���)
  -d                $DEBUG �� true �ˤ��� (ruby -d ��Ʊ��)
  -Kc               ruby -Kc ��Ʊ��
  -r library        ruby -r ��Ʊ��
#@since 1.8.2
  -I                ruby -I ��Ʊ��
#@end
  --verbose         ���줫��¹Ԥ���Ԥ�ɽ������ (�ǥե����)
  --noverbose       ���줫��¹Ԥ���Ԥ�ɽ�����ʤ�
  --echo            �¹Է�̤�ɽ������ (�ǥե����)
  --noecho          �¹Է�̤�ɽ�����ʤ�
  --inspect         ��̽��Ϥ�inspect���Ѥ��� (bc �⡼�ɰʳ��Ǥϥǥե����)
  --noinspect       ��̽��Ϥ�inspect���Ѥ��ʤ�
  --readline        readline�饤�֥������Ѥ���
  --noreadline      readline�饤�֥������Ѥ��ʤ����ǥե���ȤǤ�
                    inf-ruby-mode �ʳ��� readline �饤�֥������Ѥ��롣
  --prompt prompt-mode
  --prompt-mode prompt-mode
                    �ץ��ץȥ⡼�ɤ��ڤ��ؤ��롣�����������Ƥ����
                    ���ץȥ⡼�ɤϡ�default/simple/xmp/inf-ruby��
  --inf-ruby-mode   emacs��inf-ruby-mode �ѤΥץ��ץ�ɽ����Ԥʤ���
                    �ä˻��꤬�ʤ��¤� readline �饤�֥��ϻȤ�ʤ��ʤ롣
  --simple-prompt
                    ���˥���ץ�ʥץ��ץȤ��Ѥ���⡼�ɡ�
  --noprompt        �ץ��ץȤ�ɽ�����ʤ���
  --tracer          ���ޥ�ɼ¹Ի��˥ȥ졼�����롣
  --back-trace-limit n
                    �Хå��ȥ졼��ɽ����Хå��ȥ졼����Ƭ���� n��
                    �������� n �����Ԥʤ����ǥե�����ͤ� 16��
  --irb_debug n     irb �ΥǥХå���٥�� n �����ꤹ��
                    (�桼�������Ѥ��٤��ǤϤʤ�)
  -v, --version     irb �ΥС�������ɽ������

=== irb �Υ������ޥ���

irb ���ޥ�ɤϵ�ư���˥ۡ���ǥ��쥯�ȥ�� .irbrc �Ȥ����ե�������ɤ߹��ߤޤ���
.irbrc �� Ruby ������ץȤǤ����ۡ���ǥ��쥯�ȥ�� .irbrc ��¸�ߤ��ʤ����ϡ�
�����ȥǥ��쥯�ȥ�� .irbrc, irb.rc, _irbrc, $irbrc ����֤˥��ɤ��褦��
��ߤޤ���

�ʲ��Τ褦�� (Ruby ��) ���� .irbrc �˵��Ҥ���ȡ�
irb ���ޥ�ɤΥ��ץ�������ꤷ���Τ�Ʊ�����̤������ޤ���

  IRB.conf[:AUTO_INDENT] = false
  IRB.conf[:BACK_TRACE_LIMIT] = 16
  IRB.conf[:DEBUG_LEVEL] = 1
  IRB.conf[:ECHO] = nil
  IRB.conf[:EVAL_HISTORY] = nil
#@since 1.9.1
  IRB.conf[:HISTORY_FILE] = nil
#@end
  IRB.conf[:IGNORE_EOF] = true
  IRB.conf[:IGNORE_SIGINT] = true
  IRB.conf[:INSPECT_MODE] = nil
  IRB.conf[:IRB_NAME] = "irb"
  IRB.conf[:IRB_RC] = nil
  IRB.conf[:MATH_MODE] = false
  IRB.conf[:PROMPT] = {....}
  IRB.conf[:PROMPT_MODE] = :DEFALUT
  IRB.conf[:SINGLE_IRB] = false
#@since 1.9.1
  IRB.conf[:SAVE_HISTORY] = nil
#@end
  IRB.conf[:USE_LOADER] = true
  IRB.conf[:USE_READLINE] = nil
  IRB.conf[:USE_TRACER] = true
  IRB.conf[:VERBOSE] = true

==== �ץ��ץȤΥ������ޥ���

irb �Υץ��ץȤ򥫥����ޥ������������ϡ�
�ޤ��ȼ��Υץ��ץȥ⡼�ɤ��������
����򥳥ޥ�ɥ饤��� .irbrc �˻��ꤷ�ޤ���

�ޤ����������ץ��ץȥ⡼�ɤ��������ˤϡ�
�㤨�� .irbrc �ǰʲ��Τ褦�˵��Ҥ��ޤ���

  # �������ץ��ץȥ⡼�� MY_PROMPT ���������
  IRB.conf[:PROMPT][:MY_PROMPT] = {
    :PROMPT_I => nil,          # �̾���Υץ��ץ�
    :PROMPT_S => nil,          # ʸ����ʤɤη�³�ԤΥץ��ץ�
    :PROMPT_C => nil,          # ������³���Ƥ�����Υץ��ץ�
    :RETURN => "    ==>%s\n"   # �᥽�åɤ��������Υץ��ץ�
  }

���޺��������������ץ��ץȥ⡼�ɤ�Ȥ��ˤϡ�
�ʲ��Τ褦�� irb ���ޥ�ɤ� --prompt ���ץ�������ꤷ�ޤ���

  $ irb --prompt my-prompt

�����ꤹ��Τ����ݤʤ顢.irbrc �˰ʲ��μ��򵭽Ҥ��ޤ���

  # �ץ��ץȥ⡼�� MY_PROMPT ��Ȥ�
  IRB.conf[:PROMPT_MODE] = :MY_PROMPT

PROMPT_I, PROMPT_S, PROMPT_C �ˤϥե����ޥå�ʸ�������ꤷ�ޤ���
�ե����ޥå�ʸ����Ǥ� [[m:Kernel.#printf]] �Τ褦��
��%�פ��Ѥ�����ˡ���Ȥ��ޤ���
�ե����ޥå�ʸ����ǻ��Ѳ�ǽ�ʵ�ˡ�ϰʲ����̤�Ǥ���

: %N
    ��ư���Ƥ��륳�ޥ��̾
: %m
    main ���֥������� (self) �� to_s ����ʸ����
: %M
    main ���֥������� (self) �� inspect ����ʸ����
: %l
    ʸ������Υ����פ�ɽ�� (", ', /, ], `]'��%w����λ�)
: %NNi
    ����ǥ�ȤΥ�٥��NN ��˱��ͤᤷ��ʸ����
    NN �Ͼ�ά��ǽ��
: %NNn
    ���ֹ��NN ��˱��ͤᤷ��ʸ����
    NN �Ͼ�ά��ǽ��
: %%
    ʸ����%�פ��켫��

�ޤ���RETURN �ϸ��ߤΤȤ��� printf ������Ʊ�������ǻ��ꤷ�ޤ���
������������ϻ��ͤ��Ѥ���ǽ��������ޤ���

�㤨�С��ǥե���ȤΥץ��ץȥ⡼�ɤǤ���
��default�ץץ��ץȥ⡼�ɤϰʲ��Τ褦�����ꤵ��Ƥ��ޤ���

  IRB.conf[:PROMPT_MODE][:DEFAULT] = {
    :PROMPT_I => "%N(%m):%03n:%i> ",
    :PROMPT_S => "%N(%m):%03n:%i%l ",
    :PROMPT_C => "%N(%m):%03n:%i* ",
    :RETURN => "%s\n"
  } 

�ץ��ץȥ⡼�ɤ� :DEFAULT
��¾�� :NULL, :CLASSIC, :SIMPLE, :XMP ���������Ƥ��ޤ���

=== ���� irb

irb �Ǥϡ���ư���� irb ���󥿥ץ꥿�Ȥ���Ω�����Ķ������
�֥��� irb�פ�Ǥ�դο�������ư���뤳�Ȥ��Ǥ��ޤ���
���� irb �ϡ�irb �¹���ˡ�irb�פ����Ϥ���ȵ�ư���ޤ���

�㤨�аʲ��μ¹���򸫤Ƥ���������

  irb(main):004:0> x = "OK"          # �������ѿ� x �����
  => "OK"
  irb(main):005:0> x                 # x ��ɽ��
  => "OK"
  irb(main):006:0> irb               # ���� irb ��ư
  irb#1(main):001:0> x               # x ��ɽ��
  NameError: undefined local variable or method `x' for main:Object
	  from (irb#1):1:in `Kernel#binding'

��ư���Υ��󥿥ץ꥿�ǥ������ѿ� x ��������ޤ�������
��irb�פǥ��� irb ��ư����ȡ�
�������ѿ� x �������ʤ��ʤäƤ��ޤ���
���줬����Ω�����Ķ��פΰ�̣�Ǥ���

=== ���� irb ������

irb ���ޥ�ɵ�ư���Υ��󥿥ץ꥿�������
���ޥ�ɥ饤�󥪥ץ����� IRB.conf ���ͤǷ�ޤ�ޤ���
������Ф��ơ����� irb ���󥿥ץ꥿������ϡ�
�ƥ��󥿥ץ꥿�Ρ�conf�ץ��֥������Ȥ��ͤǷ�ޤ�ޤ���

conf ���֥������Ȥ��ͤ��ѹ�����ˤϡ�
�ޤ��ʲ��Τ褦�˥��� irb ��ư���Ƥ��� conf ���֥������Ȥ�
�ͤ��İ���ѹ�������ˡ������ޤ���

  $ irb
  irb(main):001:0> irb                     # ���� irb ��ư
  irb#1(main):001:0> conf.prompt_i         # prompt_i ���ͤ��ǧ
  => "%N(%m):%03n:%i> "
  irb#1(main):002:0> conf.prompt_i = ">"   # prompt_i ���ͤ��ѹ�
  => ">"
  >                                        # �ץ��ץȤ��Ѥ�ä�

������������ irb ��ư���뤿�Ӥ���������Ϥ���Τ����ݤǤ���
�����ǡ�IRB.conf[:IRB_RC] ��Ȥ���ˡ��Ҳ𤷤ޤ���

IRB.conf[:IRB_RC] �� Proc ���֥������Ȥ����ꤷ�Ƥ����ȡ�
���� irb ����ư����뤿�Ӥˡ����� Proc ���֥������Ȥ�
IRB::Context ���֥������Ȥ��Ϥ��Ƽ¹Ԥ��ޤ���
����ˤ�äƥ��� irb �������ޤȤ�����ꤹ�뤳�Ȥ��Ǥ��ޤ���

�ʲ�����򼨤��ޤ���

  $ irb
  irb(main):001:0> IRB.conf[:IRB_RC] = lambda {|conf| conf.prompt_i = "> " }
  => #<Proc:0x00002a95fa3fd8@(irb):2>
  irb(main):002:0> irb
  > 

=== irb �λ�����

irb �Τ�����ʻ������ʲ��˼����ޤ���

  $ irb
  irb(main):001:0> irb                        # ����irb��Ω������
  irb#1(main):001:0> jobs                     # ����irb�Υꥹ��
  #0->irb on main (#<Thread:0x400fb7e4> : stop)
  #1->irb#1 on main (#<Thread:0x40125d64> : running)
  nil
  irb#1(main):002:0> fg 0                     # job�Υ����å�
  nil
  irb(main):002:0> class Foo;end
  nil
  irb(main):003:0> irb Foo                    # Foo�򥳥�ƥ����Ȥ���irb
                                              # Ω������
  irb#2(Foo):001:0> def foo                   # Foo#foo�����
  irb#2(Foo):002:1>   print 1
  irb#2(Foo):003:1> end
  nil
  irb#2(Foo):004:0> fg 0                      # job�򥹥��å�
  nil
  irb(main):004:0> jobs                       # job�Υꥹ��
  #0->irb on main (#<Thread:0x400fb7e4> : running)
  #1->irb#1 on main (#<Thread:0x40125d64> : stop)
  #2->irb#2 on Foo (#<Thread:0x4011d54c> : stop)
  nil
  irb(main):005:0> Foo.instance_methods       # Foo#foo�������������
                                              # ��Ƥ���
  ["foo"]
  irb(main):006:0> fg 2                       # job�򥹥��å�
  nil
  irb#2(Foo):005:0> def bar                   # Foo#bar�����
  irb#2(Foo):006:1>  print "bar"
  irb#2(Foo):007:1> end
  nil
  irb#2(Foo):010:0>  Foo.instance_methods
  ["bar", "foo"]
  irb#2(Foo):011:0> fg 0                      
  nil
  irb(main):007:0> f = Foo.new
  #<Foo:0x4010af3c>
  irb(main):008:0> irb f                      # Foo�Υ��󥹥��󥹤�irb��
                                              # Ω��������.
  irb#3(#<Foo:0x4010af3c>):001:0> jobs
  #0->irb on main (#<Thread:0x400fb7e4> : stop)
  #1->irb#1 on main (#<Thread:0x40125d64> : stop)
  #2->irb#2 on Foo (#<Thread:0x4011d54c> : stop)
  #3->irb#3 on #<Foo:0x4010af3c> (#<Thread:0x4010a1e0> : running)
  nil
  irb#3(#<Foo:0x4010af3c>):002:0> foo         # f.foo�μ¹�
  nil
  irb#3(#<Foo:0x4010af3c>):003:0> bar         # f.bar�μ¹�
  barnil
  irb#3(#<Foo:0x4010af3c>):004:0> kill 1, 2, 3# job��kill
  nil
  irb(main):009:0> jobs
  #0->irb on main (#<Thread:0x400fb7e4> : running)
  nil
  irb(main):010:0> exit                       # ��λ
  $

=== ���Ѿ������

irb��, ɾ���Ǥ������(�����Ĥ�������)�Ǥ��༡�¹Ԥ�Ԥʤ��ޤ�. 
�������ä�, ruby��ľ�ܻȤä����ȼ㴳�ۤʤ�ư���Ԥʤ���礬����ޤ�.

�������餫�ˤʤäƤ������������������ޤ�.

==== �������ѿ������

Ruby �Ǥϰʲ��Υץ����ϥ��顼�ˤʤ�ޤ�.

  eval "foo = 0"
  p foo    # -:2: undefined local variable or method `foo' for #<Object:0x40283118> (NameError)

�Ȥ��� irb ���Ѥ���ȡ��ʲ��Τ褦�ˡ����顼�ˤʤ�ޤ���

  >> eval "foo = 0"
  => 0
  >> foo
  => 0

���ΰ㤤�ϡ�Ruby �� irb �Υץ����Υ���ѥ�����ˡ�κ��˵������ޤ���
Ruby �Ϻǽ�˥�����ץ����Τ򥳥�ѥ��뤷�ƥ������ѿ�����ꤷ�ޤ���
������Ф���irb �ϼ������뤷�Ƽ¹Բ�ǽ�ˤʤä������ǽ��֤˥���ѥ��뤷�ޤ���
�嵭����Ǥϡ�

  evel "foo = 0" 

�����Ϥ��줿�����Ǥޤ����μ��򥳥�ѥ��롦�¹Ԥ��ޤ���
���λ������ѿ� foo ���������뤿�ᡢ
���μ������Ϥ�������Ǥ��Ǥ��ѿ� foo ���������Ƥ���ΤǤ���

���� Ruby �� irb ��ư��ΰ㤤��ʤ����������ϡ�
irb �Ǥϰʲ��Τ褦�˼��� begin �� end �Ǥ����ä����Ϥ��Ƥ���������

  >> begin
  ?>   eval "foo = 0"
  >>   foo
  >> end
  NameError: undefined local variable or method `foo' for #<Object:0x4013d0f0>
  (irb):3
  (irb_local_binding):1:in `eval'

==== �ҥ��ɥ������

���ߤΤȤ���ҥ��ɥ�����Ȥμ������Դ����Ǥ���

==== ����ܥ�

irb �ϥ���ܥ�Ǥ��뤫�ɤ�����Ƚ�Ǥ�ְ㤨�뤳�Ȥ�����ޤ���
����Ū�ˤϡ�������λ���Ƥ���Τ˷�³�Ԥȸ��ʤ����Ȥ�����ޤ���



= class IrbCommands

���Υ��饹�� irb �Υ��ޥ�ɤ�ޤȤ�뤿��Υץ졼���ۥ���Ǥ���
�ºݤˤ� IrbCommands �Ȥ������饹���������Ƥ��ޤ���
���Υ��饹�Υɥ�����Ȥ˵��Ҥ���Ƥ���᥽�åɤϡ�
irb �Υץ��ץȤǥ쥷���Фʤ��ǻȤ����Ȥ��Ǥ��ޤ���

irb �Υ��ޥ�ɤϡ�
��ñ��̾����Ƭ�ˡ�irb_�פ�Ĥ���̾���Ȥ�ξ�����������Ƥ��ޤ���
����ϡ���ñ��̾���������С��饤�ɤ��줿���ˤ�
irb �Υ��ޥ�ɤ��¹ԤǤ���褦�ˤ��뤿��Ǥ���

== Methods

--- exit
--- quit
--- irb_exit        
#@todo

irb ��λ���ޤ���
���� irb �ǸƤӽФ������ϡ����Υ��� irb ������λ���ޤ���

--- conf
--- irb_context
#@todo

irb �θ��ߤ�����Ǥ���[[c:IRB::Context]] ���֥������ȤǤ���
���Υ᥽�åɤ����� IRB::Context ���֥������Ȥ��Ф��ƥ᥽�åɤ�
�ƤӽФ����Ȥǡ����߲�Ư��� irb ���󥿥ץ꥿�������ɽ�����ѹ��Ǥ��ޤ���

--- cws([obj])
--- chws([obj])
--- irb_cws([obj])
--- irb_chws([obj])
--- irb_change_workspace([obj])
#@todo

irb �� self �� obj ���ѹ����ޤ���
obj ����ά���줿�Ȥ��ϡ�
irb ��ư�����Ȥ��� main ���֥������Ȥ� self �ˤ��ޤ���

--- pushws([obj])
--- irb_pushws([obj])
--- irb_push_workspace([obj])
#@todo

UNIX �����륳�ޥ�ɤ� pushd ��Ʊ���Ǥ���

--- popws
--- irb_popws
--- irb_pop_workspace
#@todo

UNIX �����륳�ޥ�ɤ� popd ��Ʊ���Ǥ���

--- irb([obj])
#@todo

���������� irb ���󥿥ץ꥿��ư���ޤ���
���֥������� obj �����ꤵ�줿���Ϥ��� obj �� self �ˤ��ޤ���

--- jobs
--- irb_jobs
#@todo

���� irb �Υꥹ�Ȥ��֤��ޤ���

--- fg(n)
--- irb_fg(n)
#@todo

n �ǻ��ꤷ������ irb �˰�ư���ޤ���
n �ϰʲ��Τ����줫���ͤǻ��ꤷ�ޤ���

  * irb ���󥿥ץ꥿�ֹ�
  * irb ���֥�������
  * ����å� ID
  * �ƥ��󥿥ץ꥿�� self (��irb(obj)�פǵ�ư�������� obj)

--- kill(n)
--- irb_kill(n)
#@todo

n �ǻ��ꤷ������ irb ����ߤ��ޤ���
n �ϰʲ��Τ����줫���ͤǻ��ꤷ�ޤ���

  * irb ���󥿥ץ꥿�ֹ�
  * irb ���֥�������
  * ����å� ID
  * �ƥ��󥿥ץ꥿�� self (��irb(obj)�פǵ�ư�������� obj)

--- souce(path)
--- irb_source(path)
#@todo

���ߤ� irb ���󥿥ץ꥿��ǡ�
Ruby ������ץ� path ��ɾ�����ޤ���

source �Ȥ���̾���� UNIX ������� source ���ޥ�ɤ�ͳ�褷�ޤ���

--- irb_load(path, prev)
#@todo

�ե����� path �� Ruby ������ץȤȤߤʤ���
���ߤ� irb ���󥿥ץ꥿��Ǽ¹Ԥ��ޤ���
Ruby �� load �� irb �ǤǤ���

--- _  
#@todo

ľ���μ��μ¹Է�̤Ǥ���

�㡧

  $ irb
  irb(main):001:0> 10
  => 10
  irb(main):002:0> 2**32
  => 4294967296
  irb(main):003:0> _
  => 4294967296
  irb(main):004:0> _ - 2**31
  => 2147483648
  irb(main):005:0> 

--- __ 
#@todo

�¹Է�̤�����Ǥ���
__[lineno] �ǡ�lineno �ԤǼ¹Ԥ�����̤������ޤ���
lineno ����λ��ϡ��ǿ��η�̤��� -lineno �Ԥ�������
��̤������ޤ���

�����ѿ��ϥǥե���ȤǤϻȤ��ޤ���
�����ѿ�����Ѥ���ˤϡ����餫���� .irbrc �ʤɤ�
conf.eval_history ���ͤ���ꤷ�Ƥ����ʤ���Ф����ޤ���

�㡧

  $ irb
  irb(main):001:0> conf.eval_history = 100
  => 100
  irb(main):002:0> 1 + 2
  => 3
  irb(main):003:0> 'hoge' + 'foo'
  => "hogefoo"
  irb(main):004:0> __[2]
  => 3
  irb(main):005:0> __[3]
  => "hogefoo"
  irb(main):006:0> __[-1]
  => "hogefoo"
  irb(main):007:0> 

#@since 1.9.1
#@# 1.8.2 �����äƤ��ʤ���ͳ�� ((<ruby-dev:25595>)) �򻲾Ȥ��Ƥ�������
=== �������¸

����ˡ�.irbrc �ǰʲ��Τ褦��
conf.save_history ���ͤ���ꤷ�Ƥ����ȡ�
�¹Է�̤����򤬥ե��������¸����ޤ���

  IRB.conf[:SAVE_HISTORY] = 100

����ե������̾���ϥǥե���ȤǤ� ~/.irb_history �Ǥ���
����ե������̾���� IRB.conf[:HISTORY_FILE] �ǻ���Ǥ��ޤ���
#@end



= class IRB::Context

== Methods

--- eval_history=(n)
#@todo

�¹Է�̤Υҥ��ȥ굡ǽ������.
n �������� nil �� n > 0 �Ǥ���Ф��ο������ҥ��ȥ�ˤ���롣
n = 0�λ���̵���¤˵�������.
n = nil ���ȥҥ��ȥ굡ǽ�Ϥ��� (�ǥե����). 

--- back_trace_limit
#@todo

�Хå��ȥ졼��ɽ����Хå��ȥ졼����Ƭ���� n,
����� n �����Ԥʤ�.
�ǥե���Ȥ� 16.
    
--- debug_level=(n)
#@todo

irb �ΥǥХå���٥������

--- ignore_eof
--- ignore_eof=(bool)
#@todo

Ctrl-D �����Ϥ��줿����ư������ꤹ��.
true �λ��� Ctrl-D ��̵�뤹��.
false �λ��� irb ��λ����. 

--- ignore_sigint
--- ignore_sigint=(bool)
#@todo

Ctrl-C �����Ϥ��줿����ư������ꤷ�ޤ���
false ���� irb ��λ���ޤ���
true �λ���ư��ϰʲ��Τ褦�ˤʤ�.

: ������
    ����ޤ����Ϥ�����Τ򥭥�󥻥뤷�ȥåץ�٥�����. 
: �¹���
    �¹Ԥ���ߤ���.

--- inf_ruby_mode
--- inf_ruby_mode=(bool)
#@todo

inf-ruby-mode �ѤΥץ��ץ�ɽ����Ԥʤ����ɤ�����ɽ���ޤ���
�ǥե�����ͤ� false �Ǥ���

--- inspect_mode=(val)
#@todo

���󥹥ڥ��ȥ⡼�ɤ����ꤹ��.

: true
    inspect �η�̤�ɽ������
: false
    to_s �η�̤�ɽ������
: nil
    irb ���̾�⡼�ɤǤ���� inspect mode��
    math �⡼�ɤʤ� non inspect mode

--- math_mode
#@todo

ʬ���ȹ���η׻����Ǥ��� bc �⡼�ɤ��ɤ�����ɽ���ޤ���

--- use_loader
--- use_loader=(bool)
#@todo

load �ޤ��� require ����
irb �Υե������ɤ߹��ߵ�ǽ��Ȥ����ɤ����򼨤��ޤ���
�ǥե�����ͤ� false �Ǥ���

use_loader ���ͤ� irb ���Τ�ȿ�Ǥ���ޤ���

--- prompt_c
#@todo

if ��ľ��ʤ�, �Ԥ���³���Ƥ�����Υץ��ץȤ�
ɽ������ե����ޥå�ʸ������֤��ޤ���

--- prompt_i
#@todo

�̾�Υץ��ץȤ�ɽ������ե����ޥå�ʸ������֤��ޤ���

--- prompt_s
#@todo

ʸ������Υץ��ץȤ�ɽ������ե����ޥå�ʸ������֤��ޤ���

--- rc
#@todo

~/.irbrc ���ɤ߹���Ǥ����� true ���֤��ޤ���
�ɤ߹���Ǥ��ʤ���� false ���֤��ޤ���

--- use_prompt
--- use_prompt=(bool)
#@todo

�ץ��ץȤ�ɽ�����뤫�ɤ�������ꤷ�ޤ���
use_prompt ���ͤ� true �ʤ�ץ��ץȤ�ɽ������
false �ʤ�ץ��ץȤ�ɽ�����ޤ���

�ǥե�����ͤ� true �Ǥ���

--- use_readline=(val)
#@todo

[[lib:readline]] ��Ȥ����ɤ�������ꤷ�ޤ���
val ���ͤˤ�äơ����Υ᥽�åɤθ��̤ϰʲ��Τ褦��ʬ����ޤ���

: true
    readline �饤�֥���Ȥ�
: false
    readline �饤�֥���Ȥ�ʤ�
: nil
    inf-ruby-mode �ʳ��� readline �饤�֥������Ѥ��褦�Ȥ��� (�ǥե����)

#@#--- verbose=(bool)
#@#
#@#irb���餤����ʥ�å���������Ϥ��뤫
#@#
