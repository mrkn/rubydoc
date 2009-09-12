���ܸ�ʸ�������ɤ��Ѵ����ڤ˹Ԥ�����Υ饤�֥��Ǥ���

kconv �� require ����� [[c:String]] ���饹���Ѵ��ѤΥ᥽�åɤ��������ޤ���
[[c:Kconv]] �ˤ�Ʊ���Υ᥽�åɤ��������ޤ��� [[c:Kconv]] �ˤ�
���󥳡��ǥ��󥰤�ɽ��������������Ƥ��ޤ���

=== ������

  newstring = Kconv.kconv(string, Kconv::JIS, Kconv::AUTO)
  newstring = Kconv.tojis(string)
  newstring = Kconv.toeuc(string)
  newstring = Kconv.tosjis(string)
  guessed_code = Kconv.guess(string)

�ޤ���

  newstring = string.kconv(Kconv::JIS, Kconv::AUTO)
  newstring = string.tojis
  newstring = string.toeuc
  newstring = string.tosjis


= reopen String

== Instance Methods

--- kconv(out_code, in_code = Kconv::AUTO) -> String

self �Υ��󥳡��ǥ��󥰤� out_code ���Ѵ�����ʸ�����
�֤��ޤ���
out_code in_code �� [[c:Kconv]] ������ǻ��ꤷ�ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]] ��ȤäƤ���������

@param out_code �Ѵ���Υ��󥳡��ǥ��󥰤� [[c:Kconv]] ������ǻ��ꤷ�ޤ���
@param in_code �Ѵ�����ʸ����Υ��󥳡��ǥ��󥰤� [[c:Kconv]] ������ǻ��ꤷ�ޤ���

@see [[m:Kconv.#kconv]]

--- tojis -> String

self �Υ��󥳡��ǥ��󥰤� iso-2022-jp ���Ѵ�����ʸ�����
�֤��ޤ����Ѵ����Υ��󥳡��ǥ��󥰤�ʸ��������Ƥ����¬���ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-jxm0', str)
��ȤäƤ���������

@see [[m:Kconv.#tojis]]
--- toeuc -> String

self �Υ��󥳡��ǥ��󥰤� EUC-JP ���Ѵ�����ʸ�����
�֤��ޤ����Ѵ����Υ��󥳡��ǥ��󥰤�ʸ��������Ƥ����¬���ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-exm0', str)
��ȤäƤ���������

@see [[m:Kconv.#toeuc]]
--- tosjis -> String

self �Υ��󥳡��ǥ��󥰤� shift_jis ���Ѵ�����ʸ�����
�֤��ޤ����Ѵ����Υ��󥳡��ǥ��󥰤�ʸ��������Ƥ����¬���ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-sxm0', str)
��ȤäƤ���������

@see [[m:Kconv.#tosjis]]

#@if (version >= "1.8.2")
--- toutf8 -> String

self �Υ��󥳡��ǥ��󥰤� UTF-8 ���Ѵ�����ʸ�����
�֤��ޤ����Ѵ����Υ��󥳡��ǥ��󥰤�ʸ��������Ƥ����¬���ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-wxm0', str)
��ȤäƤ���������

@see [[m:Kconv.#toutf8]]
#@end

#@if (version >= "1.8.2")
--- toutf16 -> String

self �Υ��󥳡��ǥ��󥰤� UTF-16BE ���Ѵ�����ʸ�����
�֤��ޤ����Ѵ����Υ��󥳡��ǥ��󥰤�ʸ��������Ƥ����¬���ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-w16xm0', str)
��ȤäƤ���������

@see [[m:Kconv.#toutf16]]

#@end

#@if (version >= "1.8.2")
--- iseuc -> bool

self �� EUC-JP �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

[[m:Kconv.#iseuc]](self) ��Ʊ���Ǥ���

#@end

#@if (version >= "1.8.2")
--- issjis -> bool

self �� Shift_JIS �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���


[[m:Kconv.#issjis]] ��Ʊ���Ǥ���

#@end

#@if (version >= "1.8.2")
--- isutf8 -> bool

self �� UTF-8 �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

[[m:Kconv.#isutf8]](self) ��Ʊ���Ǥ���
#@end

#@since 1.9.1
--- isjis -> bool

self �� ISO-2022-JP �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

Kconv.isjis(self) ��Ʊ���Ǥ���

#@end
= module Kconv

ʸ�������ɥ��󥳡��ǥ��󥰤��Ѵ����뤿��Υ⥸�塼�롣
[[c:Kconv]] �� [[lib:nkf]] �Υ�åѡ��Ǥ���

#@#[[trap:Kconv]]

== Module Functions

--- kconv(str, out_code, in_code = Kconv::AUTO) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� out_code ���Ѵ�������Τ�
�֤��ޤ���in_code ����ꤵ��Ƥ����� str �Υ��󥳡��ǥ��󥰤�
in_code ���Ȥ���ư��ޤ���

���Υ᥽�åɤ�MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]] ��ȤäƤ���������

@param str �Ѵ�����ʸ����
@param out_code �Ѵ���Υ��󥳡��ǥ���
@param in_code str�Υ��󥳡��ǥ���

@see [[m:String#kconv]]

--- tojis(str) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� iso-2022-jp ���Ѵ������֤��ޤ���

Kconv.kconv(str, Kconv::JIS) ��Ʊ���Ǥ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-jxm0', str)
��ȤäƤ���������

@param str �Ѵ�����ʸ����

@see [[m:Kconv.#kconv]], [[m:String#tojis]]
--- toeuc(str) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� EUC-JP ���Ѵ������֤��ޤ���

Kconv.kconv(str, Kconv::EUC)��Ʊ���Ǥ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-exm0', str)
��ȤäƤ���������

@param str �Ѵ�����ʸ����

@see [[m:Kconv.#kconv]], [[m:String#toeuc]]

--- tosjis(str) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� shift_jis ���Ѵ������֤��ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-sxm0', str)
��ȤäƤ���������

Kconv.kconv(str, Kconv::SJIS)��Ʊ���Ǥ���

@param str �Ѵ�����ʸ����

@see [[m:Kconv.#kconv]], [[m:String#tosjis]]

#@until 1.9.0
--- guess(str) -> Integer
#@else
--- guess(str) -> Encoding | nil
#@end

ʸ���� str �Υ��󥳡��ǥ��󥰤�Ƚ�ꤷ�ޤ�������ͤ�
Kconv ������Ǥ���

���Υ⥸�塼��ؿ���Ƚ��Ǥ���Τϡ�
  * ISO-2022-JP ([[m:Kconv::JIS]])
  * Shift_JIS ([[m:Kconv::SJIS]])
  * EUC-JP ([[m:Kconv::EUC]])
#@since 1.8.2
  * ASCII ([[m:Kconv::ASCII]])
  * UTF-8 ([[m:Kconv::UTF8]])
  * UTF-16BE ([[m:Kconv::UTF16]])
#@end
  * ���� ([[m:Kconv::UNKNOWN]])
  * �ʾ�Τɤ�Ǥ�ʤ� ([[m:Kconv::BINARY]])
�Τ����줫�Ǥ���

@param str ���󥳡��ǥ���Ƚ���оݤ�ʸ����

#@since 1.8.2
#@if (version < "1.9.0")
--- guess_old(str) -> Integer
ʸ���� str �Υ��󥳡��ǥ��󥰤�Ƚ�ꤷ�ޤ�������ͤ�
Kconv ������Ǥ���

���Υ⥸�塼��ؿ���Ƚ��Ǥ���Τϡ�
  * ISO-2022-JP ([[m:Kconv::JIS]])
  * Shift_JIS ([[m:Kconv::SJIS]])
  * EUC-JP ([[m:Kconv::EUC]])
  * ���� ([[m:Kconv::UNKNOWN]])
  * �ʾ�Τɤ�Ǥ�ʤ� ([[m:Kconv::BINARY]])
�Τ����줫�Ǥ���

@param str ���󥳡��ǥ���Ƚ���оݤ�ʸ����
@see [[m:Kconv.#guess]]
#@end
#@end

#@if (version >= "1.8.2")
--- toutf8(str) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� UTF-8 ���Ѵ������֤��ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-wxm0', str)
��ȤäƤ���������

Kconv.kconv(str, Kconv::UTF8)��Ʊ���Ǥ���

@param str �Ѵ�����ʸ����
@see [[m:String#toutf8]]

#@end

#@if (version >= "1.8.2")
--- toutf16(str) -> String

ʸ���� str �Υ��󥳡��ǥ��󥰤� UTF-16BE ���Ѵ������֤��ޤ���

���Υ᥽�åɤ� MIME ���󥳡��ɤ��줿ʸ�����Ÿ������
������Ⱦ�ѥ��ʤ����Ѥ��Ѵ����ޤ���
�������Ѵ��������ʤ����ϡ� [[m:NKF.#nkf]]('-w16xm0', str)
��ȤäƤ���������

Kconv.kconv(str, Kconv::UTF16)��Ʊ���Ǥ���

@param str �Ѵ�����ʸ����
@see [[m:String#toutf16]]

#@end

#@if (version >= "1.8.2")
--- iseuc(str) -> bool
ʸ���� str �� EUC-JP �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

@param str Ƚ���оݤ�ʸ����
@see [[m:String#iseuc]]

#@end

#@if (version >= "1.8.2")
--- issjis(str) -> bool
ʸ���� str �� Shift_JIS �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

@param str Ƚ���оݤ�ʸ����
@see [[m:String#issjis]]

#@end

#@if (version >= "1.8.2")
--- isutf8(str) -> bool
ʸ���� str �� UTF-8 �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

@param str Ƚ���оݤ�ʸ����
@see [[m:String#isutf8]]
#@end

#@since 1.9.1
--- isjis(str) -> bool
ʸ���� str �� ISO-2022-JP �ʥХ�����Ȥ��������Ǥ��뤫�ɤ�����Ƚ�ꤷ�ޤ���

@param str Ƚ���оݤ�ʸ����
@see [[m:String#isjis]]
#@end
== Constants

#@if (version < "1.9.0")
--- AUTO -> Integer
#@else
--- AUTO -> nil
#@end

���󥳡��ǥ��󥰤�ư���Ф��ޤ���
���Ϥλ���ǤΤ�ͭ���Ǥ���

#@if (version < "1.9.0")
--- JIS -> Integer
#@else
--- JIS -> Encoding
#@end

ISO-2022-JP ��ɽ���ޤ���

#@if (version < "1.9.0")
--- EUC -> Integer
#@else
--- EUC -> Encoding
#@end

EUC-JP ��ɽ���ޤ���

#@if (version < "1.9.0")
--- SJIS -> Integer
#@else
--- SJIS -> Encoding
#@end

Shift_JIS ��ɽ���ޤ���
cp932�ǤϤʤ����Ȥ���դ��Ƥ���������

#@if (version < "1.9.0")
--- BINARY -> Integer
#@else
--- BINARY -> Encoding
#@end

#@if (version < "1.8.2")
JIS EUC SJIS �ʳ���ɽ���ޤ���
#@else
JIS EUC SJIS UTF8 UTF16 �ʳ���ɽ���ޤ���
#@end
�����ͤ�[[m:Kconv.#guess]]���֤��ͤȤ��ƤΤ��Ѥ����ޤ���

#@if (version < "1.9.0")
--- UNKNOWN -> Integer
#@else
--- UNKNOWN -> nil
#@end

���Ϥˤ����Ƥϡ֥��󥳡��ǥ��󥰤�Ƚ��Ǥ��ʤ��ä���
���Ϥˤ����Ƥ� AUTO ��Ʊ�ͤˡּ�ư���Сפ�ɽ���ޤ���

#@if (version < "1.9.0")
--- NOCONV -> Integer
#@else
--- NOCONV -> nil
#@end

�Ѵ�����ʤ����Ȥ�ɽ���ޤ���
���ϥ��󥳡��ǥ��󥰤λ���ˤΤ��Ѥ��ޤ���

#@if (version >= "1.8.2")
#@if (version < "1.9.0")
--- ASCII -> Integer
#@else
--- ASCII -> Encoding
#@end

ASCII ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
#@if (version < "1.9.0")
--- UTF8 -> Integer
#@else
--- UTF8 -> Encoding
#@end

UTF8 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
#@if (version < "1.9.0")
--- UTF16 -> Integer
#@else
--- UTF16 -> Encoding
#@end

UTF16 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
#@if (version < "1.9.0")
--- UTF32 -> Integer
#@else
--- UTF32 -> Encoding
#@end

UTF32 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
#@if (version < "1.9.0")
--- RegexpShiftjis -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���

--- RegexpEucjp -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���

--- RegexpUtf8 -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���
#@end
#@end

#@since 1.8.5
#@if (version < "1.9.0")
--- REVISION -> String
��������ϻȤ��٤��ǤϤ���ޤ���
#@end
#@end

#@if (version >= "1.8.2")
#@if (version <= "1.8.4")
--- Iconv_EUC_JP -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���
--- Iconv_Shift_JIS -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���
--- Iconv_UTF8 -> Regexp
��������ϻȤ��٤��ǤϤ���ޤ���
#@end
#@end
