#@if (version >= "1.6.6")
Unix��OS �� syslog �򰷤��饤�֥��Ǥ���

= module Syslog
include Syslog::Constants

UNIX��syslog�Υ�åѡ��⥸�塼�롣
syslog �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾Ȥ��Ƥ���������

  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  Syslog.close
  # �񤭹��ޤ�Ƥ��뤫�Τ���롣
  # â�����¹ԴĶ��ˤ�äƥ��ξ�꤬�㤦�����路����syslog.conf�򻲾ȡ�
  File.foreach('/var/log/system.log'){|line|
    line.chomp!
    if /syslogtest/ =~ line
      puts line
    end
  }

== Module Functions

--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) -> self
--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self

Ϳ����줿������syslog�򳫤����ʹߡ�¾�� Syslog �⥸�塼��ؿ�����
�Ѳ�ǽ�Ȥʤ롣

�֥�å��դ��ǸƤФ줿���ϡ�self ������Ȥ��ƥ֥�å���¹Ԥ���
�Ǹ�� [[m:Syslog.close]] ��Ԥ���

syslog �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾Ȥ��Ƥ���������

@param ident ���٤ƤΥ��ˤĤ����̻Ҥǡ��ɤΥץ���फ�������
             �����ʤΤ����̤��뤿��˻Ȥ���ʸ�������ꤷ�ޤ���
             ���ꤷ�ʤ����ϥץ����̾���Ȥ��ޤ���

@param options Syslog.open �� Syslog.log ��ư������椹��ե饰����ꤷ�ޤ���
               ���ꤷ�ʤ����ϡ�Syslog::LOG_PID|Syslog::LOG_CONS���ͤ��Ȥ��
               �ޤ������ѤǤ����ͤ�[[c:Syslog::Constants]] �򻲾Ȥ��Ƥ���������
               
@param facility �����Ϥ�Ԥ��ץ����μ��̤���ꤷ�ޤ���syslog �Ϥ�����
                �ˤ������äƽ�����Ȥʤ���ե��������ꤷ�ޤ��� �ܤ����ϡ�
                [[man:syslog.conf(5)]], 
                [[c:Syslog::Constants]] �򻲾Ȥ��Ƥ���������

@raise RuntimeError syslog����˳����Ƥ�������[[c:RuntimeError]]��ȯ�����롣

@return self ���֤��ޤ���

syslog����˳����Ƥ�������[[c:RuntimeError]]��ȯ�����ޤ���

  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  begin
    Syslog.open("syslogtest2")
  rescue RuntimeError => err
    puts err #=> "syslog already open"
  end

options �� facility �˻���Ǥ����ͤˤĤ��Ƥ�
[[c:Syslog::Constants]] �򻲾Ȥ��Ƥ���������

������:
        Syslog.open('ftpd', Syslog::LOG_PID | Syslog::LOG_NDELAY,
                    Syslog::LOG_FTP)

--- open!(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self
--- reopen(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... } -> self

�����Ƥ��� syslog ��ǽ�˥������������������[[m:Syslog.open]] ��Ʊ���Ǥ���

@param ident ���٤ƤΥ��ˤĤ����̻Ҥǡ��ɤΥץ���फ�������
             �����ʤΤ����̤��뤿��˻Ȥ���ʸ�������ꤷ�ޤ���
             ���ꤷ�ʤ����ϥץ����̾���Ȥ��ޤ���

@param options Syslog.open �� Syslog.log ��ư������椹��ե饰����ꤷ�ޤ���
               ���ꤷ�ʤ����ϡ�Syslog::LOG_PID|Syslog::LOG_CONS���ͤ��Ȥ��
               �ޤ������ѤǤ����ͤ�[[c:Syslog::Constants]] �򻲾Ȥ��Ƥ���������
               
@param facility �����Ϥ�Ԥ��ץ����μ��̤���ꤷ�ޤ���syslog �Ϥ�����
                �ˤ������äƽ�����Ȥʤ���ե��������ꤷ�ޤ��� �ܤ����ϡ�
                [[man:syslog.conf(5)]], [[c:Syslog::Constants]] �򻲾Ȥ��Ƥ�
                ��������

������
  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  begin
    Syslog.open!("syslogtest2")
    Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 200)
  rescue RuntimeError => err
    # RuntimeError ��ȯ�����ʤ���
    puts err 
  end
  File.foreach('/var/log/system.log'){|line|
    print line if line =~ /the sky is/
  }

@see [[m:Syslog.open]]

--- opened? -> bool

syslog �򥪡��ץ󤷤Ƥ���п����֤���

������
  require 'syslog'

  p Syslog.opened? #=> false
  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  p Syslog.opened? #=> true


--- ident -> String | nil
--- options -> Fixnum | nil
--- facility -> Fixnum | nil

�Ǹ��open��Ϳ����줿�б�����������֤��ޤ���

������
  require 'syslog'

  Syslog.open("syslogtest")
  p Syslog.ident    #=> "syslogtest"
  p Syslog.options  #=> 3
  p Syslog.facility #=> 8

--- log(priority, format, *arg) -> self

syslog�˥�å�������񤭹��ߤޤ���

priority ��ͥ���٤򼨤����([[c:Syslog::Constants]]����)��
�ޤ���facility([[c:Syslog::Constants]]����)�������¤ǻ��ꤹ
�뤳�Ȥ� open �ǻ��ꤷ�� facility �����ؤ��뤳�Ȥ�Ǥ��롣

format �ʹߤ� [[m:Kernel.#sprintf]] ��Ʊ�������ΰ�������ꤹ�롣
�� [[man:syslog(3)]] �Τ褦�� format �� %m �ϻ��ѤǤ��ʤ���

��å������˲��Ԥ�ޤ��ɬ�פϤʤ���

@param priority priority ��ͥ���٤򼨤��������ꤷ�ޤ���
                �ܤ����ϡ�[[c:Syslog::Constants]]�򻲾Ȥ��Ƥ���������

@param format �ե����ޥå�ʸ����Ǥ���

@param arg �ե����ޥåȤ��������Ǥ���

@raise ArgumentError ���������İʾ�Ǥʤ�����ȯ�����ޤ���

��:
         Syslog.log(Syslog::LOG_CRIT, "the sky is falling in %d seconds!", 10)


--- emerg(message, *arg) -> self
--- alert(message, *arg) -> self
--- crit(message, *arg) -> self
--- err(message, *arg) -> self
--- warning(message, *arg) -> self
--- notice(message, *arg) -> self
--- info(message, *arg) -> self
--- debug(message, *arg) -> self

Syslog#log()�Υ��硼�ȥ��åȥ᥽�åɡ�
�����ƥ�ˤ�äƤ��������Ƥ��ʤ���Τ⤢��ޤ���

�㤨�С�Syslog.emerg(message, *arg) �ϡ�Syslog.log(Syslog::LOG_EMERG, message, *arg)
��Ʊ���Ǥ���

@param message �ե����ޥå�ʸ����Ǥ���[[m:Kernel.#sprintf]] ��Ʊ�������ΰ�������ꤷ�ޤ���

@param arg �ե����ޥåȤ��������Ǥ���

@raise ArgumentError ������1�İʾ�Ǥʤ�����ȯ�����ޤ���

@raise RuntimeError syslog ��open ����Ƥ��ʤ����ȯ�����ޤ���

       ��:
         Syslog.crit("the sky is falling in %d seconds!",5)

--- mask -> Fixnum | nil
--- mask=(mask)

����ͥ���٤Υޥ���������ޤ������ꤹ�롣
�ޥ����ϱ�³Ū�Ǥ��ꡢ
Syslog.open��Syslog.close
�Ǥϥꥻ�åȤ���ʤ���

@param mask ����ͥ���٤Υޥ��������ꤷ�ޤ���

@raise RuntimeError syslog �������ץ󤵤�Ƥ��ʤ���硢ȯ�����ޤ���

������

  require 'syslog'
  include Syslog::Constants
  # ���ξ��ϼ¹ԴĶ��ˤ�äưۤʤ롣�ܤ�����syslog.conf �򻲾�
  log = '/var/log/ftp.log'

  Syslog.open('ftpd', LOG_PID | LOG_NDELAY, LOG_FTP)
  Syslog.mask = Syslog::LOG_UPTO(LOG_ERR)

  [ LOG_CRIT, LOG_ERR, LOG_WARNING,
    LOG_NOTICE, LOG_INFO, LOG_DEBUG ].each_with_index { |c, i|
    Syslog.log(c, "test for syslog FTP #{c}, #{i}")
  }
  Syslog.close
  File.foreach(log){|line|
    print line if line =~ /FTP/
  } 

--- close -> nil

syslog���Ĥ��ޤ���

@raise RuntimeError syslog ��open ����Ƥ��ʤ����ȯ�����ޤ���

������
  require 'syslog'

  Syslog.open("syslogtest")
  Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
  Syslog.close

--- instance -> self

self���֤���(���ǤȤθߴ����Τ���)

--- LOG_MASK(priority) -> Fixnum

1�Ĥ�ͥ���٤��Ф���ޥ�����������롣

@param priority priority ��ͥ���٤򼨤��������ꤷ�ޤ���
                �ܤ����ϡ�[[c:Syslog::Constants]]�򻲾Ȥ��Ƥ���������

��:
         Syslog.mask = Syslog::LOG_MASK(Syslog::LOG_ERR)

--- LOG_UPTO(priority) -> Fixnum

priority�ޤǤΤ��٤Ƥ�ͥ���٤Υޥ�����������롣

@param priority priority ��ͥ���٤򼨤��������ꤷ�ޤ���
                �ܤ����ϡ�[[c:Syslog::Constants]]�򻲾Ȥ��Ƥ���������

��:
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_ERR)

= module Syslog::Constants


���Υ⥸�塼��ˤϥ����ƥ�ǻ��Ѳ�ǽ��LOG_*������������Ƥ��롣

  ��:
    require 'syslog'
    include Syslog::Constants


== Constants
--- LOG_PID
--- LOG_CONS
--- LOG_ODELAY
--- LOG_NDELAY
--- LOG_NOWAIT
--- LOG_PERROR

���ץ����(options)�򼨤������
��� �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾Ȥ��Ƥ���������

--- LOG_AUTH
--- LOG_AUTHPRIV
--- LOG_CONSOLE
--- LOG_CRON
--- LOG_DAEMON
--- LOG_FTP
--- LOG_KERN
--- LOG_LPR
--- LOG_MAIL
--- LOG_NEWS
--- LOG_NTP
--- LOG_SECURITY
--- LOG_SYSLOG
--- LOG_USER
--- LOG_UUCP
--- LOG_LOCAL0
--- LOG_LOCAL1
--- LOG_LOCAL2
--- LOG_LOCAL3
--- LOG_LOCAL4
--- LOG_LOCAL5
--- LOG_LOCAL6
--- LOG_LOCAL7

��ǽ(facilities)�򼨤������

��� �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾Ȥ��Ƥ���������

--- LOG_EMERG
--- LOG_ALERT
--- LOG_CRIT
--- LOG_ERR
--- LOG_WARNING
--- LOG_NOTICE
--- LOG_INFO
--- LOG_DEBUG

ͥ����(priorities)�򼨤������
��� �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾Ȥ��Ƥ���������

#@end
