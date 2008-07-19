�����ॢ���Ȥ�Ԥ��饤�֥�ꡣ

= class TimeoutError < Interrupt

[[c:Timeout::Error]]����̾�Ǥ���

= reopen Kernel

== Private Instance Methods

#@since 1.8.0
--- timeout(sec) {|i| .... }
--- timeout(sec, exception_class = nil) {|i| .... }

�֥�å��� sec �äδ����դ��Ǽ¹Ԥ��ޤ���
�֥�å��μ¹Ի��֤����¤�᤮���Ȥ����㳰
[[c:Timeout::Error]] ��ȯ�����ޤ���
exception_class ����ꤷ�����ˤ� [[c:Timeout::Error]] �������
�����㳰��ȯ�����ޤ���
�֥�å��ѥ�᡼�� i �� sec ���Ϥ���ޤ���

�ޤ� sec �� nil �ΤȤ������»��֤ʤ���
�֥�å���¹Ԥ��ޤ���

@param sec �����ॢ���Ȥ�����֤��ÿ��ǻ��ꤷ�ޤ�.
@param exception_class �����ॢ���Ȥ�������ȯ���������㳰����ꤷ�ޤ�.

[���]

timeout �ˤ������ߤ� Thread �ˤ�äƼ¸�����Ƥ��ޤ���C ����
��٥�Ǽ������졢Ruby �Υ���åɤ�������ʤ��������Ф���
timeout ��̵�ϤǤ���
���Τ褦��
��Τϼ��ѥ�٥�ǤϾ��ʤ��ΤǤ�������򤢤���� Socket �ʤɤ�
DNS��̾�����˻��֤������ä���������ޤ���
([[lib:resolv-replace]] ����Ѥ���ɬ�פ�����ޤ�)��
���ν����� Ruby �Ǽ������ʤ����� C ¦�� Ruby
�Υ���åɤ�ռ����Ƥ�����ɬ�פ�����ޤ���
[[unknown:timeout�����|trap::timeout]]�⻲��
#@end

= module Timeout

�����ॢ���Ȥ�Ԥ�����Υ⥸�塼�롣

== Module Functions

--- timeout(sec, exception_class = nil) {|i| ... }

�֥�å��� sec �äδ����դ��Ǽ¹Ԥ��ޤ���
�֥�å��μ¹Ի��֤����¤�᤮���Ȥ����㳰
[[c:Timeout::Error]] ��ȯ�����ޤ���
exception_class ����ꤷ�����ˤ� [[c:Timeout::Error]] �������
�����㳰��ȯ�����ޤ���
�֥�å��ѥ�᡼�� i �� sec ���Ϥ���ޤ���

�ޤ� sec �� nil �ΤȤ������»��֤ʤ���
�֥�å���¹Ԥ��ޤ���

@param sec �����ॢ���Ȥ�����֤��ÿ��ǻ��ꤷ�ޤ�.
@param exception_class �����ॢ���Ȥ�������ȯ���������㳰����ꤷ�ޤ�.

��1
  require 'timeout'

  def calc_pi(min)
    loop do
      x = rand
      y = rand
      x**2 + y**2 < 1.0 ?  min[0] += 1 : min[1] += 1
    end
  end
 
  t = 5
  min = [ 0, 0]
  begin
    timeout(t){
      calc_pi(min)
    }
  rescue Timeout::Error
    puts "timeout"
  end

  printf "%d: pi = %f\n", min[0] + min[1], min[0]*4.0/(min[0]+min[1])
  #��
  #=> 417519: pi = 3.141443

��2
  #!/usr/bin/env ruby

  require 'timeout'

  class MYError < Exception;end
  begin
    timeout(5, MYError) {
      sleep(30)
    }
  rescue MYError => err
    puts "MYError"
    puts err
  end

[���]

timeout �ˤ������ߤ� Thread �ˤ�äƼ¸�����Ƥ��ޤ���
C �����٥�Ǽ������졢
Ruby �Υ���åɤ�������ʤ��������Ф��� timeout ��̵�ϤǤ���
���Τ褦�ʤ�Τϼ��ѥ�٥�ǤϾ��ʤ��ΤǤ�����
Socket �ʤɤ� DNS��̾�����˻��֤������ä���������ޤ���
([[lib:resolv-replace]] ����Ѥ���ɬ�פ�����ޤ�)��
���ν����� Ruby �Ǽ������ʤ����� C ¦�� Ruby
�Υ���åɤ�ռ����Ƥ�����ɬ�פ�����ޤ���
[[unknown:timeout�����|trap::timeout]]�⻲��

timeout �ˤ������ߤ� system �ˤ�äƸƤӽФ��줿�����ץ�����
�����ॢ���Ȥ�������ϤǤ��ʤ��Τǡ�[[m:IO.popen]]��[[m:Kernel.#open]]����Ѥ���ʤɤι��פ�ɬ�פǤ���

  # ��3 �������ޥ�ɤΥ����ॢ����
  require 'timeout'

  # �ƥ����ѤΥ������Ĥ��롣
  File.open("loop.sh", "w"){|fp|
    fp.print <<SHELL_EOT
  #!/bin/bash

  S="scale=10"
  M=32767

  trap 'echo "$S; $m1/($m1+$m2)*4" | bc ; echo "count = $((m1+m2))" ; exit 0' INT
  m1=0
  m2=0

  while true
  do
    x="($RANDOM/$M)"
    y="($RANDOM/$M)"
    c=$(echo "$S;$x^2+$y^2 < 1.0" | bc)
    echo $x $y $c
    if [ $c -eq 1 ]
    then
      let m1++
    else
      let m2++
    fi
  done
  SHELL_EOT
  }

  File.chmod(0755, "loop.sh")
  t = 10 # 10 �äǥ����ॢ����
  begin
    pid = nil
    com = nil
    timeout(t) {
      # system ���ȤȤޤ�ʤ�
      # system("./loop.sh")
      com = IO.popen("./loop.sh")
      pid = com.pid
      while line = com.gets
        print line
      end
    }
  rescue Timeout::Error => err
    puts "timeout: shell execution."
    Process.kill('SIGINT', pid)
    printf "[result]\t%s", com.read
    com.close unless com.nil?
  end
#@# ��äȤ����ߤ��������뤫�⤷��ʤ���

  #�ߤޤäƤ��뤫��ǧ���롣
  #system("ps au")

#@#== Constants
#@#--- Error
#@#[[c:Timeout::Error]]

= class Timeout::Error < Interrupt

[[lib:timeout]] �����������㳰���饹�Ǥ���
�ؿ� timeout �������ॢ���Ȥ����ȯ�����ޤ���

[[lib:timeout]] ��Ȥ��饤�֥������������ϡ��桼�������ꤷ��
timeout ����ª���ʤ��褦�˥饤�֥����� [[c:TimeoutError]] �Υ��֥��饹��
������ƻ��Ѥ�������̵��Ǥ���
#@#((-��: version 1.6 �Ǥϡ�[[unknown:ruby-list:33352]] �Υѥå���ɬ�פǤ���
#@#���Υѥå��� 1.7 �˼����ޤ�ޤ���[[unknown:ruby-list:33391]]-))

        ==> foo.rb <==
        require 'timeout.rb'
        class Foo
          FooTimeoutError = Class.new(TimeoutError)
          def longlongtime_method
            timeout(100, FooTimeoutError) {
               ...
            }
          end
        end

        ==> main.rb <==
        require 'foo'
        timeout(5) {
          Foo.new.longlongtime_method
        }
