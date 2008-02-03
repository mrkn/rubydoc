ʸ����� [[c:IO]] ��Ʊ�����󥿥ե�������������뤿��Υ饤�֥��Ǥ���

= class StringIO < Data

ʸ����� [[c:IO]] ��Ʊ�����󥿥ե�������������뤿��Υ��饹�Ǥ���

=== �㳰
StringIO ���֥������Ȥ�����ξ�� IO ���֥������Ȥ�Ʊ���㳰��ȯ�������ޤ���
�㤨�м�����Ǥ� write �� IOError ��ȯ�������ޤ���

  require "stringio"
  sio = StringIO.new("hoge")
  sio.close
  sio.write("a")
  # => in `write': not opened for writing (IOError)

== Class Methods

--- new(string = '', mode = 'r+')                 -> StringIO
--- open(string = '', mode = 'r+')                -> StringIO
--- open(string = '', mode = 'r+') {|io| ... }    -> StringIO

StringIO ���֥������Ȥ����������֤��ޤ���

Ϳ����줿 string ���ե꡼������Ƥ�����ˤϡ�mode �ϥǥե���ȤǤ��ɤ߼��Τߤ����ꤵ��ޤ���
�֥�å���Ϳ���������������� StringIO ���֥������Ȥ�����Ȥ��ƥ֥�å���ɾ�����ޤ���

@param string ��������� StringIO �Υǡ�����ʸ����ǻ��ꤷ�ޤ���
              ����ʸ����ϥХåե��Ȥ��ƻȤ��ޤ���[[m:StringIO#write]] �ʤɤˤ�äơ�
              string ���Ȥ�񤭴������ޤ���

@param mode [[m:Kernel#open]] Ʊ��ʸ���������ǻ��ꤷ�ޤ���

@raise Errno::EACCES string ���ե꡼������Ƥ��ơ�mode ���񤭹��߲�ǽ�����ꤵ��Ƥ������ȯ�����ޤ���

        require 'stringio'
         
        s = "foo"
        io = StringIO.new(s)
        p io.getc       # => 102
        p io.pos        # => 1
        p io.size       # => 3
        io << "bar"   
        p io.size       # => 4
        p s             # => "fbar"
        io.rewind
        p io.gets       # => "fbar"

        StringIO.open("hoge"){|io|
          p io.string   # => "hoge"
        }

== Instance Methods

--- string    -> String

���Ȥ�ɽ��ʸ������֤��ޤ���

�֤����Τ���������Ϳ����줿�Хåե��Ȥ��ƻȤ��Ƥ���ʸ����Ǥ���
ʸ�����ʣ������ʤ����Ȥ���դ��Ʋ�������

��:

  sio = StringIO.new
  sio << "abc"
  s = sio.string
  p s                    #=> "abc"
  sio << "xyz"
  p s                    #=> "abcxyz"

--- string=(buf)

���Ȥ�ɽ��ʸ�������ꤵ�줿 buf ���ѹ����ޤ���

buf �ϥХåե��Ȥ��ƻȤ�졢�񤭹��ߥ᥽�åɤˤ�äƽ񤭴������ޤ���
���Ȥ��ɤ߽�ξ�Ѥˤʤ�ޤ�����
buf ���ե꡼������Ƥ�����ˤ��ɤ߼�����Ѥˤʤ�ޤ���
pos �� lineno �� 0 �˥��åȤ���ޤ���

#@if (version < "1.8.3")
buf �� nil �ξ��ϡ�StringIO �ؤ��ɤ߽񤭤϶ػߤ���ޤ���
#@end

@param buf ���Ȥ�������ɽ��ʸ�������ꤷ�ޤ���

#@if (version >= "1.8.3")
@raise TypeError buf �� nil �ξ���ȯ�����ޤ���
#@end

--- <<(obj)    -> self

obj �� pos �ΰ��֤˽񤭹��ߤޤ��� ɬ�פʤ� obj.to_s ��Ƥ��
ʸ������Ѵ����ޤ��� self ���֤��ޤ���

@param obj ���Ȥ˽񤭹��ߤ�����ʸ���� to_s ��������줿���֥������Ȥ���ꤷ�ޤ���

--- binmode    -> self

���⤻���� self ���֤��ޤ���

--- close      -> nil

���Ȥ� close ���ޤ����ʸ塢���Ȥ��Ф����ɤ߽񤭤��ػߤ���ޤ���
close ���줿 StringIO ���ɤ߽������Ԥ���� IOError ��ȯ�����ޤ���

@raise IOError ���Ȥ����Ǥ� close ����Ƥ�������ȯ�����ޤ���

--- close_read    -> nil

���Ȥ��Ф����ɤ߼���ػߤ��ޤ���

@raise IOError ���Ȥ����Ǥ��ɤߤȤ��ԲĤ��ä�����ȯ�����ޤ���

--- close_write    -> nil

���Ȥ��Ф���񤭹��ߤ�ػߤ��ޤ���

@raise IOError ���Ȥ����Ǥ˽񤭹����ԲĤ��ä�����ȯ�����ޤ���

--- closed?    -> bool

���Ȥ����� close ����Ƥ������� ture ���֤��ޤ��������Ǥʤ����ϡ�false ���֤��ޤ���

      sio = StringIO.open("hoge")
      p sio.closed? # => false
      sio.close_read
      p sio.closed? # => false
      sio.close_write
      sio.closed?   # => true

--- closed_read?    -> bool

���Ȥ��Ф����ɤ߼�꤬�ػߤ���Ƥ���ʤ� true ���֤��ޤ��������Ǥʤ����ϡ�false ���֤��ޤ���

--- closed_write?    -> bool

���Ȥ��Ф���񤭹��ߤ��ػߤ���Ƥ���ʤ� true ���֤��ޤ��������Ǥʤ����ϡ�false ���֤��ޤ���

--- each(rs = $/){|line| ... }       -> self
--- each_line(rs = $/){|line| ... }  -> self

���Ȥ��� 1 �Ԥ����ɤ߹��ߡ����������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

@param rs �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���rs �� nil ����ꤹ��ȹԶ��ڤ�ʤ��Ȥߤʤ��ޤ�����ʸ���� "" ����ꤹ���Ϣ³������Ԥ�Ԥζ��ڤ�Ȥߤʤ��ޤ�(�ѥ饰��ե⡼��)��

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

  a = StringIO.new("hoge\nfoo\n")
  a.each{|l| p l }
  
  #=>
  "hoge\n"
  "foo\n"

@see [[m:$/]]

--- each_byte{|ch| ... }    -> self

���Ȥ��� 1 �Х��Ȥ����ɤ߹��ߡ����� ch ���Ѵ��������������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

  a = StringIO.new("hoge")
  a.each_byte{|ch| p ch }
  
  #=>
  104
  111
  103
  101

--- eof    -> bool
--- eof?   -> bool

���Ȥ� pos ��ʸ����ν�ü�ˤ���� true ���֤��ޤ��������Ǥʤ��ʤ� false ���֤��ޤ���

--- fcntl    -> ()

�㳰 [[c:NotImplementedError]] �����ȯ�����ޤ���

--- fileno    -> nil

���⤻�� nil ���֤��ޤ���

--- flush    -> self

���⤻���� self ���֤��ޤ���

--- fsync    -> 0

���⤻���� 0 ���֤��ޤ���

--- getc    -> Integer | nil

���Ȥ��� 1 ʸ���ɤ߹���ǡ�����ʸ�����б����� Fixnum ���֤��ޤ���
ʸ����ν�ü����ã�������ˤ� nil ���֤��ޤ��� 

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

  a = StringIO.new("ho")
  a.getc                   #=> 104
  a.getc                   #=> 111
  a.getc                   #=> nil

--- gets(rs = $/)    -> String | nil

���Ȥ��� 1 ���ɤ߹���ǡ�����ʸ������֤��ޤ���ʸ����ν�ü����ã�������ˤ� nil ���֤��ޤ���
[[m:$_]] ���ɤ߹�����Ԥ����åȤ���ޤ���

@param rs �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���rs �� nil ����ꤹ��ȹԶ��ڤ�ʤ��Ȥߤʤ��ޤ�����ʸ���� "" ����ꤹ���Ϣ³������Ԥ�Ԥζ��ڤ�Ȥߤʤ��ޤ�(�ѥ饰��ե⡼��)��

@raise IOError ���Ȥ��ɤ߹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("hoge")
  a.gets                  #=> "hoge"
  $_                      #=> "hoge"
  a.gets                  #=> nil
  $_                      #=> nil

@see [[m:$/]]

--- isatty    -> false

���⤻�� false ���֤��ޤ���

--- lineno    -> Integer

���ߤι��ֹ���֤��ޤ�������� [[m:StringIO#gets]] ���ƤФ줿����Ǥ���

--- lineno=(n)

���ߤι��ֹ�� n �˥��åȤ��ޤ���

@param n ���ֹ�������ǻ��ꤷ�ޤ���

--- path    -> nil

StringIO �ˤ��б�����ѥ��Ϥʤ��Τ� nil ���֤��ޤ���

--- pid    -> nil

���⤻�� nil ���֤��ޤ���

--- pos    -> Integer
--- tell   -> Integer

���Ȥθ��ߤΰ��֤��֤��ޤ���

--- pos=(n)

���Ȥΰ��֤� n �˰�ư���ޤ������Ȥ�ɽ��ʸ����Υ���������礭���Ƥ⹽���ޤ���

@param n ���Ȥΰ��֤������ǻ��ꤷ�ޤ���

@raise Errno::EINVAL n ���ޥ��ʥ��Ǥ������ȯ�����ޤ���

  a = StringIO.new("hoge", 'r+')
  a.pos = 10
  a << 'Z'
  a.string                        #=> "hoge\000\000\000\000\000\000Z"

--- print()        -> nil
--- print(*obj)    -> nil

���Ȥ˰������˽��Ϥ��ޤ����������ά�������ϡ�[[m:$_]] ����Ϥ��ޤ���
�����ΰ����� [[m:Kernel.#print]] �򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ���ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("", 'r+')
  a.print("hoge", "bar", "foo")
  a.string                     #=> "hogebarfoo"

--- printf(format, *obj)    -> nil

���ꤵ�줿�ե����ޥåȤ˽����ư��� obj ��ʸ������Ѵ����ơ����Ȥ˽��Ϥ��ޤ���

@param format ʸ����Υե����ޥåȤ���ꤷ�ޤ���[[m:Kernel.#format]] �򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ���ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("", 'r+')
  a.printf("%c%c%c", 97, 98, 99)
  a.string                      #=> "abc"

--- putc(ch)    -> object

ʸ�� ch �򼫿Ȥ˽񤭹��ߤޤ��� ch �������ʤ� 0 �� 255 ���ϰϤ��б�����ʸ���񤭹��ߤޤ��� 
ch ��ʸ����ʤ顢������Ƭ��ʸ����񤭹��ߤޤ���ch ���֤��ޤ���

@param ch �񤭹��ߤ���ʸ����������ʸ����ǻ��ꤷ�ޤ���ch �� Float �� Rational �Ǥ��äƤ⡢�������Ѵ�����Ƥ���񤭹��ޤ�ޤ���

@raise IOError ���Ȥ��񤭹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

--- puts(*obj)    -> nil

obj �Ȳ��Ԥ���֤˼��Ȥ˽��Ϥ��ޤ����������ʤ���в��ԤΤߤ���Ϥ��ޤ���
�ܤ������ͤ� [[m:Kernel.#puts]] �򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ���ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("", 'r+')
  a.puts("hoge", "bar", "foo")
  a.string                     #=> "hoge\nbar\nfoo\n"

--- read                  -> String
--- read(len)             -> String | nil
--- read(len, outbuf)     -> String
#@todo

���Ȥ��� len �Х����ɤ߹��ߤ���֤��ޤ���len ����ά���줿���ϡ��Ǹ�ޤ��ɤ߹�����֤��ޤ���
�ܤ������ͤ� [[m:IO#read]] �򻲾Ȥ��Ʋ�������

@param len �ɤ߹��ߤ���Ĺ���������ǻ��ꤷ�ޤ����ܤ������ͤ� [[m:IO#read]] �򻲾Ȥ��Ʋ�������

@param outbuf �ɤ߹����ʸ�������Ϥ���Хåե���ʸ����ǻ��ꤷ�ޤ����ܤ������ͤ� [[m:IO#read]] �򻲾Ȥ��Ʋ�������

@raise IOError ���Ȥ��ɤ߹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

--- readchar    -> Integer

���Ȥ��� 1 ʸ���ɤ߹���ǡ�����ʸ�����б������������֤��ޤ���ʸ����ν�ü����ã�������ˤ��㳰 EOFError ��ȯ�������ޤ���

 a = StringIO.new("hoge")
 a.readchar               #=> 104

@raise EOFError ʸ����ν�ü����ã��������ȯ�����ޤ���

--- readline(rs = $/)    -> String

���Ȥ��� 1 ���ɤ߹���ǡ�����ʸ������֤��ޤ���

ʸ����ν�ü����ã�������ˤϡ��㳰 EOFError ��ȯ�������ޤ���
[[m:IO#readline]] �Ȱ㤤�ɤ߹����ʸ������ѿ� [[m:$_]] �˥��åȤ��ޤ���

@param rs �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���rs �� nil ����ꤹ��ȹԶ��ڤ�ʤ��Ȥߤʤ��ޤ�����ʸ���� "" ����ꤹ���Ϣ³������Ԥ�Ԥζ��ڤ�Ȥߤʤ��ޤ�(�ѥ饰��ե⡼��)��

@raise EOFError ʸ����ν�ü����ã��������ȯ�����ޤ���

@raise IOError ���Ȥ��ɤ߹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("hoge\nfoo\nbar\n")
  a.readline                           #=> "hoge\n"
  a.readline(nil)                      #=> "foo\nbar\n"
  a.readline                           #=> EOFError ��ȯ������

@see [[m:$/]]

--- readlines(rs = $/)    -> [String]

���Ȥ���ǡ����������ɤ߹���ǡ����γƹԤ����ǤȤ��Ƥ��������֤��ޤ��� 
����ʸ����ν�ü��ã���Ƥ���ж����� [] ���֤��ޤ��� 

@param rs �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���rs �� nil ����ꤹ��ȹԶ��ڤ�ʤ��Ȥߤʤ��ޤ�����ʸ���� "" ����ꤹ���Ϣ³������Ԥ�Ԥζ��ڤ�Ȥߤʤ��ޤ�(�ѥ饰��ե⡼��)��

@raise IOError ���Ȥ��ɤ߹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

  a = StringIO.new("hoge\nfoo\nbar\n")
  a.readlines                          #=> ["hoge\n", "foo\n", "bar\n"]
  a.readlines                          #=> []

@see [[m:$/]]

#@since 1.9.0
--- readpartial([integer [, buffer]])
#@todo
[[m:IO#readpartial]] ��Ʊ�ͤǤ���
#@end

--- reopen(sio)           -> StringIO
--- reopen(str, mode)     -> StringIO
#@todo
���Ȥ�ɽ��ʸ���󤬻��ꤵ�줿 StringIO ��Ʊ����Τ����ꤵ�줿ʸ���� str �ˤʤ�ޤ���

@param sio ���Ȥ�ɽ������ StringIO ����ꤷ�ޤ���

@param str ���Ȥ�ɽ������ʸ�������ꤷ�ޤ���

@param mode [[m:Kernel#open]] Ʊ��ʸ���������Ǽ��ȤΥ⡼�ɤ���ꤷ�ޤ���

@raise Errno::EACCES str ���ե꡼������Ƥ��ơ�mode ���񤭹��߲�ǽ�����ꤵ��Ƥ������ȯ�����ޤ���

--- rewind    -> 0

���Ȥ� pos �� lineno �򤽤줾�� 0 �ˤ��ޤ���

--- seek(offset, whence = IO::SEEK_SET)

���Ȥ� pos �� whence �ΰ��֤��� offset �Х��Ȥ�����ư�����ޤ��� 

@param offset ��ư���������Х��ȿ��������ǻ��ꤷ�ޤ���

@param whence �ʲ��Τ����줫���������ꤷ�ޤ���

 * IO::SEEK_SET: �ե��������Ƭ���� (�ǥե����)
 * IO::SEEK_CUR: ���ߤΥե�����ݥ��󥿤���
 * IO::SEEK_END: �ե��������������

@raise Errno::EINVAL offset + whence ���ޥ��ʥ��Ǥ������ȯ�����ޤ���

@raise ArgumentError whence ����� SEEK_SET, SEEK_CUR, SEEK_END �ʳ����ä�����ȯ�����ޤ���

--- size    -> Integer
--- length  -> Integer

ʸ�����Ĺ�����֤��ޤ���

--- sync    -> true

���⤻���� true ���֤��ޤ���

--- sync=(bool)

���⤻���� bool ���֤��ޤ���

@param bool true �� flase ����ꤷ�ޤ���

--- sysread                  -> String
--- sysread(len)             -> String
--- sysread(len, outbuf)     -> String
#@todo

���Ȥ��� len �Х����ɤ߹��ߤ���֤��ޤ���
[[m:StringIO#read]] ��Ʊ���Ǥ�����������ʸ����ν�ü��ã������硢EOFError ���ꤲ�ޤ���

@param len �ɤ߹��ߤ���Ĺ���������ǻ��ꤷ�ޤ���[[m:StringIO#read]] ��Ʊ���Ǥ���

@param outbuf �ɤ߹����ʸ�������Ϥ���Хåե���ʸ����ǻ��ꤷ�ޤ���[[m:StringIO#read]] ��Ʊ���Ǥ���

@raise EOFError ʸ����ν�ü��ã��������ȯ�����ޤ���

--- syswrite(obj)    -> Integer

���Ȥ� obj ��񤭹��ߤޤ���[[m:StringIO#write]] ��Ʊ���Ǥ���

@param obj �񤭹��ߤ������֥������Ȥ���ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹����Ѥ˥����ץ󤵤�Ƥ��ʤ����ȯ�����ޤ���

--- truncate(len)    -> Integer

���ȤΥ������� len �ˤʤ�褦�ˡ����Ȥ��ڤ�ͤᡢ�⤷���ϳ��礷�ޤ���
���礷�����ϡ�������ʬ�� 0 �����ޤ���
len ���֤��ޤ���

@param len �ѹ��������������������ǻ��ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹��߲�ǽ�Ǥʤ�����ȯ�����ޤ���

@raise Errno::EINVAL len ���ޥ��ʥ��λ���ȯ�����ޤ���

  a = StringIO.new("hoge", 'r+')
  a.truncate(2)
  a.string                       #=> "ho"
  a.truncate(5)
  a.string                       #=> "ho\000\000\000"

--- tty?    -> false

���⤻�� false ���֤��ޤ���

--- ungetc(ch)    -> nil

�����ǻ��ꤵ�줿ʸ�� ch �򼫿Ȥ˽��ᤷ�ޤ���
nil ���֤��ޤ���

����Ǥ���᤹���Ȥ���ǽ�Ǥ���
���߰��֤����ȤΥ����������礭�����ϡ����Ȥ�ꥵ�������Ƥ��顢ch ����ᤷ�ޤ���
�ޤ����߰��֤� 0 �Ǥ�����ϲ���Ԥ��ޤ���

@param ch ���ᤷ����ʸ���������ǻ��ꤷ�ޤ���

@raise IOError ���Ȥ��ɤ߹��߲�ǽ�Ǥʤ�����ȯ�����ޤ���

      s = StringIO.new("hoge")
      s.pos = 1
      s.ungetc(?H)
      p s.string   #=> "Hoge"
      p s.pos        #=> 0

      s = StringIO.new("hoge")
      s.pos = 8
      s.ungetc(?A)
      p s.string   #=> "hoge\000\000\000A"
      p s.pos        #=> 7

--- write(obj)    -> Integer

���Ȥ� obj ��񤭹��ߤޤ���obj ��ʸ����Ǥʤ���� to_s �ˤ��ʸ���󲽤��ߤޤ���
�񤭹��ޤ줿ʸ�����Ĺ�����֤��ޤ���

���Ƥν��ϥ᥽�åɤϡ��ǽ�Ū�ˡ�write�פȤ���̾�Υ᥽�åɤ�ƤӽФ��Τǡ�
���Υ᥽�åɤ��֤������뤳�Ȥǽ��ϴؿ��ε�ư���ѹ����뤳�Ȥ��Ǥ��ޤ���

@param obj �񤭹��ߤ������֥������Ȥ���ꤷ�ޤ���

@raise IOError ���Ȥ��񤭹��߲�ǽ�Ǥʤ�����ȯ�����ޤ���

  a = StringIO.new("hoge", 'r+')
  a.write("aaa")                 #=> 3
  a.string                       #=> "aaae"
