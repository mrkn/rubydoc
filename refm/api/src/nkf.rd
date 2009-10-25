nkf �� Ruby ����Ȥ�����Υ饤�֥��Ǥ���

= module NKF

nkf(Network Kanji code conversion Filter, [[url:http://sourceforge.jp/projects/nkf/]]) ��
Ruby ����Ȥ�����Υ⥸�塼��Ǥ���

#@since 1.8.2
Ruby 1.8.2 �ʹߤǤ� nkf �� 2.0 �ʹߤ������ޤ�Ƥ��ޤ���
#@end

=== �Ȥ���

�ʲ��ϡ������������Ѵ����ޥ�ɤ���Ǥ���

  #!/usr/local/bin/ruby
  
  require 'nkf'
  
  opt = ''
  opt = ARGV.shift if ARGV[0][0] == ?-
  
  while line = ARGF.gets
    print NKF.nkf(opt, line)
  end

�ʲ��ϡ�����������Ƚ�̥��ޥ�ɤ���Ǥ���

  #!/usr/local/bin/ruby
  
  require 'nkf'
  
  CODES = {
    NKF::JIS      => "JIS",
    NKF::EUC      => "EUC",
    NKF::SJIS     => "SJIS",
    NKF::UTF8     => "UTF8",
    NKF::BINARY   => "BINARY",
    NKF::ASCII    => "ASCII",
    NKF::UNKNOWN  => "UNKNOWN",
  }
  
  while file = ARGV.shift
    str = open(file) {|io| io.gets(nil) }
    
    printf "%-10s ", file
    if str.nil?
      puts "EMPTY"
    else
      puts CODES.fetch(NKF.guess(str))
    end
  end

=== ���ץ����ʸ����

#@since 1.8.2
==== Ruby 1.8.2 �ʹ�

NKF 2.0.5 �����Ǥ���

  b,u      Output is buffered (DEFAULT),Output is unbuffered
  j,s,e,w  Output code is JIS 7 bit (DEFAULT), Shift JIS, AT&T JIS (EUC), UTF-8
           After 'w' you can add more options. (80?|16((B|L)0?)?)
  J,S,E,W  Input assumption is JIS 7 bit , Shift JIS, AT&T JIS (EUC), UTF-8
           After 'W' you can add more options. (8|16(B|L)?)
  t        no conversion
  i_/o_    Output sequence to designate JIS-kanji/ASCII (DEFAULT B)
  r        {de/en}crypt ROT13/47
  h        1 katakana->hiragana, 2 hiragana->katakana, 3 both
  m[BQN0]  MIME decode [B:base64,Q:quoted,N:non-strict,0:no decode]
  M[BQ]    MIME encode [B:base64 Q:quoted]
  l        ISO8859-1 (Latin-1) support
  f/F      Folding: -f60 or -f or -f60-10 (fold margin 10) F preserve nl
  Z[0-3]   Convert X0208 alphabet to ASCII  1: Kankaku to space,2: 2 spaces,
                                            3: Convert HTML Entity
  X,x      Assume X0201 kana in MS-Kanji, -x preserves X0201
  B[0-2]   Broken input  0: missing ESC,1: any X on ESC-[($]-X,2: ASCII on NL
  T        Text mode output
  d,c      Delete \r in line feed and \032, Add \r in line feed
  I        Convert non ISO-2022-JP charactor to GETA
  -L[uwm]  line mode u:LF w:CRLF m:CR (DEFAULT noconversion)
  long name options
   --fj,--unix,--mac,--windows                        convert for the system
   --jis,--euc,--sjis,--utf8,--utf16,--mime,--base64  convert for the code
   --hiragana, --katakana    Hiragana/Katakana Conversion
   --cap-input, --url-input  Convert hex after ':' or ''
   --numchar-input   Convert Unicode Character Reference
   --no-cp932        Don't convert Shift_JIS FAxx-FCxx to equivalnet CP932
   --cp932inv        convert Shift_JIS EDxx-EFxx to equivalnet CP932 FAxx-FCxx
   --ms-ucs-map      Microsoft UCS Mapping Compatible

#@else
==== Ruby 1.8.2 ������ΥС������

NKF 1.7 �����Ǥ���
#@# Ruby �Ǥ�̵��̣�ʥ��ץ����⤢�뤫�⤷��ޤ���

  -b   �Хåե���󥰽��Ϥ�Ԥ���(�ǥե����)
  -u   ���ϻ��ˡ��Хåե���󥰤��ʤ���
  -t   ���⤷�ʤ���

  -j   JIS�����ɤ���Ϥ��롣(�ǥե����)
  -e   EUC�����ɤ���Ϥ��롣
  -s   ���ե�JIS�����ɤ���Ϥ��롣

  -i?  JIS������ؼ����륷�����󥹤Ȥ��� ESC-'$'-?����Ѥ��롣
       (�ǥե���Ȥϡ�ESC-'$'-'B')
  -o?  1�Х��ȱѿ�ʸ�����åȤ�ؼ����륷�����󥹤Ȥ��ơ�ESC-
       '('-?����Ѥ��롣(�ǥե���Ȥϡ�ESC-'('-'B')

  -r   ROT13/47���Ѵ��򤹤롣
  -v   �С�������ɽ�����롣
  -T   �ƥ����ȥ⡼�ɤǽ��Ϥ��롣(MS-DOS��ǤΤ߸��Ϥ����)

  -m   MIME ����ɤ��롣(default on)
       ISO-2022-JP(base64)��ISO-8859-1(Q encode)�Τߤ���ɤ��롣
       ISO-8859-1 (Latin-1) ����ɤ�����ϡ�-l�ե饰��ɬ�פǤ��롣
         -mB  MIME base64 stream ����ɤ��롣�إå��ʤɤϼ��������ȡ�
         -mQ  MIME quoted stream ����ɤ��롣
         -m0  MIME ����ɤ��ʤ���

  -l   0x80-0xfe�Υ����ɤ�ISO-8859-1 (Latin-1)�Ȥ��ư�����
       JIS�����ɥ����ȥץåȤȤ��ȹ礻�ߤΤ�ͭ����
       -s, -e, -x�Ȥ�ξΩ���ʤ���

  -f?  ���?ʸ���ˤʤ�褦�˴�ñ�������򤪤��ʤ����ǥե���Ȥ�60ʸ���Ǥ��롣

  -Z   X0208��αѿ����ȼ㴳�ε����ASCII���Ѵ����롣
         -Z1 ��X0208�ֳ֤�ASCII space���Ѵ����롣
         -Z2 ��X0208�ֳ֤�ASCII space ��Ĥ��Ѵ����롣

  -J -E -S -X -B
       ���Ԥ�������ϥ����ɤ���������ꤹ�롣
         -J   ISO-2022-JP���ꤹ�롣
         -E   ���ܸ�EUC(AT&T)���ꤹ�롣
         -S   MS�������ꤹ�롣X0201��̾�Ⲿ�ꤵ��롣
         -X   MS�������X0201��̾������Ȳ��ꤹ�롣
         -B   ���줿(Broken)JIS�����ɡ�ESC���ʤ��ʤä��Ȳ��ꤹ�롣
         -B1  ESC-(, ESC-$ �Τ��ȤΥ����ɤ����ʤ�
         -B2  ���ԤΤ��Ȥ˶���Ū��ASCII���᤹

  -x   �̾浪���ʤ���X0201��̾->X0208�β�̾�Ѵ��򤷤ʤ��ǡ�X0201��̾����¸���롣
       ���Ϥϡ�MS-Kanji��1byte��̾��SO/SI��ESC-(-I, SSO������դ��롣
       ���Ϥϡ����ܸ�EUC��Ǥ�SSO��JIS�Ǥ� ESC-'('-I ��Ȥ���

  -O   �ե����� out_file �˽��Ϥ���¸����ޤ���
       �ե�����̾�����ꤵ��Ƥ��ʤ����ϡ�'nkf.out'����'wnkf.out'�˽��Ϥ��롣

  -c   ������CR������(0D)���ɲ�(��ĥ��ǽ -T ��ʻ���Բ�)
  -d   ��������CR������(0D)����(��ĥ��ǽ -T ��ʻ���Բ�)
#@end

=== BUGS

Ruby 1.8.2 ��ź�դ���Ƥ��� NKF ��
Unicode ���ϻ��μ�ưȽ������٤�����Ƥ��ޤ���
Ruby 1.8.3 �ʹߤ˥С�����󥢥åפ��뤫��
�Ǥ����������Ū��ʸ�������ɤ���ꤹ��褦�ˤ��ޤ��礦��

=== ����

  * "ɸ��ź�ե饤�֥��Ҳ���� 3 ��� Kconv/NKF/Iconv" [[url:http://jp.rubyist.net/magazine/?0009-BundledLibraries#l15]]

== Module Functions

--- nkf(opt, str) -> String

ʸ���� str ��ʸ�������ɤ��Ѵ������Ѵ���̤�ʸ������֤��ޤ���

opt �ˤϡ�nkf ��Ʊ�����ޥ�ɥ饤�󥪥ץ�������ꤷ�ޤ���
���ץ����ʸ����� [[c:NKF]] �Υ��ץ����ʸ����ι��
���Ƥ���������
#@# �����ϡ֥��ץ����ʸ����פ�ľ�ܥ�󥯤�������
#@# �����餯��ˡ���ʤ��ΤǾ�Τ褦�˽񤤤Ƥ�����
���ץ�����ʣ�����ꤹ����ϡ�NKF.nkf('-Se', str) ��
NKF.nkf('-S -e', str) �ʤɤȤ��ޤ���opt�ϡ�ɬ�� '-'
�ǻϤ�ʤ���Ф����ʤ����Ȥ���դ��Ƥ���������

@param opt ���ץ����ʸ����Ǥ���
@param str �Ѵ��оݤ�ʸ����Ǥ���

=== ���
���Υ᥽�åɤ�(nkf ���ޥ�ɤ������Ǥ���褦��)��MIME Base64 ��
�ǥ����ɽ������ǥե���Ȥǥ���ˤʤäƤ��ޤ�������ư���̵���ˤ�����
��� opt �� '-m0' ��ޤ�Ƥ���������

#@until 1.9.0
--- guess(str) -> Integer
#@else
--- guess(str) -> Encoding
#@end

ʸ���� str �δ��������ɤ�Ƚ�̤����֤��ޤ���

�֤�����ͤϡ�NKF �⥸�塼��Υ⥸�塼������Ǥ���
#@until 1.9.0
ruby 1.8.2 ������ϸ��ߤ� NKF.guess1 ��Ʊ����ΤǤ���
ruby 1.8.2 �ʹߤǤ� NKF.guess2 ��Ʊ����ΤǤ���
#@end

@param str ��¬�оݤ�ʸ����Ǥ���

#@until 1.9.0
#@since 1.8.2
--- guess1(str) -> Integer

ruby 1.8.1 ������ NKF.guess ��Ʊ����ΤǤ���

@param str ��¬�оݤ�ʸ����Ǥ���
#@end

#@since 1.8.2
--- guess2(str) -> Integer

nkf2�δ��������ɼ�ưȽ��롼��������Ѥ�����ΤǤ���

@param str ��¬�оݤ�ʸ����Ǥ���
#@end
#@end

== Constants

#@until 1.9.0
--- JIS -> Integer
#@else
--- JIS -> Encoding
#@end
JIS �����ɤ�ɽ���ޤ���

#@until 1.9.0
--- EUC -> Integer
#@else
--- EUC -> Encoding
#@end

EUC �����ɤ�ɽ���ޤ���

#@until 1.9.0
--- SJIS -> Integer
#@else
--- SJIS -> Encoding
#@end

SJIS �����ɤ�ɽ���ޤ���

#@until 1.9.0
--- BINARY -> Integer
#@else
--- BINARY -> Encoding
#@end

�Х��ʥ����ɽ���ޤ���

#@until 1.9.0
--- UNKNOWN -> Integer
#@else
--- UNKNOWN -> nil
#@end

������Ƚ��˼��Ԥ������Ȥ�ɽ���ޤ���

#@since 1.8.2
#@until 1.9.0
--- NOCONV -> Integer
#@else
--- NOCONV -> nil
#@end
�����ɤ��Ѵ����ʤ����Ȥ�ɽ���ޤ���

NKF�⥸�塼�뼫�Τ�������Ѥ��ޤ���

#@end

#@since 1.8.2
#@until 1.9.0
--- AUTO -> Integer
#@else
--- AUTO -> nil
#@end
�����ɤ�ưȽ�̤��뤳�Ȥ�ɽ���ޤ���

NKF�⥸�塼�뼫�Τ�������Ѥ��ޤ���

#@end

#@since 1.8.2
#@until 1.9.0
--- ASCII -> Integer
#@else
--- ASCII -> Encoding
#@end

ASCII �����ɤ�ɽ���ޤ���
#@end

#@since 1.8.2
#@until 1.9.0
--- UTF8 -> Integer
#@else
--- UTF8 -> Encoding
#@end

UTF-8 �����ɤ�ɽ���ޤ���
#@end

#@since 1.8.2
#@until 1.9.0
--- UTF16 -> Integer
#@else
--- UTF16 -> Encoding
#@end

UTF-16 �����ɤ�ɽ���ޤ���
#@end

#@since 1.8.2
--- VERSION -> String
"#{NKF::NKF_VERSION} (#{NKF_RELEASE_DATE})" ��
����蘆���ʸ����Ǥ���

--- NKF_VERSION -> String
nkf ���ΤΥС�������ɽ��ʸ����Ǥ���

--- NKF_RELEASE_DATE -> String
nkf �Υ�꡼������ɽ��ʸ����Ǥ���

#@if (version <= "1.8.4")
--- REVISION -> String
��������ϻȤ��٤��ǤϤ���ޤ���

#@end
#@end
