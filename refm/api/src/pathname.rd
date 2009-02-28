�ѥ�̾�򥪥֥������Ȼظ��餷����������Υ饤�֥��Ǥ���

#@since 1.8.5
= reopen Kernel

== Private Instance Methods

--- Pathname(path) -> Pathname
ʸ���� path �򸵤� Pathname ���֥������Ȥ��������ޤ���

Pathname.new(string) ��Ʊ���Ǥ���

#@end



= class Pathname < Object

�ѥ�̾���饹

== Constants

#@since 1.8.5
--- SEPARATOR_PAT
�ѥ�̾�Τʤ��Υǥ��쥯�ȥ����ڤ���ʬ�˥ޥå���������ɽ���Ǥ���

--- TO_PATH
����Ū�˻ȤäƤ�������Ǥ������ѼԤ��Ȥ����ȤϤ���ޤ���

#@end

== Class Methods

--- new(path) -> Pathname
ʸ���� path �򸵤� Pathname ���֥������Ȥ��������ޤ���

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
@param flag    �ѥ�����ޥå����Τդ�ޤ����Ѳ�������ե饰����ꤷ�ޤ�

== Instance Methods

--- ==(other)   -> bool
--- ===(other)  -> bool
--- eql?(other) -> bool

�ѥ�̾����Ӥ��� other ��Ʊ���ʤ鿿���֤��ޤ�����ʸ����ʸ���϶��̤���ޤ���
other �� Pathname ���֥������ȤǤʤ���Фʤ�ޤ���

�ѥ�̾����Ӥ�ñ��˥ѥ�ʸ�������Ӥˤ�äƹԤ���Τǡ�����Ū��
Ʊ���ѥ��Ǥ�ѥ�ʸ���󤬰㤨�аۤʤ��Ƚ�Ǥ���ޤ���

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
--- to_str -> String
�ѥ�̾��ʸ������֤��ޤ���

to_str �ϡ�[[m:File.open]] �ʤɤΰ����ˤ��Τޤ� Pathname ���֥������Ȥ�
�Ϥ���褦�ˤ��뤿����Ѱդ���Ƥ��ޤ���

    require 'pathname'

    path = Pathname.new("/tmp/hogehoge")
    File.open(path)

--- cleanpath(consider_symlink = false) -> Pathname
;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤��ޤ���

    require "pathname"
    path = Pathname.new("//.././../")
    p path                  # => #<Pathname://.././../>
    p path.cleanpath        # => #<Pathname:/>

consider_symlink �����ʤ�ѥ����Ǥ˥���ܥ�å���󥯤����ä����
�ˤ�����ʤ��褦�� .. ��Ĥ��ޤ���

cleanpath �ϡ��ºݤ˥ե����륷���ƥ�򻲾Ȥ��뤳�Ȥʤ���ʸ�������
�����ǽ�����Ԥ��ޤ���

    require 'pathname'

    Dir.rmdir("/tmp/foo")      rescue nil
    File.unlink("/tmp/bar/foo") rescue nil
    Dir.rmdir("/tmp/bar")      rescue nil

    Dir.mkdir("/tmp/foo")
    Dir.mkdir("/tmp/bar")
    File.symlink("../foo", "/tmp/bar/foo")
    path = Pathname.new("bar/././//foo/../bar")

    Dir.chdir("/tmp")

    p path.cleanpath
    p path.cleanpath(true)

    => ruby 1.8.0 (2003-10-10) [i586-linux]
       #<Pathname:bar/bar>
       #<Pathname:bar/foo/../bar>

--- realpath -> Pathname
#@until 1.9.2
--- realpath(force_absolute = true) -> Pathname
#@end
;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤��ޤ���

�ޤ����ե����륷���ƥ�򥢥����������ºݤ�¸�ߤ���ѥ����֤��ޤ���
����ܥ�å���󥯤��褵��ޤ���

self ���ؤ��ѥ���¸�ߤ��ʤ������㳰 [[c:Errno::ENOENT]] ��ȯ�����ޤ���

#@until 1.9.2
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
#@until 1.9.2
    p path.realpath(false)
#@end

    => ruby 1.8.0 (2003-10-10) [i586-linux]
       #<Pathname:/tmp/bar>
#@until 1.9.2
       #<Pathname:bar>
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

@param other ʸ���� Pathname ���֥������Ȥ���ꤷ�ޤ���

#@since 1.8.1

--- children -> [Pathname]
self �۲��ˤ���ѥ�̾(Pathname���֥�������)��������֤��ޤ���

    require 'pathname'

    p Pathname.new("/tmp").children
    => ruby 1.8.0 (2003-10-10) [i586-linux]
       [#<Pathname:.X11-unix>, #<Pathname:.iroha_unix>, ... ]

�������� ".", ".." �����Ǥ˴ޤޤ�ޤ���

self ��¸�ߤ��ʤ��ѥ��Ǥ��ä���ǥ��쥯�ȥ�Ǥʤ�����㳰
[[c:Errno::EXXX]] ��ȯ�����ޤ���

#@end

#@since 1.8.1

--- relative_path_from(base_directory) -> Pathname
base_direcoty ���� self �ؤ����Хѥ����ᡢ�������Ƥο����� Pathname
���֥������Ȥ����������֤��ޤ���

�ѥ�̾�β���ʸ�������ˤ�äƹԤ�졢�ե����륷���ƥ�򥢥�����
���ޤ���

    require 'pathname'

    path = Pathname.new("/tmp/foo")
    base = Pathname.new("/tmp")

    p path.relative_path_from(base)

    # => ruby 1.8.0 (2003-10-10) [i586-linux]
         #<Pathname:foo>

self �����Хѥ��ʤ� base_directory �����Хѥ���self �����Хѥ��ʤ�
base_directory �����Хѥ��Ǥʤ���Фʤ�ޤ���

base_directory �� Pathname ���֥������ȤǤʤ���Фʤ�ޤ���

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
--- read(*args)
IO.read(self.to_s, *args)��Ʊ���Ǥ���

@see [[m:IO.read]]

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

--- atime
File.atime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.atime]]

--- ctime
File.ctime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.ctime]]
--- mtime
File.mtime(self.to_s) ���Ϥ�����Τ�Ʊ���Ǥ���

@see [[m:File.mtime]]

--- chmod(mode)
File.chmod(mode, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.chmod]]

--- lchmod(mode)
File.lchmod(mode, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.lchmod]]

--- chown(owner, group)
File.chown(owner, group, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.chown]]

--- lchown(owner, group)
File.lchown(owner, group, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.lchown]]

--- fnmatch(pattern, *args)
File.fnmatch(pattern, self.to_s, *args) ��Ʊ���Ǥ���

@see [[m:File.fnmatch]]

--- fnmatch?(pattern, *args)
File.fnmatch?(pattern, self.to_s, *args) ��Ʊ���Ǥ���

@see [[m:File.fnmatch?]]

--- ftype
File.ftype(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.ftype]]

#@until 1.9.2
--- link(old)
File.link(old, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.link]]

�쥷���ФȰ����������ƥॳ����ΰ����ȵս���б����Ƥ���ʶ��路�����ᡢ
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#make_link]] ��ȤäƤ���������
#@end

--- open(*args, &block)
File.open(self.to_s, *args, &block) ��Ʊ���Ǥ���

@see [[m:File.open]]

--- readlink
Pathname.new(File.readlink(self.to_s)) ��Ʊ���Ǥ���

@see [[m:File.readlink]]

--- rename(to)
File.rename(self.to_s, to) ��Ʊ���Ǥ���

@see [[m:File.rename]]

--- stat
File.stat(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.stat]]

--- lstat
File.lstat(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.lstat]]

#@until 1.9.2
--- symlink(old)
File.symlink(old, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.symlink]]

�쥷���ФȰ����������ƥॳ����ΰ����ȵս���б����Ƥ���ʶ��路�����ᡢ
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#make_symlink]] ��ȤäƤ���������
#@end

--- truncate(length)
File.truncate(self.to_s, length) ��Ʊ���Ǥ���

@see [[m:File.truncate]]

--- utime(atime, mtime)
File.utime(atime, mtime, self.to_s) ��Ʊ���Ǥ���

@see [[m:File.utime]]

--- basename(*args)
Pathname.new(File.basename(self.to_s, *args)) ��Ʊ���Ǥ���

@see [[m:File.basename]]

--- dirname
Pathname.new(File.dirname(self.to_s)) ��Ʊ���Ǥ���

@see [[m:File.dirname]]

--- extname
File.extname(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.extname]]

--- expand_path(*args)
Pathname.new(File.expand_path(self.to_s, *args)) ��Ʊ���Ǥ���

@see [[m:File.expand_path]]

--- join(*args)
Pathname.new(File.join(self.to_s, *args)) ��Ʊ���Ǥ���

@see [[m:File.join]]

--- split
File.split(self.to_s) ��Ʊ���Ǥ���

@see [[m:File.split]]

--- blockdev?
FileTest.blockdev?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#blockdev?]]

--- chardev?
FileTest.chardev?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#chardev?]]

--- executable?
FileTest.executable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#executable?]]

--- executable_real?
FileTest.executable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#executable_real?]]

--- exist?
FileTest.exist?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#exist?]]

--- grpowned?
FileTest.grpowned?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#grpowned?]]

--- directory?
FileTest.directory?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#directory?]]

--- file?
FileTest.file?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#file?]]

--- pipe?
FileTest.pipe?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#pipe?]]

--- socket?
FileTest.socket?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#socket?]]

--- owned?
FileTest.owned?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#owned?]]

--- readable?
FileTest.readable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#readable?]]

--- readable_real?
FileTest.readable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#readable_real?]]

--- setuid?
FileTest.setuid?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#setuid?]]

--- setgid?
FileTest.setgid?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#setgid?]]

--- size
FileTest.size(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#size]]

--- size?
FileTest.size?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#size?]]

--- sticky?
FileTest.sticky?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#sticky?]]

--- symlink?
FileTest.symlink?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#symlink?]]

#@since 1.8.5

--- world_readable?
FileTest.world_readable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#world_readable?]]

--- world_writable?
FileTest.world_writable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#world_writable?]]

#@end

--- writable?
FileTest.writable?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#writable?]]

--- writable_real?
FileTest.writable_real?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#writable_real?]]

--- zero?
FileTest.zero?(self.to_s) ��Ʊ���Ǥ���

@see [[m:FileTest.#zero?]]

#@until 1.9.2
--- chdir(&block)
Dir.chdir(self.to_s, &block) ��Ʊ���Ǥ���

@see [[m:Dir.chdir]]

#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Dir.chdir]] ��ȤäƤ���������
#@end
--- chroot
Dir.chroot(self.to_s) ��Ʊ���Ǥ���

@see [[m:Dir.chroot]]

#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Dir.chroot]] ��ȤäƤ���������
#@end
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
Dir.foreach(self.to_s) {|f| yield Pathname.new(f) } ��Ʊ���Ǥ���

@see [[m:Dir.foreach]]

#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ���
����� [[m:Pathname#each_entry]] �᥽�åɤ�ȤäƤ���������
#@end
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
self �λؤ������ѥ����ǥ��쥯�ȥ�ʤ�
Dir.foreach(self.to_s, *args, &block) �ȡ�����ʤ����
IO.foreach(self.to_s, *args, &block) ��Ʊ���Ǥ���

#@since 1.8.1
���Υ᥽�åɤ� obsolete �Ǥ��� each_line �� each_entry ��ȤäƤ���������
#@end


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
--- to_path
File.open �ʤɤΰ������Ϥ��ݤ˸ƤФ��᥽�åɤǤ��� Pathname ���֥���
���Ȥˤ����Ƥϡ� to_s ��Ʊ���Ǥ���

#@end

