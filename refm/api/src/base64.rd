require 'kconv'

MIME Base64�Υǥ�����/���󥳡��ɤ�Ԥ��᥽�åɤ��������Ƥ��ޤ�������
�饤�֥���base64���󥳡��ǥ��󥰤Υ���ץ륹����ץȤȤ��ƽ񤫤�ޤ�
����

Base64�ϡ�3�����ƥå�(8bits * 3 = 24bits)�ΥХ��ʥꥳ���ɤ�ASCIIʸ����
������65ʸ�� ([A-Za-z0-9+/]��64ʸ����padding�Τ����'=')��������Ѥ���
4�����ƥå�(6bits * 4 = 24bits)�ΰ�����ǽʸ������Ѵ����륨�󥳡��ǥ�
��ˡ�Ǥ���[[unknown:RFC:2045]]���������Ƥ��ޤ���

������ˡ:

  irb> require 'base64'
  true
  irb> b64encode("���ܸ�")
  xvzL3Ljs
  "xvzL3Ljs\n"
  irb> decode64('xvzL3Ljs')
  "���ܸ�"
  irb> decode_b("���ܸ�")
  xvzL3Ljs
  "���ܸ�"
  irb> decode_b("=?ISO-2022-JP?B?QyAbJEI4QDhsJV0lJCVzJT80MEE0QClHRhsoQg==?=")
  "C ����ݥ��󥿴�������"

= module Base64

== Module Functions
--- decode64(str)
Base64���󥳡��ɤ��줿ʸ����str��ǥ����ɤ��ޤ���

--- encode64(str)
ʸ����str��Base64���󥳡��ɤ��ޤ���

--- decode_b(str)
[[unknown:RFC:2047]] ���������Ƥ��� encoded-word ��
�ޤ�ʸ����str��ǥ����ɤ��ޤ���

encoded-word �ϡ�
  "=?" + charset + "?" + encoding + "?" + encoded-text + "?="
�Ȥ���������ʸ����ǡ��᡼��إå��˻��Ѥ���ޤ���

���δؿ��� charset �Ȥ��� "iso-2022-jp" �� "shift_jis" ��
encoding �Ȥ��� "B"-encoding (Base64) �����򥵥ݡ��Ȥ��Ƥ��ޤ���

�Х�:

�ºݤϡ������� Kconv.toeuc ��Ƥ�Ǥ��뤿�� [[unknown:nkf]]�饤�֥��
������˥ǥ����ɤ�ԤäƤ��ޤ��ޤ�([[unknown:NKF�����|nkf]]�򻲾ȤΤ���)��
�������äơ����δؿ��Ϥ��ޤ��̣���ʤ��ʤäƤ��ޤäƤ��ޤ�
(�Τ�Kconv�μ�����NKF����Ѥ��ʤ��ä����ᤳ�Τ褦�ʤ��Ȥˤʤä�
����Τ��Ȼפ��ޤ�)��

--- b64encode(bin, len = 60)
ʸ����bin�򥨥󥳡��ɤ���len��Ĺ�����ޤ��֤���ɽ�����ޤ���
ɽ���ޤǤ��Ƥ��ޤ��Τϥ���ץ������Ǥ���
