= class SignalException < Exception

[[m:Kernel#trap]] ����Ƥ��ʤ������ʥ�([[man:signal(2)]]
����)�������ä��Ȥ���ȯ�����ޤ���

�ºݤ�ȯ�����������ʥ�̾�ϡ�
[[m:SignalException#message]] ����
"SIGname"�Ȥ������������ޤ���

#@# 2001/04/03 00:17 ����
�ǥե���Ȥξ��֤Ǥϡ��ʲ��Υ����ʥ뤬 SignalException ��ȯ����
���ޤ���

  SIGHUP, SIGQUIT, SIGALRM, SIGUSR1, SIGUSR2

�ޤ���SIGINT �� �㳰 [[c:Interrupt]] ��ȯ�������ޤ���
