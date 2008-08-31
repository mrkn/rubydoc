ʣ������åɤν�λ���Ԥĵ�ǽ���󶡤��ޤ���

= class ThreadsWait < Object
#@# alias ThWait

provides synchronization for multiple threads.

== Class Methods

--- all_waits(*threads) -> ()
--- all_waits(*threads){|thread| ...} -> ()

���ꤵ�줿����åɤ��٤Ƥ���λ����ޤ��Ԥ��ޤ���
�֥�å���Ϳ����줿��硢����åɽ�λ���˥֥�å���ɾ�����ޤ���

@param threads ��λ����ޤǤޤĥ���åɤ��Ĥ⤷����ʣ�����ꤷ�ޤ���

  require 'thwait'

  threads = []
  5.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }
  ThreadsWait.all_waits(*threads) {|th| printf("end %s\n", th.inspect) }

  # ������
  #=> #<Thread:0x21584 run>
  #=> #<Thread:0x21610 run>
  #=> #<Thread:0x2169c run>
  #=> #<Thread:0x21728 run>
  #=> #<Thread:0x214f8 run>
  #=> end #<Thread:0x21584 dead>
  #=> end #<Thread:0x21610 dead>
  #=> end #<Thread:0x2169c dead>
  #=> end #<Thread:0x21728 dead>
  #=> end #<Thread:0x214f8 dead>

--- new(*threads) -> ThreadsWait

���ꤵ�줿����åɤν�λ��ޤĤ���Ρ�����å�Ʊ�����֥������Ȥ�Ĥ���ޤ���

@param threads ��λ���Ԥĥ���åɤ��Ĥ⤷����ʣ�����ꤷ�ޤ���

������
  require 'thwait'

  threads = []
  5.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }
  
  thall = ThreadsWait.new(*threads)
  thall.all_waits{|th|
    printf("end %s\n", th.inspect)
  }
  
  # ������
  #=> #<Thread:0x214bc run>
  #=> #<Thread:0x21548 run>
  #=> #<Thread:0x215d4 run>
  #=> #<Thread:0x21660 run>
  #=> #<Thread:0x21430 run>
  #=> end #<Thread:0x214bc dead>
  #=> end #<Thread:0x21548 dead>
  #=> end #<Thread:0x215d4 dead>
  #=> end #<Thread:0x21660 dead>
  #=> end #<Thread:0x21430 dead>


== Instance Methods

--- threads -> Array

Ʊ������륹��åɤΰ�����������֤��ޤ���

������
  require 'thwait'

  threads = []
  3.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }

  thall = ThreadsWait.new(*threads)
  p thall.threads
  #=> [#<Thread:0x21750 sleep>, #<Thread:0x216c4 sleep>, #<Thread:0x21638 sleep>]

--- empty? -> bool

Ʊ������륹��åɤ�¸�ߤ���ʤ�� true �򤫤����ޤ���

������
  require 'thwait'

  threads = []
  3.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }

  thall = ThreadsWait.new
  p thall.threads.empty? #=> true
  thall.join(*threads)
  p thall.threads.empty? #=> false

--- finished? -> bool

���Ǥ˽�λ��������åɤ�¸�ߤ���� true ���֤��ޤ���

������
  require 'thwait'

  threads = []
  3.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }

  thall = ThreadsWait.new(*threads)
  p thall.finished? #=> false
  sleep 3
  p thall.finished? #=> true

--- join(*threads) -> ()

��λ���Ԥĥ���åɤ��оݤȤ��ơ�threads �ǻ��ꤵ�줿����åɤ���ꤷ�ޤ���

@param threads ʣ������åɤν�λ���Ԥĥ���åɤ˻��ꤵ�줿threads��ä��ޤ���

  require 'thwait'

  threads = []
  5.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }

  thall = ThreadsWait.new
  p thall.threads #=> []
  thall.join(*threads)
  p thall.threads
  #=> [#<Thread:0x216ec dead>, #<Thread:0x21660 dead>, #<Thread:0x215d4 dead>, #<Thread:0x214bc dead>]

--- join_nowait(*threads) -> ()

��λ���Ԥĥ���åɤ��оݤȤ��ơ�threads �ǻ��ꤵ�줿����åɤ���ꤷ�ޤ���
���������ºݤˤϽ�λ��ޤ��ޤ���

@param threads ʣ������åɤν�λ���Ԥĥ���åɤ˻��ꤵ�줿threads��ä��ޤ���

  require 'thwait'

  threads = []
  5.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }

  thall = ThreadsWait.new
  p thall.threads #=> []
  thall.join_nowait(*threads)
  p thall.threads #=> [#<Thread:0x21638 sleep>, #<Thread:0x215ac sleep>, #<Thread:0x21520 sleep>, #<Thread:0x21494 sleep>, #<Thread:0x21408 sleep>]
  # �ºݤˤϽ�λ���ԤäƤ��ʤ���sleep ���Ƥ��롣

--- next_wait(nonblock = nil) -> Thread
#@todo

waits until any of specified threads is terminated.

@param nonblock 

@raise ErrNoWaitingThread ��λ��ޤĥ���åɤ�¸�ߤ��ʤ����ȯ�����ޤ���

@raise ErrNoFinishedThread

--- all_waits -> ()

���ꤵ�줿����åɤ��٤Ƥ���λ����ޤ��Ԥ��ޤ���
�֥�å���Ϳ����줿��硢����åɽ�λ���˥֥�å���ɾ�����ޤ���

������
  require 'thwait'

  threads = []
  5.times {|i|
    threads << Thread.new { sleep 1; p Thread.current }
  }
  
  thall = ThreadsWait.new(*threads)
  thall.all_waits{|th|
    printf("end %s\n", th.inspect)
  }
  
  # ������
  #=> #<Thread:0x214bc run>
  #=> #<Thread:0x21548 run>
  #=> #<Thread:0x215d4 run>
  #=> #<Thread:0x21660 run>
  #=> #<Thread:0x21430 run>
  #=> end #<Thread:0x214bc dead>
  #=> end #<Thread:0x21548 dead>
  #=> end #<Thread:0x215d4 dead>
  #=> end #<Thread:0x21660 dead>
  #=> end #<Thread:0x21430 dead>

