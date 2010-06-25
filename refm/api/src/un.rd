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
#@since 1.8.8
   ruby -run -e wait_writable -- [OPTION] FILE
   ruby -run -e mkmf -- [OPTION] EXTNAME [OPTION]
   ruby -run -e httpd -- [OPTION] DocumentRoot
#@end
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

#@since 1.8.8
  -p          DIR �ǻ��ꤵ�줿�ǥ��쥯�ȥ�Ȥ��ξ�̥ǥ��쥯�ȥ�������ޤ�
#@end
  -v          �ܺ�ɽ��

@see [[man:rmdir(1)]]

--- touch -> ()

�ե�����Υ�����������Ƚ�������򸽺ߤλ�����ѹ����ޤ���


  ruby -run -e touch -- [OPTION] FILE

  -v          �ܺ�ɽ��

@see [[man:touch(1)]]

#@# ����Ū�˻��Ѥ������
#@# --- setup(options = "", * long_options) -> ()
#@since 1.8.8
--- wait_writable -> ()
�ե����뤬�񤭹��߲�ǽ�ˤʤ�ޤ��Ԥ��ޤ���

  ruby -run -e wait_writable -- [OPTION] FILE

  -n RETRY	��ȥ饤���
  -w SEC	��ȥ饤���Ȥ��Ԥ��ÿ�
  -v		�ܺ�ɽ��
--- mkmf -> ()

[[lib:mkmf]] ��Ȥä� Makefile ��������ޤ���

  ruby -run -e mkmf -- [OPTION] EXTNAME [OPTION]

  -d ARGS	run dir_config
  -h ARGS	run have_header
  -l ARGS	run have_library
  -f ARGS	run have_func
  -v ARGS	run have_var
  -t ARGS	run have_type
  -m ARGS	run have_macro
  -c ARGS	run have_const
  --vendor	install to vendor_ruby
--- httpd -> ()

WEBrick HTTP server ��ư���ޤ���

  ruby -run -e httpd -- [OPTION] DocumentRoot

  --bind-address=ADDR         �Х���ɥ��ɥ쥹����ꤷ�ޤ�
  --port=NUM                  �ݡ����ֹ����ꤷ�ޤ�
  --max-clients=MAX           Ʊ����³���κ�����
  --temp-dir=DIR              ����ǥ��쥯�ȥ����ꤷ�ޤ�
  --do-not-reverse-lookup     �հ�����̵���ˤ��ޤ�
  --request-timeout=SECOND    �ꥯ�����Ȥ������ॢ���Ȥ����ÿ�����ꤷ�ޤ�
  --http-version=VERSION      HTTP version
  -v                          �ܺ�ɽ��
#@end
