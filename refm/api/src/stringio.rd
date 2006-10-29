= class StringIO < Data

[[c:IO]] ��Ʊ�����󥿥ե���������ä�ʸ���󥯥饹�Ǥ���

#@todo

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
IO�Хåե�(ʸ����)���֤��ޤ���

--- string=(buf)
IO�Хåե��� buf ���ѹ�����buf ���֤��ޤ������������
�Хåե��ϼΤƤ��ޤ���StringIO ���ɤ߽�ξ�Ѥˤʤ�ޤ���
buf ���ե꡼������Ƥ�����ˤϡ��ɤ߼�����Ѥˤʤ�ޤ���
pos �� lineno �� 0 �˥��åȤ���ޤ���

@if (version >= "1.8.3")
ruby 1.8.3 ����� 
buf �� nil �ξ��ˤϡ��㳰 TypeError ��ȯ�����ޤ���
@else
ruby 1.8.2 �ޤ�: 
buf �� nil �ξ��ϡ�StringIO �ؤ��ɤ߽񤭤϶ػߤ���ޤ���
@end


--- <<(obj)
[[m:IO#<<]] ��Ʊ�ͤǤ���obj �� pos �ΰ��֤˽񤭹��ߤޤ��� ɬ�פʤ� obj.to_s ��Ƥ��
ʸ������Ѵ����ޤ��� self ���֤��ޤ���

--- binmode
���⤻���� self ���֤��ޤ���

--- close
close ���ޤ���[[m:IO#close]] ��Ʊ���褦���ɤ߽񤭤��ػߤ���ޤ���

--- close_read
[[m:IO#close_read]] ��Ʊ�ͤǤ����ɤ߼���ػߤ��ޤ���

--- close_write
[[m:IO#close_write]] ��Ʊ�ͤǤ����񤭹��ߤ��ػߤ���ޤ���

--- closed?
[[m:IO#closed?]] ��Ʊ�ͤǤ���

      sio = StringIO.open("hoge")
      p sio.closed? # => false
      sio.close_read
      p sio.closed? # => false
      sio.close_write
      sio.closed?   # => true

--- closed_read?
�ɤ߼�꤬�ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- closed_write?
�񤭹��ߤ��ػߤ���Ƥ���ʤ� true ���֤��ޤ���

--- each(sep_string=$/){|line| ... }
--- each_line(sep_string=$/){|line| ... }
[[m:IO#each]] ��Ʊ�ͤǤ���

--- each_byte{|byte| ... }
[[m:IO#each_byte]] ��Ʊ�ͤǤ���

--- eof
--- eof?
pos ��ʸ����ν�ü�ˤ���� true ���֤��ޤ���

--- fcntl

�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

--- fileno
���⤻�� nil ���֤��ޤ���

--- flush
���⤻���� self ���֤��ޤ���

--- fsync
���⤻���� 0 ���֤��ޤ���

--- getc
[[m:IO#getc]] ��Ʊ�ͤǤ���

--- gets(sep_string = $/)
[[m:IO#gets]] ��Ʊ�ͤǤ���[[m:$_]] ���ɤ߹�����Ԥ����åȤ���ޤ���

--- isatty
���⤻�� false ���֤��ޤ���

--- lineno
[[m:IO#lineno]] ��Ʊ�ͤǤ���

--- lineno=()
[[m:IO#lineno=]] ��Ʊ�ͤǤ���

--- path
StringIO�ˤ��б�����ѥ��Ϥʤ��Τ� nil ���֤��ޤ���

--- pid
���⤻�� nil ���֤��ޤ���

--- pos
--- tell
[[m:IO#pos]] ��Ʊ�ͤǤ���

--- pos=(n)
[[m:IO#pos=]] ��Ʊ�ͤǤ���

--- print([obj, ...])
[[m:IO#print]] ��Ʊ�ͤǤ���

--- printf(format_string [, obj, ...] )
[[m:IO#printf]] ��Ʊ�ͤǤ���

--- putc(obj)
[[m:IO#putc]] ��Ʊ�ͤǤ���Ϳ����줿 obj ���֤��ޤ���

--- puts(obj, ...)
[[m:IO#puts]] ��Ʊ�ͤǤ���

--- read([integer [, buffer]])
[[m:IO#read]] ��Ʊ�ͤǤ���

--- readchar
[[m:IO#readchar]] ��Ʊ�ͤǤ���

--- readline(sep_string = $/)
[[m:IO#readline]] ��Ʊ�ͤǤ���

--- readlines(sep_string = $/)
[[m:IO#readlines]] ��Ʊ�ͤǤ���

#@since 1.9.0
--- readpartial([integer [, buffer]])
[[m:IO#readpartial]] ��Ʊ�ͤǤ���
#@end

--- reopen
�㳰 [[c:NotImplementedError]] ��ȯ�����ޤ���

--- rewind
[[m:IO#rewind]] ��Ʊ�ͤǤ���

--- seek(n, whence)
[[m:IO#seek]] ��Ʊ�ͤǤ���

--- size
--- length
ʸ�����Ĺ�����֤��ޤ���

--- sync
���⤻���� 0 ���֤��ޤ���

--- sync=(bool)
���⤻���� bool ���֤��ޤ���

--- sysread([integer [, buffer]])
[[m:StringIO#read]] ��Ʊ���Ǥ���

--- syswrite(obj)
[[m:StringIO#write]] ��Ʊ���Ǥ���

--- truncate(n)
n �� self.size ��꾮�������ˤϥХåե��Υ������� n ���ڤ�ͤ�ޤ���
n �� self.size ����礭�����ˤϥХåե��Υ������� n �˳��礷�ޤ���

--- tty?
���⤻�� false ���֤��ޤ���

--- ungetc(c)
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
      p.pos        #=> 0

      s = StringIO.new("hoge")
      s.pos = 8
      s.ungetc(0x41)
      p s.string   #=> "hoge\000\000\000A"
      p.pos        #=> 7

--- write(obj)
[[m:IO#write]] ��Ʊ�ͤǤ����񤭹��ޤ줿ʸ�����Ĺ�����֤��ޤ���
