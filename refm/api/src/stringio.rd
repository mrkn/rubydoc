= class StringIO < Data

[[c:IO]] ��Ʊ�����󥿥ե���������ä�ʸ���󥯥饹�Ǥ���


=== �㳰
StringIO ���֥������Ȥ�����ξ�� IO ���֥������Ȥ�Ʊ���㳰��ȯ�������ޤ���
�㤨�м�����Ǥ� write �� IOError ��ȯ�������ޤ���

  require "stringio"
  sio = StringIO.new("hoge")
  sio.close
  sio.write("a")
  # => in `write': not opened for writing (IOError)

== Class Methods

--- new(string = '', mode = 'r+')
--- open(string = '', mode = 'r+')
--- open(string = '', mode = 'r+') {|io| ... }
#@todo

StringIO ���֥������Ȥ��������ޤ���mode �ϥǥե���ȤǤ��ɤ߽񤭲�ǽ��
���ꤵ��ޤ���Ϳ����줿 string ���ե꡼������Ƥ�����ˤϡ�
mode �ϥǥե���ȤǤ��ɤ߼��Τߤ����ꤵ��ޤ���

�֥�å���Ϳ�������� StringIO ���֥������Ȥ�����Ȥ��ƥ֥�å���ɾ�����ޤ���

        require 'stringio'

        io = StringIO.new("foo")
        p io.getc       # => 102
        p io.pos        # => 1
        p io.size       # => 3
        io << "bar"
        p io.size       # => 4
        io.rewind
        p io.gets       # => "fbar"

        StringIO.open("hoge"){|io|
          p io.string   # => "hoge"
        }

== Instance Methods

--- string
#@todo
IO�Хåե�(ʸ����)���֤��ޤ���

--- string=(buf)
#@todo
IO�Хåե��� buf ���ѹ�����buf ���֤��ޤ������������
�Хåե��ϼΤƤ��ޤ���StringIO ���ɤ߽�ξ�Ѥˤʤ�ޤ���
buf ���ե꡼������Ƥ�����ˤϡ��ɤ߼�����Ѥˤʤ�ޤ���
pos �� lineno �� 0 �˥��åȤ���ޤ���

#@if (version >= "1.8.3")
ruby 1.8.3 ����� 
buf �� nil �ξ��ˤϡ��㳰 TypeError ��ȯ�����ޤ���
#@else
ruby 1.8.2 �ޤ�: 
buf �� nil �ξ��ϡ�StringIO �ؤ��ɤ߽񤭤϶ػߤ���ޤ���
#@end


--- <<(obj)
#@todo
[[m:IO#<<]] ��Ʊ�ͤǤ���obj �� pos �ΰ��֤˽񤭹��ߤޤ��� ɬ�פʤ� obj.to_s ��Ƥ��
ʸ������Ѵ����ޤ��� self ���֤��ޤ���

--- binmode
#@todo
���⤻���� self ���֤��ޤ���

--- close
#@todo
close ���ޤ���[[m:IO#close]] ��Ʊ���褦���ɤ߽񤭤��ػߤ���ޤ���

--- close_read
#@todo
[[m:IO#close_read]] ��Ʊ�ͤǤ����ɤ߼���ػߤ��ޤ���

--- close_write
#@todo
[[m:IO#close_write]] ��Ʊ�ͤǤ����񤭹��ߤ��ػߤ���ޤ���

--- closed?
#@todo
[[m:IO#closed?]] ��Ʊ�ͤǤ���

      sio = StringIO.open("hoge")
      p sio.closed? # => false
      sio.close_read
      p sio.closed? # => false
      sio.close_write
      sio.closed?   # => true

--- closed_read?
#@todo
�ɤ߼�꤬�ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- closed_write?
#@todo
�񤭹��ߤ��ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- each(sep_string=$/){|line| ... }
--- each_line(sep_string=$/){|line| ... }
#@todo
[[m:IO#each]] ��Ʊ�ͤǤ���

--- each_byte{|byte| ... }
#@todo
[[m:IO#each_byte]] ��Ʊ�ͤǤ���

--- eof
--- eof?
#@todo
pos ��ʸ����ν�ü�ˤ���� true ���֤��ޤ���

--- fcntl
#@todo

�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

--- fileno
#@todo
���⤻�� nil ���֤��ޤ���

--- flush
#@todo
���⤻���� self ���֤��ޤ���

--- fsync
#@todo
���⤻���� 0 ���֤��ޤ���

--- getc
#@todo
[[m:IO#getc]] ��Ʊ�ͤǤ���

--- gets(sep_string = $/)
#@todo
[[m:IO#gets]] ��Ʊ�ͤǤ���[[m:$_]] ���ɤ߹�����Ԥ����åȤ���ޤ���

--- isatty
#@todo
���⤻�� false ���֤��ޤ���

--- lineno
#@todo
[[m:IO#lineno]] ��Ʊ�ͤǤ���

--- lineno=()
#@todo
[[m:IO#lineno=]] ��Ʊ�ͤǤ���

--- path
#@todo
StringIO�ˤ��б�����ѥ��Ϥʤ��Τ� nil ���֤��ޤ���

--- pid
#@todo
���⤻�� nil ���֤��ޤ���

--- pos
--- tell
#@todo
[[m:IO#pos]] ��Ʊ�ͤǤ���

--- pos=(n)
#@todo
[[m:IO#pos=]] ��Ʊ�ͤǤ���

--- print([obj, ...])
#@todo
[[m:IO#print]] ��Ʊ�ͤǤ���

--- printf(format_string [, obj, ...] )
#@todo
[[m:IO#printf]] ��Ʊ�ͤǤ���

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
