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

#@since 1.8.7
�ƥ�ݥ��ե������������������ɽ�� Tempfile ���֥������Ȥ����������֤��ޤ���
�ե�����̾�Υץ�ե������ˤϻ��ꤵ�줿 basename ���Ȥ��ޤ���
�ե�����ϻ��ꤵ�줿 tempdir �˺���ޤ���
#@else
"basename.pid.n" �Ȥ����ե�����̾��
�ƥ�ݥ��ե����������������󥹥��󥹤��֤��ޤ���
#@end

@param basename �ե�����̾�Υץ�ե�������ʸ����ǻ��ꤷ�ޤ���
#@since 1.8.7
                ʸ������������ꤷ����硢��Ƭ�����Ǥ��ե�����̾�Υץ�ե��å������������Ǥ�
                ���ե��å����Ȥ��ƻȤ��ޤ���
#@end

@param tempdir �ƥ�ݥ��ե����뤬�����ǥ��쥯�ȥ�Ǥ���
               ���Υǥե�����ͤϡ�[[m:Dir.tmpdir]] ���ͤȤʤ�ޤ���


#@since 1.8.7
��:
   require "tempfile"
   t = Tempfile.open(['hoge', 'bar'])
   p t.path                            #=> "/tmp/hoge20080518-6961-5fnk19-0bar"
   t2 = Tempfile.open(['t', '.xml'])
   p t2.path                           #=> "/tmp/t20080518-6961-xy2wvx-0.xml"
#@end

== Instance Methods

--- close(real = false)

�ƥ�ݥ��ե�����򥯥������ޤ���
real �����ʤ�С��ƥ�ݥ��ե������GC�ˤ�äƺ������ޤ���
�����Ǥʤ���С������˺������ޤ���

@param real false �⤷���Ϥ���ʳ�����ꤷ�ޤ���

  tf = Tempfile.open("bar")
  tf.close
  p FileTest.exist?(tf.path) # => true

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

  tf = Tempfile.open("bar")
  tf.close!
  p FileTest.exist?(tf.path) # => false

--- delete
--- unlink

�ƥ�ݥ��ե�����򥯥��������ˡ�������ޤ���
UNIX�饤���ʥ����ƥ�Ǥϡ�
���������ƥ�ݥ��ե����뤬¾�Υץ����˻��Ѥ���뵡���ʤ�������ˡ�
�ƥ�ݥ��ե����������������ץ󤷤��塢
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
