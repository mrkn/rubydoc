= class Net::FTP < Object

== Class Methods

--- new(host = nil, user = nil, passwd = nil, acct = nil)

���������󥹥��󥹤��������ޤ���

host �����ꤵ�줿��硢�������줿���󥹥��󥹤��Ф��� connect ��ƤӽФ���
����� user �����ꤵ�줿���� login ��ƤӽФ��ޤ���

--- open(host, user = nil, passwd = nil, acct = nil)

host ���ά�Ǥ��ʤ��ʳ��� new ��Ʊ���Ǥ���

== Instance Methods

--- connect(host, port = FTP_PORT)

host �ǻ��ꤵ�줿�ۥ��Ȥ���³���ޤ���

--- sendcmd(cmd)

cmd �ǻ��ꤵ�줿���ޥ�ɤ򥵡��С������ꡢ �����С�����α������֤��ޤ���

���������ɤ� 4xx �ξ����㳰 FTPTermError ����5xx �ξ���
�㳰 FTPPermError ��ȯ�����ޤ���
���������ɤκǽ�ο����� 1 ���� 5 �Τɤ�Ǥ�ʤ�����
�㳰 FTPProtoError ��ȯ�����ޤ���

--- voidcmd(cmd)

sendcmd��Ʊ�ͤ˥����С��˥��ޥ�ɤ�����ޤ�����nil ���֤����ȡ�
���������ɤ� 2xx �ʳ��ξ�硢�㳰 FTPReplyError ��ȯ�����������ۤʤ�ޤ���

--- login(user = "anonymous", passwd = nil, acct = nil)

�����������Ԥʤ��ޤ���

user ����ά���줿��硢anonymous �ǥ����󤷤ޤ���

--- retrbinary(cmd, blocksize, rest_offset = nil, callback = Proc.new)

�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�Х��ʥ�ǡ����� ���󤻤ޤ���
blocksize �ǻ��ꤵ�줿�Х���ñ�̤ǥǡ�����
�ɤ߹��ߡ�callback �ǻ��ꤵ�줿 Proc ���֥������Ȥޤ���
�֥�å����ɤ߹�����ǡ������Ϥ��ޤ���

--- retrlines(cmd, callback = nil)

�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�ƥ����ȥǡ�����
���󤻤ޤ�����Ԥ��ĥƥ����Ȥ��ɤ߹��ߡ�callback �ǻ��ꤵ�줿
Proc ���֥������Ȥޤ��ϥ֥�å����ɤ߹�����Ԥ��Ϥ��ޤ���

callback ��֥�å����ά���줿�����ɤ߹�����Ԥ� print ���ޤ���

--- storbinary(cmd, file, blocksize, rest_offset = nil, callback = nil)

�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�Х��ʥ�ǡ�����
����ޤ���blocksize �ǻ��ꤵ�줿�Х���ñ�̤�
file ����ǡ������ɤ߹��ߡ������С�������ޤ���

callback ��֥�å������ꤵ�줿���ϥǡ�����
��������뤴�Ȥˤ����ƤӽФ��ޤ���

--- storlines(cmd, file, callback = nil)

�����С��� cmd �ǻ��ꤵ�줿���ޥ�ɤ����ꡢ�ƥ����ȥǡ�����
����ޤ�����Ԥ��Ĥ� file ����ƥ����Ȥ��ɤ߹��ߡ�
�����С�������ޤ���

callback ��֥�å������ꤵ�줿���ϥǡ�����
��������뤴�Ȥˤ����ƤӽФ��ޤ���


--- getbinaryfile(remotefile, localfile, blocksize = DEFAULT_BLOCKSIZE, callback = nil)

�����С���ΥХ��ʥ�ե������ get ���ޤ���

callback ��֥�å������ꤵ�줿����
�ǡ�������������뤴�Ȥˤ����ƤӽФ��ޤ���

#@if (version >= "1.7.0")
((<ruby 1.7 feature>)): localfile �Ͼ�ά��ǽ�ˤʤ�ޤ�����
File.basename(remotefile) ����ά�����ͤˤʤ�ޤ���
#@end

--- gettextfile(remotefile, localfile, callback = nil)

�����С���Υƥ����ȥե������ get ���ޤ���

callback ��֥�å������ꤵ�줿����
�ǡ�������������뤴�Ȥˤ����ƤӽФ��ޤ���


--- putbinaryfile(localfile, remotefile, blocksize = DEFAULT_BLOCKSIZE, callback = nil)

�����С��˥Х��ʥ�ե������ put ���ޤ���

callback ��֥�å������ꤵ�줿����
�ǡ�������������뤴�Ȥˤ����ƤӽФ��ޤ���

--- puttextfile(localfile, remotefile, callback = nil)

�����С��˥ƥ����ȥե������ put ���ޤ���

callback ��֥�å������ꤵ�줿����
�ǡ�������������뤴�Ȥˤ����ƤӽФ��ޤ���

--- acct(account)

�����С��˥�������Ⱦ��������ޤ���

--- nlst(dir = nil)

dir �ǻ��ꤷ���ǥ��쥯�ȥ�Υե������������֤��ޤ���
dir ���ά������祫���ȥǥ��쥯�ȥ꤬���ꤵ��ޤ���

--- list(*args, &block)
--- ls(*args, &block)
--- dir(*args, &block)

LIST ���ޥ�ɤ�����������̤��֤��ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿���ϳƹԤ��Ф��ƥ֥�å���
�¹Ԥ��ޤ���

--- rename(fromname, toname)

�ե�������͡��ष�ޤ���

--- delete(filename)

�ե�����������ޤ���

--- chdir(dirname)

�����ȥǥ��쥯�ȥ�� dirname ���ѹ����ޤ���

--- size(filename)

�ե�����Υ��������֤��ޤ���

--- mtime(filename, local = false)

filename �ι�������� Time ���֥������Ȥ��֤��ޤ���
local �ϡ������������������Ȥߤʤ����ɤ�����
�ե饰�Ǥ���(��ά�����Ȥ��Υǥե�����ͤ� false �Ǥ�)��

--- mkdir(dirname)

�ǥ��쥯�ȥ��������ޤ���

--- rmdir(dirname)

�ǥ��쥯�ȥ�������ޤ���

--- pwd
--- getdir

�����ȥǥ��쥯�ȥ���֤��ޤ���

--- system

�����С��� OS �Υ����פ��֤��ޤ���

--- abort

�ǡ�����ž������ߤ��ޤ���

--- status

���ߤξ��֤��֤��ޤ���

--- mdtm(filename)

MDTM ���ޥ�ɤ�����������̤��֤��ޤ���

--- passive

passive �⡼�ɤξ��֤򿿵��ͤ��֤��ޤ���

--- passive=(bool)

passive �⡼�ɤξ��֤����ꤷ�ޤ������������֤��֤��ޤ���

--- return_code

���ߤΥ��å����β��ԥ����ɤ��֤��ޤ���

--- return_code=(string)

���ߤΥ��å����β��ԥ����ɤ����ꤷ�ޤ������������ԥ����ɤ��֤��ޤ���

--- lastresp
--- last_response_code

�����Ф���κǸ�α������֤��ޤ�(string)��

(��): �ե����뤬�����ž�����줿���ϡ�"226"�������ΰ�̣�� [[unknown:RFC:959]] ���ȡ�

--- last_response



--- welcome

�����ФΥ����륫���å��������֤��ޤ���

--- help(arg = nil)

help ������֤��ޤ���

--- quit

�������Ȥ��ޤ���

--- close

��³���ڤ�ޤ���

--- closed?

��³���ڤ�Ƥ�����˿����֤��ޤ���

--- resume

���ߤΥꥸ�塼��⡼�ɤ��֤��ޤ����ꥸ�塼��⡼�ɤȤ���������Ǥ��줿
�ǡ���ž����Ƴ����뤿��Τ�ΤǤ����ǥե���Ȥ��ͤ� false �Ǥ���
�����ͤ����Ǥ���Ȥ��������Ĥ���ž���᥽�åɤϻ����� REST ���ޥ�ɤ�
ȯ�Ԥ��뤳�Ȥˤ�ä�ž������ž�����Υ��ե��åȤ򥻥åȤ��ޤ���
����ˤ�ꡢ���Ǥ�ž�����줿�ǡ�����ž������ʤ��ʤ�ޤ���
����Ū�ˤϰʲ��Υ᥽�åɤ��ƶ�������ޤ���

getbinaryfile �ϥ�����ե�����Υ������򥪥ե��åȤȤ��ޤ���

putbinaryfile �ϥ�⡼�ȥե�����Υ������򥪥ե��åȤȤ��ޤ���

--- resume=(boolean)

resume ���ͤ����ꤷ�ޤ���

--- debug_mode

�ǥХå��⡼�ɤǤ��뤫�ݤ���ɽ�������ͤǤ���
�ͤ����Ǥ���Ȥ����������ε�Ͽ�� ABOR, STAT �η�̤�ɸ����Ϥ�
���ɽ������ޤ���

--- debug_mode=(boolean)

�ǥХå��⡼�ɤ��ͤ����ꤷ�ޤ���

--- set_socket(sock, get_greeting = true)

�̿���� TCPSocket ���֥������� sock �����ꤷ�ޤ���
��ά��ǽ����2���� get_greeting �˵���Ϳ������ȡ�
set_socket ���̿�������ꤹ������� sock ���Ф�������
����Ԥʤ��ޤ��󡣤��ΤȤ��ͤȤ��� nil ���֤��ޤ���
get_greeting ����(�ǥե����)�ʤ�С��̿���� sock ��
���ꤷ�����ȡ��̾�FTP�����Ф���³�������äƤ����å��������ɤ߹��ߡ�
���Υ�å��������ͤȤ����֤��ޤ���

--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE)
--- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... }

binary ���ͤ˽��äƥ�⡼�ȥե�������������
localfile ��ե�����̾�Ȥ��������ե��������¸���ޤ���
remotefile ����ά������ localfile �Υ١����͡��ब
���ꤵ��ޤ���
block_size ����ά������ DEFAULT_BLOCLSIZE �����ꤵ��ޤ���
�����ͤ� binary �����Ǥ���Ȥ��Τ�ͭ���Ǥ���

�֥�å���Ϳ����줿���Ϥ��Υǡ�����ե�����˽񤭤��ऴ�Ȥˡ�
�񤭹�����ǡ����� data ���������ƥ֥�å���ɾ������ޤ���
�֥�å���Ǹ��ɾ�������Ȥ�������줿�ͤ� get ���ͤˤʤ�ޤ���

�֥�å���Ϳ�����ʤ��ä����� get ���ͤ� nil �Ǥ���

--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE)
--- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... }

binary ���ͤ˽��äƥ�����ե����� localfile ����������
remotefile ��ե�����̾�Ȥ����⡼�ȥե��������¸���ޤ���
remotefile ����ά������ localfile �Υ١����͡��ब
���ꤵ��ޤ���
block_size ����ά������ DEFAULT_BLOCLSIZE �����ꤵ��ޤ���
�����ͤ� binary �����Ǥ���Ȥ��Τ�ͭ���Ǥ���

�֥�å���Ϳ����줿���Ϥ��Υǡ������������뤴�Ȥˡ�
���������ǡ����� data ���������ƥ֥�å���ɾ������ޤ���
�֥�å���Ǹ��ɾ�������Ȥ�������줿�ͤ� put ���ͤˤʤ�ޤ���

�֥�å���Ϳ�����ʤ��ä����� put ���ͤ� nil �Ǥ���

--- binary

ɽ�������פ��Х��ʥ�(IMAGE)�Ǥ��뤫�ݤ���ɽ�������ͤǤ���
get �� put ���ƶ�������ޤ���
�ǥե���Ȥ��ͤ� true �Ǥ���
���ξ�硢ASCII �����ꤵ��ޤ���
EBCDIC �� LOCAL �ʤ�¾��ɽ�������פϥ��ݡ��Ȥ���Ƥ��ޤ���

--- binary=(bool)

ɽ�������פ��Х��ʥ�(IMAGE)�Ǥ��뤫�ݤ������ꤷ�ޤ���


--- noop

--- site(arg)

== Constants

--- CRLF

--- DEFAULT_BLOCKSIZE

--- FTP_PORT

--- MDTM_REGEXP


= class FTPError < StandardError

= class FTPReplyError < FTPError

= class FTPTempError < FTPError

= class FTPPermError < FTPError

= class FTPProtoError < FTPError

