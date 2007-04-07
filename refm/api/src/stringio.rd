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

@param mode [[m:Kernel#open]]Ʊ��ʸ���������ǻ��ꤷ�ޤ���

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

���Ȥ��Ф����ɤ߼�꤬�ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- closed_write?    -> bool

���Ȥ��Ф���񤭹��ߤ��ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- each(sep_string = $/){|line| ... }       -> self
--- each_line(sep_string = $/){|line| ... }  -> self
#@todo
���Ȥ��� 1 �Ԥ����ɤ߹��ߡ����������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

�٤������ͤ� [[m:IO#each]] �򻲾Ȥ��Ʋ�������

@raise IOError ���Ȥ��ɤ߼���ԲĤʤ�ȯ�����ޤ���

--- each_byte{|byte| ... }    -> self
#@todo
���Ȥ��� 1 �Х��Ȥ����ɤ߹��ߡ��������Ѵ��������������Ȥ���Ϳ����줿�֥�å���¹Ԥ��ޤ���

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

--- gets(sep_string = $/)    -> String
#@todo
����ɤ߹���ǡ�����ʸ������֤��ޤ���EOF ����ã�������ˤ� nil ���֤��ޤ���
�ܤ������ͤ� [[m:IO#gets]] �򻲾Ȥ��Ʋ�������[[m:$_]] ���ɤ߹�����Ԥ����åȤ���ޤ���

--- isatty    -> false

���⤻�� false ���֤��ޤ���

--- lineno    -> Integer
#@todo
���ߤι��ֹ���֤��ޤ�������� [[m:StringIO#gets]] ���ƤФ줿����Ǥ���

--- lineno=(n)
#@todo
���ߤι��ֹ�� n �˥��åȤ��ޤ���

--- path    -> nil

StringIO�ˤ��б�����ѥ��Ϥʤ��Τ� nil ���֤��ޤ���

--- pid    -> nil

���⤻�� nil ���֤��ޤ���

--- pos    -> Integer
--- tell   -> Integer

���Ȥθ��ߤΰ��֤��֤��ޤ���

--- pos=(n)
#@todo
���Ȥΰ��֤� n �˰�ư���ޤ������Ȥ�ɽ��ʸ����Υ���������礭���Ƥ⹽���ޤ���

@raise Errno::EINVAL n ���ޥ��ʥ��Ǥ������ȯ�����ޤ���

--- print()        -> nil
--- print(*obj)    -> nil
#@todo
���Ȥ˰������˽��Ϥ��ޤ����������ά�������ϡ� $_ ����Ϥ��ޤ���
�����ΰ����� [[m:Kernel#print]] �򻲾Ȥ��Ʋ�������

--- printf(format, *obj)    -> nil
#@todo
format �˽������� *obj ��ʸ������Ѵ����ơ����Ȥ˽��Ϥ��ޤ���
�ܤ������ͤ�[[m:Kernel#printf]]�򻲾Ȥ��Ʋ�������

--- putc(obj)
#@todo
[[m:IO#putc]] ��Ʊ�ͤǤ���Ϳ����줿 obj ���֤��ޤ���

--- puts(obj, ...)
#@todo
[[m:IO#puts]] ��Ʊ�ͤǤ���

--- read([integer [, buffer]])
#@todo
[[m:IO#read]] ��Ʊ�ͤǤ���

--- readchar
#@todo
[[m:IO#readchar]] ��Ʊ�ͤǤ���

--- readline(sep_string = $/)
#@todo
[[m:IO#readline]] ��Ʊ�ͤǤ���

--- readlines(sep_string = $/)
#@todo
[[m:IO#readlines]] ��Ʊ�ͤǤ���

#@since 1.9.0
--- readpartial([integer [, buffer]])
#@todo
[[m:IO#readpartial]] ��Ʊ�ͤǤ���
#@end

--- reopen
#@todo
�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

--- rewind
#@todo
[[m:IO#rewind]] ��Ʊ�ͤǤ���

--- seek(n, whence)
#@todo
[[m:IO#seek]] ��Ʊ�ͤǤ���

--- size
--- length
#@todo
ʸ�����Ĺ�����֤��ޤ���

--- sync
#@todo
���⤻���� 0 ���֤��ޤ���

--- sync=(bool)
#@todo
���⤻���� bool ���֤��ޤ���

--- sysread([integer [, buffer]])
#@todo
[[m:StringIO#read]] ��Ʊ���Ǥ���

--- syswrite(obj)
#@todo
[[m:StringIO#write]] ��Ʊ���Ǥ���

--- truncate(n)
#@todo
n �� self.size ��꾮�������ˤϥХåե��Υ������� n ���ڤ�ͤ�ޤ���
n �� self.size ����礭�����ˤϥХåե��Υ������� n �˳��礷�ޤ���

--- tty?
#@todo
���⤻�� false ���֤��ޤ���

--- ungetc(c)
#@todo
c �� Fixnum �Ǥ���
pos �� 1 ���餷�Ƥ��饭��饯���������ɤ� c ��ʸ����񤭹��ߤޤ���
#@#���λ�pos�� 1 �����ޤ���
pos �� size �����礭�����ϡ��ꥵ�������ƿ������ä���줿�Хåե��� 0 ��
���Ƥ��� pos �� 1 ���餷�ƥ���饯���������ɤ� c ��ʸ����񤭹��ߤޤ���
#@#���λ��� pos �� 1 �����ޤ���
nil ���֤��ޤ���

      s = StringIO.new("hoge")
      s.pos = 1
      s.ungetc(0x48)
      p s.string   #=> "Hoge"
      p s.pos        #=> 0

      s = StringIO.new("hoge")
      s.pos = 8
      s.ungetc(0x41)
      p s.string   #=> "hoge\000\000\000A"
      p s.pos        #=> 7

--- write(obj)
#@todo
[[m:IO#write]] ��Ʊ�ͤǤ����񤭹��ޤ줿ʸ�����Ĺ�����֤��ޤ���
