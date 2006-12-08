#@since 1.8.0

�٥���ޡ������뤿��Υ��饹�Ǥ���

[[unknown:��ɮ���罸]]

= module Benchmark

== Module Functions

--- measure { ... }
--- realtime { ... }

Ϳ����줿�֥�å���¹Ԥ��ơ��вᤷ�����֤� Process.times() �Ƿפꡢ
Benchmark::Tms ���֥������Ȥ����������֤��ޤ���
Tms ���֥������Ȥˤ� to_s ���������Ƥ���Τǡ�����Ū�ˤϰʲ��Τ褦��
�Ȥ��ޤ���

  require 'benchmark'
  
  puts Benchmark::CAPTION
  puts Benchmark.measure { "a"*1_000_000 }
  
  =>
  
      user     system      total        real
  1.166667   0.050000   1.216667 (  0.571355)

--- bm(label_width = 0, *labels) {|rep| ... }

benchmark �᥽�åɤΰ������ά��������ΤǤ���benchmark �᥽�åɤ�Ʊ�ͤ�Ư���ޤ���

��:

  require 'benchmark'
  
  n = 50000
  Benchmark.bm do |x|
    x.report { for i in 1..n; a = "1"; end }
    x.report { n.times do   ; a = "1"; end }
    x.report { 1.upto(n) do ; a = "1"; end }
  end
  
  =>
  
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
  
  =>
               user     system      total        real
  for:     1.050000   0.000000   1.050000 (  0.503462)
  times:   1.533333   0.016667   1.550000 (  0.735473)
  upto:    1.500000   0.016667   1.516667 (  0.711239)

--- bmbm(width = 0) {|job| ... }

Benchmark::Job ���֥������Ȥ��������ơ����������Ȥ���Ϳ����줿�֥�å���
�¹Ԥ��ޤ����٥���ޡ����μ¹Ի��γ֤�����ɤ����ᡢ�֥�å���2��¹Ԥ��ޤ���
�ǽ�� Rehearsal �Ȥ���ɽ������ޤ���

  require 'benchmark'
  
  array = (1..1000000).map { rand }
  
  Benchmark.bmbm do |x|
    x.report("sort!") { array.dup.sort! }
    x.report("sort")  { array.dup.sort  }
  end
  
  =>
  
  Rehearsal -----------------------------------------
  sort!  11.928000   0.010000  11.938000 ( 12.756000)
  sort   13.048000   0.020000  13.068000 ( 13.857000)
  ------------------------------- total: 25.006000sec
  
              user     system      total        real
  sort!  12.959000   0.010000  12.969000 ( 13.793000)
  sort   12.007000   0.000000  12.007000 ( 12.791000)

--- benchmark(caption = "", label_width = nil, fmtstr = nil, *labels){|rep| ...}

Benchmark::Report ���֥������Ȥ������������������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���
����Ū�ˤϰʲ��Τ褦�˻Ȥ��ޤ����֥�å��� Benchmark::Tms ���֥������Ȥ�������֤������ϡ�
�����ο��ͤ��ɲäιԤ�ɽ������ޤ���

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
  
  =>
  
               user     system      total        real
  for:     1.016667   0.016667   1.033333 (  0.485749)
  times:   1.450000   0.016667   1.466667 (  0.681367)
  upto:    1.533333   0.000000   1.533333 (  0.722166)
  >total:  4.000000   0.033333   4.033333 (  1.889282)
  >avg:    1.333333   0.011111   1.344444 (  0.629761)

fmtstr �ˤϡ�printf �˻����ե����ޥå�ʸ�������ꤷ�ޤ���
�ե����ޥå�ʸ����Ȥ��ưʲ������ѤǤ��ޤ���

  * %u: user CPU time
  * %y: system CPU time
  * %U: user CPU time of children
  * %Y: system CPU time of children
  * %t: total CPU time
  * %r: real time
  * %n: label string

fmtstr ���ά�����Ȥ��� Benchmark::FMTSTR �����Ѥ���ޤ���
�������Ƥ�

  "%10.6u %10.6y %10.6t %10.6r\n"

�Ǥ���
#@end


== Constants

--- CAPTION

--- FMTSTR

--- BENCHMARK_VERSION

= class Benchmark::Tms < Object
== Class Methods
#@# bc-rdoc: detected missing name: new
--- new(u = 0.0, s = 0.0, cu = 0.0, cs = 0.0, real = 0.0, l = nil)

Returns an initialized Tms object which has u as the user CPU
time, s as the system CPU time, cu as the children's user CPU
time, cs as the children's system CPU time, real as the elapsed
real time and l as the label.

== Instance Methods
#@# bc-rdoc: detected missing name: *
--- *(x)

Returns a new Tms object obtained by memberwise multiplication
of the individual times for this Tms object by x.

#@# bc-rdoc: detected missing name: +
--- +(other)

Returns a new Tms object obtained by memberwise summation of
the individual times for this Tms object with those of the other
Tms object. This method and #/() are useful for taking statistics.

#@# bc-rdoc: detected missing name: -
--- -(other)

Returns a new Tms object obtained by memberwise subtraction of
the individual times for the other Tms object from those of this
Tms object.

#@# bc-rdoc: detected missing name: /
--- /(x)

Returns a new Tms object obtained by memberwise division of the
individual times for this Tms object by x. This method and #+()
are useful for taking statistics.

#@# bc-rdoc: detected missing name: add
--- add {|| ...}

Returns a new Tms object whose times are the sum of the times
for this Tms object, plus the time required to execute the code
block (blk).

#@# bc-rdoc: detected missing name: add!
--- add!

An in-place version of #add.


--- format(arg0 = nil, *args)

Returns the contents of this Tms object as a formatted string, according to a format string like that passed to Kernel.format. In addition, format accepts the following extensions:

: %u
 Replaced by the user CPU time, as reported by Tms#utime.
: %y
 Replaced by the system CPU time, as reported by stime (Mnemonic: y of "s*y*stem")
: %U
 Replaced by the children��s user CPU time, as reported by Tms#cutime
: %Y
 Replaced by the children��s system CPU time, as reported by Tms#cstime
: %t
 Replaced by the total CPU time, as reported by Tms#total
: %r
 Replaced by the elapsed real time, as reported by Tms#real
: %n
 Replaced by the label string, as reported by Tms#label (Mnemonic: n of "*n*ame")

If fmtstr is not given, FMTSTR is used as default value, detailing the user, system and real elapsed time. 

--- to_a()

Returns a new 6-element array, consisting of the label, user CPU time, system CPU time, children��s user CPU time, children��s system CPU time and elapsed real time.

--- to_s()

Same as format. 

--- utime
User CPU time

--- stime
System CPU time

--- cutime
User CPU time of children

--- cstime
System CPU time of children

--- real
Elapsed real time

--- total
Total time, that is _utime_ + _stime_ + _cutime_ + _cstime_ 

--- label
Label

== Constants

--- CAPTION

--- FMTSTR
