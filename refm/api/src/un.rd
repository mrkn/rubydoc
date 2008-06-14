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

  -v          verbose

@see [[man:chmod(1)]]

--- cp -> ()
�ե������ǥ��쥯�ȥ�򥳥ԡ����ޤ���

Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY

  ruby -run -e cp -- [OPTION] SOURCE DEST

  -p          preserve file attributes if possible
  -r          copy recursively
  -v          verbose

@see [[man:cp(1)]]

--- help -> ()
�إ�ץ�å�������ɽ�����ޤ���

Display help message.

  ruby -run -e help [COMMAND]

--- install -> ()
�ե�����򥳥ԡ���������°�������ꤷ�ޤ���

Copy SOURCE to DEST.

  ruby -run -e install -- [OPTION] SOURCE DEST

  -p          apply access/modification times of SOURCE files to
              corresponding destination files
  -m          set permission mode (as in chmod), instead of 0755
  -v          verbose

@see [[man:install(1)]]

--- ln -> ()
#@todo
�ե�����ؤΥ�󥯤�������ޤ���

  ruby -run -e ln -- [OPTION] TARGET LINK_NAME

  -s          make symbolic links instead of hard links
  -f          remove existing destination files
  -v          verbose

@see [[man:ln(1)]]

--- mkdir -> ()
�ǥ��쥯�ȥ��������ޤ���

Create the DIR, if they do not already exist.

  ruby -run -e mkdir -- [OPTION] DIR

  -p          no error if existing, make parent directories as needed
  -v          verbose

@see [[man:mkdir(1)]]

--- mv -> ()

�ե�������ư���ޤ� (�ե�����̾���ѹ����ޤ�)��

Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.

  ruby -run -e mv -- [OPTION] SOURCE DEST

  -v          verbose

@see [[man:mv(1)]]

--- rm -> ()

�ե������ǥ��쥯�ȥ�������ޤ���

Remove the FILE

  ruby -run -e rm -- [OPTION] FILE

  -f          ignore nonexistent files
  -r          remove the contents of directories recursively
  -v          verbose

@see [[man:rm(1)]]

--- rmdir -> ()

���Υǥ��쥯�ȥ�������ޤ���

Remove the DIR.

  ruby -run -e rmdir -- [OPTION] DIR

  -v          verbose

@see [[man:rmdir(1)]]

--- touch -> ()

�ե�����Υ�����������Ƚ���������ѹ����롣

Update the access and modification times of each FILE to the current time.

  ruby -run -e touch -- [OPTION] FILE

  -v          verbose

@see [[man:touch(1)]]
