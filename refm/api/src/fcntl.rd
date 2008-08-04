�ե�����ǥ�������ץ��򰷤� Unix �Υ����ƥॳ���� [[m:IO#fcntl]] (�Ĥޤ�
[[man:fcntl(2)]]) �ǻ��ѤǤ�������򽸤᤿�⥸�塼��Ǥ���


��:
    require "fcntl"
    m = s.fcntl(Fcntl::F_GETFL, 0)
    f.fcntl(Fcntl::F_SETFL, Fcntl::O_NONBLOCK|m)
    
    require 'fcntl'
    
    fd = IO::sysopen('/tmp/tempfile', 
         Fcntl::O_WRONLY | Fcntl::O_EXCL | Fcntl::O_CREAT)
    f = IO.open(fd)
    f.syswrite("TEMP DATA")
    
    f.close

= module Fcntl

�ե�����ǥ�������ץ��򰷤� Unix �Υ����ƥॳ���� [[m:IO#fcntl]]
(�Ĥޤ�[[man:fcntl(2)]]) �ǻ��ѤǤ�������򽸤᤿�⥸�塼��Ǥ���

@see [[man:fcntl(2)]], [[man:open(2)]], [[m:IO#fcntl]], [[m:IO.open]]

== Constants

--- F_DUPFD -> Integer
�ե�����ǥ�������ץ���ʣ�����ޤ���

�������� close-on-exec �ϥ��դˤʤ�ޤ���

@see [[man:dup(2)]]

--- F_GETFD -> Integer
�ե�����ǥ�������ץ����� close-on-exec �ե饰���ͤ��ɤ߽Ф��ޤ���

--- F_GETLK -> Integer
Ϳ����줿�ե�������ϰϤΥ�å����֤�������ޤ���

--- F_SETFD -> Integer
�ե�����ǥ�������ץ��� close-on-exec �ե饰���ͤ����ꤷ�ޤ���

--- F_GETFL -> Integer
�ե�������֥ե饰���ɤ߽Ф��ޤ���

@see [[man:open(2)]]

--- F_SETFL -> Integer
�ե�������֥ե饰�����ꤷ�ޤ���

@see [[man:open(2)]]

--- F_SETLK -> Integer
�ե�������ϰϤΥ�å���������ޤ���

--- F_SETLKW -> Integer
�ե�������ϰϤΥ�å���������ޤ���ɬ�פ�����Х�å�������Ǥ���ޤ��Ԥ��ޤ���

--- FD_CLOEXEC -> Integer
close-on-exec �ե饰���ͤǤ���

--- F_RDLCK -> Integer
�ɤ߽Ф��꡼����������ޤ���

--- F_UNLCK -> Integer
���Υե����뤫��꡼���������ޤ���

--- F_WRLCK -> Integer
�񤭹��ߥ꡼����������롣

--- O_CREAT -> Integer
�ե����뤬¸�ߤ��ʤ����˥ե������������ޤ���

--- O_EXCL -> Integer
�ե����뤬¸�ߤ�����˼��Ԥ��ޤ���[[m:Fcntl.OCREAT]] �Ȱ��˻��Ѥ��ޤ���

--- O_NOCTTY -> Integer
�������ե����뤬ü���ǥХ����Ǥ⡢����ü���ˤϤʤ�ޤ���

--- O_TRUNC -> Integer
�ե�����򳫤��Ȥ�����Ȥ��ڤ�ΤƤޤ���

--- O_APPEND -> Integer
�ե�������ɵ��⡼�ɤǳ����ޤ���

--- O_NONBLOCK -> Integer
--- O_NDELAY -> Integer
�ե������ non-blocking �⡼�ɤǳ����ޤ���

--- O_RDONLY -> Integer
�ե�������ɤ߹������Ѥǳ����ޤ���

--- O_RDWR -> Integer
�ե�������ɤ߽񤭤Ǥ���褦�˳����ޤ���

--- O_WRONLY -> Integer
�ե������񤭹������Ѥǳ����ޤ���

#@since 1.8.1
--- O_ACCMODE -> Integer
�ե����륢�������⡼�ɤΥޥ����Ǥ���
#@end

