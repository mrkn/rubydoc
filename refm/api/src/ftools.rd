�ե��������Τ���Υ饤�֥��Ǥ���

=== ���
1.8 �ʹߤǤϡ�ftools �����ѤϿ侩���ޤ��󡣥ե��������򤹤�ˤ� [[lib:fileutils]] ��ȤäƤ���������

=== ����
require 'ftools' �Ȥ���ȡ��ե�����Υ��ԡ������ʤɤΥ᥽�åɤ��ɲä���ޤ���

= reopen File

== Class Methods

--- copy(from, to, verbose = false) -> bool
--- cp(from, to, verbose = falseo)  -> bool
#@todo

�ե�����򥳥ԡ����ޤ���

������Τˤ� from ���ɤ�� to �˽񤭡��⡼�ɤ��ѹ����ޤ���
�ե�����ι�������ϥ��ԡ���������˹�������ޤ���

@param from ���ԡ����Υե����롣

@param to ���ԡ���Υե����롣

@param verbose ���򥻥åȤ���Ⱦܺ٤�ɽ�����ޤ���

@return ���ԡ������������ʤ� ture�����Ԥ����ʤ� false ���֤��ޤ���

��:
  # ����������ݻ����������
  File.copy(from, to)
  stat = File.stat(from)
  File.utime(stat.atime, stat.mtime, to)


--- move(from, to, verbose = false) -> bool
--- mv(from, to, verbose = false)   -> bool

�ե�������ư���ޤ���

[[m:File.rename]] �Ȱۤʤ�ѡ��ƥ�������ޤ������ư��Ǥ��ޤ���

@param from ��ư���Υե����롣

@param to ��ư��Υե����롣

@param verbose ���򥻥åȤ���Ⱦܺ٤�ɽ�����ޤ���

@return ��ư�����������ʤ� ture�����Ԥ����ʤ� false ���֤��ޤ���

--- compare(from, to, verbose = false) -> bool
--- cmp(from, to, verbose = false)     -> bool

2�ĤΥե��������Ӥ��ޤ���

@param from ��ĤΥե����롣

@param to �⤦��ĤΥե����롣

@return Ʊ���ʤ� true���ۤʤ�ʤ� false ���֤��ޤ���

#@since 1.8.3
--- safe_unlink(*files) -> Array
--- rm_f(*files)        -> Array
#@else
--- safe_unlink(*files) -> Integer
--- rm_f(*files)        -> Integer
#@end

(ʣ����)�ե�������ǽ�ʸ¤������ޤ���

rm -f([[man:rm(1)]]) ���������ޤ���

@param files �������ե��������ꤷ�ޤ���
             �Ǹ�ΰ�����ʸ����Ǥʤ����ޤ��Ͽ��ξ�硢�ܺ٤���Ϥ��ޤ���

#@since 1.8.3
@return files ���֤��ޤ���
        �Ǹ�ΰ�����ʸ����Ǥʤ����ϡ��Ǹ�ΰ����ϼ�������ޤ���
#@else
@return ����Ǥ����ե���������֤��ޤ���
#@end

--- makedirs(*dirs) -> Array
--- mkpath(*dirs)   -> Array

(ʣ����)�ǥ��쥯�ȥ��������ޤ���

¿���ؤΥѥ�����٤˺������뤳�Ȥ��ǽ�Ǥ���
�ǥ��쥯�ȥ꤬���ˤ���в��⤷�ޤ���
mkdir -p([[man:mkdir(1)]])���������ޤ���

@param dirs ��������ǥ��쥯�ȥ����ꤷ�ޤ���
             �Ǹ�ΰ�����ʸ����Ǥʤ����ޤ��Ͽ��ξ�硢�ܺ٤���Ϥ��ޤ���


--- install(from, to, mode = nil, verbose = false) -> ()

�ե�����򥳥ԡ������⡼�ɤ����ꤷ�ޤ���

���ԡ��褬¸�ߤ�����ϰ�ö�������ޤ��Τǡ����ԡ���Υե����뤬
¾�Υե�����˥ϡ��ɥ�󥯤���Ƥ���С����Υ�󥯤��ڤ�ޤ���
install ([[man:install(1)]])���ޥ�ɤ��������ޤ���

@param from ���ԡ����Υե����롣

@param to ���ԡ���Υե����롣

@param mode �ե�����Υ��������⡼�ɡ�8�ʿ��ǻ��ꤷ�ޤ���

@param verbose ������ꤹ��Ⱦܺ٤�ɽ�����ޤ���

--- catname(from, to) -> String

from, to ���鿷���� to ����������֤��ޤ���

to ��ͭ���ʥǥ��쥯�ȥ�ξ�硢to �θ��� from ���ɲä��ޤ���
�ޤ�ɬ�פǤ���С��Хå�����å���򥨥������פ�������å�����ɲä��ޤ���
to ���ǥ��쥯�ȥ�Ǥʤ����ϡ� to �򤽤Τޤ��֤��ޤ���

--- syscopy(from, to) -> bool

from ���� to �إե�����򥳥ԡ����ޤ���

to ���ǥ��쥯�ȥ�ξ��ϡ� to/from �إ��ԡ����ޤ���

= redefine File
== Class Methods

--- chmod(mode, *files) -> Integer

(ʣ����)�ե������°�����Ѥ��ޤ���

���ꥸ�ʥ�� [[m:File.chmod]] �� verbose �λ��꤬
�ɲä��������Ǥ���

@param mode

@param files �ե��������ꤷ�ޤ���
             �Ǹ�ΰ�����ʸ����Ǥʤ����ޤ��Ͽ��ξ�硢�ܺ٤���Ϥ��ޤ���

