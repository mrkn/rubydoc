= module FileTest

FileTest �ϥե�����θ����ؿ��򽸤᤿�⥸�塼��Ǥ������Υ⥸�塼
��ϥ��󥯥롼�ɤ��Ƥ�Ȥ��ޤ���

== Module Functions

--- blockdev?(filename)

filename ���֥�å����ڥ����ե�����Ǥ�����������֤��ޤ���

--- chardev?(filename)

filename ������饯�����ڥ����ե�����λ��������֤��ޤ���

--- executable?(filename)

filename ���¸��桼��/���롼�� ID �Ǽ¹ԤǤ�����������֤���
����

--- executable_real?(filename)

filename ���¥桼��/���롼�� ID �Ǽ¹ԤǤ�����������֤��ޤ���

--- exist?(filename)

filename ��¸�ߤ�����������֤��ޤ���

--- exists?(filename)

filename ��¸�ߤ�����������֤��ޤ���
���Υ᥽�åɤ�obsolete�Ǥ���
[[m:FileTest.exist?]]��ȤäƲ�������

--- grpowned?(filename)

filename �Υ��롼�� ID ���¹ԥ��롼�� ID ������������������
���ޤ���

--- directory?(filename)

filename ���ǥ��쥯�ȥ�λ��������֤��ޤ���

--- file?(filename)

filaname ���̾�ե�����Ǥ�����������֤��ޤ���

#@since 1.8.4
--- identical?(filename1, filename2)

filaname1 �� filename2 ��Ʊ���ե������ؤ��Ƥ�����������֤��ޤ���

(ruby 1.8.3 �����Ǥ�[[m:Kernel#test]](?-, filename1, filename2)��ȤäƤ���������)

��:

  open("a", "w") {}
  p File.identical?("a", "a")      #=> true
  p File.identical?("a", "./a")    #=> true
  File.link("a", "b")
  p File.identical?("a", "b")      #=> true
  File.symlink("a", "c")
  p File.identical?("a", "c")      #=> true
  open("d", "w") {}
  p File.identical?("a", "d")      #=> false
#@end
--- pipe?(filename)

filename ��̾���Ĥ��ѥ���(FIFO)�Ǥ�����������֤��ޤ���

--- socket?(filename)

filename �������åȤǤ�����������֤��ޤ���

--- owned?(filename)

filename ����ʬ�Τ�ΤǤ�����˿����֤��ޤ���

--- readable?(filename)

filename ���ɤ߹��߲�ǽ�ʻ��˿����֤��ޤ���

--- readable_real?(filename)

filename ���¥桼��/�¥��롼�פˤ�ä��ɤ߹��߲�ǽ�ʻ��˿���
�֤��ޤ���

--- setuid?(filename)

filename �� [[man:setuid(2)]] ����Ƥ�����˿�����
���ޤ���

--- setgid?(filename)

filename �� [[man:setgid(2)]] ����Ƥ�����˿�����
���ޤ���

--- size(filename)

filename �Υ��������֤��ޤ���filename ��¸�ߤ��ʤ����
�㳰 [[c:Errno::EXXX]](�����餯 Errno::ENOENT)��ȯ�����ޤ���

[[m:FileTest.size?]], [[m:FileTest.zero?]] �⻲
�Ȥ��Ƥ���������

--- size?(filename)

filename �Υ��������֤��ޤ���filename ��¸�ߤ��ʤ�����
filename �Υ�������0�λ��ˤ� nil ���֤��ޤ���

[[m:FileTest.size]], [[m:FileTest.zero?]] �⻲��
���Ƥ���������

--- sticky?(filename)

filename �� sticky �ӥå�([[man:chmod(2)]] ����)��
Ω�äƤ�����˿����֤��ޤ���

--- symlink?(filename)

filename ������ܥ�å���󥯤Ǥ�����������֤��ޤ���

--- writable?(filename)

filename ���񤭹��߲ĤǤ�����������֤��ޤ���

--- writable_real?(filename)

filename ���¥桼��/�¥��롼�פˤ�äƽ񤭹��߲ĤǤ��������
���֤��ޤ���

--- zero?(filename)

filename ��¸�ߤ��ơ����Υ������� 0 �Ǥ�����������֤��ޤ���
filename ��¸�ߤ��ʤ����� false ���֤��ޤ���

[[m:FileTest.size]], [[m:FileTest.size?]], �⻲
�Ȥ��Ƥ���������

#@since 1.9.0
--- world_readable?(filename)
#@todo
--- world_writable?(filename)
#@todo
#@end
