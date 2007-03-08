= class Tempfile < File
#@#= class Tempfile < DelegateClass(File)

�ƥ�ݥ��ե���������뤿��Υ��饹�Ǥ���

 * �ƥ�ݥ��ե������������ޤ���
   �ե������ "w+" �⡼�ɤ� "basename.pid.n" �Ȥ���̾���ˤʤ�ޤ���
 * Tempfile ���֥������Ȥ� IO ���֥������Ȥ�Ʊ���褦�˻Ȥ����Ȥ��Ǥ��ޤ���
 * Tempfile#close(true) �ˤ�ꡢ���������ƥ�ݥ��ե�����Ϻ������ޤ���
 * ������ץȤ���λ����Ȥ��ˤ�������ޤ���
 * Tempfile#open �ˤ�ꡢ�ƥ�ݥ��ե������ƥ����ץ󤹤뤳�Ȥ��Ǥ��ޤ���
 * �ƥ�ݥ��ե�����Υ⡼�ɤ� 0600 �Ǥ���

== Class Methods

--- new(basename, tempdir = Dir::tmpdir)
--- open(basename, tempdir = Dir::tmpdir)
#@todo

"basenamepid.n" �Ȥ����ե�����̾��
�ƥ�ݥ��ե����������������󥹥��󥹤��֤��ޤ���

@param tempdir �ƥ�ݥ��ե����뤬�����ǥ��쥯�ȥ�Ǥ���
���Υǥե�����ͤϡ� Dir::tmpdir[[m:Dir.tmpdir]] ���ͤȤʤ�ޤ���

== Instance Methods

--- close(real = false)
#@todo

�ƥ�ݥ��ե�����򥯥������ޤ���
real �����Ǥʤ���С��ƥ�ݥ��ե�����Ϥ����˺������ޤ���
�����Ǥʤ���С�GC �ˤ�äƺ������ޤ���

--- open
#@todo

�����������ƥ�ݥ��ե������ƥ����ץ󤷤ޤ���
"r+" �ǥ����ץ󤵤��Τǡ��������������Ƥ�����ɤ�
���Ȥ��Ǥ��ޤ���

--- path
#@todo

�ƥ�ݥ��ե�����Υѥ�̾���֤��ޤ���

#@since 1.6.8
--- length
--- size
�ƥ�ݥ��ե�����Υ��������֤��ޤ���

  tf = Tempfile.new("foo")
  tf.print("bar,ugo")
  p tf.size # => 7
  tf.close
  p tf.size # => 0
#@end

--- close!
#@todo

Closes and unlinks the file.

--- delete
--- unlink
#@todo

Unlinks the file. On UNIX-like systems, it is often a good idea
to unlink a temporary file immediately after creating and opening
it, because it leaves other programs zero chance to access the
file.
