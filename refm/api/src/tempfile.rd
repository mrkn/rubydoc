= class Tempfile < DelegateClass(File)

�ƥ�ݥ��ե���������뤿��Υ��饹�Ǥ���

 * �ƥ�ݥ��ե������������ޤ����ե������ "w+" �⡼�ɤ� 
   "basename.pid.n" �Ȥ���̾���ˤʤ�ޤ���
 * Tempfile ���֥������Ȥ� IO ���֥������Ȥ�Ʊ���褦�˻Ȥ����Ȥ��Ǥ��ޤ���
 * Tempfile#close(true) �ˤ�ꡢ���������ƥ�ݥ��ե�����Ϻ������ޤ���
 * ������ץȤ���λ����Ȥ��ˤ�������ޤ���
 * Tempfile#open �ˤ�ꡢ�ƥ�ݥ��ե������ƥ����ץ󤹤뤳�Ȥ��Ǥ��ޤ���
 * �ƥ�ݥ��ե�����Υ⡼�ɤ� 0600 �Ǥ���

== Class Methods
--- new(basename[, tempdir])
--- open(basename[, tempdir])
"basenamepid.n" �Ȥ����ե�����̾��
�ƥ�ݥ��ե������������ޤ���

�ƥ�ݥ��ե�����ϡ��ǥ��쥯�ȥ� tempdir �˺�������ޤ���
���Υǥե�����ͤϡ�
        ENV['TMPDIR'] || ENV['TMP'] || ENV['TEMP'] || '/tmp'
�Ǥ���

== Instance Methods
--- close([real])
�ƥ�ݥ��ե�����򥯥������ޤ���
real�����Ǥʤ���С��ƥ�ݥ��ե�����Ϥ����˺������ޤ���
�����Ǥʤ���С�GC �ˤ�äƺ������ޤ���real�Υǥե�����ͤ�
false �Ǥ���

--- open
�����������ƥ�ݥ��ե������ƥ����ץ󤷤ޤ���
"r+" �ǥ����ץ󤵤��Τǡ��������������Ƥ�����ɤ�
���Ȥ��Ǥ��ޤ���

--- path
�ƥ�ݥ��ե�����Υѥ�̾���֤��ޤ���

#@if (version >= "1.8.0")
#@todo
#@# ���ΥС������������������?
--- length
--- size
�ƥ�ݥ��ե�����Υ��������֤��ޤ���
#@end

--- close!

Closes and unlinks the file.

--- delete
--- unlink

Unlinks the file. On UNIX-like systems, it is often a good idea
to unlink a temporary file immediately after creating and opening
it, because it leaves other programs zero chance to access the
file.

