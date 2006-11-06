= module Process

UNIX �Υץ������������⥸�塼�롣

Process ���ץ�����ɽ�����륯�饹�ǤϤʤ����ץ������Ф������
��ޤȤ᤿�⥸�塼��Ǥ��뤳�Ȥ���դ��Ƥ���������

== Singleton Methods

#@since 1.8.0
--- abort([message])

�ؿ� [[m:Kernel#abort]] ��Ʊ���Ǥ���
#@end

#@since 1.9.0
--- daemon(nochdir=nil,noclose=nil)

�ץ�����������ü�����ڤ�Υ����
�Хå����饦��ɤˤޤ�äƥǡ����Ȥ���ư����ޤ���

�����ȥǥ��쥯�ȥ�� / �˰�ư���ޤ���
������ nochdir �˿�����ꤷ���Ȥ��ˤϤ���ư����������졢
�����ȥǥ��쥯�ȥ�ϰ�ư���ޤ���

ɸ�����ϡ�ɸ����ϡ�ɸ�२�顼���Ϥ� /dev/null �˥�����쥯�Ȥ��ޤ���
������ noclose �˿�����ꤷ���Ȥ��ˤϤ���ư����������졢
������쥯�ȤϹԤʤ��ޤ���

0���֤��ޤ���
#@end

#@since 1.8.0
--- detach(pid)

�ҥץ��� pid �ν�λ��ƻ뤹�륹��åɤ����������֤��ޤ���
������������åɤϻҥץ�������λ������� nil �ǽ�λ���ޤ���
(���ꤷ���ҥץ�����¸�ߤ��ʤ����¨�¤� nil �ǽ�λ���ޤ�)��

    pid = fork {
      # child
      sleep 3
    }

    th = Process.detach(pid)
    p th.value

    # => nil
#@end

#@since 1.8.0
--- exit([status])

�ؿ� [[m:Kernel#exit]] ��Ʊ���Ǥ���
#@end

--- exit!([status])

�ؿ� [[m:Kernel#exit!]] ��Ʊ���Ǥ���

--- fork
--- fork { ... }

�ؿ� [[m:Kernel#fork]] ��Ʊ���Ǥ���

#@since 1.8.5
--- getrlimit(resource)
--- setrlimit(resource, cur_limit, max_limit)
--- setrlimit(resource, limit)

resource �Ǽ����ץ����꥽�����������ͤμ����������Ԥ��ޤ���

Process.setrlimit �ˤ�����ñ��� limit �����ꤵ�줿���ˤϡ�
cur_limit, max_limit ��ξ���������ͤȤ��ƻ��ꤵ�줿��ΤȤ��ư����ޤ���
�����ΰ����ˤϡ�resource �ˤ�äƷ�ޤ��̣����Ĳ��餫�������⤷����
[[m:Process::RLIM_INFINITY]],
[[m:Process::RLIM_SAVED_CUR]],
[[m:Process::RLIM_SAVED_MAX]] �Τ����줫����ꤷ�ޤ���

resource �˻��ꤹ���ͤϴĶ��ˤ��ޤ������ʲ��Τ����줫�Ǥ���
�����ƥ�ˤ�äƤϤ����Τ����Ĥ���¸�ߤ��ʤ���礬����ޤ���
�ܺ٤ϡ�[[man:setrlimit(2)]] �򻲾Ȥ��Ƥ���������

  * [[m:Process::RLIMIT_CORE]] core �ե�����Υ����� (�Х���) (SUSv3)
  * [[m:Process::RLIMIT_CPU]] �ץ����� CPU ���� (��) (SUSv3)
  * [[m:Process::RLIMIT_DATA]] �ץ����Υǡ����ΰ�Υ����� (�Х���) (SUSv3)
  * [[m:Process::RLIMIT_FSIZE]] �ץ�������������ե�����Υ����� (�Х���) (SUSv3)
  * [[m:Process::RLIMIT_NOFILE]] �ץ����������ץ�Ǥ���ե�����ο� (SUSv3)
  * [[m:Process::RLIMIT_STACK]] �ץ����Υ����å��ΰ�Υ����� (�Х���) (SUSv3)
  * [[m:Process::RLIMIT_AS]] �ץ����β��ۥ��ꥵ���� (�Х���) (SUSv3, NetBSD, FreeBSD, OpenBSD but 4.4BSD-Lite))
  * [[m:Process::RLIMIT_MEMLOCK]] mlock(2) �ǥ�å��Ǥ���ȡ�����Υ����� (�Х���) (4.4BSD, GNU/Linux)
  * [[m:Process::RLIMIT_NPROC]] ���Υ桼���Υץ����κ���� (4.4BSD, GNU/Linux)
  * [[m:Process::RLIMIT_RSS]] ���ѤǤ���¥���κ��祵���� (�Х���) (4.2BSD, GNU/Linux)
  * [[m:Process::RLIMIT_SBSIZE]] �����åȥХåե��Υ����� (�Х���) (NetBSD, FreeBSD)

getrlimit �ϡ�2�ͤ����� [cur_limit, max_limit]
���֤��ޤ���
setrlimit �ϡ������˻��ꤷ���ͤ����ꤷ��nil ���֤��ޤ���

�꥽�����������ͤμ���������˼��Ԥ�����硢�㳰 [[c:Errno::EXXX]]
��ȯ�����ޤ���

�ʲ������ RLIMIT_CORE �����¤� hard limit (max limit) �ޤǰ����夲����ǽ�ʤ� core ��Ĥ��褦�ˤ��ޤ���

  Process.setrlimit(Process::RLIMIT_CORE, 
                    Process.getrlimit(Process::RLIMIT_CORE)[1])

#@end

#@since 1.9.0
--- spawn(cmd, [, arg, ...])

�ؿ� [[m:Kernel#spawn]] ��Ʊ���Ǥ���
#@end

== Module Functions

--- egid

�����ȥץ����μ¸����롼�� ID ���֤��ޤ���

--- egid=(gid)

�����ȥץ����μ¸����롼�� ID �����ꤷ�ޤ���gid ���֤��ޤ���

--- euid

�����ȥץ����μ¸��桼�� ID ���֤��ޤ���

--- euid=(uid)

�����ȥץ����μ¸��桼�� ID �����ꤷ�ޤ���uid ���֤��ޤ���

--- gid

�����ȥץ����μ¥��롼�� ID ���֤��ޤ���

--- gid=(gid)

�����ȥץ����μ¥��롼�� ID �����ꤷ�ޤ���gid ���֤��ޤ���

--- groups

������롼�� ID ��������֤��ޤ�(�¸����롼�� ID ��ޤफ���Τ�ޤ���)��

�֤��������κ������ǿ��� 32 ����Ǥ�(���֤�bug)��

--- groups=(gid_ary)

������롼�פ����ꤷ�ޤ������դ���������Ǥϥ��롼�� ID �����롼��
̾����ꤷ�ޤ���Process.groups �η�̤��֤��ޤ���

���ꤹ��������롼�� ID �ο��� [[m:Process#Process.maxgroups]] ��
����ۤ��Ƥ����硢�㳰 [[c:ArgumentError]] ��ȯ�����ޤ���

--- maxgroups
--- maxgroups=(num)

����Ǥ���������롼�� ID �ο�����ꤷ�ޤ����ºݤ��֤����������롼
�� ID �ο����⾯�ʤ��ͤ����ꤷ�Ƥ���ȡ�
[[m:Process#Process.groups]] ���㳰��ȯ�����ޤ���

--- pid

�����ȥץ����Υץ��� ID ���֤��ޤ����ѿ� [[m:$$]]
���ͤ�Ʊ���Ǥ���

--- ppid

�ƥץ����Υץ��� ID ���֤��ޤ���UN*X �Ǥϼºݤοƥץ�������
λ������� ppid �� 1 (init�� pid)�ˤʤ�ޤ���

--- uid

�ץ����μ¥桼�� ID ���֤��ޤ���

--- uid=(uid)

�ץ����μ¥桼�� ID �����ꤷ�ޤ���uid ���֤��ޤ���

--- getpgid(pid)
--- getpgrp([pid])

pid �Υץ����Υץ������롼�פ��֤��ޤ���pid �� 0
�λ����ά���줿���ϥ����ȥץ������̣���ޤ���

�ץ������롼�פμ����˼��Ԥ������ϡ��㳰 [[c:Errno::EXXX]] ��
ȯ�����ޤ���
#@# 1.6.7 �ޤǤϡ�getpgid() ���㳰��ȯ�������Ƥ��ޤ���Ǥ�����
#@# p Process.getpgid(1000000) # => -1

--- getpriority(which, who)

�ץ������ץ������롼�ס��桼���θ��ߤΥץ饤����ƥ�����
���ޤ� ([[man:getpriority(2)]] ����)��

Process �⥸�塼��� which �Ȥ��ƻ���Ǥ������
[[m:Process::PRIO_PROCESS]], [[m:Process::PRIO_PGRP]],
[[m:Process::PRIO_USER]] ��������Ƥ��ޤ���

who �ˤϡ�which ���ͤˤ������äƥץ��� ID���ץ���
���롼�� ID���桼�� ID �Τ����줫����ꤷ�ޤ���

�ץ饤����ƥ��μ����˼��Ԥ������ϡ��㳰 [[c:Errno::EXXX]] ��ȯ
�����ޤ���

#@since 1.8.0
--- initgroups(user, group)
#@todo

[[man:initgroups(3)]] ����
#@end

--- kill(signal, pid ... )

pid �ǻ��ꤵ�줿�ץ����˥����ʥ������ޤ���signal
�ϥ����ʥ��ֹ椫̾��(ʸ����ޤ���[[c:Symbol]])�ǻ��ꤷ�ޤ���

����ͤ���ĥ����ʥ�(���뤤�ϥ����ʥ�̾������-)�⤷����
����ͤ���ĥץ����ֹ��Ϳ����ȥץ����ǤϤʤ��ץ������롼�פ˥����ʥ������ޤ���
����ͤΥץ����ֹ�ϥץ������롼���ֹ�����ȿž������Τȸ��ʤ���ޤ���

���ƤΥ����ʥ�����������������硢���ꤷ�� pid �ο����֤��ޤ���
���Ԥ��������㳰 [[c:Errno::EXXX]] ��ȯ�����ޤ���

¸�ߤ��ʤ������ʥ����ꤷ������
�㳰 [[c:ArgumentError]] ��ȯ�����ޤ���

#@#�ʤ���Windows ([[unknown:mswin32]], [[unknown:mingw32]])�Ǥϡ�INT
#@#ILL FPE SEGV TERM BREAK ABRT ��������Ǥ��ޤ���((<ruby 1.7 feature>))
#@#KILL �����Ǥ��ޤ�

[[m:Kernel#trap]]�⻲�Ȥ��Ƥ���������

#@since 1.8.0
--- setpgrp
#@else
--- setpgrp(pid, pgrp)
#@end
--- setpgid(pid, pgrp)

pid �Υץ������롼�פ����ꤷ�ޤ���
pid �� 0 �λ��ϥ����ȥץ������̣���ޤ���

�ץ������롼�פ������������������ 0 ���֤��ޤ���
���Ԥ��������㳰 [[c:Errno::EXXX]] ��ȯ�����ޤ���

#@since 1.8.0
Process.setpgrp �ϡ���������ޤ���
#@end

--- setpriority(which, who, prio)

�ץ������ץ������롼�ס�
�桼���θ��ߤΥץ饤����ƥ������ꤷ�ޤ�
([[man:setpriority(2)]] ����)��

Process �⥸�塼��� which �Ȥ��ƻ���Ǥ������
[[m:Process::PRIO_PROCESS]], [[m:Process::PRIO_PGRP]],
[[m:Process::PRIO_USER]] ��������Ƥ��ޤ���

who �ˤϡ�which ���ͤˤ������äƥץ��� ID���ץ���
���롼�� ID���桼�� ID �Τ����줫����ꤷ�ޤ���

prio �ˤϡ�-20 ���� 20 ���ͤ����ꤷ�ޤ���
�������ͤϥץ饤����ƥ����⤤���Ȥ��̣����
�礭���ͤϥץ饤����ƥ����㤤���Ȥ��̣���ޤ���

�ץ饤����ƥ�������������������� 0 ���֤��ޤ���
���Ԥ��������㳰 [[c:Errno::EXXX]] ��ȯ�����ޤ���

�ʲ�����ϸƤӽФ����ץ������ȤΥץ饤����ƥ��� 10 �˲����ޤ���
���Ǥ� 10 ����ץ饤����ƥ����㤯��
Errno::EACCES �Ȥʤä����ˤ�̵�뤷�Ƽ¹Ԥ�³���ޤ���

  begin
    Process.setpriority(Process::PRIO_PROCESS, 0, 10)
  rescue Errno::EACCES
  end

--- setsid

���������å�����������ơ�tty ���ڤ�Υ���ޤ����ǡ������ñ�˺�
�뤳�Ȥ��Ǥ��ޤ������å���� ID ���֤��ޤ���

���å����κ����˼��Ԥ������ϡ��㳰 [[c:Errno::EXXX]] ��ȯ�����ޤ���

#@since 1.8.0
--- times

���ȤΥץ����Ȥ��λҥץ��������񤷤��桼��/�����ƥ� CPU ���֤��ѻ���
[[c:Struct::Tms]] ���֥������Ȥ��֤��ޤ���
Struct::Tms �ϰʲ��Υ��Ф���Ĺ�¤�Υ��饹�Ǥ���

  utime           # user time
  stime           # system time
  cutime          # user time of children
  cstime          # system time of children

���֤�ñ�̤��äǡ���ư����������Ϳ�����ޤ���
�ܺ٤� [[c:Struct::Tms]] �򻲾Ȥ��Ƥ���������
#@end

--- wait
--- wait2

�ҥץ�������λ����Τ��Ԥ�����λ�����ҥץ����� pid ���֤��ޤ���
�ҥץ�������Ĥ�ʤ�����㳰 [[c:Errno::ECHILD]] ��
ȯ�����ޤ���

wait2 �ϡ���������ͤ� pid �� [[m:$?]] ������Ǥ�
�����������ۤʤ�ޤ���

#@since 1.8.0
Ruby 1.8 ����� $? ��[[c:Process::Status]] ���֥������ȤǤ���
Process.wait �� Process.waitpid �μ��Τ�Ʊ����Τˤʤ�ޤ�����
Process.wait2 �� Process.waitpid2 �μ��Τ�Ʊ����Τˤʤ�ޤ�����
#@end

#@since 1.8.0
--- waitall

���Ƥλҥץ�������λ����Τ��Ԥ��ޤ���

��λ�����ҥץ����� pid �Ƚ�λ���ơ�����
([[c:Process::Status]]) ����������Ǥ˻���������֤��ޤ���
�ҥץ��������ʤ����֤Ǥ��Υ᥽�åɤ�ƤӽФ��ȶ���������֤��ޤ���

[[m:$?]] �ˤϺǸ�˽�λ�����ҥץ����ν�λ���ơ�������
���ꤵ��ޤ���

��:
    3.times {|n|
      Process.fork() { exit n }
    }
    p ret = Process.waitall
    p ret[-1][1]  , ret[-1][1].class
    p $?          , $?.class
    => [[5245, 256], [5244, 0], [5243, 512]]
       512
       Process::Status
       512
       Process::Status
#@end

--- waitpid(pid[, flags])
--- waitpid2(pid[, flags])

pid �ǻ��ꤵ�������λҥץ����ν�λ���Ԥ������Υץ�����
��λ�������� pid ���֤��ޤ����ҥץ�����¸�ߤ��ʤ�����㳰
[[c:Errno::ECHILD]] ��ȯ�����ޤ���

flags �ˤϡ�Process �⥸�塼������
[[m:Process::WNOHANG]](�Υ�֥�å��󥰥⡼��)��
[[m:Process::WUNTRACED]] �������¤���ꤷ�ޤ���
��ά�����Ȥ����ͤ� 0 �Ǥ���

�Υ�֥�å��󥰥⡼�ɤǻҥץ������ޤ���λ���Ƥ��ʤ����ˤ�
nil ���֤��ޤ���[[man:waitpid(2)]] ��
[[man:wait4(2)]] �μ�������Ƥ��ʤ��ޥ���Ǥ�
flags �Ϥ��Ĥ� nil �ޤ��� 0 ����ꤹ��ɬ�פ�����ޤ���

waitpid2 �ϡ���������ͤ� pid �� [[m:$?]] ������
�Ǥ������������ۤʤ�ޤ���

#@since 1.8.0
Ruby 1.8.0 ����� $? �� [[c:Process::Status]] ���֥������ȤǤ���
Process.wait �� Process.waitpid �μ��Τ�Ʊ����Τˤʤ�ޤ�����
Process.wait2 �� Process.waitpid2 �μ��Τ�Ʊ����Τˤʤ�ޤ�����
#@end

== Constants

--- PRIO_PROCESS

[[m:Process#Process.getpriority]] �ޤ���
[[m:Process#Process.setpriority]] �Υץ����ץ饤����ƥ����ꡣ

--- PRIO_PGRP

�ץ������롼�ץץ饤����ƥ���

--- PRIO_USER

�桼���ץ饤����ƥ���

--- RLIMIT_AS

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_CORE

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_CPU

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_DATA

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_FSIZE

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_MEMLOCK

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_NOFILE

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_NPROC

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_RSS

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_SBSIZE

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIMIT_STACK

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIM_INFINITY

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIM_SAVED_CUR

[[m:Process#Process.getrlimit]] ���ȡ�

--- RLIM_SAVED_MAX
#@todo

[[m:Process#Process.getrlimit]] ���ȡ�

--- WNOHANG

[[m:Process#waitpid]] ����������˻��ꤹ��ե饰�Ǥ���
��λ�����ҥץ������ʤ����� waitpid ���֥�å����ޤ���

--- WUNTRACED

[[m:Process#waitpid]] ����������˻��ꤹ��ե饰�Ǥ���
�ҥץ�������ߤˤ�ꥹ�ơ���������𤷤Ƥ��ʤ�
�ҥץ������������ waitpid ���֥�å����ޤ���

#@since 1.8.0
#@include(Process__Status.rd)
#@include(Process__UID.rd)
#@include(Process__GID.rd)
#@include(Process__Sys.rd)
#@end
