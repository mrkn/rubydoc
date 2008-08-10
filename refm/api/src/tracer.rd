�¹ԥȥ졼�����Ϥ�Ȥ뵡ǽ���󶡤��롣

�Ȥ������礭��ʬ����2�̤ꡣ

�ҤȤĤϰʲ��Τ褦�˥��ޥ�ɥ饤�󤫤�require������ˡ�Ǥ���
hoge.rb�μ¹Ԥ򤹤٤ƥȥ졼�����Ϥ��ޤ���

  ruby -rtracer hoge.rb

�⤦�ҤȤĤϥ���������require������ˡ�Ǥ���

  require 'tracer'

�Ȥ�����

  Tracer.on

�ˤ��ȥ졼�����Ϥ�ͭ���ˤ��롣

  Tracer.off

�ˤ��ȥ졼�����Ϥ�̵���ˤ��롣

�ޤ����֥�å��դ��� Tracer.on ��ƤӽФ��ȡ����Υ֥�å���Τ�
�ȥ졼������Ϥ��롣

=== ����ץ륳����

  # ��: ����ɾ�������Hoge���饹�Υ᥽�åɤ��ƤӽФ��������ȥ졼�����롣

  # ruby 1.8 �ǤϷٹ𤬤Ǥޤ�����ư��ޤ���
  require 'tracer'

  class Hoge
    def Hoge.fuga(i)
      "fuga #{i}"
    end
  end

  Tracer.add_filter {|event, file, line, id, binding, klass|
    event =~ /line/ and klass.to_s =~ /hoge/i
  }
  Tracer.on
  for i in 0..3
    puts Hoge.fuga(i) if i % 3 == 0
  end 
  Tracer.off

=== SEE ALSO

[[m:Kernel.#set_trace_func]]

= class Tracer < Object
�¹ԥȥ졼�����Ϥ�Ȥ뵡ǽ���󶡤��륯�饹�Ǥ���

== Class Methods

--- on -> nil
--- on {...}

�ȥ졼�����Ϥ򳫻Ϥ��ޤ���
�֥�å���Ϳ����줿���Ϥ��Υ֥�å���Τߥȥ졼�����Ϥ�Ԥ��ޤ���

  require 'tracer'

  Tracer.on
  class Test
    def test
      b = 2
    end
  end

  t = Test.new
  t.test

@see [[m:Tracer.off]]

--- off -> nil

�ȥ졼�����Ϥ����Ǥ��ޤ���
�ȥ졼�����Ϥ򳫻Ϥ���ˤϡ�[[m:Tracer.on]]����Ѥ��ޤ���

@see [[m:Tracer.on]]

--- set_get_line_procs(filename, proc)
--- set_get_line_procs(filename) {|line| .... }

����ե�����ˤĤ������Ѥ��롢���ֹ椫�饽�����Τ��ιԤ����Ƥ��֤�
��³������ꤹ�롣������ꤷ�ʤ���Хǥե���Ȥ�ư����Ѥ���롣
���ꤹ���³���Ϲ��ֹ��ͣ��ΰ����Ȥ��ƸƤӽФ���롣

@param filename �������ե�����ξ���ʸ����ǻ��ꤷ�ޤ���
@param proc �̾ʸ������֤���³�����֥������Ȥ���ꤷ�ޤ���

  # �� dummy.rb ��3���ܤ���6 ���ܤΥȥ졼�����Ϥ� !! ��Ĥ���
  require 'tracer'

  Tracer.set_get_line_procs('./dummy.rb'){|line|
    str = "\n"
    str = "!!\n" if line >= 3 and line <= 6
    str
  }
  Tracer.on
  require 'dummy'

  dm = Dummy.new
  puts dm.number

  =begin
  # dummy.rb
  class Dummy
    def initialize
      @number = 135
    end
    attr :number
  end
  =end

--- add_filter(proc)
--- add_filter {|event, file, line, id, binding, klass| .... }

�ȥ졼�����Ϥ��뤫�ɤ�������ꤹ��ե��륿���ɲä��ޤ���
����ե��륿��Ϳ���ʤ����Ϥ��٤ƤιԤˤĤ��ƥȥ졼�����󤬽��Ϥ���ޤ���
Ϳ����줿��³��(�֥�å��ޤ���Proc���֥�������)�������֤���
�ȥ졼���Ͻ��Ϥ���ޤ���


#@if (version < "1.9.0")
ruby 1.8 �Ǥϥ֥�å���Ϳ����ȷٹ𤬤Ǥޤ���
#@end

�ե��륿��ʣ���ɲäǤ���
���Τ�����ĤǤ⵶���֤��ȥȥ졼���ν��Ϥ���������롣

@param proc �ȥ졼�����Ϥ��뤫�ɤ�������ꤹ���³�����֥������Ȥ���ꤷ�ޤ���
            �̾true �� false���֤�ɬ�פ�����ޤ���

�ե��륿��³���ϰ����Ȥ��� event, file, line, id, binding, klass ��
6 �Ĥ�Ȥ�ޤ���
[[m:Kernel.#set_trace_func]] �ǻ��ꤹ���ΤȤۤ�Ʊ���Ǥ���

==== �ե��륿��³���Υѥ�᡼��

: event
  ���٥�Ȥ�ɽ��ʸ����
  �ʲ��μ��ब���롣���å���� tracer �ν��ϤǤ�ɽ����

    : line (-)
      ����Ԥ�¹�
    : call (>)
      �᥽�åɸƤӽФ�
    : return (<)
      �᥽�åɤ���Υ꥿����
    : class (C)
      ���饹����ƥ����Ȥ����ä�
    : end (E)
      ���饹����ƥ����Ȥ���Ф�
    : raise
      �㳰��ȯ������
    : c-call
      C�ǵ��Ҥ��줿�᥽�åɤ��ƤФ줿
    : c-return
      C�ǵ��Ҥ��줿�᥽�åɤ���return
: file
  ���߽������Ƥ���ե������̾��

: line
  ���߽������Ƥ�����ֹ�

: id
  �Ǹ�˸ƤӽФ��줿�᥽�åɤΥ᥽�å�̾(�Υ���ܥ�)
  ���Τ褦�ʥ᥽�åɤ��ʤ����0�ˤʤ롣

: binding
  ���ߤΥ���ƥ�����

: klass
  ���߸ƤӽФ���Ƥ���᥽�åɤΥ��饹���֥������ȡ�


--- verbose -> bool
--- verbose? -> bool
--- verbose=(flag)

�ȥ졼�����Ϥγ��Ϥ佪λ���Τ餻��ʸ����("Trace on"�ޤ���"Trace off")��ɬ�פʤ�true�����ꤷ�ޤ���

@param flag �ȥ졼�����Ϥγ��Ϥ佪λ���Τ餻��ʸ����ɬ�פʤ�true�����ꤷ�ޤ���

  require 'tracer'

  Tracer.verbose = true
  Tracer.on {
    puts "Hello"
  }

  # ������
  Trace on
  #0:t5.rb:7::-:   puts "Hello"
  #0:t5.rb:7:Kernel:>:   puts "Hello"
  #0:t5.rb:7:IO:>:   puts "Hello"
  Hello#0:t5.rb:7:IO:<:   puts "Hello"
  #0:t5.rb:7:IO:>:   puts "Hello"

  #0:t5.rb:7:IO:<:   puts "Hello"
  #0:t5.rb:7:Kernel:<:   puts "Hello"
  Trace off

--- stdout -> Object
--- stdout=(fp)

�ȥ졼���������IO���֥������Ȥʤɤ��ѹ������ꡢ���Ȥ��뤳�Ȥ��Ǥ��ޤ���

@param fp �ȥ졼�����Ϥ�fp ���ѹ����ޤ���

  require 'tracer'

  fp = File.open('temptrace.txt', "w")
  Tracer.stdout = fp
  Tracer.on {
    puts "Hello"
  }
  fp.close

== Constants

--- EVENT_SYMBOL
  
�ȥ졼�����ϤΥ���ܥ�Υϥå���Ǥ���
�����Τ褦��ʸ���󤬤���ޤ���

  EVENT_SYMBOL = {
    "line" => "-",
    "call" => ">",
    "return" => "<",
    "class" => "C",
    "end" => "E",
    "c-call" => ">",
    "c-return" => "<",
  }

@see [[m:Tracer.add_filter]]
