#@# Author: Keiju ISHITSUKA

Ruby ��� sh/csh �Τ褦�˥��ޥ�ɤμ¹Եڤӥե��륿��󥰤��ڤ˹Ԥ�.
sh/csh ������ʸ�� Ruby �ε�ǽ���Ѥ��Ƽ¸�����.

=== ����ץ�

==== Example 1:

  sh = Shell.cd("/tmp")
  sh.mkdir "shell-test-1" unless sh.exists?("shell-test-1")
  sh.cd("shell-test-1")
  for dir in ["dir1", "dir3", "dir5"]
    unless sh.exists?(dir)
      sh.mkdir dir
      sh.cd(dir) do
        f = sh.open("tmpFile", "w")
        f.puts "TEST"
        f.close
      end
      print sh.pwd
    end
  end

==== Example 2:

  sh = Shell.cd("/tmp")
  sh.transact do
    mkdir "shell-test-1" unless exists?("shell-test-1")
    cd("shell-test-1")
    for dir in ["dir1", "dir3", "dir5"]
      if !exists?(dir)
        mkdir dir
        cd(dir) do
          f = open("tmpFile", "w")
          f.print "TEST\n"
          f.close
        end
        print pwd
      end
    end
  end

==== Example 3: Using Pipe

  sh.cat("/etc/printcap") | sh.tee("tee1") > "tee2"
  (sh.cat < "/etc/printcap") | sh.tee("tee11") > "tee12"
  sh.cat("/etc/printcap") | sh.tee("tee1") >> "tee2"
  (sh.cat < "/etc/printcap") | sh.tee("tee11") >> "tee12"

==== Example 4:

  print sh.cat("/etc/passwd").head.collect {|line| /keiju/ =~ line }



= class Shell::Filter < Object

include Enumerable

���ޥ�ɤμ¹Է�̤Ϥ��٤�Filter�Ȥ��Ƥ�����ޤ�. 

== Instance Methods

--- each

�ե��륿�ΰ�Ԥ��Ĥ�block���Ϥ�.

--- <(src)

src��ե��륿�����ϤȤ���. src��, ʸ����ʤ�Хե������, IO�Ǥ���
�Ф���򤽤Τޤ����ϤȤ���.

--- >(to)

src��ե��륿�ν��ϤȤ���. to��, ʸ����ʤ�Хե������, IO�Ǥ���
�Ф���򤽤Τޤ޽��ϤȤ���.

--- >>(to)

src��ե��륿���ɲä���. to��, ʸ����ʤ�Хե������, IO�Ǥ����
����򤽤Τޤ޽��ϤȤ���.

--- |(filter)

�ѥ��׷��

--- +(filter)

filter1 + filter2 �� filter1�ν��Ϥθ�, filter2�ν��Ϥ�Ԥ�.

--- to_a
--- to_s



= class Shell < Object

Shell���֥������Ȥϥ����ȥǥ��쥯�ȥ�����, 
���ޥ�ɼ¹ԤϤ�����������Хѥ��ˤʤ�ޤ�.

== Class Methods

#@#=== ���ޥ�����
#@#OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
#@#��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

--- def_system_command(command, path = command)

Shell�Υ᥽�åɤȤ���command����Ͽ���ޤ�.

OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

��)
Shell.def_system_command "ls"
  ls �����

Shell.def_system_command "sys_sort", "sort"
  sort���ޥ�ɤ�sys_sort�Ȥ������

--- undef_system_command(command)

command�������ޤ�.

--- alias_command(ali, command, *opts) {...}

command��alias�򤷤ޤ�.

��)
  Shell.alias_command "lsC", "ls", "-CBF", "--show-control-chars"
  Shell.alias_command("lsC", "ls"){|*opts| ["-CBF", "--show-control-chars", *opts]}

--- unalias_command(ali)

command��alias�������ޤ�.

--- install_system_commands(pre = "sys_")

system_path��ˤ������Ƥμ¹Բ�ǽ�ե������Shell���������. �᥽��
��̾�ϸ��Υե�����̾��Ƭ��pre��Ĥ�����ΤȤʤ�.

--- new

�ץ����Υ����ȥǥ��쥯�ȥ�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell��
�֥������Ȥ��������ޤ�.

--- cd(path)

path�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell���֥������Ȥ��������ޤ�.

== Instance Methods
#@#=== �ץ�������

--- cwd
--- dir
--- getwd
--- pwd

�����ȥǥ��쥯�ȥ���֤���

--- system_path

���ޥ�ɥ������ѥ���������֤���

--- umask

umask���֤���

--- jobs

�������塼��󥰤���Ƥ���job�ΰ������֤�.

--- kill(sig, job)

job�˥����ʥ�sig������

#@#=== �����ȥǥ��쥯�ȥ����

--- cd(path, &block)
--- chdir

�����ȥǥ��쥯�ȥ��path�ˤ���. ���ƥ졼���Ȥ��ƸƤФ줿�Ȥ��ˤ�
�֥�å��¹���Τߥ����ȥǥ��쥯�ȥ���ѹ�����.

--- pushd(path = nil, &block)
--- pushdir

�����ȥǥ��쥯�ȥ��ǥ��쥯�ȥꥹ���å��ˤĤ�, �����ȥǥ��쥯
�ȥ��path�ˤ���. path����ά���줿�Ȥ��ˤ�, �����ȥǥ��쥯�ȥ��
�ǥ��쥯�ȥꥹ���å��Υȥåפ�򴹤���. ���ƥ졼���Ȥ��ƸƤФ줿��
���ˤ�, �֥�å��¹���Τ�pushd����.

--- popd
--- popdir

�ǥ��쥯�ȥꥹ���å�����ݥåפ�, ����򥫥��ȥǥ��쥯�ȥ�ˤ���.

#@#=== �ե�����/�ǥ��쥯�ȥ����
--- foreach(path = nil, &block)

path���ե�����ʤ�, File#foreach
path���ǥ��쥯�ȥ�ʤ�, Dir#foreach

--- open(path, mode)

path���ե�����ʤ�, File#open
path���ǥ��쥯�ȥ�ʤ�, Dir#open

--- unlink(path)

path���ե�����ʤ�, File#unlink
path���ǥ��쥯�ȥ�ʤ�, Dir#unlink

--- test(command, file1, file2)
--- [](command, file1, file2)

�ե�����ƥ��ȴؿ�test��Ʊ��.

��:

    sh[?e, "foo"]
    sh[:e, "foo"]
    sh["e", "foo"]
    sh[:exists?, "foo"]
    sh["exists?", "foo"]

--- mkdir(*path)

Dir.mkdir��Ʊ�� (ʣ����)

--- rmdir(*path)

Dir.rmdir��Ʊ�� (ʣ����)

--- system(command, *opts)

command��¹Ԥ���.

��:

  print sh.system("ls", "-l")
  sh.system("ls", "-l") | sh.head > STDOUT

--- rehash

��ϥå��夹��

--- transact { ... }

�֥�å���Ǥ� shell �� self �Ȥ��Ƽ¹Ԥ���.

��:

  sh.transact{system("ls", "-l") | head > STDOUT}

--- out(dev = STDOUT, &block)

[[m:Shell#transact]] ��ƤӽФ����η�̤� dev �˽��Ϥ���.

#@#=== �������ޥ��

--- echo(*strings)
--- cat(*files)
--- glob(patten)
--- tee(file)

�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

#@#=== �ȹ��ߥ��ޥ��

--- atime(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- basename(file, *opt)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chmod(mode, *files)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chown(owner, group, *file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- ctime(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- delete(*file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- dirname(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- ftype(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- join(*file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- link(file_from, file_to)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- lstat(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- mtime(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readlink(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- rename(file_from, file_to)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- split(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- stat(file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- symlink(file_from, file_to)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- truncate(file, length)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- utime(atime, mtime, *file)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- blockdev?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chardev?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- directory?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- executable?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- executable_real?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- exist?(file)
--- exists?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- file?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- grpowned?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- owned?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- pipe?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readable?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readable_real?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- setgid?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- setuid?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- size(file)
--- size?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- socket?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- sticky?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- symlink?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- writable?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- writable_real?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- zero?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- syscopy(filename_from, filename_to)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- copy(filename_from, filename_to)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- move(filename_from, filename_to)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- compare(filename_from, filename_to)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- safe_unlink(*filenames)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- makedirs(*filenames)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- install(filename_from, filename_to, mode)

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- cmp

[[m:Shell#compare]] ��Ʊ���Ǥ���

--- mv

[[m:Shell#move]] ��Ʊ���Ǥ���

--- cp

[[m:Shell#copy]] ��Ʊ���Ǥ���

--- rm_f

[[m:Shell#safe_unlink]] ��Ʊ���Ǥ���

--- mkpath

[[m:Shell#makedirs]] ��Ʊ���Ǥ���
