require kconv
require nkf


MIME Base64�Υǥ�����/���󥳡��ɤ�Ԥ��᥽�åɤ��������Ƥ��ޤ���
���Υ饤�֥��� Base64 ���󥳡��ǥ��󥰤�
����ץ륹����ץȤȤ��ƽ񤫤�ޤ�����

Base64 �ϡ�3 �����ƥå� (8bits * 3 = 24bits) �ΥХ��ʥꥳ���ɤ�
ASCII ʸ���Τ����� 65 ʸ�� ([A-Za-z0-9+/] �� 64 ʸ���� '=')
��������Ѥ��� 4 �����ƥå� (6bits * 4 = 24bits)
�ΰ�����ǽʸ������Ѵ����륨�󥳡��ǥ���ˡ�Ǥ���
[[RFC:2045]]���������Ƥ��ޤ���

=== ������ˡ

  require 'base64'

  p b64encode("���ܸ�")      # => "xvzL3Ljs\n"
  p decode64('xvzL3Ljs')     # => "���ܸ�"
  p decode_b("���ܸ�")       # => "���ܸ�"
  p decode_b("=?ISO-2022-JP?B?QyAbJEI4QDhsJV0lJCVzJT80MEE0QClHRhsoQg==?=")
                             # => "C ����ݥ��󥿴�������"


#@since 1.8.2
= module Base64

== Module Functions

--- decode64(str) -> String

Base64���󥳡��ɤ��줿ʸ����str��ǥ����ɤ��ޤ���

@param src �ǥ����ɤ�����ʸ����Ǥ���

--- encode64(str) -> String

ʸ����str��Base64���󥳡��ɤ��ޤ���

@param src ���󥳡��ɤ�����ʸ����Ǥ���

--- decode_b(str) -> String

[[rfc:2047]] ���������Ƥ��� encoded-word ��ޤ�
ʸ���� str ��ǥ����ɤ��ޤ���

encoded-word �ϡ�

  "=?" + charset + "?" + encoding + "?" + encoded-text + "?="

�Ȥ���������ʸ����ǡ��᡼��إå��˻��Ѥ���ޤ���

���δؿ��� charset �Ȥ��� "iso-2022-jp" �� "shift_jis" ��
encoding �Ȥ��� "B" encoding (Base64) �����򥵥ݡ��Ȥ��Ƥ��ޤ���

�Х�:

�ºݤϡ������� [[m:Kconv.toeuc]] ��Ƥ�Ǥ��뤿�ᡢ [[lib:Kconv]] ����
��Ū�����Ѥ��� [[lib:nkf]] �饤�֥�꤬����˥ǥ����ɤ�ԤäƤ��ޤ��ޤ���
�������äơ����δؿ��Ϥ��ޤ��̣���ʤ��ʤäƤ��ޤäƤ��ޤ�(�Τ� Kconv
�μ����� NKF ����Ѥ��ʤ��ä����ᤳ�Τ褦�ʤ��ȤˤʤäƤ���Τ��Ȼפ��
�ޤ�)��

@param src �ǥ����ɤ�����ʸ����Ǥ���

--- b64encode(bin, len = 60) -> ()

ʸ���� bin �򥨥󥳡��ɤ���len ��Ĺ�����ޤ��֤���ɽ�����ޤ���

ɽ���ޤǤ��Ƥ��ޤ��Τϥ���ץ������Ǥ���

#@include(base64/Base64__Deprecated)

= reopen Kernel

== Module Functions

--- decode64(str) -> String

[[m:Base64.decode64]] ��Ʊ���Ǥ������Υ᥽�åɤϾ���Ū���ѻߤ�����ǽ
�������ꡢ���ߤ� Base64 �⥸�塼���Ȥ����Ȥ��侩����Ƥ��ޤ���

--- encode64(str) -> String

[[m:Base64.encode64]] ��Ʊ���Ǥ������Υ᥽�åɤϾ���Ū���ѻߤ�����ǽ
�������ꡢ���ߤ� Base64 �⥸�塼���Ȥ����Ȥ��侩����Ƥ��ޤ���

--- decode_b(str) -> String

[[m:Base64.decode_b]] ��Ʊ���Ǥ������Υ᥽�åɤϾ���Ū���ѻߤ�����ǽ
�������ꡢ���ߤ� Base64 �⥸�塼���Ȥ����Ȥ��侩����Ƥ��ޤ���

--- b64encode(bin, len = 60) -> ()

[[m:Base64.b64encode]] ��Ʊ���Ǥ������Υ᥽�åɤϾ���Ū���ѻߤ�����ǽ
�������ꡢ���ߤ� Base64 �⥸�塼���Ȥ����Ȥ��侩����Ƥ��ޤ���

#@end

#@if (version <= "1.8.1")
= reopen Kernel

== Private Instance Methods

--- decode64(str) -> String

ʸ����str��Base64���󥳡��ɤ��ޤ���

@param src ���󥳡��ɤ�����ʸ����Ǥ���

--- encode64(str) -> String

ʸ����str��Base64���󥳡��ɤ��ޤ���

@param src ���󥳡��ɤ�����ʸ����Ǥ���

--- decode_b(str) -> String

[[rfc:2047]] ���������Ƥ��� encoded-word ��ޤ�
ʸ���� str ��ǥ����ɤ��ޤ���

encoded-word �ϡ�

  "=?" + charset + "?" + encoding + "?" + encoded-text + "?="

�Ȥ���������ʸ����ǡ��᡼��إå��˻��Ѥ���ޤ���

���δؿ��� charset �Ȥ��� "iso-2022-jp" �� "shift_jis" ��
encoding �Ȥ��� "B" encoding (Base64) �����򥵥ݡ��Ȥ��Ƥ��ޤ���

�Х�:

�ºݤϡ������� [[m:Kconv.toeuc]] ��Ƥ�Ǥ��뤿�ᡢ [[lib:Kconv]] ����
��Ū�����Ѥ��� [[lib:nkf]] �饤�֥�꤬����˥ǥ����ɤ�ԤäƤ��ޤ��ޤ���
�������äơ����δؿ��Ϥ��ޤ��̣���ʤ��ʤäƤ��ޤäƤ��ޤ�(�Τ� Kconv
�μ����� NKF ����Ѥ��ʤ��ä����ᤳ�Τ褦�ʤ��ȤˤʤäƤ���Τ��Ȼפ��
�ޤ�)��

@param src �ǥ����ɤ�����ʸ����Ǥ���

--- b64encode(bin, len = 60) -> ()

ʸ���� bin �򥨥󥳡��ɤ���len ��Ĺ�����ޤ��֤���ɽ�����ޤ���

ɽ���ޤǤ��Ƥ��ޤ��Τϥ���ץ������Ǥ���

#@end
