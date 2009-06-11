#@since 1.8.0
strscan �� ʸ������®�˥�����󤹤뤿��Υ饤�֥��Ǥ���

= class StringScanner < Object

StringScanner ��ʸ���󥹥���ʥ��饹�Ǥ���
��ñ�˹�®�ʥ�����ʤ򵭽ҤǤ��ޤ���

    s = StringScanner.new('This is an example string')
    s.eos?            #=> false

    p s.scan(/\w+/)   #=> "This"
    p s.scan(/\w+/)   #=> nil
    p s.scan(/\s+/)   #=> " "
    p s.scan(/\s+/)   #=> nil
    p s.scan(/\w+/)   #=> "is"
    s.eos?            #=> false

    p s.scan(/\s+/)   #=> " "
    p s.scan(/\w+/)   #=> "an"
    p s.scan(/\s+/)   #=> " "
    p s.scan(/\w+/)   #=> "example"
    p s.scan(/\s+/)   #=> " "
    p s.scan(/\w+/)   #=> "string"
    s.eos?            #=> true

    p s.scan(/\s+/)   #=> nil
    p s.scan(/\w+/)   #=> nil

StringScanner ���֥������Ȥϥ�����󤹤�ʸ����ȡ֥������ݥ��󥿡פΥ��åȤǤ���
�������ݥ��󥿤Ȥϥ�����󤷤���ä��Ȥ���򼨤�����ǥå����Τ��ȤǤ���
���֥������Ⱥ���ľ��ˤϥ������ݥ��󥿤�ʸ������Ƭ�ˤ��ꡢ
���������ǤΤߥޥå����ޤ����ޥå������餽�θ��˥ݥ��󥿤�ʤ�ޤ���

    ## a string and a scan pointer   ("_" = scan pointer)

    s = StringScanner.new('This is an example string')
    _This is an example string     s.eos? = false
    s.scan(/\w+/)
    This_ is an example string     s.eos? = false
    s.scan(/\s+/)
    This _is an example string     s.eos? = false
    s.scan(/\w+/)
    This is_ an example string     s.eos? = false
    s.scan(/\s+/)
    This is _an example string     s.eos? = false
    s.scan(/\w+/)
    This is an_ example string     s.eos? = false
    s.scan(/\s+/)
    This is an _example string     s.eos? = false
    s.scan(/\w+/)
    This is an example_ string     s.eos? = false
    s.scan(/\s+/)
    This is an example _string     s.eos? = false
    s.scan(/\w+/)
    This is an example string_     s.eos? = true


���ߤΥ������ݥ��󥿤����������ʳ��Ǥ�ޥå����������ϡ�[[m:StringScanner#scan_until]]�ʤ�
��ȤäƤ���������

��: scan, scan_full ��ư��ΰ㤤

  def case1
    s = StringScanner.new('test string')
    p s.scan(/t/)       #=> "t"
    p s.scan(/\w+/)     #=> "est"
    p s.scan(/string/)  #=> nil
    p s.scan(/\s+/)     #=> " "
    p s.scan(/string/)  #=> "string"
  end
  
  def case2
    s = StringScanner.new('test string')
    p s.scan_until(/t/)       #=> "t"
    p s.scan_until(/\w+/)     #=> "est"
    p s.scan_until(/string/)  #=> " string"
    p s.scan_until(/\s+/)     #=> nil
    p s.scan_until(/string/)  #=> nil
  end
  
  p "case1"
  case1
  p "case2"
  case2

�������ݥ��󥿤ΰ��֤�ʸ��ñ�̤Ǥʤ��Х���ñ�̤Ȥʤ�ޤ���

      # vim:set fileencoding=euc-jp:
      require 'strscan'
      s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�EUC-JP�Ȥ��ޤ�
      p s.exist?(/��/) #=> 4

StringScanner �� $~ $& $1 $2 �ġ� �ʤɤ�����ɽ����Ϣ�ѿ���
���åȤ��ޤ�������� [[m:StringScanner#[] ]], [[m:StringScanner#matched?]] �ʤɤ�
�ޥå��ǡ�����Ϣ�᥽�åɤ�ȤäƤ���������


== Class Methods

--- new(str, dup = false) -> StringScanner 

������ StringScanner ���֥������Ȥ��������ޤ���

@param str ��������оݤ�ʸ�������ꤷ�ޤ���

#@if (version <= "1.8.0")
@param dup dup �� true �λ���ʸ�����ʣ������ freeze ���ޤ���
           dup �� false �ʤ�ʣ�������� freeze ���ޤ���
#@else
@param dup dup ��ñ��̵�뤷�ޤ���
           ������ʸ�����ʣ���� freeze �⤵�줺�����Τޤ޻Ȥ��ޤ���
#@end

������
    s = StringScanner.new('This is an example string')
    s.eos?            #=> false

    p s.scan(/\w+/)   #=> "This"
    p s.scan(/\w+/)   #=> nil
    p s.scan(/\s+/)   #=> " "

---  StringScanner.must_C_version -> self
���Υ᥽�åɤϸ����ߴ����Τ�����������Ƥ��ޤ���

== Instance Methods

--- [](nth) -> String | nil

����ޥå���������ɽ���� nth ���ܤΤ��ä����б�������ʬʸ�����
�֤��ޤ�������ǥå��� 0 �ϥޥå�������ʬ���ΤǤ�������Υޥå���
���Ԥ��Ƥ���Ⱦ�� nil ���֤��ޤ���

@param nth ����ޥå���������ɽ���� nth ���ܤΤ��ä����б�������ʬʸ�����
           �֤��ޤ���


      s = StringScanner.new('test string')
      s.scan(/\w(\w)(\w*)/) # => "test"
      s[0]                  # => "test"
      s[1]                  # => "e"
      s[2]                  # => "st"
      s.scan(/\w+/)         # => nil
      s[0]                  # => nil
      s[1]                  # => nil
      s[2]                  # => nil
      s.scan(/\s+/)         # => " "
      s[0]                  # => " "
      s[1]                  # => nil
      s[2]                  # => nil
      s.scan(/\w(\w)(\w*)/) # => "string"
      s[0]                  # => "string"
      s[1]                  # => "t"
      s[2]                  # => "ring"

#@if (version >= "1.8.1")
--- <<(str) -> self
--- concat(str) -> self

����оݤ�ʸ������Ф� str ���˲�Ū��Ϣ�뤷�ޤ���
�ޥå���Ͽ���ѹ�����ޤ���

self���֤��ޤ���

@param str ����оݤ�ʸ������Ф� str ���˲�Ū��Ϣ�뤷�ޤ���

������
      s = StringScanner.new('test') # => #<StringScanner 0/4 @ "test">
      s.match(/\w(\w*)/)            # => "test"
      s[0]                          # => "test"
      s[1]                          # => "est"
      s << ' string'                # => #<StringScanner 4/11 "test" @ " stri...">
      s[0]                          # => "test"
      s[1]                          # => "est"
      s.match(/\s+/)                # => " "
      s.match(/\w+/)                # => "string"

�������� StringScanner.new ���Ϥ���ʸ����ˤ�ƶ����뤳�Ȥ�����ޤ���

      str = 'test'
      s = StringScanner.new(str) # => #<StringScanner 0/4 @ "test">
      s << ' string'             # => #<StringScanner 0/11 @ "test ...">
      str                        # => "test string"
#@end

#@if (version >= "1.8.1")
--- beginning_of_line? -> bool
--- bol? -> bool
�������ݥ��󥿤���Ƭ��ؤ��Ƥ���ʤ� true ��
��Ƭ�ʳ���ؤ��Ƥ���ʤ� false ���֤��ޤ���

��Ƭ������ϡ�ʸ������Ƭ���ޤ��� \n ��ľ���ؤ��Ƥ��뤳�ȤǤ���
ʸ����������ɬ�������Ƭ�ǤϤ���ޤ���

������
      s = StringScanner.new("test\nstring")
      s.bol?        # => true
      s.scan(/\w+/)
      s.bol?        # => false
      s.scan(/\n/)
      s.bol?        # => true
      s.scan(/\w+/)
      s.bol?        # => false
#@end

--- check(regexp) -> String | nil
���߰��֤��� regexp �ȤΥޥå����ߤޤ���
�ޥå�������������ޥå�������ʬʸ������֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

���Υ᥽�åɤϥޥå����������Ƥ⥹�����ݥ��󥿤�ʤ�ޤ���

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
      s = StringScanner.new('test string')
      s.check(/\w+/) # => "test"
      s.pos          # => 0
      s.matched      # => "test"
      s.check(/\s+/) # => nil
      s.matched      # => nil

--- check_until(regexp) -> String | nil
regexp �����פ���ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå������������饹����󳫻ϰ��֤���ޥå���ʬ�������ޤǤ���ʬʸ������֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

���Υ᥽�åɤϥޥå����������Ƥ⥹�����ݥ��󥿤�ʤ�ޤ���

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
      s = StringScanner.new('test string')
      s.check_until(/str/) # => "test str"
      s.matched            # => "str"
      s.pos                # => 0
      s.pre_match          # => "test "

--- eos? -> bool
--- empty? -> bool
�������ݥ��󥿤�ʸ�����������ؤ��Ƥ���ʤ� true ��
�����ʳ���ؤ��Ƥ���ʤ� false ���֤��ޤ���

������
      s = StringScanner.new('test string')
      s.eos?        # => false
      s.scan(/\w+/)
      s.scan(/\s+/)
      s.scan(/\w+/)
      s.eos?        # => true

[[m:StringScanner#empty?]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#eos?]] ��ȤäƤ���������

--- exist?(regexp) -> Fixnum | nil
#@if (version <= "1.8.5")
[���] ���Υ᥽�åɤ� Ruby 1.8.5 �����Ǥ�������ư��ޤ���
#@else
#@#Ruby 1.8.6 �ʹߤϰʲ��ε��Ҥ˱�ä����ͤ��Ѥ��ޤ���

�������ݥ��󥿤ΰ��֤��顤���˥ޥå�����ʸ����������ޤǤ�Ĺ�����֤��ޤ���

�ޥå��˼��Ԥ����� nil ���֤��ޤ���

���Υ᥽�åɤϥޥå����������Ƥ⥹�����ݥ��󥿤�ʤ�ޤ���

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
      s = StringScanner.new('test string')
      s.exist?(/s/) # => 3
      s.exist?(//)  # => 0
      s.scan(/\w+/) # => "test"
      s.exist?(/s/) # => 2
      s.exist?(/e/) # => nil
#@end

--- getch -> String | nil
��ʸ��������󤷤�ʸ������֤��ޤ���
�������ݥ��󥿤򤽤θ��˿ʤ�ޤ���
�������ݥ��󥿤�ʸ�����������ؤ��ʤ�nil���֤��ޤ���

#@since 1.9.1
��ʸ��������ϡ�Ϳ����ʸ����Υ��󥳡��ɤ˰�¸���ޤ���

������
  require 'strscan'

  utf8 = "\u{308B 3073 3044}"
  s = StringScanner.new(utf8.encode("UTF-8")) 
  p s.getch                         # => "��"
  p s.getch                         # => "��"
  p s.getch                         # => "��"
  p s.getch                         # => nil

#@else
��ʸ��������� $KCODE �˰�¸���ޤ���

������
      require 'strscan'

      s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�EUC-JP�Ȥ��ޤ�
      $KCODE = 'n'                    # ñ�ʤ�Х�����Ȥ���ǧ������ޤ�
      s.getch                         # => "\244"
      s.getch                         # => "\353"
      $KCODE = "e"                    # EUC-JP��ʸ����Ȥ���ǧ������ޤ�
      s.getch                         # => "��"
      s.getch                         # => "��"
      s.getch                         # => nil
#@end


--- get_byte -> String | nil
--- getbyte -> String | nil

#@since 1.9.1
1 �Х��ȥ�����󤷤�ʸ������֤��ޤ���
�������ݥ��󥿤򤽤θ��˿ʤ�ޤ���
�������ݥ��󥿤�ʸ�����������ؤ��ʤ� nil ���֤��ޤ���

[[m:StringScanner#getbyte]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#get_byte]] ��ȤäƤ���������

������
  require 'strscan'

  utf8 = "\u{308B 3073 3044}"
  s = StringScanner.new(utf8.encode("EUC-JP"))
  p s.get_byte       #=> "\xA4"
  p s.get_byte       #=> "\xEB"
  p s.get_byte       #=> "\xA4"
  p s.get_byte       #=> "\xD3"
  p s.get_byte       #=> "\xA4"
  p s.get_byte       #=> "\xA4"
  p s.get_byte       #=> nil   

#@else
$KCODE �˴ؤ餺 1 �Х��ȥ�����󤷤�ʸ������֤��ޤ���
�������ݥ��󥿤򤽤θ��˿ʤ�ޤ���
�������ݥ��󥿤�ʸ�����������ؤ��ʤ� nil ���֤��ޤ���

[[m:StringScanner#getbyte]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#get_byte]] ��ȤäƤ���������

������
      require 'strscan'

      s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�EUC-JP�Ȥ��ޤ�
      $KCODE = 'n'                    # ñ�ʤ�Х�����Ȥ���ǧ������ޤ�
      s.get_byte                      # => "\244"
      s.get_byte                      # => "\353"
      $KCODE = 'e'                    # ��Ϥ�ñ�ʤ�Х�����Ȥ���ǧ������ޤ�
      s.get_byte                      # => "\244"
      s.get_byte                      # => "\323"
      s.get_byte                      # => "\244"
      s.get_byte                      # => "\244"
      s.get_byte                      # => nil

#@end


--- inspect -> String
StringScanner���֥������Ȥ�ɽ��ʸ������֤��ޤ���

ʸ����ˤϥ��饹̾��¾���ʲ��ξ��󤬴ޤޤ�ޤ���

    * ������ʥݥ��󥿤θ��߰��֡�
    * ��������оݤ�ʸ�����Ĺ����
    * �������ݥ��󥿤�����ˤ���ʸ�����嵭�¹���� @ ���������ݥ��󥿤�ɽ���ޤ���

������
      require 'strscan'

      s = StringScanner.new('test string')
      s.inspect                            # => "#<StringScanner 0/11 @ \"test ...\">"
      s.scan(/\w+/)                        # => "test"
      s.inspect                            # => "#<StringScanner 4/11 \"test\" @ \" stri...\">"
      s.scan(/\s+/)                        # => " "
      s.inspect                            # => "#<StringScanner 5/11 \"test \" @ \"strin...\">"
      s.scan(/\w+/)                        # => "string"
      s.inspect                            # => "#<StringScanner fin>"


--- match?(regexp) -> Fixnum | nil
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������顢�������ݥ��󥿤Ͽʤ᤺�˥ޥå�����
��ʬʸ�����Ĺ�����֤��ޤ����ޥå����ʤ��ä��� nil ��
�֤��ޤ���

�ޥå�������������ʸ��ñ�̤Ǥʤ��Х���ñ�̤Ȥʤ�ޤ���

#@since 1.9.1
  require 'strscan'
  def case1(encode)
    utf8 = "\u{308B 3073 3044}"
    s = StringScanner.new(utf8.encode(encode))
    s.match?(/#{"\u{308B}".encode(encode)}/)
  end

  p case1("EUC-JP")     #=> 2
#@else

  require 'strscan'
  s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�UTF-8�Ȥ��ޤ�
  puts s.string      #=> ��Ӥ�
  puts s.match?(/��/)  #=> 3

#@end

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
        s = StringScanner.new('test string')
        p s.match?(/\w+/)   #=> 4
        p s.match?(/\w+/)   #=> 4
        p s.match?(/\s+/)   #=> nil

--- matched -> String | nil
����ޥå�������ʬʸ������֤��ޤ���
����Υޥå��˼��Ԥ��Ƥ���� nil ���֤��ޤ���

������
      s = StringScanner.new('test string')
      s.matched     # => nil
      s.scan(/\w+/) # => "test"
      s.matched     # => "test"
      s.scan(/\w+/) # => nil
      s.matched     # => nil
      s.scan(/\s+/) # => " "
      s.matched     # => " "

--- matched? -> bool
����Υޥå����������Ƥ����� true ��
���Ԥ��Ƥ����� false ���֤��ޤ���

������
      s = StringScanner.new('test string')
      s.matched?    # => false
      s.scan(/\w+/) # => "test"
      s.matched?    # => true
      s.scan(/\w+/) # => nil
      s.matched?    # => false
      s.scan(/\s+/) # => " "
      s.matched?    # => true

--- matched_size -> Fixnum | nil
����ޥå�������ʬʸ�����Ĺ�����֤��ޤ���
����ޥå��˼��Ԥ��Ƥ����� nil ���֤��ޤ���

�ޥå�������������ʸ��ñ�̤Ǥʤ��Х���ñ�̤Ȥʤ�ޤ���

#@since 1.9.1
  def run(encode)
    utf8 = "\u{308B 3073 3044}" # ��Ӥ�
    s = StringScanner.new(utf8.encode(encode))
    s.scan(/#{"\u{308B}".encode(encode)}/)
    s.matched_size
  end

  p run("UTF-8")     #=> 3
  p run("EUC-JP")    #=> 2
  p run("Shift_Jis") #=> 2

#@else

 require 'strscan'

 s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�UTF-8�Ȥ��ޤ�
 puts s.string       #=> ��Ӥ�
 puts s.scan(/��/)   #=> ��
 p s.matched_size    #=> 3

#@end

������
      s = StringScanner.new('test string')
      s.matched_size # => nil
      s.scan(/\w+/)  # => "test"
      s.matched_size # => 4
      s.scan(/\w+/)  # => nil
      s.matched_size # => nil


--- peek(bytes) -> String
--- peep(bytes) -> String
�������ݥ��󥿤���Ĺ�� bytes �Х���ʬ����ʸ������֤��ޤ���

ư����:
      require 'strscan'
      s = StringScanner.new('test string')
      s.peek(4)   # => "test"

�ޤ������Υ᥽�åɤ�¹Ԥ��Ƥ⥹�����ݥ��󥿤ϰ�ư���ޤ���

[[m:StringScanner#peep]] �Ͼ���ΥС������ǤϺ�������ͽ��Ǥ���
����� [[m:StringScanner#peek]] ��ȤäƤ���������

@param bytes 0 �ʾ����������ꤷ�ޤ���
             ����������������оݤ�ʸ�����Ĺ����Ķ����ʬ��̵�뤵��ޤ���
             bytes �� 0 �ΤȤ����ޤ��ϥ������ݥ��󥿤�ʸ�����������
             �ؤ��Ƥ���Ȥ��϶�ʸ���� ("") ���֤��ޤ���

@raise ArgumentError bytes �������Ϳ�����ȯ�����ޤ���

������
      require 'strscan'

      s = StringScanner.new('test string')
      p s.peek(4)     # => "test"
      p s.peek(20)    # => "test string"
      p s.peek(0)     # => ""
      begin
        s.peek(-1)   
      rescue ArgumentError => err
        puts err # negative string size (or size too big)
      end
      p s.scan(/\w+/) # => "test"
      p s.scan(/\s+/) # => " "
      p s.scan(/\w+/) # => "string"
      p s.peek(4)     # => ""

      # ���Υ᥽�åɤ�¹Ԥ��Ƥ⥹�����ݥ��󥿤ϰ�ư���ޤ���

      s = StringScanner.new('test string')
      p s.peek(4)     # => "test"
      p s.peek(4)     # => "test"
      p s.scan(/\w+/) # => "test"
      p s.peek(4)     # => " str"
      p s.peek(4)     # => " str"

--- pointer -> Fixnum
--- pos -> Fixnum
���ߤΥ������ݥ��󥿤Υ���ǥå������֤��ޤ���

������
      s = StringScanner.new('test string')
      s.pos         # => 0
      s.scan(/\w+/) # => "test"
      s.pos         # => 4
      s.scan(/\w+/) # => nil
      s.pos         # => 4
      s.scan(/\s+/) # => " "
      s.pos         # => 5

--- pointer=(n) -> Fixnum
--- pos=(n) -> Fixnum
�������ݥ��󥿤Υ���ǥå����� n �˥��åȤ��ޤ���

@param n �����ǡ��Х���ñ�̤ǻ��ꤷ�ޤ���
         �������ꤹ���ʸ�������������Υ��ե��åȤȤ��ư����ޤ���
@raise RangeError  �ޥå��оݤ�ʸ�����Ĺ����Ķ�����ͤ���ꤹ���ȯ�����ޤ���

@return n ���֤��ޤ���

������
      require 'strscan'

      s = StringScanner.new('test string')
      p s.scan(/\w+/) # => "test"
      p s.pos = 1     # => 1
      p s.scan(/\w+/) # => "est"
      p s.pos = 7     # => 7
      p s.scan(/\w+/) # => "ring"

      begin
        s.pos = 20    
      rescue RangeError => err
        puts err #=> index out of range
      end
      p s.pos = -4    # => -4
      p s.scan(/\w+/) # => "ring"

#@if (version <= "1.8.0")
���Υ᥽�åɤϥޥå���Ͽ��ΤƤޤ���
#@end

--- post_match -> String | nil
����ޥå���Ԥä�ʸ����Τ������ޥå������Ȥ���������
��ʬʸ������֤��ޤ�������Υޥå������Ԥ��Ƥ���Ⱦ�� nil ��
�֤��ޤ���

      s = StringScanner.new('test string')
      s.post_match  # => nil
      s.scan(/\w+/) # => "test"
      s.post_match  # => " string"
      s.scan(/\w+/) # => nil
      s.post_match  # => nil
      s.scan(/\s+/) # => " "
      s.post_match  # => "string"
      s.scan(/\w+/) # => "string"
      s.post_match  # => ""
      s.scan(/\w+/) # => nil
      s.post_match  # => nil

--- pre_match -> String | nil
����ޥå���Ԥä�ʸ����Τ������ޥå������Ȥ����������
��ʬʸ������֤��ޤ�������Υޥå������Ԥ��Ƥ���Ⱦ�� nil ��
�֤��ޤ���

      s = StringScanner.new('test string')
      s.pre_match   # => nil
      s.scan(/\w+/) # => "test"
      s.pre_match   # => ""
      s.scan(/\w+/) # => nil
      s.pre_match   # => nil
      s.scan(/\s+/) # => " "
      s.pre_match   # => "test"
      s.scan(/\w+/) # => "string"
      s.pre_match   # => "test "
      s.scan(/\w+/) # => nil
      s.pre_match   # => nil

--- reset -> self
�������ݥ��󥿤�ʸ�������Ƭ (����ǥå��� 0) ���ᤷ��
�ޥå���Ͽ��ΤƤޤ���

pos = 0��Ʊ��ư��Ǥ���

@return self ���֤��ޤ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.matched     # => "test"
      s.pos         # => 4
      s[0]          # => "test"
      s.reset
      s.matched     # => nil
      s[0]          # => nil
      s.pos         # => 0

--- rest -> String
ʸ����λĤ� (rest) ���֤��ޤ���
����Ū�ˤϡ��������ݥ��󥿤��ؤ����֤����ʸ������֤��ޤ���

�������ݥ��󥿤�ʸ�����������ؤ��Ƥ������ʸ���� ("") ���֤��ޤ���

      s = StringScanner.new('test string')
      s.rest         # => "test string"
      s.scan(/\w+/)  # => "test"
      s.rest         # => " string"
      s.scan(/\s+/)  # => " "
      s.rest         # => "string"
      s.scan(/\w+/)  # => "string"
      s.rest         # => ""

--- rest? -> bool
ʸ���󤬻ĤäƤ���ʤ�� true��
�ĤäƤ��ʤ��ʤ�� false ���֤��ޤ���

[[m:StringScanner#eos?]] �ȵդη�̤��֤��ޤ���

[[m:StringScanner#rest?]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#eos?]] ��ȤäƤ���������

������
      s = StringScanner.new('test string')
      p s.eos?        # => false
      p s.rest?       # => true
      s.scan(/\w+/)
      s.scan(/\s+/)
      s.scan(/\w+/)
      p s.eos?        # => true
      p s.rest?       # => false

--- rest_size -> Fixnum
--- restsize -> Fixnum
ʸ����λĤ��Ĺ�����֤��ޤ���
stringscanner.rest.size ��Ʊ���Ǥ���

[[m:StringScanner#restsize]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
�����[[m:StringScanner#rest_size]] ��ȤäƤ���������

������
      s = StringScanner.new('test string')
      p s.rest_size # => 11
      p s.rest.size # => 11

--- scan(regexp) -> String | nil
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������顢�������ݥ��󥿤�ʤ������ɽ���˥ޥå�����
��ʬʸ������֤��ޤ����ޥå����ʤ��ä��� nil ���֤��ޤ���

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
        s = StringScanner.new('test string')
        p s.scan(/\w+/)   #=> "test"
        p s.scan(/\w+/)   #=> nil
        p s.scan(/\s+/)   #=> " "
        p s.scan(/\w+/)   #=> "string"
        p s.scan(/./)     #=> nil

--- scan_full(regexp, s, f) -> object
�������ݥ��󥿤ΰ��֤��� regexp ��ʸ����Υޥå����ޤ���
�ޥå�����������ȡ�s �� f ���ͤˤ�äưʲ��Τ褦��ư��ޤ���

    * s �� true �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * s �� false �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * f �� true �ʤ�Хޥå�������ʬʸ������֤��ޤ���
    * f �� false �ʤ�Хޥå�������ʬʸ�����Ĺ�����֤��ޤ���

�ޥå��˼��Ԥ���� s �� f �˴ط��ʤ� nil ���֤��ޤ���

���Υ᥽�åɤ� s �� f ���Ȥ߹�碌�ˤ�ꡢ
¾�Υ᥽�åɤ�Ʊ����ư��ˤʤ�ޤ���

    * scan_full(regexp, true, true) �� [[m:StringScanner#scan]] ��Ʊ����
    * scan_full(regexp, true, false) �� [[m:StringScanner#skip]] ��Ʊ����
    * scan_full(regexp, false, true) �� [[m:StringScanner#check]] ��Ʊ����
    * scan_full(regexp, false, false) �� [[m:StringScanner#match?]] ��Ʊ����

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

@param s true �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
         false �ʤ�Х������ݥ��󥿤�ʤ�ޤ���

@param f true �ʤ�Хޥå�������ʬʸ������֤��ޤ���
         false �ʤ�Хޥå�������ʬʸ�����Ĺ�����֤��ޤ���

������
  s = StringScanner.new('test string')
  p s.scan_full(/\w+/, true, true)     #=> "test"
  p s.scan_full(/\s+/, false, true)    #=> " "
  p s.scan_full(/\s+/, true, false)    #=> 1
  p s.scan_full(/\w+/, false, false)   #=> 6
  p s.scan_full(/\w+/, true, true)     #=> "string"

@see [[m:StringScanner#scan]] [[m:StringScanner#skip]] [[m:StringScanner#check]]  [[m:StringScanner#match?]] 

--- scan_until(regexp) -> String | nil
regexp �ǻ��ꤵ�줿����ɽ���ȥޥå�����ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå������������饹�����ݥ��󥿤�ʤ�ơ�
������󳫻ϰ��֤���ޥå���ʬ�������ޤǤ���ʬʸ������֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

������
      s = StringScanner.new('test string')
      s.scan_until(/str/) # => "test str"
      s.matched           # => "str"
      s.pos               # => 8
      s.pre_match         # => "test "

--- search_full(regexp, s, f) -> object
regexp �ǻ��ꤵ�줿����ɽ���ȥޥå�����ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå�����������ȡ�s �� f ���ͤˤ�äưʲ��Τ褦��ư��ޤ���

    * s �� true �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * s �� false �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * f �� true �ʤ�Х�����󳫻ϰ��֤���ޥå�������ʬ�������ޤǤ���ʬʸ������֤��ޤ���
    * f �� false �ʤ�Х�����󳫻ϰ��֤���ޥå�������ʬ�������ޤǤ���ʬʸ�����Ĺ�����֤��ޤ���

�ޥå��˼��Ԥ���� s �� f �˴ط��ʤ� nil ���֤��ޤ���

���Υ᥽�åɤ� s �� f ���Ȥ߹�碌�ˤ�ꡢ
¾�Υ᥽�åɤ�Ʊ����ư��ˤʤ�ޤ���

    * search_full(regexp, true, true) �� [[m:StringScanner#scan_until]] ��Ʊ����
    * search_full(regexp, true, false) �� [[m:StringScanner#skip_until]] ��Ʊ����
    * search_full(regexp, false, true) �� [[m:StringScanner#check_until]] ��Ʊ����
    * search_full(regexp, false, false) �� [[m:StringScanner#exist?]] ��Ʊ����

@param regexp �ޥå����Ѥ�������ɽ������ꤷ�ޤ���

@param s true �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
         false �ʤ�Х������ݥ��󥿤�ʤ�ޤ���

@param f true �ʤ�Хޥå�������ʬʸ������֤��ޤ���
         false �ʤ�Хޥå�������ʬʸ�����Ĺ�����֤��ޤ���

������

  s = StringScanner.new('test string')   
  p s.search_full(/t/, true, true)       #=> "t"
  p s.search_full(/str/, false, true)    #=> "est str"
  p s.search_full(/string/, true, true)  #=> "est string"


@see [[m:StringScanner#scan_until]] [[m:StringScanner#skip_until]] [[m:StringScanner#check_until]] [[m:StringScanner#exist?]]

--- skip(regexp) -> Fixnum | nil
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������饹�����ݥ��󥿤�ʤ�ޥå�������ʬʸ�����
Ĺ�����֤��ޤ����ޥå����ʤ��ä��� nil ���֤��ޤ���

@param regexp �ޥå��˻��Ѥ�������ɽ������ꤷ�ޤ���

������
        s = StringScanner.new('test string')
        p s.skip(/\w+/)   #=> 4
        p s.skip(/\w+/)   #=> nil
        p s.skip(/\s+/)   #=> 1
        p s.skip(/\w+/)   #=> 6
        p s.skip(/./)     #=> nil

--- skip_until(regexp) -> Fixnum | nil
regexp �����פ���ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå������������饹�����ݥ��󥿤�ʤ�ơ�
������󳫻ϰ��֤���ޥå���ʬ�������ޤǤ���ʬʸ�����Ĺ�����֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

@param regexp �ޥå��˻��Ѥ�������ɽ������ꤷ�ޤ���

������
      s = StringScanner.new('test string')
      s.scan_until(/str/) # => 8
      s.matched           # => "str"
      s.pos               # => 8
      s.pre_match         # => "test "

--- string -> String
��������оݤˤ��Ƥ���ʸ������֤��ޤ���

������
      s = StringScanner.new('test string')
      s.string # => "test string"

#@if (version <= "1.8.0")
#@#Ruby 1.8.0 �Ǥ�
�֤��ͤ� freeze ����Ƥ��ޤ���

      s = StringScanner.new('test string')
      s.string.frozen? # => true
#@else
#@#Ruby 1.8.1 �ʹߤǤ�
�֤��ͤ� freeze ����Ƥ��ޤ���

      s = StringScanner.new('test string')
      s.string.frozen? # => false
#@end

�ʤ������Υ᥽�åɤ� StringScanner.new ���Ϥ���
ʸ����򤽤Τޤ��֤��ޤ��������λ��ͤ�������Ϥä��ݾڤ����櫓�ǤϤ���ޤ���
���λ��ͤ˰�¸���������ɤ�񤫤ʤ��褦�ˤ��ޤ��礦��

      str = 'test string'
      s = StringScanner.new(str)
      s.string == str    # => true
      s.string.eql?(str) # => true (����� false �ˤʤ��ǽ��������)

�ޤ����֤��ͤ�ʸ������Ф����˲�Ū���ѹ���Ǥ��ޤ�����
��������������оݤ�ʸ������ѹ����뤳�Ȥ��ݾڤ���ޤ���
���λ��ͤ˰�¸���������ɤ�񤫤ʤ��Ǥ���������

      str = 'test string'
      s = StringScanner.new(str)
      s.string.replace("0123")
      s.scan(/\w+/)     # => "0123" (����� "test" ���֤��ǽ������)
      str               # => "0123" (����� "test string" ���֤��ǽ������)

--- string=(str) -> String
��������оݤ�ʸ����� str ���ѹ����ơ��ޥå���Ͽ��ΤƤޤ���

@param str ��������оݤ�ʸ����� str ���ѹ����ơ��ޥå���Ͽ��ΤƤޤ���

@return str ���֤��ޤ���

������
      str = '0123'
      s = StringScanner.new('test string')
      s.string = str     # => "0123"
      s.scan(/\w+/)      # => "0123"

--- terminate -> self
--- clear -> self
�������ݥ��󥿤�ʸ����������ޤǿʤᡢ�ޥå���Ͽ��ΤƤޤ���

@return self ���֤��ޤ���

pos = self.string.size ��Ʊ��ư��Ǥ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.matched     # => "test"
      s.pos         # => 4
      s[0]          # => "test"
      s.terminate
      s.matched     # => nil
      s[0]          # => nil
      s.pos         # => 11

[[m:StringScanner#clear]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#terminate]] ��ȤäƤ���������

--- unscan -> self
�������ݥ��󥿤�����Υޥå������ΰ��֤��ᤷ�ޤ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.unscan
      s.scan(/\w+/) # => "test"


@return self���֤��ޤ���

#@since 1.8.2
���Υ᥽�åɤǥݥ��󥿤��᤻��Τ� 1 ��ʬ�����Ǥ���
2 ��ʬ�ʾ��᤽���Ȥ����Ȥ����㳰 StringScanner::Error ��ȯ�����ޤ���
�ޤ����ޤ��ޥå�����٤�ԤäƤ��ʤ��Ȥ��䡢
����Υޥå������Ԥ��Ƥ����Ȥ����㳰 StringScanner::Error ��ȯ�����ޤ���

@raise StringScanner::Error 2 ��ʬ�ʾ��᤽���Ȥ������䡢
                            �ޤ��ޥå�����٤�ԤäƤ��ʤ�����
                            ����Υޥå������Ԥ��Ƥ�������ȯ�����ޤ���
#@else
���Υ᥽�åɤǥݥ��󥿤��᤻��Τ� 1 ��ʬ�����Ǥ���
2 ��ʬ�ʾ��᤽���Ȥ����Ȥ����㳰 ScanError ��ȯ�����ޤ���
�ޤ����ޤ��ޥå�����٤�ԤäƤ��ʤ��Ȥ��䡢
����Υޥå������Ԥ��Ƥ����Ȥ����㳰 ScanError ��ȯ�����ޤ���

@raise ScanError 2 ��ʬ�ʾ��᤽���Ȥ������䡢
                 �ޤ��ޥå�����٤�ԤäƤ��ʤ�����
                 ����Υޥå������Ԥ��Ƥ�������ȯ�����ޤ���
#@end
������
      s = StringScanner.new('test string')
      begin
        # �ޥå�����٤�ԤäƤ��ʤ��Τǡ��㳰��ȯ�����롣
        s.unscan
      rescue StringScanner::Error => err
        puts err
        # ������
        #=> unscan failed: previous match had failed
      end
      p s.scan(/\w+/) # => "test"
      s.unscan
      begin
        # ���ʾ��᤽���Ȥ����Τǡ��㳰��ȯ�����롣
        s.unscan
#@since 1.8.2
      rescue StringScanner::Error => err
#@else
      rescue ScanError => err
#@end
        puts err
        # ������
        #=> unscan failed: previous match had failed
      end
      p s.scan(/\w+/) # => "test"
      p s.scan(/\w+/) # => nil
      begin
        # ����Υޥå������Ԥ��Ƥ���Τǡ��㳰��ȯ�����롣
        s.unscan
      rescue => err
        puts err
        # ������
        #=> unscan failed: previous match had failed
      end


#@# bc-rdoc: detected missing name: matchedsize
--- matchedsize -> Fixnum | nil

[[m:StringScanner#matched_size]] ��Ʊ���Ǥ���

���Υ᥽�åɤ� �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#matched_size]] ��ȤäƤ���������

@see [[m:StringScanner#matched_size]] 

== Constants

--- Version -> String
[[c:StringScanner]] ���饹�ΥС�������ʸ������֤��ޤ���
����ʸ����� [[m:Object#freeze]] ����Ƥ��ޤ���

      StringScanner::Version           # => "0.7.0"
      StringScanner::Version.frozen?   # => true

--- Id -> String

[[c:StringScanner]] ���饹�ξܤ����С�������ʸ������֤��ޤ���
����ʸ����� [[m:Object#freeze]] ����Ƥ��ޤ���


#@until 1.8.2
= class ScanError

����������ȯ���������顼�򤢤�魯�㳰�Ǥ���

#@end
#@since 1.8.2
= class StringScanner::Error

����������ȯ���������顼�򤢤�魯�㳰�Ǥ���

#@end
#@end
