--- void rb_p(VALUE obj)

p �μ��Ρ�obj �򸫤䤹�����Ϥ��ޤ���

--- int rb_io_mode_flags(const char *mode)

[[man:fopen(3)]] �Τ褦�ʥ⡼�ɻ���mode��ruby�����Υ⡼�ɥե饰��
�Ѵ����ޤ���

mode�ϡ�[rwa][b][+] �Ȥ���ʸ����Ǥ� (��: "rb+").
����ͤϡ�
FMODE_READABLE,
FMODE_WRITABLE,
FMODE_BINMODE,
FMODE_READWRITE
�������¤Ǥ���FMODE_READWRITE�ϡ�FMODE_READABLE��
FMODE_WRITEABLE�������¤Ǥ���

--- static int rb_io_mode_flags2(int mode)

[[man:open(2)]] �Τ褦�ʥ⡼�ɻ���mode��ruby�����Υ⡼�ɥե饰���Ѵ����ޤ���

mode�ϡ�O_RDONLY, O_WRONLY, O_RDWR�Τ����줫��
�б�����ʲ����ͤΤ����줫���֤��ޤ���

  * FMODE_READABLE,
  * FMODE_WRITABLE,
  * FMODE_READWRITE

FMODE_READWRITE�ϡ�FMODE_READABLE��
FMODE_WRITEABLE�������¤Ǥ���

Microsoft Windows �ʤɥե�����˥Х��ʥ꡿�ƥ�����°���ζ��̤�����ץ��
�ȥۡ���Ǥϡ�mode��O_BINARY�������¤����ꤵ��Ƥ�
��С�����ͤˤ�FMODE_BINMODE�������¤����ꤵ��ޤ���

--- static VALUE pipe_open(char *pname, char *mode)

[[man:popen(3)]] ��¹Ԥ��ޤ�������pname��mode�� [[man:popen(3)]] ��
�������б����ޤ���

pname�ϡ��¹Ԥ���ץ����� "-" �ʤ�С����Ȥ� [[man:fork(2)]] ���ޤ���

[[c:IO]] ���֥������Ȥ���������mode �� "r" �ΤȤ���
�ҥץ�����ɸ����Ϥ��������� IO �����ϤˤĤʤ��ޤ���

mode �� "w" �ΤȤ���
�ҥץ�����ɸ�����Ϥ��������� IO �ν��ϤˤĤʤ��ޤ���

mode �� "+" ���ޤޤ��С��ҥץ�����ɸ�������Ϥ�
�������� IO �������ϤˤĤʤ��ޤ���

�������� IO ���֥������Ȥ��֤��ޤ���
pname�� "-" �Ǥ���С��ҥץ����ˤϡ�nil ���֤��ޤ�
