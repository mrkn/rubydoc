Unix �δ��ܥ��ޥ�ɤ����ؤȤʤ�桼�ƥ���ƥ���

Makefile ��ǥ����ƥ�˰�¸���ʤ��褦���Ѱդ���ޤ�����
[[lib:mkmf]] �����Ѥ��ޤ���

Windows �ʤɥ磻��ɥ����ɤ�ǧ�����ʤ������ƥ�(������)�Τ���˰�����
un���磻��ɥ�����Ÿ��([[m:Dir.glob]]����)���ޤ�(Unix �Ǥϥ���
���un�ˤ����Ť˥磻��ɥ�����Ÿ������ޤ�)��

=== �Ȥ���:

   ruby -run -e cp -- [-prv] SOURCE DEST
   ruby -run -e ln -- [-sfv] TARGET LINK_NAME
   ruby -run -e mv -- [-v] SOURCE DEST
   ruby -run -e rm -- [-frv] FILE
   ruby -run -e mkdir -- [-pv] DIRS
   ruby -run -e rmdir -- [-v] DIRS
   ruby -run -e install -- [-pv -m mode] SOURCE DEST
   ruby -run -e chmod -- [-v] OCTAL-MODE FILE
   ruby -run -e touch -- [-v] FILE
   ruby -run -e help [COMMAND]

= reopen Kernel
== Private Instance Methods
--- chmod -> ()
�ե�����Υ������������ѹ����ޤ���

Change the mode of each FILE to OCTAL-MODE.

  ruby -run -e chmod -- [OPTION] OCTAL-MODE FILE

  -v          �ܺ�ɽ��

@see [[man:chmod(1)]]

--- cp -> ()
�ե������ǥ��쥯�ȥ�򥳥ԡ����ޤ���


  ruby -run -e cp -- [OPTION] SOURCE DEST

  -p          ��ǽ�Ǥ���Хե������°�����ݻ����ޤ���
  -r          �Ƶ�Ū�˥��ԡ����ޤ���
  -v          �ܺ�ɽ��

@see [[man:cp(1)]]

--- help -> ()
�إ�ץ�å�������ɽ�����ޤ���


  ruby -run -e help [COMMAND]

--- install -> ()
�ե�����򥳥ԡ���������°�������ꤷ�ޤ���


  ruby -run -e install -- [OPTION] SOURCE DEST

  -p          �ե�����Υ�����������Ƚ���������ݻ����ޤ���
              corresponding destination files
  -m          chmod ��Ʊ���褦�˥ե�����Υѡ��ߥå��������ꤷ�ޤ���
  -v          �ܺ�ɽ��

@see [[man:install(1)]]

--- ln -> ()
�ե�����ؤΥ�󥯤�������ޤ���

  ruby -run -e ln -- [OPTION] TARGET LINK_NAME

  -s          �ϡ��ɥ�󥯤�����˥���ܥ�å���󥯤�������ޤ�
  -f          LINK_NAME ���񤭤��ޤ�
  -v          �ܺ�ɽ��

@see [[man:ln(1)]]

--- mkdir -> ()
�ǥ��쥯�ȥ��������ޤ���


  ruby -run -e mkdir -- [OPTION] DIR

  -p          �ǥ��쥯�ȥ꤬¸�ߤ��Ƥ⥨�顼�ˤʤ�ޤ���
              ɬ�פǤ���пƥǥ��쥯�ȥ��������ޤ���
  -v          �ܺ�ɽ��

@see [[man:mkdir(1)]]

--- mv -> ()

�ե�������ư���ޤ� (�ե�����̾���ѹ����ޤ�)��


  ruby -run -e mv -- [OPTION] SOURCE DEST

  -v          �ܺ�ɽ��

@see [[man:mv(1)]]

--- rm -> ()

�ե������ǥ��쥯�ȥ�������ޤ���


  ruby -run -e rm -- [OPTION] FILE

  -f          ¸�ߤ��ʤ��ե������̵�뤷�ޤ�
  -r          �ǥ��쥯�ȥ��Ƶ�Ū�ˤ��ɤäƥե������ǥ��쥯�ȥ�������ޤ�
  -v          �ܺ�ɽ��

@see [[man:rm(1)]]

--- rmdir -> ()

���Υǥ��쥯�ȥ�������ޤ���

  ruby -run -e rmdir -- [OPTION] DIR

  -v          �ܺ�ɽ��

@see [[man:rmdir(1)]]

--- touch -> ()

�ե�����Υ�����������Ƚ�������򸽺ߤλ�����ѹ����ޤ���


  ruby -run -e touch -- [OPTION] FILE

  -v          �ܺ�ɽ��

@see [[man:touch(1)]]

#@# ����Ū�˻��Ѥ������
#@# --- setup(options = "", * long_options) -> ()
