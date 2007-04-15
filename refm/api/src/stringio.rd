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
#@todo

StringIO ���֥������Ȥ����������֤��ޤ���

Ϳ����줿 string ���ե꡼������Ƥ�����ˤϡ�mode �ϥǥե���ȤǤ��ɤ߼��Τߤ����ꤵ��ޤ���

�֥�å���Ϳ�������� StringIO ���֥������Ȥ�����Ȥ��ƥ֥�å���ɾ�����ޤ���

@param string ��������� StringIO �Υǡ�����ʸ����ǻ��ꤷ�ޤ�������ʸ����ϥХåե��Ȥ��ƻȤ��ޤ���[[m:StringIO#write]] �ʤɤˤ�äơ�string ���Ȥ�񤭴������ޤ���

@param mode [[m:Kernel#open]] Ʊ��ʸ���������ǻ��ꤷ�ޤ���

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

@raise Errno::EACCES string ���ե꡼������Ƥ��ơ�mode ���񤭹��߲�ǽ�����ꤵ��Ƥ������ȯ�����ޤ���

== Instance Methods

--- string    -> String
#@todo
���Ȥ�ɽ���Ƥ���ʸ������֤��ޤ���

--- string=(buf)
#@todo
���Ȥ�ɽ���Ƥ���ʸ����� buf ���ѹ����ޤ���
���Ȥ��ɤ߽�ξ�Ѥˤʤ�ޤ���
buf ���ե꡼������Ƥ�����ˤϡ��ɤ߼�����Ѥˤʤ�ޤ���
pos �� lineno �� 0 �˥��åȤ���ޤ���

#@if (version < "1.8.3")
buf �� nil �ξ��ϡ�StringIO �ؤ��ɤ߽񤭤϶ػߤ���ޤ���
#@end

@param buf ���Ȥ�������ɽ��ʸ�����Ϳ���ޤ���

#@if (version >= "1.8.3")
@raise TypeError buf �� nil �ξ���ȯ�����ޤ���
#@end

--- <<(obj)    -> self
#@todo
obj �� pos �ΰ��֤˽񤭹��ߤޤ��� ɬ�פʤ� obj.to_s ��Ƥ��
ʸ������Ѵ����ޤ��� self ���֤��ޤ���

@param obj ���Ȥ˽񤭹��ߤ�����ʸ���� to_s ��������줿���֥������Ȥ�Ϳ���ޤ���

--- binmode    -> self

���⤻���� self ���֤��ޤ���

--- close      -> nil
#@todo
���Ȥ� close ���ޤ����ʸ塢���Ȥ��Ф����ɤ߽񤭤��ػߤ���ޤ���
close ���줿 StringIO ���ɤ߽������Ԥ���� IOError ��ȯ�����ޤ���

@raise IOError ���Ȥ����Ǥ� close ����Ƥ�������ȯ�����ޤ���

--- close_read    -> nil
#@todo
���Ȥ��Ф����ɤ߼���ػߤ��ޤ���

@raise IOError ���Ȥ����Ǥ��ɤߤȤ��ԲĤ��ä�����ȯ�����ޤ���

--- close_write    -> nil
#@todo
���Ȥ��Ф���񤭹��ߤ�ػߤ��ޤ���

@raise IOError ���Ȥ����Ǥ˽񤭹����ԲĤ��ä�����ȯ�����ޤ���

--- closed?    -> bool
#@todo
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

--- each(sep_string = $/){|line| ... }       -> self
--- each_line(sep_string = $/){|line| ... }  -> self
#@todo
���Ȥ��� 1 �Ԥ����ɤ߹��ߡ����������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

�ܤ������ͤ� [[m:IO#each]] �򻲾Ȥ��Ʋ�������

@param sep_string �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

--- each_byte{|ch| ... }    -> self
#@todo
���Ȥ��� 1 �Х��Ȥ����ɤ߹��ߡ����� ch ���Ѵ��������������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

--- eof    -> bool
--- eof?   -> bool
#@todo
���Ȥ� pos ��ʸ����ν�ü�ˤ���� true ���֤��ޤ��������Ǥʤ��ʤ� false ���֤��ޤ���

--- fcntl    -> ()

�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

--- fileno    -> nil

���⤻�� nil ���֤��ޤ���

--- flush    -> self

���⤻���� self ���֤��ޤ���

--- fsync    -> 0

���⤻���� 0 ���֤��ޤ���

--- getc    -> Integer | nil
#@todo
���Ȥ��� 1 ʸ���ɤ߹���ǡ�����ʸ�����б����� Fixnum ���֤��ޤ���
EOF ����ã�������ˤ� nil ���֤��ޤ��� 

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

--- gets(sep_string = $/)    -> String | nil
#@todo
���Ȥ��� 1 ���ɤ߹���ǡ�����ʸ������֤��ޤ���EOF ����ã�������ˤ� nil ���֤��ޤ���
�ܤ������ͤ� [[m:IO#gets]] �򻲾Ȥ��Ʋ�������[[m:$_]] ���ɤ߹�����Ԥ����åȤ���ޤ���

@param sep_string �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���

--- isatty    -> false

���⤻�� false ���֤��ޤ���

--- lineno    -> Integer
#@todo
���ߤι��ֹ���֤��ޤ�������� [[m:StringIO#gets]] ���ƤФ줿����Ǥ���

--- lineno=(n)
#@todo
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
#@todo
���Ȥΰ��֤� n �˰�ư���ޤ������Ȥ�ɽ��ʸ����Υ���������礭���Ƥ⹽���ޤ���

@param n ���Ȥΰ��֤������ǻ��ꤷ�ޤ���

@raise Errno::EINVAL n ���ޥ��ʥ��Ǥ������ȯ�����ޤ���

--- print()        -> nil
--- print(*obj)    -> nil
#@todo
���Ȥ˰������˽��Ϥ��ޤ����������ά�������ϡ� $_ ����Ϥ��ޤ���
�����ΰ����� [[m:Kernel#print]] �򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ�Ϳ���ޤ���

--- printf(format, *obj)    -> nil
#@todo
format �˽������� *obj ��ʸ������Ѵ����ơ����Ȥ˽��Ϥ��ޤ���
�ܤ������ͤ�[[m:Kernel#printf]]�򻲾Ȥ��Ʋ�������

@param format ʸ����Υե����ޥåȤ���ꤷ�ޤ���[[m:Kernel#format]]�򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ�Ϳ���ޤ���

--- putc(ch)    -> object
#@todo
ʸ�� ch �򼫿Ȥ˽񤭹��ߤޤ��� ch �������ʤ� 0 �� 255 ���ϰϤ��б�����ʸ���񤭹��ߤޤ��� 
ch ��ʸ����ʤ顢������Ƭ��ʸ����񤭹��ߤޤ���ch ���֤��ޤ���

@param ch �񤭹��ߤ���ʸ����������ʸ�����Ϳ���ޤ���ch �� Float �� Rational �Ǥ��äƤ⡢�������Ѵ�����Ƥ���񤭹��ޤ�ޤ���

--- puts(*obj)    -> nil
#@todo
obj �Ȳ��Ԥ���֤˼��Ȥ˽��Ϥ��ޤ����������ʤ���в��ԤΤߤ���Ϥ��ޤ���
�ܤ������ͤ� [[m:Kernel#puts]] �򻲾Ȥ��Ʋ�������

@param obj �񤭹��ߤ������֥������Ȥ�Ϳ���ޤ���

--- read                  -> String
--- read(len)             -> String | nil
--- read(len, outbuf)     -> String
#@todo

���Ȥ��� len �Х����ɤ߹��ߤ���֤��ޤ���len ����ά���줿���ϡ��Ǹ�ޤ��ɤ߹�����֤��ޤ���
�ܤ������ͤ� [[m:IO#read]] �򻲾Ȥ��Ʋ�������

@param len �ɤ߹��ߤ���Ĺ���������ǻ��ꤷ�ޤ���

@param outbuf �ɤ߹����ʸ�������Ϥ���Хåե���ʸ�����Ϳ���ޤ���

--- readchar    -> Integer
#@todo
���Ȥ��� 1 ʸ���ɤ߹���ǡ�����ʸ�����б������������֤��ޤ���EOF ����ã�������ˤ��㳰 EOFError ��ȯ�������ޤ���

@raise EOFError EOF ����ã��������ȯ�����ޤ���

--- readline(sep_string = $/)    -> String
#@todo
���Ȥ��� 1 ���ɤ߹���ǡ�����ʸ������֤��ޤ���EOF ����ã�������ˤϡ��㳰 EOFError ��ȯ�������ޤ���
�ܤ������ͤ� [[m:IO#readline]] �򻲾Ȥ��Ʋ�������

@param sep_string �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���

@raise EOFError EOF ����ã��������ȯ�����ޤ���

--- readlines(sep_string = $/)    -> [String]
#@todo
���Ȥ���ǡ����������ɤ߹���ǡ����γƹԤ����ǤȤ��Ƥ��������֤��ޤ��� 
���� EOF ��ã���Ƥ���� [] ���֤��ޤ��� 
�ܤ������ͤ� [[m:IO#readlines]] �򻲾Ȥ��Ʋ�������

@param sep_string �Ԥζ��ڤ��ʸ����ǻ��ꤷ�ޤ���

#@since 1.9.0
--- readpartial([integer [, buffer]])
#@todo
[[m:IO#readpartial]] ��Ʊ�ͤǤ���
#@end

--- reopen    
#@todo
�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

@raise NotImplementedError ���ȯ�����ޤ���

--- rewind    -> 0
#@todo
���Ȥ� pos �� lineno �򤽤줾�� 0 �ˤ��ޤ���

--- seek(offset, whence = IO::SEEK_SET)
#@todo

���Ȥ� pos �� whence �ΰ��֤��� offset �Х��Ȥ�����ư�����ޤ��� whence ���ͤϰʲ��Τ����줫�Ǥ���

 * IO::SEEK_SET: �ե��������Ƭ���� (�ǥե����)
 * IO::SEEK_CUR: ���ߤΥե�����ݥ��󥿤���
 * IO::SEEK_END: �ե��������������

@param offset ��ư���������Х��ȿ���������Ϳ���ޤ���

@raise Errno::EINVAL offset + whence ���ޥ��ʥ��Ǥ������ȯ�����ޤ���

@raise ArgumentError whence ����� SEEK_SET, SEEK_CUR, SEEK_END �ʳ����ä�����ȯ�����ޤ���

--- size    -> Integer
--- length  -> Integer
#@todo
ʸ�����Ĺ�����֤��ޤ���

--- sync    -> true
#@todo
���⤻���� true ���֤��ޤ���

--- sync=(bool)
#@todo
���⤻���� bool ���֤��ޤ���

@param bool true �� flase ��Ϳ���ޤ���

--- sysread                  -> String
--- sysread(len)             -> String
--- sysread(len, outbuf)     -> String
#@todo
[[m:StringIO#read]] ��Ʊ���Ǥ�����������EOF ��ã������硢EOFError ���ꤲ�ޤ���

@param len �ɤ߹��ߤ���Ĺ���������ǻ��ꤷ�ޤ���

@param outbuf �ɤ߹����ʸ�������Ϥ���Хåե���ʸ�����Ϳ���ޤ���

@raise EOFError EOF ��ã��������ȯ�����ޤ���

--- syswrite(obj)    -> Integer
#@todo
[[m:StringIO#write]] ��Ʊ���Ǥ���

@param obj �񤭹��ߤ������֥������Ȥ�Ϳ���ޤ���

--- truncate(len)    -> Integer
#@todo
���ȤΥ������� len �ˤʤ�褦�ˡ����Ȥ��ڤ�ͤᡢ�⤷���ϳ��礷�ޤ���
���礷�����ϡ�������ʬ�� 0 �����ޤ���
len ���֤��ޤ���

@param len �ѹ���������������������Ϳ���ޤ���

@raise IOError ���Ȥ��񤭹��߲�ǽ�Ǥʤ�����ȯ�����ޤ���

@raise Errno::EINVAL len ���ޥ��ʥ��λ���ȯ�����ޤ���

--- tty?    -> false
#@todo
���⤻�� false ���֤��ޤ���

--- ungetc(ch)    -> nil
#@todo
ch �򼫿Ȥ˽��ᤷ�ޤ���
pos �����ȤΥ����������礭�����ϡ����Ȥ�ꥵ�������Ƥ��顢ch ����ᤷ�ޤ���

����Ǥ���᤹���Ȥ���ǽ�Ǥ����ޤ����߰��֤� 0 �Ǥ�����ϲ���Ԥ��ޤ���

nil ���֤��ޤ���

@param ch ���ᤷ����ʸ����������Ϳ���ޤ���

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
#@todo
���Ȥ� obj ����Ϥ��ޤ���obj ��ʸ����Ǥʤ���� to_s �ˤ��ʸ���󲽤��ߤޤ���
�񤭹��ޤ줿ʸ�����Ĺ�����֤��ޤ���

���Ƥν��ϥ᥽�åɤϡ��ǽ�Ū�ˡ�write�פȤ���̾�Υ᥽�åɤ�ƤӽФ��Τǡ�
���Υ᥽�åɤ��֤������뤳�Ȥǽ��ϴؿ��ε�ư���ѹ����뤳�Ȥ��Ǥ��ޤ���

@param obj �񤭹��ߤ������֥������Ȥ�Ϳ���ޤ���

@raise IOError ���Ȥ��񤭹��߲�ǽ�Ǥʤ�����ȯ�����ޤ���
