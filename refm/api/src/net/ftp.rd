FTP �ץ�ȥ���򰷤��饤�֥��Ǥ���

����Ū�ˤ� CLI �� FTP ���饤����Ȥ�Ȥä����ȤΤ���
�ͤˤȤäƤ狼��䤹�����󥿡��ե������ˤʤäƤ��ޤ���
����Ruby Ū�פǤ��륤�󥿡��ե��������Ѱդ��Ƥ��ޤ���

FTP �ˤĤ��Ƥ� [[RFC:959]] �� [[RFC:3659]] �򻲹ͤˤ��Ƥ���������

=== �Х��ʥ�⡼�ɤȥƥ����ȥ⡼��
FTP �Υǡ���ž���ˤϥƥ����ȥ⡼�ɤȥХ��ʥ�⡼��
������ޤ����ƥ����ȥ⡼�ɤ�ž��������ˤ�
���Ԥ�Ŭ��CRLF���Ѵ����ޤ����Х��ʥ�⡼�ɤξ���
���ڤ��Ѵ��򤷤ޤ���

�̾�ǤϥХ��ʥ�⡼�ɰʳ���Ȥ�ɬ�פϤʤ��Ǥ��礦��

[[m:Net::FTP#get]] �� [[m:Net::FTP#put]] ��
[[m:Net::FTP#binary]] ���ͤ˽��äƥƥ����ȥ⡼�ɤ�
�Х��ʥ�⡼�ɤ���������Ӥޤ����ޤ���
[[m:Net::FTP#getbinaryfile]]��[[m:Net::FTP#putbinaryfile]]
�� [[m:Net::FTP#binary]] ���ͤˤ�餺�Х��ʥ�⡼�ɤǡ�
[[m:Net::FTP#gettextfile]]��[[m:Net::FTP#puttextfile]] ��
�� [[m:Net::FTP#binary]] ���ͤˤ�餺�ƥ����ȥ⡼�ɤ�
�ǡ���ž�����Ԥ��ޤ���

=== �ѥå��֥⡼�ɤȥ����ƥ��֥⡼��
FTP �ϥǡ���ž����ǥ��쥯�ȥ��������Τ����
�ǡ���ž���Ѥ� TCP ���ͥ�������
�����ФȤ����楳�ޥ�ɤ���Ȥ��
�򤹤뤿��Υ��ͥ������Ȥ��̤˺������ޤ���

���Υǡ���ž���ѥ��ͥ��������������ݤˡ�
�����ƥ��֥⡼�ɤǤ�
������¦���饯�饤�����¦�إ��ͥ��������ꡢ
�ѥå��֥⡼�ɤǤ�
���饤�����¦���饵����¦�إ��ͥ��������ޤ���

���Τ��ᡢ�����ƥ��֥⡼�ɤǤϥ�����-���饤����ȴ֤�
�ե���������������� NAT ��������ˤϤ��ޤ���³�Ǥ��ʤ�
��礬����ޤ������λ��ˤϥѥå��֥⡼�ɤ����Ѥ��Ƥ���������

=== ��

��1:
  require 'net/ftp'
  ftp = Net::FTP.new('ftp.example.org')
  ftp.login
  ftp.passive = true
  ftp.chdir('pub/ruby')
  files = ftp.list('ruby*')
  ftp.getbinaryfile('ruby-1.9.1-p243.tar.bz2', 'ruby.bz2', 1024)
  ftp.close

��2:
  require 'net/ftp'
  Net::FTP.open('ftp.example.org') do |ftp|
    ftp.login
    ftp.passive = true
    ftp.chdir('pub/ruby')
    files = ftp.list('*.bz2')
    ftp.getbinaryfile('ruby-1.9.1-p243.tar.bz2', 'ruby.bz2', 1024)
  endh

= class Net::FTP < Object
FTP ������������饹�Ǥ���


== Class Methods

--- new(host = nil, user = nil, passwd = nil, acct = nil) -> Net::FTP

������ Net::FTP �Υ��󥹥��󥹤��������ޤ���

host �����ꤵ�줿��硢�������줿���󥹥��󥹤��Ф��� 
[[m:Net::FTP#connect]] ��ƤӽФ���
����� user �����ꤵ�줿���� [[m:Net::FTP#login]] 
��ƤӽФ��ޤ���

@param host ��³����ۥ��Ȥ���ꤷ�ޤ���
@param user ������˻Ȥ��桼��̾����ꤷ�ޤ���
@param passwd ������˻Ȥ��ѥ���ɤ���ꤷ�ޤ���
@param acct ������������ ACCT ���ޥ�ɤΥѥ�᡼������ꤷ�ޤ���

@see [[m:Net::FTP.open]]

--- open(host, user = nil, passwd = nil, acct = nil) -> Net::FTP
--- open(host, user = nil, passwd = nil, acct = nil){|ftp| ... } -> object

������ Net::FTP ���󥹥��󥹤��������ޤ���

[[m:Net::FTP.new]] �Ȱۤʤ� host ���ά�Ǥ��ޤ���

�֥�å���Ϳ�������ˤϡ������������󥹥��󥹤�
�֥�å����Ϥ��ƸƤӤ����ޤ������ξ�硢�֥�å���λ����
[[m:Net::FTP#close]] ��ƤӤ������֥�å����ͤ�
�֤��ޤ���

�֥�å���Ϳ���ʤ��ä����ˤ������������󥹥��󥹤��֤��ޤ���

user �����ꤵ�줿���� [[m:Net::FTP#login]] 
��ƤӽФ��ޤ���

@param host ��³����ۥ��Ȥ���ꤷ�ޤ���
@param user ������˻Ȥ��桼��̾����ꤷ�ޤ���
@param passwd ������˻Ȥ��ѥ���ɤ���ꤷ�ޤ���
@param acct ������������ ACCT ���ޥ�ɤΥѥ�᡼������ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

== Instance Methods

--- connect(host, port = FTP_PORT) -> ()

host �ǻ��ꤵ�줿�ۥ��Ȥ���³���ޤ���

�Ķ��ѿ� SOCK_SERVER �����ꤵ��Ƥ����硢SOCKS �ץ�����
��ͳ������³���ޤ���

@param host ��³����ۥ���̾�Ǥ���
@param port ��³����ݡ����ֹ�Ǥ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- sendcmd(cmd) -> String
cmd �ǻ��ꤵ�줿���ޥ�ɤ򥵡��С������ꡢ
�����С�����α������֤��ޤ���

@param cmd ���ޥ�ɤ�ʸ����ǻ��ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���


--- voidcmd(cmd) -> nil
cmd �ǻ��ꤵ�줿���ޥ�ɤ򥵡��С�������ޤ���

@param cmd ���ޥ�ɤ�ʸ����ǻ��ꤷ�ޤ���

@raise Net::FTPReplyError ���������ɤ� 2yz �ʳ��ξ���ȯ�����ޤ���

--- login(user = "anonymous", passwd = nil, acct = nil) -> ()
�ۥ��ȤؤΥ����������Ԥʤ��ޤ���

���Υ᥽�åɤϥۥ��Ȥؤ���³��ˤ����Ȥ��ޤ���

user, passwd ����ά���줿��硢�桼��̾
"anonymous", �ѥ���� user@host �Ȥʤ�ޤ���

acct ���ά���ʤ��ä����ˤϡ� ACCT ���ޥ�ɤ�
acct �ǻ��ꤷ���ѥ�᡼��������ޤ���

@param user ������˻Ȥ��桼��̾����ꤷ�ޤ���
@param passwd ������˻Ȥ��ѥ���ɤ���ꤷ�ޤ���
@param acct ������������ ACCT ���ޥ�ɤΥѥ�᡼������ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- retrbinary(cmd, blocksize, rest_offset = nil) -> nil
--- retrbinary(cmd, blocksize, rest_offset = nil){|data| ...} -> nil

�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�Х��ʥ�ǡ����� 
���󤻤ޤ���

blocksize �ǻ��ꤵ�줿�Х���ñ�̤ǥǡ�����
�ɤ߹��ߡ��֥�å����Ϥ��ޤ���

rest_offset ����ά����ʤ��ä����ϡ�cmd����������
REST ���ޥ�ɤ����ꡢ���ꤷ���Х��ȿ��ΰ��֤���
ž���򳫻Ϥ��ޤ���

@param cmd ���ޥ�ɤ�ʸ�����Ϳ���ޤ���
@param blocksize �ɤ߹���ñ�̤�Х���ñ�̤�Ϳ���ޤ���
@param rest_offset REST ���ޥ�ɤ�Ϳ���륪�ե��åȤ�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

@see [[m:Net::FTP#getbinaryfile]]

--- retrlines(cmd){|line| ...} -> nil
�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�ƥ����ȥǡ����� 
���󤻤ޤ���

��ԤŤĥƥ����Ȥ��ɤ߹��ߡ��֥�å����Ϥ��ޤ���

@param cmd ���ޥ�ɤ�ʸ�����Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

@see [[m:Net::FTP#gettextfile]]

--- storbinary(cmd, file, blocksize, rest_offset = nil) -> nil
--- storbinary(cmd, file, blocksize, rest_offset = nil){|data| ...} -> nil
�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�Х��ʥ�ǡ����� 
����ޤ���

����ǡ����� [[c:IO]] �Υ��󥹥��󥹤�
file �ǻ��ꤷ�ޤ���
(�ºݤˤ� [[c:StringIO]] �Τ褦�� IO �ȥ᥽�åɥ�٥��
�ߴ����륪�֥������ȤǤ���Фʤ�Ǥ⤫�ޤ��ޤ���)��

blocksize �ǻ��ꤵ�줿�Х���ñ�̤� file ����ǡ������ɤߤ��ߡ�
�����Ф�����ޤ���

rest_offset ����ά����ʤ��ä����ϡ�cmd����������
REST ���ޥ�ɤ����ꡢ���ꤷ���Х��ȿ��ΰ��֤���
ž���򳫻Ϥ��ޤ���

�֥�å������ꤵ�줿���ˤϡ�ž������ǡ����� blocksize ���Ȥ�
�֥�å��ˤ��Ϥ��ޤ���

@param cmd ���ޥ�ɤ�ʸ�����Ϳ���ޤ���
@param file ����ǡ�����Ϳ���ޤ���
@param blocksize �ɤ߹���ñ�̤�Х���ñ�̤�Ϳ���ޤ���
@param rest_offset REST ���ޥ�ɤ�Ϳ���륪�ե��åȤ�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

@see [[m:Net::FTP#putbinaryfile]]

--- storlines(cmd, file) -> nil
--- storlines(cmd, file){|line| ...} -> nil
�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�ƥ����ȥǡ�����
����ޤ���

��Ԥ��Ĥ� file ����ƥ����Ȥ��ɤ߹��ߡ������С�������ޤ���

����ǡ����� [[c:IO]] �Υ��󥹥��󥹤�
file �ǻ��ꤷ�ޤ���
(�ºݤˤ� [[c:StringIO]] �Τ褦�� IO �ȥ᥽�åɥ�٥��
�ߴ����륪�֥������ȤǤ���Фʤ�Ǥ⤫�ޤ��ޤ���)��

�֥�å���Ϳ����줿���ˤϳƹԤ򤽤Υ֥�å����Ϥ��ޤ���

@param cmd ���ޥ�ɤ�ʸ�����Ϳ���ޤ���
@param file ����ǡ�����Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

@see [[m:Net::FTP#puttextfile]]

--- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE){|data| ...} -> nil
--- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil

�����о�ΥХ��ʥ�ե������������ޤ���

�����С���ˤ��� remotefile �Ȥ���̾���Υե�������������
������� localfile �Ȥ���̾���Υե��������¸���ޤ���

�ǡ�����ž���� blocksize �Х�����˹Ԥʤ��ޤ���

�֥�å������ꤵ�줿����
�ǡ����� blocksize �Х��ȼ������뤴�Ȥˡ����Υǡ�����
�֥�å����Ϥ��ޤ���

@param remotefile �����оݤΥ�⡼�ȤΥե�����̾��Ϳ���ޤ���
@param localfile ���������ǡ������Ǽ���������Υե�����̾��Ϳ���ޤ���
@param blocksize �ǡ���ž����ñ�̤�Х���ñ�̤�Ϳ���ޤ���


@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- gettextfile(remotefile, localfile = File.basename(remotefile)) -> nil
--- gettextfile(remotefile, localfile = File.basename(remotefile)){|line| ...} -> nil

�����о�Υƥ����ȥե������������ޤ���

�����С���ˤ��� remotefile �Ȥ���̾���Υե�������������
������� localfile �Ȥ���̾���Υե��������¸���ޤ���

�֥�å������ꤵ�줿����
�ǡ�����1�Լ������뤴�Ȥˡ����ιԤ�֥�å����Ϥ��ޤ���

@param remotefile �����оݤΥ�⡼�ȤΥե�����̾��Ϳ���ޤ���
@param localfile ���������ǡ������Ǽ���������Υե�����̾��Ϳ���ޤ���


@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) {|data| ...} -> nil

�����Ф˥Х��ʥ�ե������ž�����ޤ���

������� localfile �Ȥ���̾���Υե�������ɤߤ�����
�����С���� remotefile �Ȥ���̾���Υե��������¸���ޤ���

�ǡ�����ž���� blocksize �Х�����˹Ԥʤ��ޤ���

�֥�å������ꤵ�줿����
�ǡ����� blocksize �Х���ž�����뤴�Ȥˡ����Υǡ�����
�֥�å����Ϥ��ޤ���

@param localfile ž�����������Υե�����̾��Ϳ���ޤ���
@param remotefile ž���ǡ�������¸�����⡼�ȤΥե�����̾��Ϳ���ޤ���
@param blocksize �ǡ���ž����ñ�̤�Х���ñ�̤�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- puttextfile(localfile, remotefile = File.basename(localfile)) -> nil
--- puttextfile(localfile, remotefile = File.basename(localfile)) {|line| ... } -> nil
�����Ф˥Х��ʥ�ե������ž�����ޤ���

������� localfile �Ȥ���̾���Υե�������ɤߤ�����
�����С���� remotefile �Ȥ���̾���Υե��������¸���ޤ���

�֥�å������ꤵ�줿����
�ǡ�����1��ž�����뤴�Ȥˡ����ιԤ�
�֥�å����Ϥ��ޤ���

@param localfile ž�����������Υե�����̾��Ϳ���ޤ���
@param remotefile ž���ǡ�������¸�����⡼�ȤΥե�����̾��Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- acct(account) -> nil

�����С��� ACCT ���ޥ�ɤǥ�������Ⱦ��������ޤ���

@param account ���ꤿ����������Ⱦ����ʸ�����Ϳ���ޤ���

@raise Net::FTPReplyError ���������ɤ�2yz�Ǥʤ����ˤ�ȯ�����ޤ���

--- nlst(dir = nil) -> [String]

dir �ǻ��ꤷ���ǥ��쥯�ȥ�Υե������������֤��ޤ���

dir ���ά������祫���ȥǥ��쥯�ȥ꤬���ꤵ��ޤ���

@param dir �ǥ��쥯�ȥ��ʸ����ǻ��ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- list(*args) -> [String]
--- list(*args) {|line| ... } -> nil
--- ls(*args) -> [String] 
--- ls(*args) {|line| ... } -> nil
--- dir(*args) -> [String]
--- dir(*args) {|line| ...} -> nil

LIST ���ޥ�ɤ�����������̤��֤��ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿���ϳƹԤ��Ф��ƥ֥�å���
�¹Ԥ��ޤ����֥�å��ʤ��ξ��ˤ�ʸ���������Ƿ�̤��֤��ޤ���

@param args LIST �ΰ�����ʸ������Ϥ��ޤ���ʣ���Ϥ����Ȥ��Ǥ��ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ����(1xy, 3xy�����٤��Ǥʤ��Ȥ����褿���ʤ�)��ȯ�����ޤ���

--- rename(fromname, toname) -> nil
�ե�������͡��ष�ޤ���

��⡼�ȥ����о�� fromname �Ȥ���̾���Υե������
toname �Ȥ���̾�����ѹ����ޤ���

@param fromname �ѹ����Υե�����̾��Ϳ���ޤ���
@param toname �ѹ���Υե�����̾��Ϳ���ޤ���

@raise Net::FTPReplyError ���������ɤ��������ʤ�����ȯ�����ޤ�����͡���˼��Ԥ�������ȯ�����ޤ���

--- delete(filename) -> nil
�ե�����������ޤ���

��⡼�ȥ����о�� fromname �Ȥ���̾���Υե�����������ޤ���

����˼��Ԥ������ˤ� �㳰��ȯ�����ޤ���

@param filename �������ե������̾����Ϳ���ޤ���

@raise Net::FTPPermError ���������ɤ� 5yz �Ǥ��ä�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ� 5yz �ʳ����������ʤ�����ȯ�����ޤ���

--- chdir(dirname) -> nil
��⡼�ȥ����ФǤΥ����ȥǥ��쥯�ȥ�� dirname ���ѹ����ޤ���

@param dirname �ѹ���Υǥ��쥯�ȥ��Ϳ���ޤ���
@raise Net::FTPReplyError ���������ɤ����顼�Ǥ������ȯ�����ޤ��������ȥǥ��쥯�ȥ��ѹ��˼��Ԥ�������ȯ�����ޤ���

--- size(filename) -> Integer
��⡼�ȥ����о�Υե�����Υ��������֤��ޤ���

@param filename ��������Ĵ�٤����ե�����̾��Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���

--- mtime(filename, local = false) -> Time

filename �ι�������� Time ���֥������Ȥ��֤��ޤ���

local �򿿤Ȥ���ȡ�����줿����������������Ȥߤʤ��ޤ���
���ξ��Ϲ�����������������ȸ������ޤ���

@param filename ����������������ե������̾����ʸ�����Ϳ���ޤ���
@param local �֤��ͤλ�����������Ȥߤʤ����ɤ����򿿵��ͤ�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���

--- mkdir(dirname) -> String
��⡼�ȥ����о�˥ǥ��쥯�ȥ��������ޤ���

�����˼��Ԥ������ˤ��㳰��ȯ�����ޤ���

@param dirname ��������ǥ��쥯�ȥ�̾��ʸ����ǻ��ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���

--- rmdir(dirname) -> nil
��⡼�ȥ����о�Υǥ��쥯�ȥ�������ޤ���

@param dirname �������ǥ��쥯�ȥ�̾��ʸ����ǻ��ꤷ�ޤ���

@raise Net::FTPReplyError ���������ɤ��������ʤ�����ȯ�����ޤ�������˼��Ԥ�������ȯ�����ޤ���

--- pwd -> String
--- getdir -> String
�����ȥǥ��쥯�ȥ���֤��ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���

--- system -> String
�����С��� OS �Υ����פ��֤��ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ��ǥ��顼�Ǥ������ȯ�����ޤ���

--- abort -> String
�ǡ�����ž������ߤ��ޤ���

@return �����Ф���α�����ʸ������֤��ޤ���

@raise Net::FTPReplyError ���������ɤ��������ʤ�����ȯ�����ޤ���

--- status -> String
���ߤξ��֤��֤��ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���

--- mdtm(filename) -> String
MDTM ���ޥ�ɤ�����������̤��֤��ޤ���

@param filename ���ޥ�ɤ�ȯ�Ԥ������ե�����̾��ʸ����ǻ��ꤷ�ޤ���
@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���

--- passive -> bool
passive �⡼�ɤǤ���ʤ�п��򡢤����Ǥʤ����
�����֤��ޤ���

�ǥե���Ȥϵ��Ǥ���

@see [[m:Net::FTP#passive=]]
--- passive=(bool)
passive �⡼�ɤ����ꤷ�ޤ���

@see [[m:Net::FTP#passive]]

--- return_code -> String
���Υ᥽�åɤ� obsolete �Ǥ����Ȥ�ʤ��Ǥ���������

"\n" ���֤��ޤ���

--- return_code=(string)
���Υ᥽�åɤ� obsolete �Ǥ����Ȥ�ʤ��Ǥ���������

--- lastresp -> String
--- last_response_code -> String

�����Ф���κǸ�α����Υ����ɤ�ʸ������֤��ޤ���

�㤨�Х�����([[m:Net::FTP#login]])�������������ˤ�
"230" ���֤��ޤ���

�����ΰ�̣�� [[rfc:959]] ���Ȥ��Ƥ���������

@see [[m:Net::FTP#last_response]]
--- last_response -> String
�����Ф���κǸ�α�����ʸ������֤��ޤ���

�㤨�Х�����([[m:Net::FTP#login]])�������������ˤ�
"230 Login successful.\n" ���֤��ޤ���

@see [[m:Net::FTP#last_response_code]]
--- welcome -> String
�����ФΥ����륫���å��������֤��ޤ���

���Υ�å������ϥ�����([[m:Net::FTP#login]])����
�����Ф��������ޤ���

--- help(arg = nil) -> String
�����Ф���� help ������֤��ޤ���

@param arg HELP ���ޥ�ɤΥѥ�᡼������ꤷ�ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���

--- quit -> nil
FTP �Υ��å���󤫤�������Ȥ��ޤ���

--- close -> ()
�����ФȤ���³���ڤ�ޤ���

�Ƥ� [[m:Net::FTP#connect]] ����³���ʤ��¤�
���ڤ����Բ�ǽ�ˤʤ�ޤ���

--- closed? -> bool
��³���ڤ�Ƥ�����˿����֤��ޤ���

--- resume -> bool
���ߤΥꥸ�塼��⡼�ɤξ��֤��֤��ޤ���

�ꥸ�塼��⡼�ɤ�ͭ���Ǥ���ʤ�С�
�����Ĥ���ž���᥽�åɤˤ�����
ž�������Ǥ����Դ�����ž�������Ǥ��ʤ��ä�����
�Ƴ�����ǽ�ˤʤ�ޤ���

�ǥե���Ȥ� false �Ǥ���

ž�������ǤȺƳ�����ǽ�ʤΤϰʲ��Υ᥽�åɤǤ���
  * [[m:Net::FTP#get]]
  * [[m:Net::FTP#put]]
  * [[m:Net::FTP#getbinaryfile]]
  * [[m:Net::FTP#putbinaryfile]]

ž�������Ǥ������ɤ�����ž���������Υե����뤬¸�ߤ��뤫
�ɤ�����Ƚ�ꤵ�졢���Υե����륵�����ǺƳ�������֤�
���ޤ���

@see [[m:Net::FTP#resume=]]
#@# �ꥸ�塼��⡼�ɤȤ���������Ǥ��줿
#@# �ǡ���ž����Ƴ����뤿��Τ�ΤǤ����ǥե���Ȥ��ͤ� false �Ǥ���
#@# �����ͤ����Ǥ���Ȥ��������Ĥ���ž���᥽�åɤϻ����� REST ���ޥ�ɤ�
#@# ȯ�Ԥ��뤳�Ȥˤ�ä�ž������ž�����Υ��ե��åȤ򥻥åȤ��ޤ���
#@# ����ˤ�ꡢ���Ǥ�ž�����줿�ǡ�����ž������ʤ��ʤ�ޤ���
#@# ����Ū�ˤϰʲ��Υ᥽�åɤ��ƶ�������ޤ���

#@# getbinaryfile �ϥ�����ե�����Υ������򥪥ե��åȤȤ��ޤ���

#@# putbinaryfile �ϥ�⡼�ȥե�����Υ������򥪥ե��åȤȤ��ޤ���

--- resume=(boolean)
���ߤΥꥸ�塼��⡼�ɤ����ꤷ�ޤ���

@param boolean true�ʤ�Хꥸ�塼��⡼�ɤ� on �ˤ��ޤ���
@see [[m:Net::FTP#resume]]

--- debug_mode -> bool
�ǥХå��⡼�ɤǤ���п��򡢤����Ǥʤ���е����֤��ޤ���

�ͤ����Ǥ���Ȥ����������ε�Ͽ�� ABOR, STAT �η�̤�
[[m:$stdout]] �˿��ɽ������ޤ���

�ǥե���Ȥϵ��Ǥ���
@see [[m:Net::FTP#debug_mode=]]

--- debug_mode=(boolean)

�ǥХå��⡼�ɤ� on/off �����ꤷ�ޤ���

@param boolean ���ʤ�ХǥХå��⡼�ɤ� on �ˤ��ޤ���
@see [[m:Net::FTP#debug_mode]]

--- set_socket(sock, get_greeting = true) -> nil
FTP �Υ���ȥ�����³��
�����åȤ� TCPSocket ���֥������� sock �����ꤷ�ޤ���

get_greeting �˵���Ϳ������ȡ�
set_socket ���̿�������ꤹ������� sock ���Ф�������
����Ԥʤ��ޤ���
get_greeting �����ʤ�С��̿���� sock ��
���ꤷ�����ȡ��̾�FTP�����Ф���³�������äƤ����å��������ɤ߹��ߤޤ���

@param sock ����ȥ�����³�˻Ȥ������åȤ���ꤷ�ޤ���
@param get_greeting �����åȤ����ꤷ������³����å������򥽥��åȤ����ɤߤ��फ�ɤ�������ꤷ�ޤ���

--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil

�����о�Υե������������ޤ���

[[m:Net::FTP#binary]] ���ͤ˽��ä�
[[m:Net::FTP#getbinaryfile]] �⤷����
[[m:Net::FTP#gettextfile]] ��ƤӤ����ޤ���

binary �����ΤȤ����Ĥޤ�ƥ����ȥ⡼�ɤ�
�Ȥ��ˤ� blocksize ��̵�뤵��ޤ���

@param remotefile �����оݤΥ�⡼�ȤΥե�����̾��Ϳ���ޤ���
@param localfile ���������ǡ������Ǽ���������Υե�����̾��Ϳ���ޤ���
@param blocksize �ǡ���ž����ñ�̤�Х���ñ�̤�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���


--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil

�����Фإե������ž�����ޤ���

[[m:Net::FTP#binary]] ���ͤ˽��ä�
[[m:Net::FTP#putbinaryfile]] �⤷����
[[m:Net::FTP#puttextfile]] ��ƤӤ����ޤ���

binary �����ΤȤ����Ĥޤ�ƥ����ȥ⡼�ɤ�
�Ȥ��ˤ� blocksize ��̵�뤵��ޤ���

@param localfile ž�����������Υե�����̾��Ϳ���ޤ���
@param remotefile ž���ǡ�������¸�����⡼�ȤΥե�����̾��Ϳ���ޤ���
@param blocksize �ǡ���ž����ñ�̤�Х���ñ�̤�Ϳ���ޤ���

@raise Net::FTPTermError ���������ɤ� 4yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPPermError ���������ɤ� 5yz �ΤȤ���ȯ�����ޤ���
@raise Net::FTPProtoErrro ���������ɤ� RFC Ū���������ʤ�����ȯ�����ޤ���
@raise Net::FTPReplyError ���������ɤ���ξ��ʳ����������ʤ�����ȯ�����ޤ���

--- binary -> bool
[[m:Net::FTP#put]], [[m:Net::FTP#get]] �ˤ��ž����
�Х��ʥ�⡼��(IMAGE)��ž�����뤫�ɤ������֤��ޤ���

�ǥե���Ȥ��ͤ� true �Ǥ���

���ξ�硢�ƥ����ȥ⡼��(ASCII)�����ꤵ��ޤ���

EBCDIC �� LOCAL �ʤ�¾��ɽ�������פϥ��ݡ��Ȥ���Ƥ��ޤ���

@see [[m:Net::FTP#binary=]]
--- binary=(bool)
[[m:Net::FTP#put]], [[m:Net::FTP#get]] �ˤ��ž����
�Х��ʥ�⡼��(IMAGE)��ž�����뤫�ɤ�������ꤷ�ޤ���

�ǥե���Ȥ��ͤ� true �Ǥ���

���ξ�硢�ƥ����ȥ⡼��(ASCII)�����ꤵ��ޤ���

EBCDIC �� LOCAL �ʤ�¾��ɽ�������פϥ��ݡ��Ȥ���Ƥ��ޤ���

@param bool ���ʤ�ХХ��ʥ�⡼�ɤ� on �ˤ��ޤ���
@see [[m:Net::FTP#binary]]

--- noop -> nil
NOOP ���ޥ�ɤ�ȯ�Ԥ��ޤ���

�����Ф��������������¾�ϲ��⤷�ޤ���

@raise Net::FTPReplyError ���������ɤ���ξ��ʳ��ǥ��顼�Ǥ������ȯ�����ޤ���

--- site(arg) -> nil
SITE ���ޥ�ɤ�ȯ�Ԥ��ޤ���

@param arg SITE���ޥ�ɤΥѥ�᡼������ꤷ�ޤ���

@raise Net::FTPReplyError ���������ɤ���ξ��ʳ��ǥ��顼�Ǥ������ȯ�����ޤ���

== Constants

#@# --- CRLF
#@# #@todo

--- DEFAULT_BLOCKSIZE -> Integer
get, put �򤹤�Ȥ��Υǥե���ȤΥ֥�å��������Ǥ���

--- FTP_PORT -> Integer
FTP�Υǥե���ȤΥݡ����ֹ�(21)�Ǥ���

#@# --- MDTM_REGEXP
#@# #@todo


= class Net::FTPError < StandardError
net/ftp �饤�֥���Ϣ�Υ��顼���̤�ɽ���㳰���饹�Ǥ���

�����Фα��������ɤ����顼�򼨤��Ƥ������ȯ�����ޤ���

�㳰ȯ���θ����Ȥʤä������б����� [[m:Exception#message]]
���������ޤ���

= class Net::FTPReplyError < Net::FTPError
FTP�α����� 1yz �� 3yz �Ǥ��ꡢ���줬
���곰�Ǥ��뤳�Ȥ�ɽ�魯�㳰���饹�Ǥ���

= class Net::FTPTempError < Net::FTPError
FTP �α��������� 4yz 
(Transient Negative Completion reply)
��ɽ���㳰���饹�Ǥ���

�ܤ����� [[RFC:959]] �򻲾Ȥ��Ƥ���������

= class Net::FTPPermError < Net::FTPError
FTP �α��������� 5yz 
(Permanent Negative Completion reply)
��ɽ���㳰���饹�Ǥ���

�ܤ����� [[RFC:959]] �򻲾Ȥ��Ƥ���������

= class Net::FTPProtoError < Net::FTPError
�����Фα����� FTP �Υץ�ȥ���˱�äƤ��ʤ�����
ȯ�������㳰�Υ��饹�Ǥ���
