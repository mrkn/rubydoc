#@since 1.8.0
= module Process::Sys

[[c:Process::UID]], [[c:Process::GID]] �Ȱۤʤꡢ
�桼�� ID�����롼�� ID �����륷���ƥॳ�����
���᤿�⥸�塼�롣

== Module Functions

--- getuid
�ץ����μ¥桼�� ID ���֤��ޤ���
C �� getuid() ��Ʊ���Ǥ���

--- geteuid
�ץ����μ¸��桼�� ID ���֤��ޤ���
C �� geteuid() ��Ʊ���Ǥ���

--- getgid
�ץ����μ¥��롼�� ID ���֤��ޤ���
C �� getguid() ��Ʊ���Ǥ���

--- getegid
�ץ����μ¸����롼�� ID ���֤��ޤ���
C �� getegid() ��Ʊ���Ǥ���

--- setuid(id)
C �� setuid() ��Ʊ���Ǥ���

--- setgid(id)
C �� setgid() ��Ʊ���Ǥ���

--- setruid(id)
C �� setgid() ��Ʊ���Ǥ���

--- setrgid(id)
C �� setgid() ��Ʊ���Ǥ���

--- seteuid(id)
C �� seteuid() ��Ʊ���Ǥ���

--- setegid(id)
C �� setegid() ��Ʊ���Ǥ���

--- setreuid(rid, eid)
C �� setreuid() ��Ʊ���Ǥ���

--- setregid(rid, eid)
C �� setregid() ��Ʊ���Ǥ���

--- setresuid(rid, eid, sid)
C �� setresuid() ��Ʊ���Ǥ���

--- setresgid(rid, eid, sid)
C �� setresgid() ��Ʊ���Ǥ���

--- issetugid
�ץ����� setuid �⤷���� setgid �ӥåȤ�Ȥä�
��ư����Ƥ�����˿����֤��ޤ���
#@end
