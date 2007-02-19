[[c:String]]���饹�Υ᥽�åɤ��ɲá����������
���ܸ��ռ�����ʸ����������󶡤��ޤ���

=== ������ 

  require 'jcode'
  $KCODE = 'EUC' # ���������ɤ�EUC-JP�ˡ�Windows �� Shift JIS �ʤ� 'SJIS' �ˤ���
  puts 'abcdef'.tr('a-z', '��-��')

$KCODE �Ϥ��Υ�����ץȼ��Τ�ʸ�������ɤ��碌�����ꤷ�ޤ���

= reopen String

== Methods

--- each_char
--- each_char {|char| ... }
#@todo

ʸ������γ�ʸ�����Ф��Ʒ����֤��ޤ���
�֥�å�����ꤻ���˸ƤӽФ��줿���ˤϡ���ʸ����������֤��ޤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'

  require 'jcode'

  zstr = '���£ãģţ�'
  zstr.each_char do |x|
    print "+#{x}+"
  end                     # => +��++��++��++��++��++��+

#@# --- end_regexp
#@# 
#@# �Ǹ��ʸ����¿�Х���ʸ���Ǥ���ʸ����˥ޥå���������ɽ�����֤��ޤ���
#@# ��������줿 [[m:String#succ]] ������Ū�˻Ȥ��ޤ���

--- jcount(str)
#@todo

[[m:String#count]] �����ܸ��б��ǤǤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'e'
  zstr = '���£ãģţ�'
  hogehoge = 'hogehoge'

  p zstr.count('��')     # => 7   ������������ʤ�
  p hogehoge.count('g')  # => 2

  require 'jcode'
  p zstr.jcount('��')    # => 1   �����������
  p hogehoge.jcount('g') # => 2

--- jlength
--- jsize
#@todo

[[m:String#length]] �����ܸ��б��ǤǤ���

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

--- mbchar?
#@todo

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
  

= redefine String

== Methods

--- chop
--- chop!
#@todo

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

--- delete(str)
--- delete!(str)
#@todo

[[m:String#delete]] �����ܸ��б��ǤǤ���

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
    
--- squeeze([str])
--- squeeze!([str])
#@todo

[[m:String#squeeze]] �����ܸ��б��ǤǤ���

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
    
--- succ
--- succ!
#@todo

[[m:String#succ]] �����ܸ��б��ǤǤ���

�ʲ��Τ褦�ʼ���ʸ������֤��ޤ���

  "��a��".succ => "��a��"
  "r��".succ => "r��"
  "_�ȶ�".succ => "_�ȶ�"

����� [[m:String#succ]] �ϡ�
¿�Х���ʸ����Ⱦ��ʸ�������ߤ��Ƥ���ʸ�����
�տ��̤�˽������뤳�Ȥ��Ǥ��ޤ���
�㤨�о嵭�Υ����ɤϡ����줾��
"��b��"��"s��"��"_�ɶ�" ���֤��ޤ���

�ʤ���"99" �μ��� "100" �ˤʤ�Τ��Ф���
"����" �μ��� "������" �ˤϤʤ�ʤ����Ȥ���ա�
"����" �� "����" ��Ʊ�ͤǤ���
#@# CozoH: ���Τ����ꡢ��ä����Τ�ʬ����䤹���������ߤ����Ǥ����伫�ȡ��褯ʬ���äƤ��ʤ��Τǡ�

--- tr(search, replace)
--- tr!(search, replace)
#@todo

[[m:String#tr]] �����ܸ��б��ǤǤ���

�㡧

  #!/usr/bin/env ruby

  $KCODE = 'EUC'
  zstr = '�����££ã�'
  hoge = 'hhoge'

  p zstr.tr('��-��','A-Z')    # => "A����������\303"
  p hoge.tr('a-z','��-��')    # => "����\332"

  require 'jcode'
  p zstr.tr('��-��','A-Z')    # => "AABBCC"
  p hoge.tr('a-z','��-��')    # => "�ȣȣϣǣ�"

--- tr_s(search, replace)
--- tr_s!(search, replace)
#@todo

[[m:String#tr_s]] �����ܸ��б��ǤǤ���

  $KCODE = 'EUC'

  p "foo".tr_s("o", "f")        # => "ff"
  p "����".tr_s("��", "��")   # => TODO: fill result

  require 'jcode'
  p "foo".tr_s("o", "f")        # => "ff"
  p "����".tr_s("��", "��")   # => "���"
