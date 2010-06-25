�ѥ�̾�򥪥֥������Ȼظ��餷����������Υ饤�֥��Ǥ���

#@since 1.8.5
= reopen Kernel

== Private Instance Methods

--- Pathname(path) -> Pathname
ʸ���� path �򸵤� [[c:Pathname]] ���֥������Ȥ��������ޤ���

Pathname.new(path) ��Ʊ���Ǥ���

@param path ʸ���󡢤ޤ�������Υ��֥������Ȥ�Ϳ���ޤ���
            �ºݤˤ� to_str ��ȿ�����륪�֥������Ȥʤ鲿�Ǥ⹽���ޤ���

#@end

= class Pathname < Object

�ѥ�̾�򥪥֥������Ȼظ��餷���������饹�Ǥ���

Pathname ���֥������Ȥϥѥ�̾��ɽ���Ƥ��ꡢ�ե������ǥ��쥯�ȥꤽ�Τ�Τ�ɽ���ƤϤ��ޤ���
������¸�ߤ��ʤ��ե�����Υѥ�̾�ⰷ���ޤ���

���Хѥ������Хѥ��ⰷ���ޤ���

Pathname ���֥������Ȥ� immutable �Ǥ��ꡢ���Ȥ��˲�Ū������᥽�åɤϤ���ޤ���

Pathname �Υ��󥹥��󥹥᥽�åɤˤϡ��ǥ��쥯�ȥ�Υѥ����֤� [[m:Pathname#dirname]] �Τ褦�ˡ�
ʸ�����������Ƿ�̤��֤���Τ⤢��С��ե��������Ȥ��ɤ߽Ф� [[m:Pathname#read]] �Τ褦��
�ե����륷���ƥ�˥������������Τ⤢��ޤ���

Pathname ���֥������Ȥ������ˤϡ�[[m:Pathname#new]] �Τۤ��� [[m:Kernel#Pathname]] ��Ȥ��ޤ���

  Pathname.new("foo/bar") # => #<Pathname:foo/bar>
  Pathname("foo/bar")     # => #<Pathname:foo/bar>


== Constants

#@since 1.8.5
--- SEPARATOR_PAT
�ѥ�̾�Τʤ��Υǥ��쥯�ȥ����ڤ���ʬ�˥ޥå���������ɽ���Ǥ���

�����ͤϴĶ���¸�Ǥ���

--- TO_PATH
����Ū�˻ȤäƤ�������Ǥ������ѼԤ��Ȥ����ȤϤ���ޤ���

#@end

== Class Methods

--- new(path) -> Pathname
ʸ���� path �򸵤� Pathname ���֥������Ȥ��������ޤ���

@param path ʸ���󡢤ޤ�������Υ��֥������Ȥ�Ϳ���ޤ���
            �ºݤˤ� to_str ��ȿ�����륪�֥������Ȥʤ鲿�Ǥ⹽���ޤ���

@raise ArgumentError path �� \0 ��ޤ�Ǥ����ȯ�����ޤ���

--- getwd -> Pathname
--- pwd   -> Pathname
�����ȥǥ��쥯�ȥ�򸵤� Pathname ���֥������Ȥ��������ޤ���
Pathname.new(Dir.getwd) ��Ʊ���Ǥ���

--- glob(pattern, flags=0) -> [Pathname]
--- glob(pattern, flags=0) {|pathname| ...} -> nil

�磻��ɥ����ɤ�Ÿ����Ԥʤä���̤�
Pathname ���֥������Ȥ�����Ȥ����֤��ޤ���

�����ΰ�̣�ϡ�[[m:Dir.glob]] ��Ʊ���Ǥ��� flag �ν���ͤǤ��� 0 �ϡֲ�
����ꤷ�ʤ��פ��Ȥ��̣���ޤ���

�֥�å���Ϳ����줿�Ȥ��ϡ��磻��ɥ����ɤ˥ޥå����� Pathname ���֥���
���Ȥ�1�Ĥ��İ����Ȥ��Ƥ��Υ֥�å���Ϳ���Ƽ¹Ԥ����ޤ������ξ�硢�ͤ�
���Ƥ� nil ���֤��ޤ���

@param pattern �磻��ɥ����ɥѥ�����Ǥ�
@param flags   �ѥ�����ޥå����Τդ�ޤ����Ѳ�������ե饰����ꤷ�ޤ�

== Instance Methods

--- ==(other)   -> bool
--- ===(other)  -> bool
--- eql?(other) -> bool

�ѥ�̾����Ӥ��� other ��Ʊ���ʤ鿿���֤��ޤ�����ʸ����ʸ���϶��̤���ޤ���
other �� Pathname ���֥������ȤǤʤ���Фʤ�ޤ���

�ѥ�̾����Ӥ�ñ��˥ѥ�ʸ�������Ӥˤ�äƹԤ���Τǡ�����Ū��
Ʊ���ѥ��Ǥ�ѥ�ʸ���󤬰㤨�аۤʤ��Ƚ�Ǥ���ޤ���

@param other ����оݤ� Pathname ���֥������Ȥ���ꤷ�ޤ���

    require 'pathname'

    p Pathname.new("foo/bar") == Pathname.new("foo/bar")
    p Pathname.new("foo/bar") == Pathname.new("foo//bar")
    p Pathname.new("foo/../foo/bar") == Pathname.new("foo/bar")

    # => true
         false
         false

--- <=>(other) -> bool

�ѥ�̾����Ӥ��ޤ���other ��Ʊ���ʤ� 0 ��ASCII��� self ���礭�����
������other ���礭����������֤��ޤ�����ʸ����ʸ���϶��̤���ޤ���
other �� Pathname ���֥������ȤǤʤ���Фʤ�ޤ���

�ѥ�̾����Ӥ�ñ��˥ѥ�ʸ�������Ӥˤ�äƹԤ���Τǡ�����Ū��
Ʊ���ѥ��Ǥ�ѥ�ʸ���󤬰㤨�аۤʤ��Ƚ�Ǥ���ޤ���

@param other ����оݤ� Pathname ���֥������Ȥ���ꤷ�ޤ���

    require 'pathname'

    p Pathname.new("foo/bar") <=> Pathname.new("foo/bar")
    p Pathname.new("foo/bar") <=> Pathname.new("foo//bar")
    p Pathname.new("foo/../foo/bar") <=> Pathname.new("foo/bar")
    => 0
       1
       -1

--- hash -> Fixnum
�ϥå����ͤ��֤��ޤ���

--- to_s   -> String
#@until 1.9.1
--- to_str -> String
#@end
�ѥ�̾��ʸ������֤��ޤ���

#@until 1.9.1
to_str �ϡ�[[m:File.open]] �ʤɤΰ����ˤ��Τޤ� Pathname ���֥������Ȥ�
�Ϥ���褦�ˤ��뤿����Ѱդ���Ƥ��ޤ���
#@end

    require 'pathname'
    
    path = Pathname.new("/tmp/hogehoge")
    File.open(path)

--- cleanpath(consider_symlink = false) -> Pathname
;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤��ޤ���

cleanpath �ϡ��ºݤ˥ե����륷���ƥ�򻲾Ȥ��뤳�Ȥʤ���ʸ�������
�����ǽ�����Ԥ��ޤ���

@param consider_symlink ���ʤ�ѥ����Ǥ˥���ܥ�å���󥯤����ä����
                        �ˤ�����ʤ��褦�� .. ��Ĥ��ޤ���

    require "pathname"
    path = Pathname.new("//.././../")
    path                  # => #<Pathname://.././../>
    path.cleanpath        # => #<Pathname:/>


    require 'pathname'
    Dir.rmdir("/tmp/foo")      rescue nil
    File.unlink("/tmp/bar/foo") rescue nil
    Dir.rmdir("/tmp/bar")      rescue nil
    Dir.mkdir("/tmp/foo")
    Dir.mkdir("/tmp/bar")
    File.symlink("../foo", "/tmp/bar/foo")
    path = Pathname.new("bar/././//foo/../bar")
    Dir.chdir("/tmp")
    
    path.cleanpath       # => #<Pathname:bar/bar>
    path.cleanpath(true) # => #<Pathname:bar/foo/../bar>

#@since 1.9.2
--- realpath(basedir = nil) -> Pathname
#@end
#@until 1.8.5
--- realpath(force_absolute = true) -> Pathname
#@else
--- realpath -> Pathname
#@end
;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤��ޤ���

�ޤ����ե����륷���ƥ�򥢥����������ºݤ�¸�ߤ���ѥ����֤��ޤ���
����ܥ�å���󥯤��褵��ޤ���

self ���ؤ��ѥ���¸�ߤ��ʤ������㳰 [[c:Errno::ENOENT]] ��ȯ�����ޤ���

#@since 1.9.2
@param basedir �١����ǥ��쥯�ȥ����ꤷ�ޤ�����ά����ȥ����ȥǥ��쥯�ȥ�ˤʤ�ޤ���
#@end
#@until 1.8.5
@param force_absolute ���ξ�硢���Хѥ����֤��ޤ��� self �����Хѥ��Ǥ���С������ȥǥ��쥯�ȥ꤫������Хѥ��Ȥ��Ʋ�ᤵ��ޤ���
                      �Ť���ư�� obsolete �Ǥ��������Ͼ�ά���٤��Ǥ���
#@end

    require 'pathname'

    Dir.rmdir("/tmp/foo")      rescue nil
    File.unlink("/tmp/bar/foo") rescue nil
    Dir.rmdir("/tmp/bar")      rescue nil

    Dir.mkdir("/tmp/foo")
    Dir.mkdir("/tmp/bar")
    File.symlink("../foo", "/tmp/bar/foo")
    path = Pathname.new("bar/././//foo/../bar")

    Dir.chdir("/tmp")

    p path.realpath
#@until 1.8.5
    p path.realpath(false)
#@end

    => ruby 1.8.0 (2003-10-10) [i586-linux]
       #<Pathname:/tmp/bar>
#@until 1.8.5
       #<Pathname:bar>
#@end

#@since 1.9.2
@see [[m:Pathname#realdirpath]], [[m:File.realpath]]

--- realdirpath(basedir = nil) -> Pathname

[[m:Pathname#realpath]] �Ȥۤ�Ʊ���ǡ��Ǹ�Υ���ݡ��ͥ�Ȥϼºݤ�
¸�ߤ��ʤ��Ƥ⥨�顼�ˤʤ�ޤ���

@param basedir �١����ǥ��쥯�ȥ����ꤷ�ޤ�����ά����ȥ����ȥǥ��쥯�ȥ�ˤʤ�ޤ���

@see [[m:Pathname#realpath]]
#@end
--- parent -> Pathname
self �οƥǥ��쥯�ȥ��ؤ������� Pathname ���֥������Ȥ��֤��ޤ���

--- mountpoint? -> bool
self ���ޥ���ȥݥ���ȤǤ���п����֤��ޤ���

--- root? -> bool
self ���롼�ȥǥ��쥯�ȥ�Ǥ���п����֤��ޤ���Ƚ�Ǥ�ʸ�������ˤ��
�ƹԤ�졢�ե����륷���ƥ�ϥ�����������ޤ���

--- absolute? -> bool
self �����Хѥ�����Ǥ���п����֤��ޤ���

--- relative? -> bool
self �����Хѥ�����Ǥ���п����֤���

--- each_filename {|v| ... } -> nil
self �Υѥ�̾������˥֥�å���¹Ԥ��ޤ���

    require 'pathname'

    Pathname.new("/foo/../bar").each_filename {|v| p v}

    # => "foo"
         ".."
         "bar"

--- +(other) -> Pathname
�ѥ�̾��Ϣ�뤷�ޤ����Ĥޤꡢother �� self ��������Хѥ��Ȥ���������
Pathname ���֥������Ȥ����������֤��ޤ���

other �����Хѥ��ʤ�ñ�� other ��Ʊ�����Ƥ� Pathname ���֥������Ȥ��֤�
��ޤ���

 Pathname("foo/bar")+"baz" # => #<Pathname:foo/bar/baz>
 Pathname("foo/bar/")+"baz" # => #<Pathname:foo/bar/baz>
 Pathname("foo/bar")+"/baz" # => #<Pathname:/baz>
 Pathname("foo/bar")+"../baz" # => #<Pathname:foo/baz>

@param other ʸ���� Pathname ���֥������Ȥ���ꤷ�ޤ���

#@since 1.8.1

--- children(with_directory = true) -> [Pathname]
self �۲��ˤ���ѥ�̾(Pathname���֥�������)��������֤��ޤ���

�������� ".", ".." �����Ǥ˴ޤޤ�ޤ���

@param with_directory ������ꤹ��ȥե�����̾�Τ��֤��ޤ����ǥե���ȤϿ��Ǥ���

@raise Errno::EXXX self ��¸�ߤ��ʤ��ѥ��Ǥ��ä���ǥ��쥯�ȥ�Ǥʤ�����㳰��ȯ�����ޤ���

    require 'pathname'
    Pathname.new("/tmp").children # => [#<Pathname:.X11-unix>, #<Pathname:.iroha_unix>, ... ]

#@end

#@since 1.9.2

--- each_child(with_directory = true)                  -> Enumerator
--- each_child(with_directory = true) {|pathname| ...} -> [Pathname]
#@todo

self.children(with_directory).each ��Ʊ���Ǥ���

@param with_directory ������ꤹ��ȥե�����̾�Τ��֤��ޤ����ǥե���ȤϿ��Ǥ���

@see [[m:Pathname#children]]
#@end

#@since 1.8.1

--- relative_path_from(base_directory) -> Pathname
base_directory ���� self �ؤ����Хѥ����ᡢ�������Ƥο����� Pathname
���֥������Ȥ����������֤��ޤ���

�ѥ�̾�β���ʸ�������ˤ�äƹԤ�졢�ե����륷���ƥ�򥢥�����
���ޤ���

self �����Хѥ��ʤ� base_directory �����Хѥ���self �����Хѥ��ʤ�
base_directory �����Хѥ��Ǥʤ���Фʤ�ޤ���

@param base_directory �١����ǥ��쥯�ȥ��ɽ�� Pathname ���֥������Ȥ���ꤷ�ޤ���

    require 'pathname'

    path = Pathname.new("/tmp/foo")
    base = Pathname.new("/tmp")

    path.relative_path_from(base) # => #<Pathname:foo>

#@end

#@since 1.8.1

--- each_line(*args, &block)
IO.foreach(self.to_s, *args, &block) ��Ʊ���Ǥ���

@see [[m:IO.foreach]]
#@end

#@until 1.9.2
--- foreachline(*args, &block)
IO.foreach(self.to_s, *args, &block) ��Ʊ���Ǥ���

#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#each_line]] ��ȤäƤ���������
#@end

@see [[m:IO.foreach]]
#@end
--- read(*args) -> String | nil
IO.read(self.to_s, *args)��Ʊ���Ǥ���

@see [[m:IO.read]]

#@since 1.9.2
--- binread(*args)
IO.binread(self.to_s, *args)��Ʊ���Ǥ���

@see [[m:IO.binread]]

#@end
--- readlines(*args)
IO.readlines(self.to_s, *args)��Ʊ���Ǥ���

@see [[m:IO.readlines]]

--- sysopen(*args)
IO.sysopen(self.to_s, *args)��Ʊ���Ǥ���

@see [[m:IO.sysopen]]

#@since 1.8.1
--- make_link(old)
File.link(old, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.link]]

--- make_symlink(old)
File.symlink(old, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.symlink]]
#@end

--- atime -> Time
File.atime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.atime]]

--- ctime -> Time
File.ctime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.ctime]]
--- mtime -> Time
File.mtime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.mtime]]

--- chmod(mode) -> Integer
File.chmod(mode, self.to_s) ��Ʊ���Ǥ���

@param mode �ե�����Υ����������¤������ǻ��ꤷ�ޤ���

@see [[m:File.chmod]]

--- lchmod(mode) -> Integer
File.lchmod(mode, self.to_s) ��Ʊ���Ǥ���

@param mode �ե�����Υ����������¤������ǻ��ꤷ�ޤ���

@see [[m:File.lchmod]]

--- chown(owner, group) -> Integer
File.chown(owner, group, self.to_s) ��Ʊ���Ǥ���

@param owner �����ʡ�����ꤷ�ޤ���

@param group ���롼�פ���ꤷ�ޤ���

@see [[m:File.chown]]

--- lchown(owner, group) -> Integer
File.lchown(owner, group, self.to_s) ��Ʊ���Ǥ���

@param owner �����ʡ�����ꤷ�ޤ���

@param group ���롼�פ���ꤷ�ޤ���

@see [[m:File.lchown]]

--- fnmatch(pattern, *args) -> bool
File.fnmatch(pattern, self.to_s, *args) ��Ʊ���Ǥ���

@param pattern �ѥ������ʸ����ǻ��ꤷ�ޤ����磻��ɥ����ɤȤ��� `*', `?', `[]' �����ѤǤ���
               ����[[m:Dir.glob]] �Ȥϰ�ä� `{}' �� `**/' �ϻ��ѤǤ��ޤ���

@param args [[m:File.fnmatch]] �򻲾Ȥ��Ƥ���������

@see [[m:File.fnmatch]]

--- fnmatch?(pattern, *args) -> bool
File.fnmatch?(pattern, self.to_s, *args) ��Ʊ���Ǥ���

@param pattern �ѥ������ʸ����ǻ��ꤷ�ޤ����磻��ɥ����ɤȤ��� `*', `?', `[]' �����ѤǤ���
               ����[[m:Dir.glob]] �Ȥϰ�ä� `{}' �� `**/' �ϻ��ѤǤ��ޤ���

@param args [[m:File.fnmatch]] �򻲾Ȥ��Ƥ���������

@see [[m:File.fnmatch?]]

--- ftype -> String
File.ftype(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.ftype]]

#@until 1.9.2
--- link(old) -> 0
�쥷���ФȰ����������ƥॳ����ΰ����ȵս���б����Ƥ���ʶ��路�����ᡢ
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#make_link]] ��ȤäƤ���������

File.link(old, self.to_s) ��Ʊ���Ǥ���

@param old �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.link]]

#@end

--- open(mode = 'r', perm = 0666) -> File
--- open(mode = 'r', perm = 0666){|file| ... } -> object
File.open(self.to_s, *args, &block) ��Ʊ���Ǥ���

@see [[m:File.open]]

--- readlink -> Pathname
Pathname.new(File.readlink(self.to_s)) ��Ʊ���Ǥ���

@see [[m:File.readlink]]

--- rename(to) -> 0
File.rename(self.to_s, to) ��Ʊ���Ǥ���

@param to �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.rename]]

--- stat -> File::Stat
File.stat(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.stat]]

--- lstat -> File::Stat
File.lstat(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.lstat]]

#@until 1.9.2
--- symlink(old) -> 0
�쥷���ФȰ����������ƥॳ����ΰ����ȵս���б����Ƥ���ʶ��路�����ᡢ
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#make_symlink]] ��ȤäƤ���������

File.symlink(old, self.to_s) ��Ʊ���Ǥ���

@param old �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.symlink]]

#@end

--- truncate(length) -> 0
File.truncate(self.to_s, length) ��Ʊ���Ǥ���

@param length �ѹ���������������������Ϳ���ޤ���

@see [[m:File.truncate]]

--- utime(atime, mtime) -> Integer
File.utime(atime, mtime, self.to_s) ��Ʊ���Ǥ���

@param atime �ǽ�������������� [[c:Time]] ��������������ηв��ÿ�����ͤǻ��ꤷ�ޤ���

@param utime ��������� [[c:Time]] ��������������ηв��ÿ�����ͤǻ��ꤷ�ޤ���

@see [[m:File.utime]]

--- basename(suffix = "") -> Pathname
Pathname.new(File.basename(self.to_s, suffix)) ��Ʊ���Ǥ���

@param suffix ���ե��å�����ʸ�����Ϳ���ޤ���'.*' �Ȥ���ʸ�����Ϳ������硢'*' �ϥ磻��ɥ����ɤȤ���Ư��
              '.' ��ޤޤʤ�Ǥ�դ�ʸ����˥ޥå����ޤ���

@see [[m:File.basename]]

--- dirname -> Pathname
Pathname.new(File.dirname(self.to_s)) ��Ʊ���Ǥ���

@see [[m:File.dirname]]

--- extname -> String
File.extname(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.extname]]

--- expand_path(default_dir = '.') -> Pathname
Pathname.new(File.expand_path(self.to_s, *args)) ��Ʊ���Ǥ���

@param default_dir self �����Хѥ��Ǥ���� default_dir �����Ÿ������ޤ���

@see [[m:File.expand_path]]

--- join(*args) -> Pathname

Ϳ����줿�ѥ�̾��Ϣ�뤷�ޤ���

@param args Ϣ�뤷�����ǥ��쥯�ȥ�̾��ե�����̾��ʸ�����Ϳ���ޤ���

--- split -> Array
File.split(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.split]]

--- blockdev? -> bool
FileTest.blockdev?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#blockdev?]]

--- chardev? -> bool
FileTest.chardev?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#chardev?]]

--- executable? -> bool
FileTest.executable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#executable?]]

--- executable_real? -> bool
FileTest.executable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#executable_real?]]

--- exist? -> bool
FileTest.exist?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#exist?]]

--- grpowned? -> bool
FileTest.grpowned?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#grpowned?]]

--- directory? -> bool
FileTest.directory?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#directory?]]

--- file? -> bool
FileTest.file?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#file?]]

--- pipe? -> bool
FileTest.pipe?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#pipe?]]

--- socket? -> bool
FileTest.socket?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#socket?]]

--- owned? -> bool
FileTest.owned?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#owned?]]

--- readable? -> bool
FileTest.readable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#readable?]]

--- readable_real? -> bool
FileTest.readable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#readable_real?]]

--- setuid? -> bool
FileTest.setuid?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#setuid?]]

--- setgid? -> bool
FileTest.setgid?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#setgid?]]

--- size -> Integer
FileTest.size(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#size]]

--- size? -> bool
FileTest.size?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#size?]]

--- sticky? -> bool
FileTest.sticky?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#sticky?]]

--- symlink? -> bool
FileTest.symlink?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#symlink?]]

#@since 1.8.5

--- world_readable? -> bool
FileTest.world_readable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#world_readable?]]

--- world_writable? -> bool
FileTest.world_writable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#world_writable?]]

#@end

--- writable? -> bool
FileTest.writable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#writable?]]

--- writable_real? -> bool
FileTest.writable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#writable_real?]]

--- zero? -> bool
FileTest.zero?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#zero?]]

#@until 1.9.2
--- chdir(&block)
#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Dir.chdir]] ��ȤäƤ���������
#@end

Dir.chdir(self.to_s, &block) ��Ʊ���Ǥ���

@see [[m:Dir.chdir]]

--- chroot
#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Dir.chroot]] ��ȤäƤ���������
#@end

Dir.chroot(self.to_s) ��Ʊ���Ǥ���

@see [[m:Dir.chroot]]

#@end
--- rmdir
Dir.rmdir(self.to_s) ��Ʊ���Ǥ���

@see [[m:Dir.rmdir]]

--- entries
Dir.entries(self.to_s) ��Ʊ���Ǥ���

@see [[m:Dir.entries]]

#@since 1.8.1

--- each_entry {|pathname| ... }
Dir.foreach(self.to_s) {|f| yield Pathname.new(f) } ��Ʊ���Ǥ���

@see [[m:Dir.foreach]]

#@end

#@until 1.9.2
--- dir_foreach {|pathname| ... }
#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#each_entry]] �᥽�åɤ�ȤäƤ���������
#@end

Dir.foreach(self.to_s) {|f| yield Pathname.new(f) } ��Ʊ���Ǥ���

@see [[m:Dir.foreach]]

#@end
--- mkdir(*args)
Dir.mkdir(self.to_s, *args) ��Ʊ���Ǥ���

@see [[m:Dir.mkdir]]

--- opendir(&block)
Dir.open(self.to_s, &block) ��Ʊ���Ǥ���

@see [[m:Dir.open]]

--- find {|pathname| ...}
self �۲��Τ��٤ƤΥե������ǥ��쥯�ȥ��
��Ĥ��İ��� pathname ���Ϥ��ƥ֥�å���¹Ԥ��ޤ���

  require 'find'
  Find.find(self.to_s) {|f| yield Pathname.new(f)}

��Ʊ���Ǥ���

@see [[m:Find.#find]]

--- mkpath
FileUtils.mkpath(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileUtils.#mkpath]]

--- rmtree
FileUtils.rm_r(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileUtils.#rm_r]]

--- unlink
--- delete
self ���ؤ��ǥ��쥯�ȥꤢ�뤤�ϥե�����������ޤ���

#@since 1.8.5

--- ascend { |pathname| ... }
self �Υѥ�̾�����������é�äƤ��ä��Ȥ��γƥѥ�̾�򿷤��� Pathname ��
�֥������ȤȤ������������֥�å��ؤΰ����Ȥ����Ϥ��Ƽ¹Ԥ��ޤ���

  Pathname.new('/path/to/some/file.rb').ascend {|v| p v}
     #<Pathname:/path/to/some/file.rb>
     #<Pathname:/path/to/some>
     #<Pathname:/path/to>
     #<Pathname:/path>
     #<Pathname:/>

  Pathname.new('path/to/some/file.rb').ascend {|v| p v}
     #<Pathname:path/to/some/file.rb>
     #<Pathname:path/to/some>
     #<Pathname:path/to>
     #<Pathname:path>

�ե����륷���ƥ�ˤϥ����������ޤ���

#@end

#@since 1.8.5
--- descend { |pathname| ... }
self �Υѥ�̾�οƤ���Ҷ��ؤ�é�äƤ��ä��Ȥ��γƥѥ�̾�򿷤���
Pathname ���֥������ȤȤ������������֥�å��ؤΰ����Ȥ����Ϥ��Ƽ¹Ԥ���
����

  Pathname.new('/path/to/some/file.rb').descend {|v| p v}
     #<Pathname:/>
     #<Pathname:/path>
     #<Pathname:/path/to>
     #<Pathname:/path/to/some>
     #<Pathname:/path/to/some/file.rb>
  
  Pathname.new('path/to/some/file.rb').descend {|v| p v}
     #<Pathname:path>
     #<Pathname:path/to>
     #<Pathname:path/to/some>
     #<Pathname:path/to/some/file.rb>

�ե����륷���ƥ�ˤϥ����������ޤ���

#@end

#@if(version <= "1.8.1")

--- cleanpath_aggressive
cleanpath(false) ��Ʊ���Ǥ��� 1.8.2 �ʹߤ�� private �᥽�åɤȤʤꡢ���ѤǤ��ʤ��ʤ�ޤ����� cleanpath �����Ѥ��Ƥ���������

--- cleanpath_conservative
cleanpath(true) ��Ʊ���Ǥ��� 1.8.2 �ʹߤ�� private �᥽�åɤȤʤꡢ���ѤǤ��ʤ��ʤ�ޤ����� cleanpath �����Ѥ��Ƥ���������

#@end

--- foreach(*args, &block)
#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ��� each_line �� each_entry ��ȤäƤ���������
#@end

self �λؤ������ѥ����ǥ��쥯�ȥ�ʤ�
Dir.foreach(self.to_s, *args, &block) �ȡ�����ʤ����
IO.foreach(self.to_s, *args, &block) ��Ʊ���Ǥ���



#@if(version <= "1.8.0")
--- realpath_rec
realpath �᥽�åɤμ¼�Ū�ʽ�����ԤäƤ���᥽�åɤǤ������Ѥ���٤���
�Ϥ���ޤ���

#@end


#@since 1.8.5
--- sub(pattern, replace)  -> Pathname
--- sub(pattern) {|matched| ... } -> Pathname

self ��ɽ������ѥ�ʸ������Ф��� sub �᥽�åɤ�ƤӽФ������η�̤���
�ƤȤ��뿷���� Pathname ���֥������Ȥ����������֤��ޤ��� cf. [[m:String#sub]]

#@end

#@since 1.9.1
--- to_path -> String
File.open �ʤɤΰ������Ϥ��ݤ˸ƤФ��᥽�åɤǤ��� Pathname ���֥���
���Ȥˤ����Ƥϡ� to_s ��Ʊ���Ǥ���

#@end

