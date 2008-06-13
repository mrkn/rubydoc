Telnet�ץ�ȥ���򰷤��饤�֥��Ǥ���

= class Net::Telnet < SimpleDelegator

=== ������

  require 'net/telnet'
  
  # ��⡼�ȥۥ��� foobar ����³
  telnet = Net::Telnet.new("Host" => "foobar") {|c| print c}
  
  # ������
  telnet.login("your name", "your password") {|c| print c}
  # ������塢�ץ��ץȤ��Ф�ޤ��Ԥ���碌��
  
  telnet.cmd("ls") {|c| print c}
  # ���ޥ�ɼ¹Ը塢�ץ��ץȤ��Ф�ޤ��Ԥ���碌��
  
  # ����ʣ������
  telnet.cmd("sleep 5 && echo foobar &") {|c| print c}
  
  STDOUT.flush # <- ���줬�ʤ��Ȥ����ޤǽ�������Ƥ뤳�Ȥ��狼��ˤ���
  
  # ���Υ��ޥ�ɤν��Ϥ��Ԥ���碌��
  telnet.waitfor(/foobar\Z/) {|c| print c}
  
  # �����󥻥å����ν�λ
  telnet.cmd("exit") {|c| print c}
  telnet.close


Net::Telnet �Υ��󥹥��󥹤ϡ������åȤΥ᥽�åɤ�delegate���ޤ�(�㤨
�С����å���󤬽���ä���� close ��¹Ԥ��������ɤ��Ǥ��礦)��

== Class Methods

--- new(opts)
#@todo

Telnet ���֥������Ȥ��������ޤ������ΤȤ���⡼�ȥۥ��Ȥؤ���³��Ԥ���
����opts �ˤ� Telnet ���֥������Ȥ����ꤹ��ʲ��Υ��ץ�����ϥ�
����ǻ��ꤷ�ޤ������ץ����Ͼ�ά���ˤϤ��줾�챦�˼����ǥե�����ͤ�
Ŭ�Ѥ���ޤ���

 "Host"       => "localhost"
 "Port"       => 23
 "Prompt"     => /[$%#>] \z/n
 "Timeout"    => 10  # ��³�Ԥ������ॢ������(sec)
 "Waittime"   => 0   # Prompt ���Ԥ���碌����֡������ͤ� nil �ˤ��ƤϤ����ޤ���
 "Binmode"    => false
 "Telnetmode" => true
 "Output_log" => nil # ���ϥե�����̾
 "Dump_log"   => nil # ���ϥե�����̾
 "Proxy"      => nil # Net::Telnet �ޤ��� IO �Υ��֥������Ȥ���ꤹ��

�������줿���󥹥��󥹤� [[c:TCPSocket]] ���뤤�� "Proxy" �ǻ��ꤷ����
�֥������Ȥ����ĥ᥽�åɤ�����դ��ޤ�([[c:SimpleDelegator]]�ˤ��
delegate�����)��

"Timeout" �ǻ��ꤷ�����֤ޤǤ���³�Ǥ��ʤ���� [[c:TimeoutError]] �㳰
��ȯ�����ޤ���

"Waittime" �� [[unknown:"net/telnet"/Net::Telnet#waitfor]] �᥽�åɤ� "Waittime" �Υǥե�
����ͤˤʤ�ޤ���waitfor �᥽�åɤΥץ��ץ��Ԥ���碌�ν����ϡ���⡼
�ȥۥ��Ȥ���ν��Ϥ� "Prompt" �ǻ��ꤷ������ɽ���˥ޥå����Ƥ���
"Waittime" ���ԤäƤ���Ϥ��ʤ����ɤ�����Ƚ�Ǥ���ޤ���
waitfor �᥽�åɤ� [[unknown:"net/telnet"/Net::Telnet#cmd]] �� [[unknown:"net/telnet"/Net::Telnet#login]]
�������Ǥ���Ѥ���Ƥ��ޤ���

�֥�å�����ꤷ����硢��³����
  "Trying #{�ۥ���̾} ...\n"
��³���
  "Connected to #{�ۥ���̾}.\n"
�Ȥ���ʸ���������ˤ��줾��֥�å���¹Ԥ��ޤ���

== Instance Methods

--- login(user[, password])
--- login("Name" => user, "Password" => password)
#@todo

�桼��̾ user, �ѥ���� password �ǥ����󤷤ޤ���
��⡼�ȥۥ��Ȥ��ʲ��Υץ��ץȤǥ桼��̾���ѥ���ɤ����Ϥ��׵᤹��
���Ȥ���Ԥ��Ƥ��ޤ���

  xxxlogin:
  Password:

�����Ŭ�礷�ʤ����ϡ���ʬ���㤨�аʲ��Τ褦�˥������Ԥ�ɬ�פ���
��ޤ���

  # ��������ˤ����ʤ�ѥ���ɤ��䤤��碌�������
  telnet = Net::Telnet.new("Host"=>"localhost") {|c| print c}
  telnet.waitfor(/Password[: ]*\z/n) {|c| print c}
  telnet.cmd("your password")

�֥�å�����ꤷ����硢����ʸ���������˥֥�å����༡�¹Ԥ��ޤ���

--- waitfor(match)
--- waitfor("Match" => match, "Timeout" => timeout, "Waittime" => waittime)
#@todo

����ɽ�� match �ǻ��ꤷ��ʸ���󤬽��Ϥ����ޤ��Ԥ���碌�ޤ���
match ������� "String" �򥭡���ʸ�������ꤷ����硢
��⡼�ȥۥ��Ȥ���ν��Ϥˤ���ʸ���󤬸����ޤ��Ԥ���碌�ޤ���

timeout �ԤäƤⲿ����Ϥ��ʤ���� [[c:TimeoutError]] �㳰��ȯ��
���ޤ���

timeout, waittime �Υǥե�����ͤ� new �ǻ��ꤷ��
"Timeout", "Waittime" ���ͤǤ���

�֥�å�����ꤷ����硢����ʸ���������˥֥�å����༡�¹Ԥ��ޤ���

--- cmd(string)
--- cmd("String" => string, "Match" => match, "Timeout" => timeout)
#@todo

string ������դ��ǥ�⡼�ȥۥ��Ȥ����ꡢ���Υץ��ץ�
match �����Ϥ����ޤ��Ԥ��ޤ���

match �Υǥե�����ͤ� new �ǻ��ꤷ�� "Prompt" ���ͤǤ���
timeout �Υǥե�����ͤ� new �ǻ��ꤷ�� "Timeout" ���ͤǤ���

�֥�å�����ꤷ����硢����ʸ���������˥֥�å����༡�¹Ԥ��ޤ���

--- puts(string)
#@todo

string ����Ԥ��դ��ƥ�⡼�ȥۥ��Ȥ�����ޤ���

--- telnetmode
--- telnetmode(bool)
--- telnetmode=(bool)
#@todo
    ...

--- binmode
--- binmode(bool)
--- binmode=(bool)
#@todo
    ...

--- sock
#@todo

��⡼�ȥۥ��Ȥ���³���Ƥ��� IO ���֥������Ȥ��֤��ޤ���


--- preprocess(string)
#@todo

--- print(string)
#@todo

--- write(string)
#@todo


== Constants

--- IAC
--- DONT
--- DO
--- WONT
--- WILL
--- SB
--- GA
--- EL
--- EC
--- AYT
--- AO
--- IP
--- BREAK
--- DM
--- NOP
--- SE
--- EOR
--- ABORT
--- SUSP
--- EOF
--- SYNCH
--- OPT_BINARY
--- OPT_ECHO
--- OPT_RCP
--- OPT_SGA
--- OPT_NAMS
--- OPT_STATUS
--- OPT_TM
--- OPT_RCTE
--- OPT_NAOL
--- OPT_NAOP
--- OPT_NAOCRD
--- OPT_NAOHTS
--- OPT_NAOHTD
--- OPT_NAOFFD
--- OPT_NAOVTS
--- OPT_NAOVTD
--- OPT_NAOLFD
--- OPT_XASCII
--- OPT_LOGOUT
--- OPT_BM
--- OPT_DET
--- OPT_SUPDUP
--- OPT_SUPDUPOUTPUT
--- OPT_SNDLOC
--- OPT_TTYPE
--- OPT_EOR
--- OPT_TUID
--- OPT_OUTMRK
--- OPT_TTYLOC
--- OPT_3270REGIME
--- OPT_X3PAD
--- OPT_NAWS
--- OPT_TSPEED
--- OPT_LFLOW
--- OPT_LINEMODE
--- OPT_XDISPLOC
--- OPT_OLD_ENVIRON
--- OPT_AUTHENTICATION
--- OPT_ENCRYPT
--- OPT_NEW_ENVIRON
--- OPT_EXOPL
--- NULL
--- CR
--- LF
--- EOL
--- REVISION
#@todo

