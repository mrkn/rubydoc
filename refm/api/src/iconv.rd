#@since 1.8.0
Iconv �� UNIX 95 �� iconv() �ؿ��Υ�åѡ��ǡ�
���ޤ��ޤ�ʸ���������ηϴ֤�ʸ������Ѵ���Ԥʤ��ޤ���

�ܺ٤� [[url:http://www.opengroup.org/]] �Υ���饤��ɥ�����Ȥ�
���Ȥ��Ʋ�������

  * [[man:iconv(3)]]
  * [[man:iconv_open(3)]]
  * [[man:iconv_close(3)]]
  * [[url:http://www.opengroup.org/onlinepubs/009695399/basedefs/iconv.h.html]]

=== ���

�ɤ�ʸ���������ηϤ����ѤǤ��뤫�ϥץ�åȥե������¸�Ǥ��������ʸ���������ηϤ򤢤�魯ʸ�����ץ�åȥե������¸�Ǥ������ܸ� EUC �򤢤�魯ʸ���� EUC-JP, euc-jp, eucJP �ʤɰۤʤ��礬����ޤ������Υץ�åȥե�����ˤ��㤤��ۼ����뤿��ˡ�
��ext/iconv/charset_alias.rb�� ���Ѱդ���Ƥ��ޤ���
GNU ���եȥ����� texinfo ([[url:http://www.gnu.org/software/texinfo/]]) �˴ޤޤ��ե����� config.charset ��ʲ��Υߥ顼�����Ȥ����������

#@# * [[url:http://tug.ctan.org/cgi-bin/getFile.py?fn=/macros/texinfo/texinfo/intl/config.charset]]
#@# * [[url:http://ring.riken.go.jp/archives/text/CTAN/macros/texinfo/texinfo/intl/config.charset]]
 * [[url:http://ring.riken.go.jp/archives/text/CTAN/macros/texinfo/texinfo/gnulib/lib/config.charset]]

ext/iconv/ ���֤���ext/iconv/ �Ǽ��Τ褦�˼¹Ԥ����

  ruby extconf.rb
  make

iconv.rb ����������ޤ������� iconv.rb ���ץ�åȥե�����ˤ��ʸ���������ηϤ򤢤�魯ʸ����ΰ㤤��ۼ����ޤ���

config.charset �Υ饤���󥹤� LGPL �ʤΤǡ��������줿 iconv.rb �ˤ� LGPL ��Ŭ�Ѥ���ޤ���
#@# ��Ĵ��

=== ��

  require 'iconv'
  euc = ["a4a2a4a4a4a6a4a8a4aa"].pack("H*") # ����������
  sjis = ["82a082a282a482a682a8"].pack("H*")
  iconv = Iconv.new('SHIFT_JIS', 'EUC-JP')  # EUC-JP ���� SHIFT_JIS ���Ѵ�
  str = iconv.iconv(euc)
  str << iconv.iconv(nil)
  p( str == sjis )

(1) ������ [[c:Iconv]] �Υ��󥹥��󥹤���, [[m:Iconv#iconv]] �᥽�åɤ�Ȥ�
      cd = Iconv.new(to, from)
      begin
        input.each {|s| output << cd.iconv(s)}
        output << cd.iconv(nil)      # don't forget this
      ensure
        cd.close
      end
(2) [[m:Iconv.open]] ��֥�å��Ĥ��ǸƤӽФ�
      Iconv.open(to, from) do |cd|
        input.each {|s| output << cd.iconv(s)}
        output << cd.iconv(nil)
      end
(3) (2) ��û�̷�
      Iconv.iconv(to, from, *input.to_a)

=== ����

  * ɸ��ź�ե饤�֥��Ҳ���� 3 ��� Kconv/NKF/Iconv ([[url:http://jp.rubyist.net/magazine/?0009-BundledLibraries#l30]])

= class Iconv < Data
iconv �ؿ��Υ�åѡ����饹�Ǥ���

== Class Methods

--- new(to, from)    -> Iconv

ʸ�������� from ���� to ���Ѵ�����Iconv���֥������Ȥ��������ޤ���

@param to �Ѵ����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param from �Ѵ�����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@raise TypeError to �� from �� String ���֥������ȤǤʤ��Ȥ�ȯ�����ޤ���

@raise Iconv::InvalidEncoding to �� from �ǻ��ꤵ�줿ʸ���������ηϤ����Ĥ���ʤ��Ȥ�ȯ�����ޤ���

@raise SystemCallError [[man:iconv_open(3)]] �����Ԥ����Ȥ�ȯ�����ޤ���

��:
  require 'iconv'
  # EUC-JP ���� SHIFT_JIS ���Ѵ�����Iconv���֥������Ȥ�������
  icv = Iconv.new('SHIFT_JIS', 'EUC-JP')
 
--- open(to, from)               -> Iconv
--- open(to, from) {|cd| ...}    -> object

�֥�å���Ϳ�����ʤ����� [[m:Iconv.new]] �������Ǥ���
�֥�å���Ϳ������ȡ�Iconv ���֥������Ȥ������������������Ȥ��ƥ֥�å���¹Ԥ��ޤ���
�֥�å��ν���� Iconv ���֥������Ȥ� close ����ޤ���
�֥�å����ͤ��֤��ޤ���

@param to �Ѵ����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param from �Ѵ�����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@raise TypeError to �� from �� String ���֥������ȤǤʤ��Ȥ�ȯ�����ޤ���

@raise Iconv::InvalidEncoding to �� from �ǻ��ꤵ�줿ʸ���������ηϤ����Ĥ���ʤ��Ȥ�ȯ�����ޤ���

��:
  euc = ["a4a2a4a4a4a6a4a8a4aa"].pack("H*") # ������������EUC-JP������

  Iconv.open("UTF-8", "EUC-JP") do |i|
    str = i.iconv(euc)
    str << i.iconv(nil)
  end
  puts str #=> ����������

--- iconv(to, from, *strs)    -> Array

Ϳ����줿ʸ�������ɤˤ������ä� strs ���Ѵ�������̤�ʸ���������Ȥ����֤��ޤ���

���ξ�ά���Ǥ���
  Iconv.open(to, from) {|cd| (strs + [nil]).collect {|s| cd.iconv(s)}}

@param to �Ѵ����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param from �Ѵ�����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param strs �Ѵ�������ʸ�������ꤷ�ޤ���

���Υ᥽�åɤ�
[[m:Iconv.new]], [[m:Iconv.open]] ����� [[m:Iconv#iconv]] ���㳰
�򵯤����ޤ���

--- conv(to, from, str)     -> String

Ϳ����줿ʸ�������ɤˤ������ä� str ���Ѵ�������̤�ʸ����Ȥ����֤��ޤ���

���ξ�ά���Ǥ���
  Iconv.iconv(to, from, str).join

@param to �Ѵ����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param from �Ѵ�����ʸ���������ηϤ�ɽ��ʸ�������ꤷ�ޤ���

@param str �Ѵ�������ʸ�������ꤷ�ޤ���

���Υ᥽�åɤ�
[[m:Iconv.new]], [[m:Iconv.open]] ����� [[m:Iconv#iconv]] ���㳰
�򵯤����ޤ���

#@since 1.9.1
--- list                       -> Array
--- list {|*aliases| ... }     -> Array

�ƥ����ꥢ�����åȤ��Ȥ˷����֤����ƥ졼���Ǥ���
�֥�å������ꤵ��Ƥ��ʤ���С��������Ѳ�ǽ��ʸ���������ηϤ�̾����ʸ���������Ȥ����֤��ޤ���
Iconv ɸ��ε�ǽ�ǤϤʤ��Τǥ��ݡ��Ȥ���뤫�ϥץ�åȥե�����˰�¸���ޤ���

@raise NotImplementedError �¹ԥץ�åȥե�����ǥ��ݡ��Ȥ���Ƥ��ʤ�����ȯ�����ޤ���
#@end

--- charset_map -> Hash

#@# Returns the map from canonical name to system dependent name.

ʸ�������ɥ��å�̾���饷���ƥ��¸��ʸ�������ɥ��å�̾�ؤ� [[c:Hash]] ���֤��ޤ���

#@since 1.9.1
--- ctlmethods -> Array

#@# Returns available iconvctl() method list.
�����ƥ���libiconv��iconvctl()�ؿ��ǻ��Ѳ�ǽ�ʥե饰�Υꥹ�Ȥ� [[c:Array]] �Ȥ����֤��ޤ���

#@end

== Instance Methods

--- close    -> String

�Ѵ���λ���ޤ������ϥХåե��������եȾ��֤��᤹�����ʸ������֤��ޤ���
���Ϥ�ʸ����沽�������������֤������ʤ���硢��ʸ������֤��ޤ���

���Υ᥽�åɤ��ƤФ줿���Ȥ� [[m:Iconv#iconv]] ���ƤФ����㳰��
�����ޤ�����close ���ΤϷ��֤��ƤФ�Ƥ��������ޤ���

��:

  i = Iconv.open("ISO-2022-JP", "EUC-JP")
  i.iconv("\264\301")     #=> "\e$B4A"
  i.iconv("\273\372")     #=> ";z"
  i.close                 #=> "\e(B"

--- iconv(str, start = 0, length = -1)    -> String

ʸ������Ѵ��򳫻Ϥ����Ѵ����ʸ������֤��ޤ���
str ��ʸ����ξ�硢str[start, length] ���Ѵ�����
�Ѵ����ʸ������֤��ޤ���

str �� nil �ξ�硢�Ѵ���򤽤ν�����եȾ��֤ˤ���
���ϥХåե��������եȾ��֤��᤹����ΥХ����󤫤�ʤ�ʸ������֤��ޤ���
���Ϥ�ʸ����沽�������������֤������ʤ���硢��ʸ������֤��ޤ���

@param str �Ѵ������ʸ����ޤ��� nil ����ꤷ�ޤ���

@param start str �Τ����Ѵ��򳫻Ϥ��륪�ե��åȤ���ꤷ�ޤ���

@param length str �Τ����Ѵ�����Ĺ������ꤷ�ޤ���nil �� -1 �ΤȤ��ϡ�start �ʹ��������̣���ޤ���

@raise Iconv::IllegalSequence str�˻��ꤵ�줿ʸ��������Ϥ˻ؼ����줿ʸ�������ɤ˴ޤޤ�ʤ�������Ѵ�����ߤ�������ȯ�����ޤ���

@raise Iconv::InvalidCharacter ���ϤκǸ夬�Դ�����ʸ�������եȤǽ��äƤ��뤿����Ѵ�����ߤ�������ȯ�����ޤ���

@raise Iconv::OutOfRange �饤�֥����������顼��ȯ����������ȯ�����ޤ���

#@since 1.9.1

--- conv(str) -> String

ʸ������Ѵ������Ѵ����ʸ������֤��ޤ���
str �� nil �ξ�硢��ʸ����""���֤��ޤ���

@param str �Ѵ������ʸ�������ꤷ�ޤ���

��:
  utf8 = ["E38182E38184E38186E38188E3818A"].pack("H*") # ����������

  iconv = Iconv.new('EUC-JP', 'UTF-8') # UTF-8 ���� EUC ���Ѵ�
  str = iconv.conv(utf8)
  puts str #=> "����������"

--- discard_ilseq=
#@todo

Sets discard_ilseq flag.

--- discard_ilseq?
#@todo

Returns discard_ilseq flag

--- transliterate=
#@todo

Sets transliterate flag.

--- transliterate?
#@todo

Returns transliterate flag.

--- trivial?
#@todo

Returns trivial flag.

#@end

= module Iconv::Failure

[[c:Iconv]] ���������㳰�Τ���Υ⥸�塼��Ǥ���

== Instance Methods

--- success    -> String
#@todo

�㳰��������ޤǤ��Ѵ�����������ʸ������֤��ޤ���

[[m:Iconv.iconv]] �Ǥ����㳰�������ä��Ȥ����֤�����ͤϡ�
�������㳰��������ޤǤ��Ѵ�����������ʸ��������ǤȤ�������Ǥ���
�Ǹ�����Ǥ��Ѵ����ʸ����Ǥ���

--- failed    -> String
#@todo

[[c:Iconv]] ���Ϥ��줿ʸ����Τ�����
�㳰�������ä����֤���Ϥ��ޤ���ʬ���֤��ޤ���

--- inspect    -> String
#@todo

#<type: "success", "failed"> �Τ褦�ʷ��򤷤�
ʸ������֤��ޤ���


#@since 1.8.4
= class Iconv::BrokenLibrary < RuntimeError
include Iconv::Failure

iconv �饤�֥��ΥХ��ʤɤˤ�ꡢ[[man:errno]] �����ꤵ��ʤ��ä�����ȯ�����ޤ���
(Windows �� iconv.dll �λ��Ѥ��� MSVC runtime DLL �ΥС�����󤬡�ruby ���Τ����Ѥ����ΤȰ��פ��Ƥ��ʤ�����ޤߤޤ���)
#@end

= class Iconv::IllegalSequence < ArgumentError
include Iconv::Failure

���Ϥ����Ϥ�ʸ�����ؼ����줿ʸ������˴ޤޤ�ʤ�������Ѵ�����ߤ�������
��ɽ���ޤ���

= class Iconv::InvalidCharacter < ArgumentError
include Iconv::Failure

���ϤκǸ夬�Դ�����ʸ�������եȤǽ��äƤ��뤿����Ѵ�����ߤ�������
��ɽ���ޤ���

#@since 1.8.3
= class Iconv::InvalidEncoding < ArgumentError
include Iconv::Failure

�᥽�åɤΰ������ǻ��ꤵ�줿ʸ���������ηϤ����Ĥ���ʤ� (�����ƥ���ͭ���Ǥʤ�) ����ȯ�����ޤ���
#@end

= class Iconv::OutOfRange < RuntimeError
include Iconv::Failure

Iconv �饤�֥����������顼�Ǥ��������㳰�ϵ�����ʤ��Ϥ��Ǥ���
#@end
