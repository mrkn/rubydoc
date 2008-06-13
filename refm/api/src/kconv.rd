ʸ�������ɤ��Ѵ����ڤ˹Ԥ�����Υ饤�֥��Ǥ���

kconv �� require ����� [[c:String]] ���饹�˰ʲ��Υ᥽�åɤ��������ޤ���
¾�Υ᥽�åɤ�����ˤĤ��Ƥ� [[c:Kconv]] �򻲾Ȥ��Ƥ���������

= reopen String

== Instance Methods

--- kconv(out_code, in_code = Kconv::AUTO)
#@todo

self �Υ��󥳡��ǥ��󥰤� out_code ���Ѵ������Τ�
�֤��ޤ���out_code in_code �� Kconv �������
���ꤷ�ޤ���

--- tojis
#@todo

self �Υ��󥳡��ǥ��󥰤� iso-2022-jp ���Ѵ�����ʸ�����
�֤��ޤ���

--- toeuc
#@todo

self �Υ��󥳡��ǥ��󥰤� euc-jp ���Ѵ�����ʸ�����
�֤��ޤ���

--- tosjis
#@todo

self �Υ��󥳡��ǥ��󥰤� shift_jis ���Ѵ�����ʸ�����
�֤��ޤ���

#@if (version >= "1.8.2")
--- toutf8
#@todo

((<ruby 1.8.2 feature>))


self �Υ��󥳡��ǥ��󥰤� utf8 ���Ѵ�����ʸ�����
�֤��ޤ���
#@end

#@if (version >= "1.8.2")
--- toutf16
#@todo

((<ruby 1.8.2 feature>))


self �Υ��󥳡��ǥ��󥰤� utf16 ���Ѵ�����ʸ�����
�֤��ޤ���
#@end

#@if (version >= "1.8.2")
--- iseuc
#@todo

((<ruby 1.8.2 feature>))


Kconv.iseuc(self) ��Ʊ���Ǥ���
#@end

#@if (version >= "1.8.2")
--- issjis
#@todo

((<ruby 1.8.2 feature>))


Kconv.issjis(self) ��Ʊ���Ǥ���
#@end

#@if (version >= "1.8.2")
--- isutf8
#@todo

((<ruby 1.8.2 feature>))


Kconv.isutf8(self) ��Ʊ���Ǥ���
#@end

= module Kconv

ʸ�������ɥ��󥳡��ǥ��󥰤��Ѵ����뤿��Υ⥸�塼�롣
[[c:Kconv]] �� [[lib:nkf]] �Υ�åѡ��Ǥ���

see also: [[m:kconv#String ���ɲä����᥽�å�]]

[[trap:Kconv]]

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

== Module Functions

--- kconv(str, out_code, in_code = Kconv::AUTO)
#@todo

ʸ���� str �Υ��󥳡��ǥ��󥰤� out_code ���Ѵ�������Τ�
�֤��ޤ���in_code ����ꤵ��Ƥ����� str �Υ��󥳡��ǥ��󥰤�
in_code ���Ȥ���ư��ޤ���

out_code in_code ������ǻ��ꤷ�ޤ���

--- tojis(str)
#@todo

ʸ���� str �Υ��󥳡��ǥ��󥰤� iso-2022-jp ���Ѵ������֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Kconv.kconv(str, Kconv::JIS)

--- toeuc(str)
#@todo

ʸ���� str �Υ��󥳡��ǥ��󥰤� euc-jp ���Ѵ������֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Kconv.kconv(str, Kconv::EUC)

--- tosjis(str)
#@todo

ʸ���� str �Υ��󥳡��ǥ��󥰤� shift_jis ���Ѵ������֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Kconv.kconv(str, Kconv::SJIS)

--- guess(str)
#@todo

ʸ���� str �Υ��󥳡��ǥ��󥰤�Ƚ�ꤷ�ޤ�������ͤ�
Kconv ������Ǥ���

#@since 1.8.2
--- guess_old(str)
#@todo
#@end

#@if (version >= "1.8.2")
--- toutf8(str)
#@todo

((<ruby 1.8.2 feature>)):
ʸ���� str �Υ��󥳡��ǥ��󥰤� utf8 ���Ѵ������֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Kconv.kconv(str, Kconv::UTF8)
#@end

#@if (version >= "1.8.2")
--- toutf16(str)
#@todo

((<ruby 1.8.2 feature>)):
ʸ���� str �Υ��󥳡��ǥ��󥰤� utf16 ���Ѵ������֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Kconv.kconv(str, Kconv::UTF16)
#@end

#@if (version >= "1.8.2")
--- iseuc(str)
#@todo

((<ruby 1.8.2 feature>)):
�ʲ���Ʊ���Ǥ���

  Kconv::RegexpEucjp.match(str)
#@end

#@if (version >= "1.8.2")
--- issjis(str)
#@todo

((<ruby 1.8.2 feature>)):
�ʲ���Ʊ���Ǥ���

  Kconv::RegexpShiftjis.match(str)
#@end

#@if (version >= "1.8.2")
--- isutf8(str)
#@todo

((<ruby 1.8.2 feature>)):
�ʲ���Ʊ���Ǥ���

  Kconv::RegexpUtf8.match(str)
#@end

== Constants

--- AUTO
#@todo

���󥳡��ǥ��󥰤�ư���Ф��ޤ���
���Ϥλ���ǤΤ�ͭ���Ǥ���

--- JIS
#@todo

iso-2022-jp ��ɽ���ޤ���

--- EUC
#@todo

euc-jp ��ɽ���ޤ���

--- SJIS
#@todo

shift_jis (���ե� JIS / MS ���������ɤȤ����) ��ɽ���ޤ���

--- BINARY
#@todo

JIS EUC SJIS �ʳ���ɽ���ޤ���

--- UNKNOWN
#@todo

���Ϥˤ����Ƥϡ֥��󥳡��ǥ��󥰤�Ƚ��Ǥ��ʤ��ä���
���Ϥˤ����Ƥ� AUTO ��Ʊ�ͤˡּ�ư���Сפ�ɽ���ޤ���

--- NOCONV
#@todo

�Ѵ�����ʤ����Ȥ�ɽ���ޤ���

#@if (version >= "1.8.2")
--- ASCII
#@todo

((<ruby 1.8.2 feature>)):
ASCII ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
--- UTF8
#@todo

((<ruby 1.8.2 feature>)):
UTF8 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
--- UTF16
#@todo

((<ruby 1.8.2 feature>)):
UTF16 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
--- UTF32
#@todo

((<ruby 1.8.2 feature>)):
UTF32 ��ɽ���ޤ���
#@end

#@if (version >= "1.8.2")
--- RegexpShiftjis
#@todo

((<ruby 1.8.2 feature>)):
SJIS �˥ޥå���������ɽ���Ǥ���
#@end

#@if (version >= "1.8.2")
--- RegexpEucjp
#@todo

((<ruby 1.8.2 feature>)):
EUCJP �˥ޥå���������ɽ���Ǥ���
#@end

#@if (version >= "1.8.2")
--- RegexpUtf8
#@todo

((<ruby 1.8.2 feature>)):
UTF8 �˥ޥå���������ɽ���Ǥ���
#@end

#@since 1.8.5
--- REVISION
#@todo
#@end

#@if (version >= "1.8.2")
#@if (version <= "1.8.4")
--- Iconv_EUC_JP
--- Iconv_Shift_JIS
--- Iconv_UTF8
#@todo
#@end
#@end
