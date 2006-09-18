ftools

=== ���

1.8 �ʹߤǤϡ�ftools �����ѤϿ侩���ޤ��󡣥ե��������򤹤�ˤ� [[lib:fileutils]] ��ȤäƤ���������

=== ����
require 'ftools' �Ȥ���ȡ��ե�����Υ��ԡ������ʤɤΥ᥽�åɤ��ɲä���ޤ���
to �Ͽ����ʥե�����̾���ǥ��쥯�ȥ�̾�Ǥ���
verbose �����ΤȤ���ɸ�२�顼���Ϥ˽����ηв᤬�Фޤ���

= reopen File

== Class Methods

--- copy(from, to[, verbose = false])
--- cp(from, to[, verbose = false])

�ե�����򥳥ԡ����ޤ���������Τˤ� from ���ɤ�� to
�˽񤭡��⡼�ɤ��ѹ����ޤ����ե�����ι�������ϥ��ԡ���������˹�
������ޤ���

�㤨�С�����������ݻ�����������

  File.copy(from, to)
  stat = File.stat(from)
  File.utime(stat.atime, stat.mtime, to)

�ʤɤȤ��ޤ���
���ԡ������������ʤ� ture�����Ԥ����ʤ� false ���֤��ޤ���

--- move(from, to[, verbose = false]) 
--- mv(from, to[, verbose = false])

�ե�������ư���ޤ���[[m:File.rename]] �Ȱۤʤ�ѡ��ƥ������
��ޤ������ư��Ǥ��ޤ���

��ư�����������ʤ� ture�����Ԥ����ʤ� false ���֤��ޤ���

--- compare(from, to[, verbose = false])
--- cmp(from, to[, verbose = false])

2�ĤΥե��������Ӥ��ޤ���
Ʊ���ʤ� true���ۤʤ�ʤ� false ���֤��ޤ���

--- safe_unlink(files[, ...][, verbose = false])
--- rm_f(files[, ...][, verbose = false])

(ʣ����)�ե�������ǽ�ʸ¤������ޤ�������Ǥ����ե�����ο���
�֤��ޤ���rm -f([[man:rm(1)]]) ���������ޤ���

--- makedirs(dirs[, ...][, verbose = false])
--- mkpath(dirs[, ...][, verbose = false])

(ʣ����)�ǥ��쥯�ȥ��������ޤ���¿���ؤΥѥ�����٤˺������뤳�Ȥ��ǽ�Ǥ���
�ǥ��쥯�ȥ꤬���ˤ���в��⤷�ޤ���
mkdir -p([[man:mkdir(1)]])���������ޤ���

--- chmod(mode, files[, ...][, verbose = false])

(ʣ����)�ե������°�����Ѥ��ޤ���
���ꥸ�ʥ�� [[m:File.chmod]] �� verbose �λ��꤬
�ɲä��������Ǥ���

--- install(from, to[, mode = nil[, verbose = false]])

�ե�����򥳥ԡ������⡼�ɤ����ꤷ�ޤ���
���ԡ��褬¸�ߤ�����ϰ�ö�������ޤ��Τǡ����ԡ���Υե����뤬
¾�Υե�����˥ϡ��ɥ�󥯤���Ƥ���С����Υ�󥯤��ڤ�ޤ���
install ([[man:install(1)]])���ޥ�ɤ��������ޤ���
