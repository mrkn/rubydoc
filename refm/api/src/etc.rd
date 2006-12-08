/etc ��¸�ߤ���ǡ����١��������������뤿��Υ⥸�塼��Ǥ���
���饹�˥��󥯥롼�ɤ��ƻȤ����Ȥ�Ǥ��ޤ���

=== �Ȥ���

  require 'etc'
  p Etc.getlogin

= module Etc

== Module Functions

#@if (version >= "1.8.1")
--- endgrent

#@end

#@if (version >= "1.8.1")
--- endpwent

#@end

#@if (version >= "1.8.1")
--- getgrent

#@end

#@if (version >= "1.8.1")
--- getpwent

#@end

#@if (version >= "1.8.1")
--- setgrent

#@end

#@if (version >= "1.8.1")
--- setpwent

#@end

--- getlogin

��ʬ�� login ̾���֤��ޤ��������ʤ��ä����� nil ���֤��ޤ���

getlogin �� su �ʤɤǥ�������Υ桼���Ȥϰۤʤ�桼���ˤʤäƤ����硢
���ߤǤϤʤ���������Υ桼�����֤��ޤ���

���Υ᥽�åɤ����Ԥ������� [[m:Etc.getpwuid]] ��
�ե�����Хå�����Ȥ褤�Ǥ��礦��

���Ȥ��С��Ķ��ѿ� USER �ʤɤ⤢�碌�ơ��ʲ��Τ褦�˥ե�����Хå��Ǥ��ޤ���

  login_user = ENV['USER'] || ENV['LOGNAME'] || Etc.getlogin || Etc.getpwuid.name


--- getpwnam(name)

passwd �ǡ����١����򸡺�����
̾���� name �Ǥ��� passwd ����ȥ���֤��ޤ���
����ͤ� passwd ��¤�Τǡ��ʲ��Υ��Ф�����ޤ���

  struct passwd
    name        # �桼��̾(ʸ����)
    passwd      # �ѥ����(ʸ����)
    uid         # �桼��ID(����)
    gid         # ���롼��ID(����)
    gecos       # gecos�ե������(ʸ����)
    dir         # �ۡ���ǥ��쥯�ȥ�(ʸ����)
    shell       # �����󥷥���(ʸ����)
    # �ʹߤΥ��Фϥ����ƥ�ˤ�äƤ��󶡤���ʤ�
    change      # �ѥ�����ѹ�����(����)
    quota       # ��������(����)
    age         # ������(����)
    class       # �桼�������������饹(ʸ����)
    comment     # ������(ʸ����)
    expire      # ���������ͭ������(����)
  end

̾���� name �Ǥ��� passwd ����ȥ꤬�ʤ��ä���硢
ArgumentError ��ȯ�����ޤ���

�ܺ٤� [[man:getpwnam(3)]] �򻲾Ȥ��Ƥ���������

--- getpwuid([uid])

passwd �ǡ����١����򸡺�����
�桼�� ID �� uid �Ǥ��� passwd ����ȥ���֤��ޤ���
����ͤ� [[m:etc#Etc.getpwnam]] ��Ʊ�ͤǤ���
�������ά�������ˤ� [[man:getuid(2)]] ���ͤ��Ѥ��ޤ���

�ܺ٤� [[man:getpwuid(3)]] �򻲾Ȥ��Ƥ���������

--- getgrgid(gid)

group �ǡ����١����򸡺��������롼�� ID �� gid
�Ǥ��륰�롼�ץ���ȥ���֤��ޤ���
����ͤ� group ��¤�Τǡ��ʲ��Υ��Ф�����ޤ���

  struct group
    name        # ���롼��̾(ʸ����)
    passwd      # ���롼�פΥѥ����(ʸ����)
    gid         # ���롼��ID(����)
    mem         # ���롼�ץ���̾������
  end

�ܺ٤� [[man:getgrgid(3)]] �򻲾Ȥ��Ƥ���������

--- getgrnam(name)

name �Ȥ���̾���Υ��롼�ץ���ȥ���֤��ޤ���
����ͤ� [[m:Etc.getgrgid]] ��Ʊ�ͤǤ���

�ܺ٤�[[man:getgrnam(3)]] �򻲾Ȥ��Ƥ���������

--- group
--- group {|group| ... }

���ƤΥ��롼�ץ���ȥ���˥����������뤿��Υ��ƥ졼���Ǥ���

--- passwd
--- passwd {|passwd| ... }

���Ƥ� passwd ����ȥ���˥����������뤿��Υ��ƥ졼���Ǥ���
