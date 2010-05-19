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

  -b ���Ϥ��Хåե���󥰤����(�ǥե����)
  -u ���Ϥ��Хåե���󥰤���ʤ�
  -j -s -e -w -w16 ���Ϥ��륨�󥳡��ǥ��󥰤���ꤹ��
    -j ISO-2022-JP (7bit JIS) ����Ϥ���(�ǥե����)
    -s Shift_JIS ����Ϥ���
    -e EUC-JP ����Ϥ���
    -w UTF-8 ����Ϥ���(BOM�ʤ�)
    -w16 UTF-16 LE ����Ϥ��� 
  -J -S -E -W -W16 ����ʸ����Υ��󥳡��ǥ��󥰤ο����ͤ���ꤹ�롣
    -J ���Ϥ� JIS ���ꤹ��
    -S ���Ϥ� Shift_JIS �� X0201�Ҳ�̾(������Ⱦ���Ҳ�̾)
       ���ꤹ�롣-x����ꤷ�ʤ�����X0201�Ҳ�̾(������Ⱦ���Ҳ�̾)��X0208��
       �Ҳ�̾(�����������Ҳ�̾)���Ѵ������
    -E ���Ϥ� EUC-JP ���ꤹ��
    -W ���Ϥ� UTF-8 ���ꤹ��
    -W16 ���Ϥ� UTF-16LE ���ꤹ��
  -t �Ѵ����ʤ�
  -i_ JIS ������ؼ����륷�����󥹤���ꤹ�롣 (�ǥե���Ȥ�B(EUC-$-B))
  -o_ 1 �Х��ȱѿ�ʸ�����åȤ�ؼ����륷�����󥹤���ꤹ�롣 (�ǥե���Ȥ�B(EUC-(-B))
  -r ROT13/47�Ź沽/���沽�򤹤�
  -h1 --hiragana �Ҳ�̾��ʿ��̾���Ѵ�����
  -h2 --katakana ʿ��̾���Ҳ�̾���Ѵ�����
  -h3 --katakana-hiragana �Ҳ�̾��ʿ��̾�ˡ�ʿ��̾���Ҳ�̾���Ѵ�����
  -T �ƥ����ȥ⡼�ɤǽ��Ϥ���(MS-DOS�ǤΤ�ͭ��)
  -l 0x80-0xfe �Υ����ɤ� ISO-8859-1 (Latin-1) �Ȥ��ư���
  -f[m-[n]] 1�Ԥ�mʸ���ˤʤ�褦��n�Υޡ���������������롣�ǥե���Ȥ�m��60��n��10
  -F �������˲��Ԥ��ݻ�����
  -Z[0-3] X0208 ����ե��٥åȤ� ASCII ���Ѵ�����
    -Z -Z0 X0208 ����ե��٥åȤ� ASCII ���Ѵ�����
    -Z1 X0208����(���������Ѷ���)�� ASCII �ζ�����Ѵ�����
    -Z2 X0208����(���������Ѷ���)�� ASCII �ζ���2�Ĥ��Ѵ�����
    -Z3 X0208�Ρ䡢�㡢�ɡ������� '&gt;', '&lt;', '&quot;', '&amp;' ���Ѵ�����
  -X X0201�Ҳ�̾(������Ⱦ���Ҳ�̾)��X0208���Ҳ�̾(�����������Ҳ�̾)���Ѵ�����
  -x X0201�Ҳ�̾(������Ⱦ���Ҳ�̾)��X0208���Ҳ�̾(�����������Ҳ�̾)���Ѵ�������
     ���Ϥ��롣ISO-2022-JP �ǽ��Ϥ���Ȥ��� ESC-(-I ��EUC-JP�ǽ��Ϥ���Ȥ��� SSO ��Ȥ���
  -B[0-2] ���Ϥ� ESC ���ä����褦�ʲ��줿 JIS ���ꤹ�롣
    -B1 ESC-(, ESC-$ �Τ��ȤΥ����ɤ����ʤ�
    -B2 ���ԤΤ��Ȥ˶���Ū�� ASCII ���᤹
  -I ISO-2022-JP �ʳ��δ��������ɤ򢮤��Ѵ�����
  -L[uwm] -d -c ���Ԥ��Ѵ����롣�ǥե���ȤǤ��Ѵ����ʤ���
    -Lu -d ���ԤȤ��� LF ����Ϥ���
    -Lw -c ���ԤȤ��� CRLF ����Ϥ���
    -Lm ���ԤȤ��� CR ����Ϥ���
  -m[BQN0] MIME����ɤ��롣
    -m (�ǥե����) ISO-2022-JP (B encode) �� ISO-8859-1 (Q encode) ����ɤ���(�ǥե����)
    -mB MIME base64 stream ����ɤ��롣�إå��ʤɤϥ᥽�åɤ��Ϥ����˼�����ɬ�פ����롣
    -mQ MIME quoted stream ����ɤ��롣
    -mN MIME �Υ����å���ˤ����롣base64����˲��Ԥ����äƤ��ɤ���
    -m0 MIME �β��ɤ���ڤ��ʤ������󥳡��ǥ��󥰤��Ѵ��Τߤ򤹤�ʤ�Ф������ꤷ�Ƥ����٤�
       �Ǥ��롣
  -M MIME ���Ѵ����롣���󥳡��ɤ��Ѵ���ԤäƤ��� MIME�Ѵ����롣
    -MB base64 ���Ѵ�����
    -MQ quoted stream ���Ѵ�����
  --fj --unix --mac --msdos  --windows �����Υ����ƥ��Ŭ�����Ѵ��򤷤ޤ���
  --jis --euc --sjis --mime --base64 �б������Ѵ��򤷤ޤ���
  --jis-input --euc-input --sjis-input --mime-input --base64-input ���Ϥ��ꤷ�ޤ���
  --ic=input_codeset --oc=output-codeset ���ϡ����Ϥ��줾��Υ��󥳡��ǥ��󥰤���ꤷ�ޤ���
                                         �ʲ��Υ��󥳡��ǥ��󥰤����Ѳ�ǽ�Ǥ���
                                         �����Ǥ�̾���λ���ˤ���ʸ����ʸ����̵�뤵��ޤ���
    ISO-2022-JP
    EUC-JP
    eucJP-ascii
    eucJP-ms
    CP51932
    Shift_JIS
    CP932
    UTF-8 UTF-8N��Ʊ��
    UTF-8N
    UTF-8-BOM
    UTF-16 UTF-16BE-BOM��Ʊ��
    UTF-16BE 
    UTF-16BE-BOM
    UTF-16LE
    UTF-16LE-BOM
    UTF-32 UTF-32BE��Ʊ��
    UTF-32BE
    UTF-32BE-BOM
    UTF-32LE
    UTF-32LE-BOM
    UTF-8-MAC ���������¦�ˤ�������Ǥ��ޤ���
  --fb-{skip, html, xml, perl, java, subchar} �Ѵ��Ǥ��ʤ��ä�ʸ����ɤ���갷������
    ���ꤷ�ޤ����ǥե���Ȥ� --fb-skip �Ǥ���
  --prefix <escape character><target character>..
    Shift_JIS �ؤ��Ѵ����ˡ�<target character>�˻��ꤷ��ʸ����2�Х����ܤ�
    ����줿����<escape character>���ղä��ޤ���<target character>��ʣ������Ǥ��ޤ���
    �㤨�С�--prefix=\$@ �Ȥ���ȡ�Shift_JIS �� 2 ʸ���ܤ� $ �� @ ���褿�顢
    �������� \ ����������ޤ�
  --no-cp932ext CP932�ǳ�ĥ���줿ʸ�����갷��ʤ��褦�ˤ��ޤ���
  --cap-input --url-input :��%�ǥ��������פ��줿ʸ���򸵤�ʸ�����Ѵ����ޤ�
  --numchar-input "&#..;" ������ Unicodeʸ�����Ȥ��Ѵ����ޤ�
  --no-best-fit-chars
     Unicode ������Ѵ��κݤˡ�round trip safe�Ǥʤ�ʸ�����Ѵ���Ԥ��ޤ���
     ����� -x ��ʻ�Ѥ��뤳�Ȥǡ� Unicode ����ߤΥ��󥳡��ǥ��󥰴֤Ǥ��Ѵ�
     (UTF-8 ���� UTF-16LE �ʤ�)���������Ѵ����뤳�Ȥ��Ǥ��ޤ���
     ���ʤ���������Υ��ץ�������ꤷ�ʤ��Ȥ��Τ褦���Ѵ����������Ԥ����ȤϤǤ��ޤ���
     
  -- �ʹߤΥ��ץ�����̵�뤷�ޤ���

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
