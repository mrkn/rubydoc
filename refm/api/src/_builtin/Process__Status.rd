#@if (version >= "1.7.0")
= module Process::Status

((<ruby 1.7 feature>))
[[m:Process#Process.wait]] �ʤɤ���������륪�֥������ȡ��ץ����ν�
λ���ơ�������ɽ�����ޤ���

������

wait ����Ѥ�����

  fork { exit }
  Process.wait
  case
  when $?.signaled?
    p "child #{$?.pid} was killed by signal #{$?.termsig}"
  when $?.stopped?
    # �ºݤˤ� Process.wait ����Ѥ��Ƥ���Τǡ���������뤳�ȤϤʤ�
    p "child #{$?.pid} was stopped by signal #{$?.stopsig}"
  when $?.exited?
    p "child #{$?.pid} exited normaly. status=#{$?.exitstatus}"
  when $?.coredump?   # �����ƥब���Υ��ơ������򥵥ݡ��Ȥ��Ƥʤ���о��false
    p "child #{$?.pid} dumped core."
  else
    p "unknown status %#x" % $?.to_i
  end

SIGCHLD �� trap ������

  trap(:SIGCHLD) {|sig|

    puts "interrupted by signal #{sig} at #{caller[1]}"
    # ʣ���λҥץ����ν�λ���Ф���1�Ĥ� SIGCHLD �����Ϥ��ʤ�
    # ��礬����Τǥ롼�פ�����ɬ�פ�����ޤ�

    while Process.waitpid(-1, Process::WNOHANG|Process::WUNTRACED)
      case
      when $?.signaled?
        puts "   child #{$?.pid} was killed by signal #{$?.termsig}"
      when $?.stopped?
        puts "   child #{$?.pid} was stopped by signal #{$?.stopsig}"
      when $?.exited?
        puts "   child #{$?.pid} exited normaly. status=#{$?.exitstatus}"
      when $?.coredump?
        puts "   child #{$?.pid} dumped core."
      else
        p "unknown status %#x" % $?.to_i
      end
    end
  }

  p pid1 = fork { sleep 1; exit }
  p pid2 = fork { loop { sleep } } # signal ���ԤĤ���� sleep
  begin
     Process.kill :STOP, pid2
     sleep                      # SIGCHLD ���ԤĤ���� sleep
     Process.kill :CONT, pid2
     Process.kill :TERM, pid2
     loop { sleep }             # SIGCHLD ���ԤĤ���� sleep
  rescue Errno::ECHILD
    puts "done"
  end

  => 12964
     12965
     interrupted by signal 17 at -:27:in `sleep'
        child 12965 was stopped by signal 19
     interrupted by signal 17 at -:30:in `sleep'
        child 12965 was killed by signal 15
     interrupted by signal 17 at -:30:in `sleep'
        child 12964 exited normaly. status=0
     done


== Instance Methods

--- ==(other)

Ʊ�����ơ������ξ��˿����֤��ޤ���

other �����ͤξ�硢self.to_i �Ȥ���Ӥ��Ԥ��ޤ�����
��ϸ����ߴ����Τ���Ǥ���

--- &(other)

to_i & other ��Ʊ���Ǥ���

���Υ᥽�åɤϸ����ߴ����Τ���ˤ���ޤ���

--- pid

��λ�����ץ����Υץ��� ID ���֤��ޤ���

--- to_i

C ����Ǥν�λ���ơ�����ɽ�����������֤��ޤ���

¿���Υ����ƥ�μ����Ǥϡ������ͤξ�� 8 bit �� [[man:exit(2)]]
���Ϥ�����λ���ơ������������� 8 bit �˥����ʥ����ǽ�λ�������ξ�
�����äƤ��ޤ���

--- to_int

to_i ��Ʊ���Ǥ������Υ᥽�åɤˤ�� $? �� [[c:Fixnum]]
�Ȥ��ư�����褦�ˤʤ�ޤ�(���ۤη��Ѵ�)������ϸ����ߴ����Τ���
�Ǥ���

  fork { exit 1 }
  Process.wait
  p $? # => 256

--- to_s

to_i.to_s ��Ʊ���Ǥ���

--- exited?

�ץ����� [[man:exit(2)]] �ˤ�꼫ʬ�ǽ�λ����(¾�Υץ�
�����˻ߤ��줿�ΤǤϤʤ�)��硢�����֤��ޤ���

--- exitstatus

exited? �����ξ��ץ������֤�����λ���ơ������������򡢤�
���Ǥʤ����� nil ���֤��ޤ���

--- inspect

�ץ����ξ��֤�ʲ��Υե����ޥåȤǽ��Ϥ��ޤ���

    ���ｪλ�ΤȤ�

    #<Process::Status: pid=18262,exited(nnn)>

    �����ʥ�ˤ����ߤΤȤ�

    #<Process::Status: pid=18262,stopped(SIGxxx=nnn)>

    �����ʥ�ˤ�뽪λ�ΤȤ�

    #<Process::Status: pid=18262,signaled(SIGxxx=nnn)>

    ��������פ����Ȥ�(���Υ��ơ�������ɽ���ϥ����ƥ�˰�¸���ޤ�)

    #<Process::Status: pid=18262,coredumped>


--- stopped?

�ץ������������(��λ�ǤϤʤ�)���Ƥ�����˿����֤��ޤ���
Process.waitpid �� Process::WUNTRACED �ե饰�����ꤷ��
���ˤ������ˤʤꤨ�ޤ���

--- stopsig

stopped? �����ξ�礽�Υ����ʥ���ֹ�򡢤����Ǥʤ�����
nil ���֤��ޤ���

--- signaled?

�ץ������ϥ�ɥ��������Ƥ��ʤ������ʥ������ƽ�λ�������˿�
���֤��ޤ���

--- termsig

signaled? �����ξ��ץ�����λ�����������ʥ��ֹ��
�����Ǥʤ����� nil ���֤��ޤ���

--- coredump?

��λ���˥�������פ��Ƥ����鿿���֤��ޤ���

(���Υ᥽�åɤϥ����ƥ�˰�¸���ޤ������ݡ��Ȥ��ʤ��ץ�åȥե���
��ǤϾ�� false ���֤��ޤ�)

#@end