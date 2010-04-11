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
#@todo

���Υǥ��쥯�ȥ�������ޤ���

  ruby -run -e rmdir -- [OPTION] DIR

#@since 1.8.8
  -p          remove DIRECTORY and its ancestors.
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
#@todo

Wait until the file becomes writable.

  ruby -run -e wait_writable -- [OPTION] FILE

  -n RETRY	count to retry
  -w SEC	each wait time in seconds
  -v		verbose
--- mkmf -> ()
#@todo

Create makefile using mkmf.

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
#@todo

Run WEBrick HTTP server.

  ruby -run -e httpd -- [OPTION] DocumentRoot

  --bind-address=ADDR         address to bind
  --port=NUM                  listening port number
  --max-clients=MAX           max number of simultaneous clients
  --temp-dir=DIR              temporary directory
  --do-not-reverse-lookup     disable reverse lookup
  --request-timeout=SECOND    request timeout in seconds
  --http-version=VERSION      HTTP version
  -v                          verbose
#@end
