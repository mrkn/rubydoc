#@if (version >= "1.6.6")
= module Syslog
include Syslog::Constants

UNIX��syslog�Υ�åѡ��⥸�塼�롣

        require 'syslog'

        Syslog.open("syslogtest")
        Syslog.log(Syslog::LOG_WARNING, "the sky is falling in %d seconds!", 100)
        Syslog.close

== Module Functions

--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER)
--- open(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... }
#@todo

Ϳ����줿������syslog�򳫤����ʹߡ�¾�� Syslog �⥸�塼��ؿ�����
�Ѳ�ǽ�Ȥʤ롣

�֥�å��դ��ǸƤФ줿���ϡ�self ������Ȥ��ƥ֥�å���¹Ԥ���
�Ǹ�� Syslog.close ��Ԥ���

syslog����˳����Ƥ�������[[c:RuntimeError]]��ȯ�����롣

ident �Ϥ��٤ƤΥ��ˤĤ����̻Ҥǡ��ɤΥץ���फ�������
�����ʤΤ����̤��뤿��˻Ȥ��롣�̾�ץ����̾���Ȥ��롣

options �ˤϡ�Syslog.open �� Syslog.log ��ư������椹��ե�
������ꤹ�롣

facility �ˤϡ������Ϥ�Ԥ��ץ����μ��̤���ꤹ�롣
syslog �Ϥ����ͤˤ������äƽ�����Ȥʤ���ե��������롣
[[man:syslog.conf(5)]] ����)

options �� facility �˻���Ǥ����ͤˤĤ��Ƥ�
[[c:Syslog::Constants]] �򻲾ȡ�

      ��:
        Syslog.open('ftpd', Syslog::LOG_PID | Syslog::LOG_NDELAY,
                    Syslog::LOG_FTP)

self ���֤���

syslog �ξܺ٤ˤĤ��Ƥ� [[man:syslog(3)]] �򻲾ȡ�

--- open!(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... }
--- reopen(ident=$0, options=Syslog::LOG_PID|Syslog::LOG_CONS, facility=Syslog::LOG_USER) { |syslog| ... }
#@todo

�����Ƥ��� syslog ��ǽ�˥������������������ Syslog.open ��Ʊ����

--- opened?
#@todo

syslog �򥪡��ץ󤷤Ƥ���п����֤���

--- ident
--- options
--- facility
#@todo

�Ǹ��open��Ϳ����줿�б�����������֤���

--- log(priority, format, ...)
#@todo

syslog�˥�å�������񤭹��ࡣ

priority ��ͥ���٤򼨤����[[c:Syslog::Constants]]����)��
�ޤ���facility([[c:Syslog::Constants]]����)�������¤ǻ��ꤹ
�뤳�Ȥ� open �ǻ��ꤷ�� facility �����ؤ��뤳�Ȥ�Ǥ��롣

format �ʹߤ� [[m:Kernel#sprintf]] ��Ʊ�������ΰ�������ꤹ�롣
��å������˲��Ԥ�ޤ��ɬ�פϤʤ���

       ��:
         Syslog.log(Syslog::LOG_CRIT, "the sky is falling in %d seconds!", 10)

�� [[man:syslog(3)]] �Τ褦�� format �� %m �ϻ��ѤǤ��ʤ���

--- emerg(message, ...)
--- alert(message, ...)
--- crit(message, ...)
--- err(message, ...)
--- warning(message, ...)
--- notice(message, ...)
--- info(message, ...)
--- debug(message, ...)
#@todo

Syslog#log()�Υ��硼�ȥ��åȥ᥽�åɡ�
�����ƥ�ˤ�äƤ��������Ƥ��ʤ���Τ⤢�롣

       ��:
         Syslog.crit("the sky is falling in %d seconds!",5)

--- mask
--- mask=(mask)
#@todo

����ͥ���٤Υޥ���������ޤ������ꤹ�롣
�ޥ����ϱ�³Ū�Ǥ��ꡢ
Syslog.open��Syslog.close
�Ǥϥꥻ�åȤ���ʤ���
       ��:
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_ERR)

--- close
#@todo

syslog���Ĥ��롣

--- instance
#@todo

self���֤���(���ǤȤθߴ����Τ���)

--- LOG_MASK(priority)
#@todo

1�Ĥ�ͥ���٤��Ф���ޥ�����������롣

--- LOG_UPTO(priority)
#@todo

priority�ޤǤΤ��٤Ƥ�ͥ���٤Υޥ�����������롣

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
#@todo
���ץ����(options)�򼨤������

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
#@todo
��ǽ(facilities)�򼨤������

--- LOG_EMERG
--- LOG_ALERT
--- LOG_CRIT
--- LOG_ERR
--- LOG_WARNING
--- LOG_NOTICE
--- LOG_INFO
--- LOG_DEBUG
#@todo
ͥ����(priorities)�򼨤������
#@end
