#@until 1.9.1
[[c:String]]���饹�Υ᥽�åɤ��ɲá����������
���ܸ��ռ�����ʸ����������󶡤��ޤ���

�оݤ�ʸ����Υ��󥳡��ǥ��󥰤� [[m:$KCODE]] ��
�����ΤȤ��ƽ������ޤ����Ĥޤꥹ����ץ����
[[m:$KCODE]] ���ѹ�����Ȱʸ�᥽�åɤ�ư��Ѥ��ޤ���

[[m:String#chop]]��[[m:String#delete]] �Ȥ��ä���¸��
�᥽�åɤ��֤������뤿�ᡢ�̤Υ饤�֥���
ư��Ѳ����Ƥ��ޤ���ǽ��������ޤ���
���Τ��ᤳ�Υ饤�֥���ȤäƤ褤�Τ�
���Ѥ��Ƥ���饤�֥���ޤ�
ư��Ƥ��륽�������٤Ƥ��İ���ǽ�ʾ��ΤߤǤ���

�ޥ���Х���ʸ����μ谷�˴ؤ��������
���Υ饤�֥��ǲ�褷�褦�Ȥ���ΤϤ����ᤷ�ޤ���
Ruby ��ʸ����Υ��󥳡��ǥ��󥰤μ�갷���˴ؤ��Ƥϡ�
[[d:spec/rubycmd]] �� -K ���ץ����ν�䡢 [[m:$KCODE]] ��
���Ƥ���������

=== ������ 

  #!/usr/bin/ruby -Ke
  # -*- coding: euc-jp -*-
  # ���������ɤ�EUC-JP�ˡ�
  # Windows �� Shift JIS �ʤ� -Ks, coding: cp932 �ˤ���
  
  # jcode �饤�֥����ɤ߹��ߡ��᥽�åɤ��ɲá��������Ԥ�
  require 'jcode' 
  
  # ��������줿 String#tr ��ƤӤ���
  puts 'abcdef'.tr('a-z', '��-��')

= reopen String

== Methods

#@if (version <= "1.8.6")
--- each_char -> [String]
--- each_char {|char| ... } -> String
ʸ������γ�ʸ�����Ф��ƥ֥�å���ƤӤ����ޤ���
�֥�å�����ꤻ���˸ƤӽФ��줿���ˤϡ���ʸ����������֤��ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'

  require 'jcode'

  zstr = '���£ãģţ�'
  zstr.each_char do |x|
    print "+#{x}+"
  end                     # => +��++��++��++��++��++��+
#@end

#@# --- end_regexp
#@# 
#@# �Ǹ��ʸ����¿�Х���ʸ���Ǥ���ʸ����˥ޥå���������ɽ�����֤��ޤ���
#@# ��������줿 [[m:String#succ]] ������Ū�˻Ȥ��ޤ���

--- jcount(str) -> Integer
[[m:String#count]] �����ܸ��б��ǤǤ���

self ��ʸ���� str �ǻ��ꤷ��ʸ���������Ĵޤޤ�Ƥ��뤫������ޤ�

������ [[m:String#count]] �Ȥϰۤʤ����ѤǤ���ѥ������
"��-��" �Τ褦�ʡ�^��(����)��ޤޤʤ��ѥ�����ΤߤǤ��ꡢ
�ޤ�ʣ���Υѥ�������뤳�ȤϤǤ��ޤ���

@param str �и�����������ʸ���Υѥ������ʸ�����Ϳ���ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'e'
  zstr = '���£ãģţ�'
  hogehoge = 'hogehoge'

  p zstr.count('��')     # => 7   ������������ʤ�
  p zstr.jcount('����')  # => 8 
  p hogehoge.count('g')  # => 2

  require 'jcode'
  p zstr.jcount('��')    # => 1   �����������
  p hogehoge.jcount('g') # => 2

  p zstr.jcount('����')  # => 2 


--- jlength -> Integer
--- jsize -> Integer

[[m:String#length]] �����ܸ��б��ǤǤ���

ʸ�������������֤��ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '���£ãģţ�'
  hogehoge = 'hogehoge'
  
  p zstr.size       # => 12   ������������ʤ�
  p hogehoge.size   # => 8

  require 'jcode'
  p zstr.jsize      # => 6    �����������
  p hogehoge.jsize  # => 8

--- mbchar? -> Integer|nil

self ��¿�Х���ʸ�����ǽ�˸������֤��֤��ޤ���
¿�Х���ʸ�����ޤޤ�Ƥ��ʤ���� nil ���֤��ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '���£ãģţ�'
  hoge = 'hogehoge'

  require 'jcode'
  p zstr.mbchar?   # => 0
  p hoge.mbchar?   # => nil

#@# �ʲ���������᥽�åɤ�����Ū���Ѥ���졢�桼�����Ȥ��٤��Ǥʤ���  
#@# == Constant
#@# --- PATTERN_SJIS
#@# --- PATTERN_EUC
#@# --- PATTERN_UTF8
#@# --- RE_SJIS
#@# --- RE_EUC
#@# --- RE_UTF8
#@# --- SUCC
#@# --- HashCache 
#@# --- TrPatternCache
#@# --- DeletePatternCache
#@# --- SqueezePatternCache
#@# == Private Instance Methods
#@# --- _regex_quote(str) 
#@# --- _expand_ch(str)
#@# --- _expand_ch_hash(from, to)

= redefine String

== Methods

#@since 1.8.7
--- each_char -> [String]
--- each_char {|char| ... } -> String
ʸ������γ�ʸ�����Ф��ƥ֥�å���ƤӤ����ޤ���
�֥�å�����ꤻ���˸ƤӽФ��줿���ˤϡ���ʸ����������֤��ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'

  require 'jcode'

  zstr = '���£ãģţ�'
  zstr.each_char do |x|
    print "+#{x}+"
  end                     # => +��++��++��++��++��++��+
#@end

--- chop -> String
--- chop! -> String|nil

[[m:String#chop]] �����ܸ��б��ǤǤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'e'
  zstr = '���£ãģţ�'
  hoge = 'hogehoge'

  p zstr.chop       # => "���£ãģ�\243"
  p hoge.chop       # => "hogehog"

  require 'jcode'
  p zstr.chop       # => "���£ãģ�"
  p hoge.chop       # => "hogehog"

--- delete(str) -> String
--- delete!(str) -> String|nil

[[m:String#delete]] �����ܸ��б��ǤǤ���
���ꤷ���ѥ������ʸ�����������ޤ���

���������Υ᥽�åɤ��֤���������ʪ�Ȥϰۤʤ�
ʣ���ΰ�������ޤ���

@param str ������ʸ���Υѥ�����

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '���£ãģţ�'
  hoge = 'hogehoge'

  p zstr.delete("��")  # => "����\306"
  p hoge.delete("e")   # => "hoghog"

  require 'jcode'
  p zstr.delete("��")  # => "�£ãģţ�"
  p hoge.delete("e")   # => "hoghog"
    
--- squeeze(str = nil) -> String
--- squeeze!(str = nil) -> String|nil

[[m:String#squeeze]] �����ܸ��б��ǤǤ���
���ꤷ��ʸ����1ʸ���ˤޤȤ�ޤ���

���������Υ᥽�åɤ��֤���������ʪ�Ȥϰۤʤꡢ
2�İʾ�ΰ������뤳�ȤϤǤ��ޤ���

@param str 1ʸ���ˤޤȤ��ʸ���Υѥ�����

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '�����££ã�'
  hoge = 'hhoge'

  p zstr.squeeze   # => "�����££ã�"
  p hoge.squeeze   # => "hoge"

  require 'jcode'
  p zstr.squeeze   # => "���£�"
  p hoge.squeeze   # => "hoge"
    
--- succ -> String
--- succ! -> String|nil

[[m:String#succ]] �����ܸ��б��ǤǤ���
�ּ��Ρ�ʸ������֤��ޤ���

�ʲ��Τ褦�ʼ���ʸ������֤��ޤ���

  "��a��".succ => "��a��"
  "r��".succ => "r��"
  "_�ȶ�".succ => "_�ȶ�"

����� [[m:String#succ]] �ϡ�
¿�Х���ʸ����Ⱦ��ʸ�������ߤ��Ƥ���ʸ�����
�տ��̤�˽������뤳�Ȥ��Ǥ��ޤ���
�㤨�о嵭�Υ����ɤϡ����줾��
"��b��"��"s��"��"_�ɶ�"(�Ǹ�Τ� SJIS �Ķ��ξ�����ǡ�
EUC-JP �ξ��Ϥ����Ϥʤ�ޤ���)���֤��ޤ���

�ʤ���"99" �μ��� "100" �ˤʤ�Τ��Ф���
"����" �μ��� "������" �ˤϤʤ�ʤ����Ȥ���ա�
"����" �� "����" ��Ʊ�ͤǤ����Ĥޤ�¿�Х���ʸ���Ǥ�
����� [[m:String#succ]] �Τ褦�ʥ���ե��٥åȤ������
�ؤ��뷫��夲��Ԥ�ʤ��Ȥ������ȤǤ���
#@# CozoH: ���Τ����ꡢ��ä����Τ�ʬ����䤹���������ߤ����Ǥ����伫�ȡ��褯ʬ���äƤ��ʤ��Τǡ�

--- tr(search, replace) -> String
--- tr!(search, replace) -> String|nil

[[m:String#tr]] �����ܸ��б��ǤǤ���
search �˴ޤޤ��ʸ���򸡺����� replace ���б�����ʸ����
�֤������ޤ���

@param search    �֤�������ʸ���Υѥ�����
@param replace    pattern �ǻ��ꤷ��ʸ�����֤�������ʸ��

��:

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '�����££ã�'
  hoge = 'hhoge'

  p zstr.tr('��-��','A-Z')    # => "A����������\303"
  p hoge.tr('a-z','��-��')    # => "����\332"

  require 'jcode'
  p zstr.tr('��-��','A-Z')    # => "AABBCC"
  p hoge.tr('a-z','��-��')    # => "�ȣȣϣǣ�"

@see [[m:String#tr_s]]

--- tr_s(search, replace) -> String
--- tr_s!(search, replace) -> String|nil

[[m:String#tr_s]] �����ܸ��б��ǤǤ���
ʸ�������� search ʸ����˴ޤޤ��ʸ����¸�ߤ����顢
replace ʸ������б�����ʸ�����֤������ޤ�������ˡ�
�ִ�������ʬ���Ʊ���ʸ�����¤Ӥ����ä��餽��� 
1 ʸ���˰��̤��ޤ���

@param search    �֤�������ʸ���Υѥ�����
@param replace    pattern �ǻ��ꤷ��ʸ�����֤�������ʸ��

��:
  $KCODE = 'EUC'

  p "foo".tr_s("o", "f")        # => "ff"
  p "����".tr_s("��", "��")   # => TODO: fill result

  require 'jcode'
  p "foo".tr_s("o", "f")        # => "ff"
  p "����".tr_s("��", "��")   # => "���"

#@end

@see [[m:String#tr]]

