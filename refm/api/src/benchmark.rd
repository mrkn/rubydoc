#@since 1.8.0

�٥���ޡ������뤿��Υ��饹�Ǥ���

= module Benchmark

== Module Functions

--- measure(label = "") { ... }  -> Benchmark::Tms
#@todo

Ϳ����줿�֥�å���¹Ԥ��ơ��вᤷ�����֤� [[m:Process.times]] �Ƿפꡢ
[[c:Benchmark::Tms]] ���֥������Ȥ����������֤��ޤ���

Benchmark::Tms ���֥������Ȥˤ� to_s ���������Ƥ���Τǡ�
����Ū�ˤϰʲ��Τ褦�˻Ȥ��ޤ���

  require 'benchmark'
  
  puts Benchmark::CAPTION
  puts Benchmark.measure { "a"*1_000_000 }
  
  #=>
  
      user     system      total        real
  1.166667   0.050000   1.216667 (  0.571355)


--- realtime { ... } -> Float

Ϳ����줿�֥�å���ɾ�����Ƽ¹Ի��֤��¬�����֤��ޤ���



--- bm(label_width = 0, *labels) {|rep| ... } -> bool

[[m:Benchmark.#benchmark]] �᥽�åɤΰ������ά��������ΤǤ���

[[m:Benchmark.#benchmark]] �᥽�åɤ�Ʊ�ͤ�Ư���ޤ���

@param label_width ��٥��������ꤷ�ޤ���
@param labels     �֥�å��� [[c:Benchmark::Tms]] ���֥������Ȥ�������֤����˻��ꤷ�ޤ���

@return STDIN.sync ���ͤ��֤������ʤΤ��֤��ͤ˰�̣�Ϥ���ޤ���

��:

  require 'benchmark'
  
  n = 50000
  Benchmark.bm do |x|
    x.report { for i in 1..n; a = "1"; end }
    x.report { n.times do   ; a = "1"; end }
    x.report { 1.upto(n) do ; a = "1"; end }
  end
  
  #=>
  
        user     system      total        real
    1.033333   0.016667   1.016667 (  0.492106)
    1.483333   0.000000   1.483333 (  0.694605)
    1.516667   0.000000   1.516667 (  0.711077)

�ʲ��Τ褦�ˤ�񤱤ޤ���

  require 'benchmark'
  
  n = 50000
  Benchmark.bm(7) do |x|
    x.report("for:")   { for i in 1..n; a = "1"; end }
    x.report("times:") { n.times do   ; a = "1"; end }
    x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  end
  
  #=>
               user     system      total        real
  for:     1.050000   0.000000   1.050000 (  0.503462)
  times:   1.533333   0.016667   1.550000 (  0.735473)
  upto:    1.500000   0.016667   1.516667 (  0.711239)

���פ��դ������
  
  require 'benchmark'
  
  n = 50000
  Benchmark.bm(7) do |x|
    tf = x.report("for:")   { for i in 1..n; a = "1"; end }
    tt = x.report("times:") { n.times do   ; a = "1"; end }
    tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
    [tf + tt + tu, (tf + tt + tu) / 3]
  end
  
  #=>
               user     system      total        real
  for:     0.040000   0.000000   0.040000 (  0.141902)
  times:   0.010000   0.000000   0.010000 (  0.043335)
  upto:    0.020000   0.000000   0.020000 (  0.089806)
  >total:  0.070000   0.000000   0.070000 (  0.275044)
  >avg:    0.023333   0.000000   0.023333 (  0.091681)

@see [[m:Benchmark.#benchmark]]

--- bmbm(width = 0) {|job| ... } -> [Benchmark::Tms]

[[c:Benchmark::Job]] ���֥������Ȥ��������ơ����������Ȥ���Ϳ����줿�֥�å���
�¹Ԥ��ޤ���

�٥���ޡ����η�̤� GC �αƶ��ˤ�ä��Ĥ���Ƥ��ޤ����Ȥ�����ޤ���
���Υ᥽�åɤ�Ϳ����줿�֥�å������ټ¹Ԥ�����ˤ�äƤ��αƶ���Ǿ������ޤ���
����ܤϼ¹ԴĶ�����경���뤿��˥�ϡ�����Ȥ��Ƽ¹Ԥ��ޤ�������ܤ����֤Ȥ���
�¹Ԥ��ޤ���

����ܤΥ֥�å��¹Ԥ����� [[m:GC.start]] ��¹Ԥ��ޤ��������μ¹Ի��֤Ϸ�¬�ˤ�
�ޤޤ�ޤ��󡣤��������ºݤˤϤ��Υ᥽�åɤ���Ѥ��Ƥ⡢GC �ʤɤαƶ���ʬΥ����
���Ȥ��ݾڤ���ޤ���

@param width ��٥��������ꤷ�ޤ���

  require 'benchmark'
  
  array = (1..1000000).map { rand }
  
  Benchmark.bmbm do |x|
    x.report("sort!") { array.dup.sort! }
    x.report("sort")  { array.dup.sort  }
  end
  
  #=>
  
  Rehearsal -----------------------------------------
  sort!  11.928000   0.010000  11.938000 ( 12.756000)
  sort   13.048000   0.020000  13.068000 ( 13.857000)
  ------------------------------- total: 25.006000sec
  
              user     system      total        real
  sort!  12.959000   0.010000  12.969000 ( 13.793000)
  sort   12.007000   0.000000  12.007000 ( 12.791000)

--- benchmark(caption = "", label_width = nil, fmtstr = nil, *labels){|rep| ...} -> bool

[[c:Benchmark::Report]] ���֥������Ȥ������������������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

����Ū�ˤϰʲ��Τ褦�˻Ȥ��ޤ���
�֥�å��� [[c:Benchmark::Tms]] ���֥������Ȥ�������֤������ϡ�
�����ο��ͤ��ɲäιԤ�ɽ������ޤ���

@param caption     ��ݡ��Ȥΰ���ܤ�ɽ������ʸ�������ꤷ�ޤ���
@param label_width ��٥��������ꤷ�ޤ���
@param fmtstr      �ե����ޥå�ʸ�������ꤷ�ޤ���
                   ���ΰ������ά����� Benchmark::FMTSTR �����Ѥ���ޤ���
@param labels  �֥�å��� [[c:Benchmark::Tms]] ���֥������Ȥ�������֤����˻��ꤷ�ޤ���

@return STDIN.sync ���ͤ��֤������ʤΤ��֤��ͤ˰�̣�Ϥ���ޤ���


===== �ե����ޥå�ʸ����

�ե����ޥå�ʸ����Ȥ��ưʲ������ѤǤ��ޤ���

: %u
  user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#utime]]
: %y
  system CPU time ���֤��������ޤ�(Mnemonic: y of "s*y*stem")��[[m:Benchmark::Tms#stime]]
: %U
  �ҥץ����� user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cutime]]
: %Y
  �ҥץ����� system CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cstime]]
: %t
  total CPU time ���֤��������ޤ���[[m:Benchmark::Tms#total]]
: %r
  �·в���֤��֤��������ޤ���[[m:Benchmark::Tms#real]]
: %n
  ��٥���֤��������ޤ�(Mnemonic: n of "*n*ame")��[[m:Benchmark::Tms#label]]

===== ��

  require 'benchmark'
  
  n = 50000
  
  # �����
  #    Benchmark.bm(7, ">total:", ">avg:") do |x| ... end
  # ��Ʊ��
  Benchmark.benchmark(" "*7 + Benchmark::CAPTION,
                      7,
                      Benchmark::FMTSTR,
                      ">total:",
                      ">avg:") do |x|
    
    tf = x.report("for:")   { for i in 1..n; a = "1"; end }
    tt = x.report("times:") { n.times do   ; a = "1"; end }
    tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
    
    [tf+tt+tu, (tf+tt+tu)/3]
  end
  
  #=>
  
               user     system      total        real
  for:     1.016667   0.016667   1.033333 (  0.485749)
  times:   1.450000   0.016667   1.466667 (  0.681367)
  upto:    1.533333   0.000000   1.533333 (  0.722166)
  >total:  4.000000   0.033333   4.033333 (  1.889282)
  >avg:    1.333333   0.011111   1.344444 (  0.629761)

#@end


== Constants

--- CAPTION

[[m:Benchmark.#bm]] �������ʤɤǻ��Ѥ���ޤ���

�ºݤ������ [[m:Benchmark::Tms::CAPTION]] �Ǥ���Ƥ��ޤ���

@see [[m:Benchmark::Tms::CAPTION]]

--- FMTSTR

[[m:Benchmark.#benchmark]] ���軰�����Υǥե�����͡�

: %u
  user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#utime]]
: %y
  system CPU time ���֤��������ޤ�(Mnemonic: y of "s*y*stem")��[[m:Benchmark::Tms#stime]]
: %U
  �ҥץ����� user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cutime]]
: %Y
  �ҥץ����� system CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cstime]]
: %t
  total CPU time ���֤��������ޤ���[[m:Benchmark::Tms#total]]
: %r
  �·в���֤��֤��������ޤ���[[m:Benchmark::Tms#real]]
: %n
  ��٥���֤��������ޤ�(Mnemonic: n of "*n*ame")��[[m:Benchmark::Tms#label]]

�嵭�Υե����ޥå�ʸ�������Ѥ��Ƥ��ޤ���
������������Ƥϰʲ����̤�Ǥ���

  "%10.6u %10.6y %10.6t %10.6r\n"

@see [[m:Benchmark.#benchmark]], [[m:Benchmark::Tms::FMTSTR]]

--- BENCHMARK_VERSION

benchmark �饤�֥��ΥС�������ɽ���ޤ���


= class Benchmark::Tms < Object

== Class Methods

--- new(utime = 0.0, stime = 0.0, cutime = 0.0, cstime = 0.0, real = 0.0, label = nil) -> Benchmark::Tms

������ [[c:Benchmark::Tms]] ���֥������Ȥ����������֤��ޤ���

@param utime  User CPU time
@param stime  System CPU time
@param cutime �ҥץ����� User CPU time
@param cstime �ҥץ����� System CPU time
@param real   �·в����
@param label  ��٥�


== Instance Methods

--- *(x) -> Benchmark::Tms

self �� x �ξ軻��׻����ޤ���

@param x [[c:Benchmark::Tms]] �Υ��֥������Ȥ� [[c:Float]] �˰��ۤ��Ѵ����Ǥ��륪�֥������ȤǤ���

@return �׻���̤Ͽ����� [[c:Benchmark::Tms]] ���֥������ȤǤ���

@see [[m:Benchmark::Tms#memberwise]]

--- +(x) -> Benchmark::Tms

self �� x �βû���׻����ޤ���

@param x [[c:Benchmark::Tms]] �Υ��֥������Ȥ� [[c:Float]] �˰��ۤ��Ѵ����Ǥ��륪�֥������ȤǤ���

@return �׻���̤Ͽ����� [[c:Benchmark::Tms]] ���֥������ȤǤ���

@see [[m:Benchmark::Tms#memberwise]]

--- -(x) -> Benchmark::Tms

self �� x �θ�����׻����ޤ���

@param x [[c:Benchmark::Tms]] �Υ��֥������Ȥ� [[c:Float]] �˰��ۤ��Ѵ����Ǥ��륪�֥������ȤǤ���

@return �׻���̤Ͽ����� [[c:Benchmark::Tms]] ���֥������ȤǤ���

@see [[m:Benchmark::Tms#memberwise]]

--- /(x) -> Benchmark::Tms

self �� x �ν�����׻����ޤ���

@param x [[c:Benchmark::Tms]] �Υ��֥������Ȥ� [[c:Float]] �˰��ۤ��Ѵ����Ǥ��륪�֥������ȤǤ���

@return �׻���̤Ͽ����� [[c:Benchmark::Tms]] ���֥������ȤǤ���

@see [[m:Benchmark::Tms#memberwise]]

--- add { ... } -> Benchmark::Tms

Ϳ����줿�֥�å��μ¹Ի��֤� self �˲û�����
������ [[c:Benchmark::Tms]] ���֥������Ȥ����������֤��ޤ���

@see [[m:Benchmark.#measure]]

--- add!{ ... } -> self

Ϳ����줿�֥�å��μ¹Ի��֤� self �˲û������֤��ޤ���

���Υ᥽�åɤ� self ���˲�Ū���ѹ����ޤ���

@see [[m:Benchmark.#measure]]


--- format(fmtstr = nil, *args)

self ����ꤵ�줿�ե����ޥåȤ����������֤��ޤ���

���Υ᥽�åɤ� [[m:Kernel.#format]] �Τ褦�˥��֥������Ȥ��������ޤ�����
�ʲ��γ�ĥ����Ѥ��뤳�Ȥ��Ǥ��ޤ���

: %u
  user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#utime]]
: %y
  system CPU time ���֤��������ޤ�(Mnemonic: y of "s*y*stem")��[[m:Benchmark::Tms#stime]]
: %U
  �ҥץ����� user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cutime]]
: %Y
  �ҥץ����� system CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cstime]]
: %t
  total CPU time ���֤��������ޤ���[[m:Benchmark::Tms#total]]
: %r
  �·в���֤��֤��������ޤ���[[m:Benchmark::Tms#real]]
: %n
  ��٥���֤��������ޤ�(Mnemonic: n of "*n*ame")��[[m:Benchmark::Tms#label]]

@param fmtstr �ե����ޥå�ʸ����Ǥ�����ά���줿���ϡ�[[m:Benchmark::Tms::FMTSTR]] �����Ѥ���ޤ���
@param args  �ե����ޥåȤ��������Ǥ���

--- to_a -> Array

6 ���Ǥ�������֤��ޤ���

���Ǥϰʲ��ν��֤�����˳�Ǽ����Ƥ��ޤ���
  * ��٥�
  * user CPU time
  * system CPU time,
  * �ҥץ����� user CPU time
  * �ҥץ����� system CPU time,
  * �·в����

--- to_s -> String

�������ά���� [[m:Benchmark::Tms#format]] ��ƤӽФ��Τ�Ʊ���Ǥ���


--- utime -> Float

User CPU time

--- stime -> Float

System CPU time

--- cutime -> Float

�ҥץ����� User CPU time

--- cstime -> Float

�ҥץ����� System CPU time

--- real -> Float

�·в���֡�

--- total -> Float

��׻��֡�(utime + stime + cutime + cstime)

--- label -> String

��٥롣


== Protected Instance Methods

--- memberwise(op, x) -> Benchmark::Tms

[[c:Benchmark::Tms]] �λ�§�黻��¹Ԥ��뤿��������ǻ��Ѥ����᥽�åɤǤ���

@param op �黻�Ҥ򥷥�ܥ��Ϳ���ޤ���
@param x [[c:Benchmark::Tms]] �Υ��֥������Ȥ� [[c:Float]] �˰��ۤ��Ѵ����Ǥ��륪�֥������ȤǤ���

@return �׻���̤Ͽ����� [[c:Benchmark::Tms]] ���֥������ȤǤ���


== Constants

--- CAPTION

[[m:Benchmark.#bm]] �������ʤɤǻ��Ѥ���ޤ���

@see [[m:Benchmark::CAPTION]]

--- FMTSTR

[[m:Benchmark.#benchmark]] ���軰�����Υǥե�����͡�

: %u
  user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#utime]]
: %y
  system CPU time ���֤��������ޤ�(Mnemonic: y of "s*y*stem")��[[m:Benchmark::Tms#stime]]
: %U
  �ҥץ����� user CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cutime]]
: %Y
  �ҥץ����� system CPU time ���֤��������ޤ���[[m:Benchmark::Tms#cstime]]
: %t
  total CPU time ���֤��������ޤ���[[m:Benchmark::Tms#total]]
: %r
  �·в���֤��֤��������ޤ���[[m:Benchmark::Tms#real]]
: %n
  ��٥���֤��������ޤ�(Mnemonic: n of "*n*ame")��[[m:Benchmark::Tms#label]]

�嵭�Υե����ޥå�ʸ�������Ѥ��Ƥ��ޤ���
������������Ƥϰʲ����̤�Ǥ���

  "%10.6u %10.6y %10.6t %10.6r\n"

@see [[m:Benchmark.#benchmark]], [[m:Benchmark::FMTSTR]]


= class Benchmark::Job < Object

[[m:Benchmark.#bmbm]] �᥽�åɤ������ǻ��Ѥ���륯�饹�Ǥ���

���Υ饤�֥��Υ桼������ľ�ܰռ�����ɬ�פϤ���ޤ���

== Class Methods

--- new(width) -> Benchmark::Job

== Instance Methods

--- item(label = ""){ ... } -> self
--- report(label = ""){ ... } -> self

Ϳ����줿��٥�ȥ֥�å��򥸥�֥ꥹ�Ȥ���Ͽ���ޤ���

@param label ��٥�

--- list -> [String, Proc]

��Ͽ����Ƥ��른��֤Υꥹ�Ȥ��֤��ޤ���

���줾������Ǥϡ���٥�ȥ֥�å�����ʤ������Ǥ�����Ǥ���

--- width -> Integer

[[m:Benchmark::Job#list]] �Υ�������


= class Benchmark::Report < Object

[[m:Benchmark.#benchmark]] �᥽�åɤ� [[m:Benchmark.#bm]] �᥽�åɤ�
�����ǻ��Ѥ���Ƥ��륯�饹�Ǥ���

���Υ饤�֥��Υ桼������ľ�ܰռ�����ɬ�פϤ���ޤ���

== Class Methods

--- new(width = 0, fmtstr = nil) -> Benchmark::Report

[[c:Benchmark::Report]] �Υ��󥹥��󥹤����������֤��ޤ���

�̾盧�Υ᥽�åɤ��桼�����ˤ�ä�ľ�ܸƤӽФ���뤳�ȤϤ���ޤ���

@param width  ��٥����
@param fmtstr �ե����ޥå�ʸ����

== Instance Methods

--- item(label = "", *fmt){ ... } -> Benchmark::Tms
--- report(label = "", *fmt){ ... } -> Benchmark::Tms

��٥��Ϳ����줿�֥�å��μ¹Ի��֤�ɸ����Ϥ˽��Ϥ��ޤ���

���ϤΥե����ޥåȤ� [[m:Benchmark::Tms#format]] ���Ԥ��ޤ���

@param label ��٥�
@param fmt   ��̤˽��Ϥ��������֥�������

@see [[m:Benchmark::Tms#format]]

