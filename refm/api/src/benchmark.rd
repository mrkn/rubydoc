#@if (version >= "1.7.0")
-> [[unknown:"ruby-src:lib/benchmark.rb"]]

[[unknown:��ɮ���罸]]

�٥���ޡ������뤿��Υ��饹�Ǥ���

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
