#@since 1.8.0
ʸ������®�˥�����󤹤뤿��Υ饤�֥��Ǥ���

= class StringScanner < Object

strscan ��ʸ���󥹥���ʥ饤�֥��Ǥ���
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

StringScanner �� $~ $& $1 $2 �ġ� �ʤɤ�����ɽ����Ϣ�ѿ���
���åȤ��ޤ�������� StringScanner#[], #matched? �ʤɤ�
�ޥå��ǡ�����Ϣ�᥽�åɤ�ȤäƤ���������

== Class Methods

--- new(str, dup = false) -> StringScanner -> StringScanner

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
#@todo
�������ݥ��󥿤���Ƭ��ؤ��Ƥ���ʤ� true ��
��Ƭ�ʳ���ؤ��Ƥ���ʤ� false ���֤��ޤ���

��Ƭ������ϡ�ʸ������Ƭ���ޤ��� \n ��ľ���ؤ��Ƥ��뤳�ȤǤ���
ʸ����������ɬ�������Ƭ�ǤϤ���ޤ���

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

      s = StringScanner.new('test string')
      s.check_until(/str/) # => "test str"
      s.matched            # => "str"
      s.pos                # => 0
      s.pre_match          # => "test "

--- eos? -> bool
--- empty? -> bool
�������ݥ��󥿤�ʸ�����������ؤ��Ƥ���ʤ� true ��
�����ʳ���ؤ��Ƥ���ʤ� false ���֤��ޤ���

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

      s = StringScanner.new('test string')
      s.exist?(/s/) # => 3
      s.exist?(//)  # => 0
      s.scan(/\w+/) # => "test"
      s.exist?(/s/) # => 2
      s.exist?(/e/) # => nil
#@end

--- getch
#@todo
��ʸ��������󤷤�ʸ������֤��ޤ���
��ʸ��������� $KCODE �˰�¸���ޤ���
�������ݥ��󥿤򤽤θ��˿ʤ�ޤ���
�������ݥ��󥿤�ʸ�����������ؤ��ʤ�nil���֤��ޤ���

      s = StringScanner.new("��Ӥ�") # ʸ�������ɤ�EUC-JP�Ȥ��ޤ�
      $KCODE = 'n'                    # ñ�ʤ�Х�����Ȥ���ǧ������ޤ�
      s.getch                         # => "\244"
      s.getch                         # => "\353"
      $KCODE = "e"                    # EUC-JP��ʸ����Ȥ���ǧ������ޤ�
      s.getch                         # => "��"
      s.getch                         # => "��"
      s.getch                         # => nil


--- get_byte
--- getbyte
#@todo
$KCODE �˴ؤ餺 1 �Х��ȥ�����󤷤�ʸ������֤��ޤ���
�������ݥ��󥿤򤽤θ��˿ʤ�ޤ���
�������ݥ��󥿤�ʸ�����������ؤ��ʤ� nil ���֤��ޤ���

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

[[m:StringScanner#getbyte]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#get_byte]] ��ȤäƤ���������

--- inspect
#@todo
StringScanner���֥������Ȥ�ɽ��ʸ������֤��ޤ���

      s = StringScanner.new('test string')
      s.inspect                            # => "#<StringScanner 0/11 @ \"test ...\">"
      s.scan(/\w+/)                        # => "test"
      s.inspect                            # => "#<StringScanner 4/11 \"test\" @ \" stri...\">"
      s.scan(/\s+/)                        # => " "
      s.inspect                            # => "#<StringScanner 5/11 \"test \" @ \"strin...\">"
      s.scan(/\w+/)                        # => "string"
      s.inspect                            # => "#<StringScanner fin>"

ʸ����ˤϥ��饹̾��¾���ʲ��ξ��󤬴ޤޤ�ޤ���

    * ������ʥݥ��󥿤θ��߰��֡�
    * ��������оݤ�ʸ�����Ĺ����
    * �������ݥ��󥿤�����ˤ���ʸ�����嵭�¹���� @ ���������ݥ��󥿤�ɽ���ޤ���

--- match?(regexp)
#@todo
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������顢�������ݥ��󥿤Ͽʤ᤺�˥ޥå�����
��ʬʸ�����Ĺ�����֤��ޤ����ޥå����ʤ��ä��� nil ��
�֤��ޤ���

        s = StringScanner.new('test string')
        p s.match?(/\w+/)   #=> 4
        p s.match?(/\w+/)   #=> 4
        p s.match?(/\s+/)   #=> nil

--- matched
#@todo
����ޥå�������ʬʸ������֤��ޤ���
����Υޥå��˼��Ԥ��Ƥ���� nil ���֤��ޤ���

      s = StringScanner.new('test string')
      s.matched     # => nil
      s.scan(/\w+/) # => "test"
      s.matched     # => "test"
      s.scan(/\w+/) # => nil
      s.matched     # => nil
      s.scan(/\s+/) # => " "
      s.matched     # => " "

--- matched?
#@todo
����Υޥå����������Ƥ����� true ��
���Ԥ��Ƥ����� false ���֤��ޤ���

      s = StringScanner.new('test string')
      s.matched?    # => false
      s.scan(/\w+/) # => "test"
      s.matched?    # => true
      s.scan(/\w+/) # => nil
      s.matched?    # => false
      s.scan(/\s+/) # => " "
      s.matched?    # => true

--- matched_size
#@todo
����ޥå�������ʬʸ�����Ĺ�����֤��ޤ���
����ޥå��˼��Ԥ��Ƥ����� nil ���֤��ޤ���

      s = StringScanner.new('test string')
      s.matched_size # => nil
      s.scan(/\w+/)  # => "test"
      s.matched_size # => 4
      s.scan(/\w+/)  # => nil
      s.matched_size # => nil

--- peek(bytes)
--- peep(bytes)
#@todo
�������ݥ��󥿤���Ĺ�� bytes �Х���ʬ����ʸ������֤��ޤ���

      s = StringScanner.new('test string')
      s.peek(4)   # => "test"

bytes �� 0 �ʾ�������Ǥ���
����������������оݤ�ʸ�����Ĺ����Ķ����ʬ��̵�뤵��ޤ���
�ޤ��������Ϳ������㳰 ArgumentError ��ȯ�����ޤ���
bytes �� 0 �ΤȤ����ޤ��ϥ������ݥ��󥿤�ʸ�����������
�ؤ��Ƥ���Ȥ��϶�ʸ���� ("") ���֤��ޤ���

      s = StringScanner.new('test string')
      s.peek(4)     # => "test"
      s.peek(20)    # => "test string"
      s.peek(0)     # => ""
      s.peek(-1)    # ArgumentError: negative string size (or size too big)
      s.scan(/\w+/) # => "test"
      s.scan(/\s+/) # => " "
      s.scan(/\w+/) # => "string"
      s.peek(4)     # => ""

���Υ᥽�åɤ�¹Ԥ��Ƥ⥹�����ݥ��󥿤ϰ�ư���ޤ���

      s = StringScanner.new('test string')
      s.peek(4)     # => "test"
      s.peek(4)     # => "test"
      s.scan(/\w+/) # => "test"
      s.peek(4)     # => " str"
      s.peek(4)     # => " str"

[[m:StringScanner#peep]] �Ͼ���ΥС������ǤϺ�������ͽ��Ǥ���
����� [[m:StringScanner#peek]] ��ȤäƤ���������

--- pointer
--- pos
#@todo
���ߤΥ������ݥ��󥿤Υ���ǥå������֤��ޤ���

      s = StringScanner.new('test string')
      s.pos         # => 0
      s.scan(/\w+/) # => "test"
      s.pos         # => 4
      s.scan(/\w+/) # => nil
      s.pos         # => 4
      s.scan(/\s+/) # => " "
      s.pos         # => 5

--- pointer=(n)
--- pos=(n)
#@todo
�������ݥ��󥿤Υ���ǥå����� n �˥��åȤ��ޤ���

n �������ǡ��Х���ñ�̤ǻ��ꤷ�ޤ���
�ޥå��оݤ�ʸ�����Ĺ����Ķ�����ͤ���ꤹ����㳰 RangeError ��ȯ�����ޤ���
�������ꤹ���ʸ�������������Υ��ե��åȤȤ��ư����ޤ���

n ���֤��ޤ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.pos = 1     # => 1
      s.scan(/\w+/) # => "est"
      s.pos = 7     # => 7
      s.scan(/\w+/) # => "ring"
      s.pos = 20    # RangeError: index out of range
      s.pos = -4    # => -4
      s.scan(/\w+/) # => "ring"

#@if (version <= "1.8.0")
���Υ᥽�åɤϥޥå���Ͽ��ΤƤޤ���
#@end

--- post_match
#@todo
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

--- pre_match
#@todo
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

--- reset
#@todo
�������ݥ��󥿤�ʸ�������Ƭ (����ǥå��� 0) ���ᤷ��
�ޥå���Ͽ��ΤƤޤ���

self ���֤��ޤ���

pos = 0��Ʊ��ư��Ǥ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.matched     # => "test"
      s.pos         # => 4
      s[0]          # => "test"
      s.reset
      s.matched     # => nil
      s[0]          # => nil
      s.pos         # => 0

--- rest
#@todo
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

--- rest?
#@todo
ʸ���󤬻ĤäƤ���ʤ�� true��
�ĤäƤ��ʤ��ʤ�� false ���֤��ޤ���

[[m:StringScanner#eos?]] �ȵդη�̤��֤��ޤ���

      s = StringScanner.new('test string')
      s.eos?        # => false
      s.rest?       # => true
      s.scan(/\w+/)
      s.scan(/\s+/)
      s.scan(/\w+/)
      s.eos?        # => true
      s.rest?       # => false

[[m:StringScanner#rest?]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
����� [[m:StringScanner#eos?]] ��ȤäƤ���������

--- rest_size
--- restsize
#@todo
ʸ����λĤ��Ĺ�����֤��ޤ���
stringscanner.rest.size ��Ʊ���Ǥ���

      s = StringScanner.new('test string')
      s.rest_size # => 11
      s.rest.size # => 11

[[m:StringScanner#restsize]] �Ͼ���ΥС������Ǻ�������ͽ��Ǥ���
�����[[m:StringScanner#rest_size]] ��ȤäƤ���������

--- scan(regexp)
#@todo
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������顢�������ݥ��󥿤�ʤ������ɽ���˥ޥå�����
��ʬʸ������֤��ޤ����ޥå����ʤ��ä��� nil ���֤��ޤ���

        s = StringScanner.new('test string')
        p s.scan(/\w+/)   #=> "test"
        p s.scan(/\w+/)   #=> nil
        p s.scan(/\s+/)   #=> " "
        p s.scan(/\w+/)   #=> "string"
        p s.scan(/./)     #=> nil

--- scan_full(regexp, s, f)
#@todo
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
    * scan_full(regexp, false, false) �� [[m:StringScanner#match]] ��Ʊ����

--- scan_until(regexp)
#@todo
regexp �����פ���ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå������������饹�����ݥ��󥿤�ʤ�ơ�
������󳫻ϰ��֤���ޥå���ʬ�������ޤǤ���ʬʸ������֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

      s = StringScanner.new('test string')
      s.scan_until(/str/) # => "test str"
      s.matched           # => "str"
      s.pos               # => 8
      s.pre_match         # => "test "

--- search_full(regexp, s, f)
#@todo
regexp �����פ���ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå�����������ȡ�s �� f ���ͤˤ�äưʲ��Τ褦��ư��ޤ���

    * s �� true �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * s �� false �ʤ�Х������ݥ��󥿤�ʤ�ޤ���
    * f �� true �ʤ�Хޥå�������ʬʸ������֤��ޤ���
    * f �� false �ʤ�Хޥå�������ʬʸ�����Ĺ�����֤��ޤ���

�ޥå��˼��Ԥ���� s �� f �˴ط��ʤ� nil ���֤��ޤ���

���Υ᥽�åɤ� s �� f ���Ȥ߹�碌�ˤ�ꡢ
¾�Υ᥽�åɤ�Ʊ����ư��ˤʤ�ޤ���

    * search_full(regexp, true, true) �� [[m:StringScanner#scan_until]] ��Ʊ����
    * search_full(regexp, true, false) �� [[m:StringScanner#skip_until]] ��Ʊ����
    * search_full(regexp, false, true) �� [[m:StringScanner#check_until]] ��Ʊ����
    * search_full(regexp, false, false) �� [[m:StringScanner#exist?]] ��Ʊ����

--- skip(regexp) -> Fixnum | nil
#@todo
�������ݥ��󥿤����������� regexp ��ʸ����Υޥå����ޤ���
�ޥå������饹�����ݥ��󥿤�ʤ�ޥå�������ʬʸ�����
Ĺ�����֤��ޤ����ޥå����ʤ��ä��� nil ���֤��ޤ���

@param regexp �ޥå��˻��Ѥ�������ɽ������ꤷ�ޤ���

        s = StringScanner.new('test string')
        p s.skip(/\w+/)   #=> 4
        p s.skip(/\w+/)   #=> nil
        p s.skip(/\s+/)   #=> 1
        p s.skip(/\w+/)   #=> 6
        p s.skip(/./)     #=> nil

--- skip_until(regexp)
#@todo
regexp �����פ���ޤ�ʸ����򥹥���󤷤ޤ���
�ޥå������������饹�����ݥ��󥿤�ʤ�ơ�
������󳫻ϰ��֤���ޥå���ʬ�������ޤǤ���ʬʸ�����Ĺ�����֤��ޤ���
�ޥå��˼��Ԥ����� nil ���֤��ޤ���

      s = StringScanner.new('test string')
      s.scan_until(/str/) # => 8
      s.matched           # => "str"
      s.pos               # => 8
      s.pre_match         # => "test "

--- string
#@todo
��������оݤˤ��Ƥ���ʸ������֤��ޤ���

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

--- string=(str)
#@todo
��������оݤ�ʸ����� str ���ѹ����ơ��ޥå���Ͽ��ΤƤޤ���
str ���֤��ޤ���

      str = '0123'
      s = StringScanner.new('test string')
      s.string = str     # => "0123"
      s.scan(/\w+/)      # => "0123"

--- terminate
--- clear
#@todo
�������ݥ��󥿤�ʸ����������ޤǿʤᡢ�ޥå���Ͽ��ΤƤޤ���

self ���֤��ޤ���

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

--- unscan
#@todo
�������ݥ��󥿤�����Υޥå������ΰ��֤��ᤷ�ޤ���

      s = StringScanner.new('test string')
      s.scan(/\w+/) # => "test"
      s.unscan
      s.scan(/\w+/) # => "test"

���Υ᥽�åɤǥݥ��󥿤��᤻��Τ� 1 ��ʬ�����Ǥ���
2 ��ʬ�ʾ��᤽���Ȥ����Ȥ����㳰 StringScanner::Error ��ȯ�����ޤ���
�ޤ����ޤ��ޥå�����٤�ԤäƤ��ʤ��Ȥ��䡢
����Υޥå������Ԥ��Ƥ����Ȥ����㳰 StringScanner::Error ��ȯ�����ޤ���

      s = StringScanner.new('test string')
      s.unscan      # StringScanner::Error: can't unscan: prev match had failed
      s.scan(/\w+/) # => "test"
      s.unscan
      s.unscan      # StringScanner::Error: can't unscan: prev match had failed
      s.scan(/\w+/) # => "test"
      s.scan(/\w+/) # => nil
      s.unscan      # StringScanner::Error: can't unscan: prev match had failed

self���֤��ޤ���

#@# bc-rdoc: detected missing name: matchedsize
--- matchedsize
#@todo

Equivalent to #matched_size. This method is obsolete; use #matched_size
instead.


== Constants

--- Version
#@todo
StringScanner���饹�ΥС�������ʸ������֤��ޤ���
����ʸ�����freeze����Ƥ��ޤ���

      StringScanner::Version           # => "0.7.0"
      StringScanner::Version.frozen?   # => true

#@end
