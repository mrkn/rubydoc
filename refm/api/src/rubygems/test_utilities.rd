require rubygems
require rubygems/remote_fetcher

�ƥ��Ȥǻ��Ѥ��륯�饹��᥽�åɤ�������Ƥ��ޤ���

= class Gem::FakeFetcher

[[c:Gem::RemoteFetcher]] ���֤�������ƥ����ѤΥ��饹�Ǥ���

�����㤬���������ϥƥ��ȥ����ɤ򻲾Ȥ��Ƥ���������

= reopen Gem::RemoteFetcher

== Singleton Methods

--- fetcher=(fetcher)

�ƥ����ѤΥ᥽�åɤǤ���

= class TempIO

�ƥ����Ѥ� [[c:Tempfile]] ���åפ��ޤ���

[[c:StringIO]] ��Ʊ�����󥿥ե���������äƤ��ޤ�����
�ǡ�����񤭹������ [[c:Tempfile]] �ˤʤäƤ��ޤ���
