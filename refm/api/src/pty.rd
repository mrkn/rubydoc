����ü��(Pseudo tTY)�򰷤��饤�֥��Ǥ���

= module PTY

����ü��(Pseudo tTY)�򰷤��⥸�塼��Ǥ���

== Module Functions

--- getpty(command)                          -> [IO, IO, Integer]
--- getpty(command){|read, write, pid| ... } -> nil
--- spawn(command)                           -> [IO, IO, Integer]
--- spawn(command){|read, write, pid| ... }  -> nil

���� tty ����ݤ������ꤵ�줿���ޥ�ɤ򤽤ε��� tty �θ������Ǽ¹Ԥ���������֤��ޤ���

���Υ᥽�åɤˤ�äƺ��줿���֥ץ�����ư���Ƥ���֡��ҥץ���
�ξ��֤�ƻ뤹�뤿��� SIGCHLD �����ʥ����ª���ޤ����ҥץ���
����λ��������ߤ������ˤϡ��㳰 [[c:PTY::ChildExited]] ��ȯ�����ޤ���
���δ֡����٤Ƥ� SIGCHLD �� PTY �⥸�塼��Υ����ʥ�ϥ�ɥ����ª�����Τǡ�
���֥ץ�������������¾�Υ᥽�å�([[m:Kernel.#system]] �� [[m:IO.popen]]�ʤ�)��
�Ȥ��ȡ�ͽ�����ʤ��㳰��ȯ�����뤳�Ȥ�����ޤ���������ɤ�����
�ˤϡ������� [[m:PTY.#protect_signal]] �򻲾Ȥ��Ƥ���������

���Υ᥽�åɤ��֥�å��դ��ǸƤФ줿���ˤϡ����Υ֥�å�
����ǤΤ� SIGCHLD ����ª����ޤ����������äơ��֥�å��ѥ�᡼��
�Ȥ����Ϥ��줿IO���֥������Ȥ򡢥֥�å��γ��˻����Ф��ƻȤ���
�ϴ�����ޤ���

@param command ���� tty ��Ǽ¹Ԥ��륳�ޥ��

@return ���ͤ�3�Ĥ����Ǥ���ʤ�����Ǥ����ǽ�����Ǥϵ��� tty ����
        �ɤ߽Ф������ IO ���֥������ȡ�2���ܤ����ǤϽ񤭤��ि��� IO ���֥������ȡ�
        3���ܤ����Ǥϻҥץ����Υץ��� ID �Ǥ���
        ���Υ᥽�åɤ��֥�å��դ��ƤФ줿��硢���������Ǥϥ֥�å��ѥ�᡼���Ȥ����Ϥ��졢
        �᥽�åɼ��Τ� nil ���֤��ޤ���

@raise PTY::ChildExited �ҥץ�������λ��������ߤ����ꤷ������ȯ�����ޤ���

@see [[m:Kernel.#system]], [[m:IO.popen]], [[m:PTY.#protect_signal]], [[man:signal(2)]]

#@until 1.9.2
--- protect_signal{ ... } -> self
���Υ᥽�åɤϲ��⤷�ޤ���
���Υ᥽�åɤ� obsolete �Ǥ���

--- reset_signal -> self
���Υ᥽�åɤϲ��⤷�ޤ���
���Υ᥽�åɤ� obsolete �Ǥ���
#@end

== Singleton Methods
#@since 1.9.2
--- check(pid, exc)
#@todo

--- open -> [IO, File]
--- open{|master_io, slave_file| ... } -> object
#@todo

#@end
#@since 1.8.0
= class PTY::ChildExited < RuntimeError

�ҥץ�������λ��������ߤ�������ȯ�������㳰�Ǥ���

== Instance Methods

--- status -> Process::Status

�ҥץ����ν�λ���ơ�������[[c:Process::Status]]���֥������Ȥ��֤��ޤ���
#@end

