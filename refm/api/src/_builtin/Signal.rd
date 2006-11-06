#@since 1.8.0
= module Signal

UNIX �Υ����ʥ��Ϣ������Ԥ��⥸�塼��Ǥ���

== Module Functions

--- list

�����ʥ�̾�ȥ����ʥ��ֹ���б��Ť��� [[c:Hash]] ���֥������Ȥ��֤�
�ޤ���

��:

  p Signal.list   # => {"WINCH"=>28, "PROF"=>27, ...}
#@end

#@since 1.8.0
--- trap(signal, command)
--- trap(signal) { ... }

signal �ǻ��ꤵ�줿�����ߤˤ�������ϥ�ɥ�Ȥ���
command ����Ͽ���ޤ���signal �ϥ����ʥ�̾��
ʸ���� [[c:Symbol]]���ޤ��ϥ����ʥ��ֹ�ǻ��ꤷ�ޤ���
��������̤��ͤȤ��� 0 �ޤ��� "EXIT" ������Ǥ��ޤ���
����ϡ֥ץ����ν�λ���פ�ɽ���ޤ���

command ��ʸ����ޤ��ϥ֥�å��ǻ��ꤷ�ޤ���
nil����ʸ����""��"SIG_IGN" �ޤ���
"IGNORE" ����ꤷ�����ϡ���ǽ�ʤ�Ф��Υ����ʥ��
̵�뤷�ޤ���
"SIG_DFL" �ޤ��� "DEFAULT" ����ꤷ�����ϡ�
�����ʥ�ϥ�ɥ��ǥե���Ȥ��ᤷ�ޤ���
"EXIT"����ꤷ�����ϡ������ʥ���������[[unknown:��λ����]]��
�Ԥä����ȥ��ơ����� 0 �ǽ�λ���ޤ���

�����Ĥ��Υ����ʥ���Ф��ơ�Ruby ���󥿥ץ꥿���㳰 [[c:Interrupt]] ��
[[c:SignalException]] ��ȯ�������ޤ������Τ褦�ʥ����ʥ���㳰�����ˤ��
����ª���뤳�Ȥ�Ǥ��ޤ���

��:

  begin
    Process.kill :QUIT, $$   # ���Ȥ�SIGQUIT������
  rescue SignalException
    puts "rescue #$!"
  end
  # => rescue SIGQUIT

trap �ˤ����ª���줿�����ʥ���㳰��ȯ�������ޤ���

trap ������� trap �����ꤷ���ϥ�ɥ���֤��ޤ���
�֥�å�����Ͽ���Ƥ����餽��� [[c:Proc]] ���֥�������
�Ȥ����֤��ޤ���ʸ����� "EXIT" �����ꤷ�Ƥ�������
������֤��ޤ���"IGNORE" �� "DEFAULT" ���Ф��Ƥ� nil
���֤��ޤ����ޤ���������Ͽ����Ƥ��ʤ��Ȥ��� nil
���֤��ޤ���

�ޤ���ruby �λ��Ȥߤγ��ǥ����ʥ�ϥ�ɥ餬��Ͽ���줿���
(�㤨�г�ĥ�饤�֥�꤬�ȼ��� sigaction ��Ƥ�����ʤ�)
�� nil ���֤��ޤ���

��:

  p Signal.trap(:INT, "p true")     # => nil
  p Signal.trap(:INT) { }           # => "p true"
  p Signal.trap(:INT, "SIG_IGN")    # => #<Proc:0x401b1328>
  p Signal.trap(:INT, "DEFAULT")    # => nil
  p Signal.trap(:INT, "EXIT")       # => nil
  p Signal.trap(:INT, nil)          # => "EXIT"

�����ƥ���������Ƥ��ʤ������ʥ�� trap �˻��ꤷ������
�㳰 [[c:ArgumentError]] ��ȯ�����ޤ����㤨�Хͥ��ƥ��֤�
Windows �����ƥ� (mswin32, mingw �ʤ�) ��ư�� ruby �Ǥ�
INT ILL FPE SEGV TERM BREAK ABRT EXIT �����������Ƥ��ޤ���

#@end
