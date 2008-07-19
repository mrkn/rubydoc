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
