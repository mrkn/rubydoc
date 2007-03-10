require tmpdir

�ƥ�ݥ��ե���������뤿��Υ��饹�Ǥ�

= class Tempfile < File
#@#= class Tempfile < DelegateClass(File)

�ƥ�ݥ��ե���������뤿��Υ��饹�Ǥ���

 * �ƥ�ݥ��ե������������ޤ���
   �ե������ "w+" �⡼�ɤ� "basename.pid.n" �Ȥ���̾���ˤʤ�ޤ���
 * Tempfile ���֥������Ȥ�[[c:File]]���֥������Ȥ�Ʊ���褦�˻Ȥ����Ȥ��Ǥ��ޤ���
 * Tempfile#close(true) �ˤ�ꡢ���������ƥ�ݥ��ե�����Ϻ������ޤ���
 * ������ץȤ���λ����Ȥ��ˤ�������ޤ���
 * [[m:Tempfile#open]]�ˤ�ꡢ�ƥ�ݥ��ե������ƥ����ץ󤹤뤳�Ȥ��Ǥ��ޤ���
 * �ƥ�ݥ��ե�����Υ⡼�ɤ� 0600 �Ǥ���

== Class Methods

--- new(basename, tempdir = Dir::tmpdir)
--- open(basename, tempdir = Dir::tmpdir)

"basename.pid.n" �Ȥ����ե�����̾��
�ƥ�ݥ��ե����������������󥹥��󥹤��֤��ޤ���

@param tempdir �ƥ�ݥ��ե����뤬�����ǥ��쥯�ȥ�Ǥ���
���Υǥե�����ͤϡ�[[m:Dir.tmpdir]] ���ͤȤʤ�ޤ���

== Instance Methods

--- close(real = false)

�ƥ�ݥ��ե�����򥯥������ޤ���
real �����ʤ�С��ƥ�ݥ��ե������GC�ˤ�äƺ������ޤ���
�����Ǥʤ���С������˺������ޤ���

@param real false �⤷���Ϥ���ʳ�����ꤷ�ޤ���

--- open

�����������ƥ�ݥ��ե������ƥ����ץ󤷤ޤ���
"r+" �ǥ����ץ󤵤��Τǡ��������������Ƥ�����ɤ�
���Ȥ��Ǥ��ޤ���

  tf = Tempfile.new("foo")
  tf.print("foobar,hoge\n")
  tf.print("bar,ugo\n")
  tf.close
  tf.open
  p tf.gets # => "foobar,hoge\n"

--- path

�ƥ�ݥ��ե�����Υѥ�̾���֤��ޤ���

  tf = Tempfile.new("hoo")
  p tf.path # => "/tmp/hoo.10596.0" 

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
�ƥ�ݥ��ե�����򥯥������������˺�����ޤ���

--- delete
--- unlink
#@todo
�ƥ�ݥ��ե�����򥯥��������ˡ�������ޤ���
UNIX�饤���ʥ����ƥ�Ǥϡ�
���������ƥ�ݥ��ե����뤬¾�Υץ����˻��Ѥ���뵡���ʤ��������
�ƥ�ݥ��ե����������������ץ󤷤���
�����˺������Ȥ������Ȥ����Ф��Ф����ʤ��ޤ���

#@# Unlinks the file. On UNIX-like systems, it is often a good idea
#@# to unlink a temporary file immediately after creating and opening
#@# it, because it leaves other programs zero chance to access the
#@# file.

  tf = Tempfile.new("foo")
  tf.unlink
  p tf.path # => nil
  tf.print("foobar,hoge\n")
  tf.rewind
  p tf.gets("\n") # => "foobar,hoge\n"
