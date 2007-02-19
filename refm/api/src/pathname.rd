#@since 1.8.5
= reopen Kernel

== Private Instance Methods

--- Pathname(path)
#@todo

ʸ���� path �򸵤� Pathname ���֥������Ȥ��������롣

Pathanme.new(string) ��Ʊ����
#@end



= class Pathname < Object

�ѥ�̾���饹

== Constants

#@since 1.8.5
--- SEPARATOR_PAT
#@todo

--- TO_PATH
#@todo

#@end

== Class Methods

--- new(path)
#@todo

ʸ���� path �򸵤� Pathname ���֥������Ȥ��������롣

--- getwd
--- pwd
#@todo

�����ȥǥ��쥯�ȥ�򸵤� Pathname ���֥������Ȥ��������롣
Pathname.new(Dir.getwd) ��Ʊ����

--- glob(pattern)
--- glob(pattern) {|pathname| ...}
--- glob(pattern[, flags])
--- glob(pattern[, flags]) {|pathname| ...}
#@todo

�磻��ɥ����ɤ�Ÿ����Ԥʤä���̤�
Pathname ���֥������Ȥ�����Ȥ����֤���

�����ΰ�̣�ϡ�[[m:Dir.glob]] ��Ʊ����

�֥�å���Ϳ����줿�Ȥ��ϡ�
�磻��ɥ����ɤ˥ޥå����� Pathname ���֥������Ȥ�����Ȥ���
���Υ֥�å��� 1 �Ĥ���ɾ���� nil ���֤���

== Instance Methods

--- ==(other)
--- ===(other)
--- eql?(other)
#@todo

�ѥ�̾����ӡ�other ��Ʊ���ʤ鿿���֤�����ʸ����ʸ���϶��̤���롣
other �� Pathname ���֥������ȤǤʤ���Фʤ�ʤ���

�ѥ�̾����Ӥ�ñ��˥ѥ�ʸ�������Ӥˤ�äƹԤ���Τ�����Ū��
Ʊ���ѥ��Ǥ�ۤʤ��Ƚ�Ǥ���롣

    require 'pathname'

    p Pathname.new("foo/bar") == Pathname.new("foo/bar")
    p Pathname.new("foo/bar") == Pathname.new("foo//bar")
    p Pathname.new("foo/../foo/bar") == Pathname.new("foo/bar")

    # => true
         false
         false

--- <=>(other)
#@todo

�ѥ�̾����ӡ�other ��Ʊ���ʤ� 0 ��ASCII��� self ���礭������
����other ���礭����������֤�����ʸ����ʸ���϶��̤���롣

other �� Pathname ���֥������ȤǤʤ���Фʤ�ʤ���

�ѥ�̾����Ӥ�ñ��˥ѥ�ʸ�������Ӥˤ�äƹԤ���Τ�����Ū��
Ʊ���ѥ��Ǥ�ۤʤ��Ƚ�Ǥ���롣

    require 'pathname'

    p Pathname.new("foo/bar") <=> Pathname.new("foo/bar")
    p Pathname.new("foo/bar") <=> Pathname.new("foo//bar")
    p Pathname.new("foo/../foo/bar") <=> Pathname.new("foo/bar")
    => 0
       1
       -1

--- hash
#@todo

�ϥå����ͤ��֤���

--- to_s
--- to_str
#@todo

�ѥ�̾��ʸ������֤���

to_str �ϡ�[[m:File.open]] �ʤɤΰ����ˤ��Τޤ� Pathname ���֥������Ȥ�
�Ϥ���褦���Ѱդ��Ƥ��롣

    require 'pathname'

    path = Pathname.new("/tmp/hogehoge")
    File.open(path)

--- cleanpath(consider_symlink = false)
#@todo

;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤���

    require "pathname"
    path = Pathname.new("//.././../")
    p path                  # => #<Pathname://.././../>
    p path.cleanpath        # => #<Pathname:/>

consider_symlink �����ʤ�ѥ����Ǥ˥���ܥ�å���󥯤����ä����
�ˤ�����ʤ��褦�� .. ��Ĥ���

cleanpath �ϡ��ºݤ˥ե����륷���ƥ�򻲾Ȥ��뤳�Ȥʤ���ʸ�������
�����ǽ�����Ԥ���

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

--- realpath(force_absolute = true)
#@todo

;�פ� "."��".." �� "/" ��������������� Pathname ���֥������Ȥ��֤���

�ե����륷���ƥ�򥢥����������ºݤ�¸�ߤ���ѥ����֤���
����ܥ�å���󥯤��褵��롣

force_absolute �����ξ�硢���Хѥ����֤���self �����Хѥ��Ǥ���С�
�����ȥǥ��쥯�ȥ꤫������Хѥ��Ȥ��Ʋ�ᤵ��롣

self ���ؤ��ѥ���¸�ߤ��ʤ������㳰
[[c:Errno::ENOENT]] ��ȯ�����롣

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
    p path.realpath(false)

    => ruby 1.8.0 (2003-10-10) [i586-linux]
       #<Pathname:/tmp/bar>
       #<Pathname:bar>

--- parent
#@todo

self �οƥǥ��쥯�ȥ��ؤ������� Pathname ���֥������Ȥ��֤���

--- mountpoint?
#@todo

self ���ޥ���ȥݥ���ȤǤ���п����֤���

--- root?
#@todo

self ���롼�ȥǥ��쥯�ȥ�Ǥ���п����֤���Ƚ�Ǥ�ʸ�������ˤ��
�ƹԤ�졢�ե����륷���ƥ�ϥ�����������ʤ���

--- absolute?
#@todo

self �����Хѥ�����Ǥ���п����֤���

--- relative?
#@todo

self �����Хѥ�����Ǥ���п����֤���

--- each_filename {|v| ... ]
#@todo

self �Υѥ�̾������˥֥�å���¹Ԥ��롣

    require 'pathname'

    Pathname.new("/foo/../bar").each_filename {|v| p v}

    # => "foo"
         ".."
         "bar"

--- +(other)
#@todo

�ѥ�̾��Ϣ�뤹�롣�Ĥޤꡢother �� self ��������Хѥ��Ȥ���������
Pathname ���֥������Ȥ����������֤���

other �����Хѥ��ʤ�ñ�� other �� Pathname ���֥������ȤȤ����֤���

other ��ʸ���� Pathname ���֥������ȡ�

#@since 1.8.1

--- children
#@todo

self �۲��ˤ���ѥ�̾(Pathname���֥�������)��������֤���

    require 'pathname'

    p Pathname.new("/tmp").children
    => ruby 1.8.0 (2003-10-10) [i586-linux]
       [#<Pathname:.X11-unix>, #<Pathname:.iroha_unix>, ... ]

".", ".." �����Ǥ˴ޤޤ�ʤ���

self ��¸�ߤ��ʤ��ѥ��Ǥ��ä���ǥ��쥯�ȥ�Ǥʤ�����㳰
[[c:Errno::EXXX]] ��ȯ�����롣

#@end

#@since 1.8.1

--- relative_path_from(base_directory)
#@todo

base_direcoty ���� self �ؤ����Хѥ����� Pathname ���֥������Ȥ�
���������֤���

�ѥ�̾�β���ʸ�������ˤ�äƹԤ�졢�ե����륷���ƥ�򥢥�����
���ʤ���

    require 'pathname'

    path = Pathname.new("/tmp/foo")
    base = Pathname.new("/tmp")

    p path.relative_path_from(base)

    # => ruby 1.8.0 (2003-10-10) [i586-linux]
         #<Pathname:foo>

self �����Хѥ��ʤ� base_directory �����Хѥ���self �����Хѥ��ʤ�
base_directory �����Хѥ��Ǥʤ���Фʤ�ʤ���

base_directory �� Pathname ���֥������ȤǤʤ���Фʤ�ʤ���

#@end

#@since 1.8.1

--- each_line(*args, &block)
#@todo

Equivalent to:
IO.foreach(self.to_s, *args, &block)

#@end

--- read(*args)
#@todo

Equivalent to:
IO.read(self.to_s, *args)

--- readlines(*args)
#@todo

Equivalent to:
IO.readlines(self.to_s, *args)

--- sysopen(*args)
#@todo

Equivalent to:
IO.sysopen(self.to_s, *args)

--- atime
#@todo

Equivalent to:
File.atime(self.to_s)

--- ctime
#@todo

Equivalent to:
File.ctime(self.to_s)

--- mtime
#@todo

Equivalent to:
File.mtime(self.to_s)

--- chmod(mode)
#@todo

Equivalent to:
File.chmod(mode, self.to_s)

--- lchmod(mode)
#@todo

Equivalent to:
File.chmod(mode, self.to_s)

--- chown(owner, group)
#@todo

Equivalent to:
File.chown(owner, group, self.to_s)

--- lchown(owner, group)
#@todo

Equivalent to:
File.lchown(owner, group, self.to_s)

--- fnmatch(pattern, *args)
#@todo

Equivalent to:
File.fnmatch(pattern, self.to_s, *args)

--- fnmatch?(pattern, *args)
#@todo

Equivalent to:
File.fnmatch?(pattern, self.to_s, *args)

--- ftype
#@todo

Equivalent to:
File.ftype(self.to_s)

--- link(old)
#@todo

Equivalent to:
File.link(old, self.to_s)

--- open(*args, &block)
#@todo

Equivalent to:
File.open(self.to_s, *args, &block)

--- readlink
#@todo

Equivalent to:
Pathname.new(File.readlink(self.to_s))

--- rename(to)
#@todo

Equivalent to:
File.rename(self.to_s, to)

--- stat
#@todo

Equivalent to:
File.stat(self.to_s)

--- lstat
#@todo

Equivalent to:
File.lstat(self.to_s)

--- symlink(old)
#@todo

Equivalent to:
File.symlink(old, self.to_s)

--- truncate(length)
#@todo

Equivalent to:
File.truncate(self.to_s, length)

--- utime(atime, mtime)
#@todo

Equivalent to:
File.utime(atime, mtime, self.to_s)

--- basename(*args)
#@todo

Equivalent to:
Pathname.new(File.basename(self.to_s, *args))

--- dirname
#@todo

Equivalent to:
Pathname.new(File.dirname(self.to_s))

--- extname
#@todo

Equivalent to:
File.extname(self.to_s)

--- expand_path(*args)
#@todo

Equivalent to:
Pathname.new(File.expand_path(self.to_s, *args))

--- join(*args)
#@todo

Equivalent to:
Pathname.new(File.join(self.to_s, *args))

--- split
#@todo

Equivalent to:
File.split(self.to_s)

--- blockdev?
#@todo

Equivalent to:
FileTest.blockdev?(self.to_s)

--- chardev?
#@todo

Equivalent to:
FileTest.chardev?(self.to_s)

--- executable?
#@todo

Equivalent to:
FileTest.executable?(self.to_s)

--- executable_real?
#@todo

Equivalent to:
FileTest.executable_real?(self.to_s)

--- exist?
#@todo

Equivalent to:
FileTest.exist?(self.to_s)

--- grpowned?
#@todo

Equivalent to:
FileTest.grpowned?(self.to_s)

--- directory?
#@todo

Equivalent to:
FileTest.directory?(self.to_s)

--- file?
#@todo

Equivalent to:
FileTest.file?(self.to_s)

--- pipe?
#@todo

Equivalent to:
FileTest.pipe?(self.to_s)

--- socket?
#@todo

Equivalent to:
FileTest.socket?(self.to_s)

--- owned?
#@todo

Equivalent to:
FileTest.owned?(self.to_s)

--- readable?
#@todo

Equivalent to:
FileTest.readable?(self.to_s)

--- readable_real?
#@todo

Equivalent to:
FileTest.readable_real?(self.to_s)

--- setuid?
#@todo

Equivalent to:
FileTest.setuid?(self.to_s)

--- setgid?
#@todo

Equivalent to:
FileTest.setgid?(self.to_s)

--- size
#@todo

Equivalent to:
FileTest.size(self.to_s)

--- size?
#@todo

Equivalent to:
FileTest.size?(self.to_s)

--- sticky?
#@todo

Equivalent to:
FileTest.sticky?(self.to_s)

--- symlink?
#@todo

Equivalent to:
FileTest.symlink?(self.to_s)

--- writable?
#@todo

Equivalent to:
FileTest.writable?(self.to_s)

--- writable_real?
#@todo

Equivalent to:
FileTest.writable_real?(self.to_s)

--- zero?
#@todo

Equivalent to:
FileTest.zero?(self.to_s)

--- rmdir
#@todo

Equivalent to:
Dir.rmdir(self.to_s)

--- entries
#@todo

Equivalent to:
Dir.entries(self.to_s)

#@since 1.8.1

--- each_entry {|pathname| ... }
#@todo

Equivalent to:
Dir.foreach(self.to_s) {|f| yield Pathname.new(f) }

#@end

--- mkdir(*args)
#@todo

Equivalent to:
Dir.mkdir(self.to_s, *args)

--- opendir(&block)
#@todo

Equivalent to:
Dir.open(self.to_s, &block)

--- find {|pathname| ...}
#@todo

self �۲��Τ��٤ƤΥե������ǥ��쥯�ȥ��
��Ĥ��İ��� pathname ���Ϥ��ƥ֥�å���¹Ԥ��롣

  require 'find'
  Find.find(self.to_s) {|f| yield Pathname.new(f)}

��Ʊ����

--- mkpath
#@todo

Equivalent to:
FileUtils.mkpath(self.to_s)

--- rmtree
#@todo

Equivalent to:
FileUtils.rm_r(self.to_s)

--- unlink
--- delete
#@todo

self ���ؤ��ǥ��쥯�ȥꤢ�뤤�ϥե�����������롣

#@since 1.8.5

--- ascend
#@todo

#@end

--- chdir
#@todo

--- chroot
#@todo

#@if(version <= "1.8.1")

--- cleanpath_aggressive
#@todo

--- cleanpath_conservative
#@todo

#@end

#@since 1.8.5
--- descend
#@todo

#@end

--- dir_foreach
#@todo

--- foreach
#@todo

--- foreachline
#@todo

#@since 1.8.2
--- freeze
#@todo

#@end

--- inspect
#@todo

#@since 1.8.1
--- make_link
#@todo


--- make_symlink
#@todo

#@end

#@if(version <= "1.8.0")
--- realpath_rec
#@todo

--- realpath_root?
#@todo

#@end


#@since 1.8.5
--- sub
#@todo

#@end

#@since 1.8.2
--- taint
#@todo

--- untaint
#@todo

#@end

#@since 1.9.0
--- to_path
#@todo

#@end

#@since 1.8.5

--- world_readable?
#@todo

--- world_writable?
#@todo

#@end
