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

== Class Methods

--- new
#@todo

== Instance Methods

--- each
#@todo

�ե��륿�ΰ�Ԥ��Ĥ�block���Ϥ�.

--- <(src)
#@todo

src��ե��륿�����ϤȤ���. src��, ʸ����ʤ�Хե������, IO�Ǥ���
�Ф���򤽤Τޤ����ϤȤ���.

--- >(to)
#@todo

src��ե��륿�ν��ϤȤ���. to��, ʸ����ʤ�Хե������, IO�Ǥ���
�Ф���򤽤Τޤ޽��ϤȤ���.

--- >>(to)
#@todo

src��ե��륿���ɲä���. to��, ʸ����ʤ�Хե������, IO�Ǥ����
����򤽤Τޤ޽��ϤȤ���.

--- |(filter)
#@todo

�ѥ��׷��

--- +(filter)
#@todo

filter1 + filter2 �� filter1�ν��Ϥθ�, filter2�ν��Ϥ�Ԥ�.

--- to_a
--- to_s
#@todo

--- input
--- input=
#@todo

= class Shell < Object

Shell���֥������Ȥϥ����ȥǥ��쥯�ȥ�����, 
���ޥ�ɼ¹ԤϤ�����������Хѥ��ˤʤ�ޤ�.

== Class Methods

#@#=== ���ޥ�����
#@#OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
#@#��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

--- def_system_command(command, path = command)
#@todo

Shell�Υ᥽�åɤȤ���command����Ͽ���ޤ�.

OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

��)
  Shell.def_system_command "ls"
  ls �����

  Shell.def_system_command "sys_sort", "sort"
  sort���ޥ�ɤ�sys_sort�Ȥ������

--- undef_system_command(command)
#@todo

command�������ޤ�.

--- alias_command(ali, command, *opts) {...}
#@todo

command��alias�򤷤ޤ�.

��)
  Shell.alias_command "lsC", "ls", "-CBF", "--show-control-chars"
  Shell.alias_command("lsC", "ls"){|*opts| ["-CBF", "--show-control-chars", *opts]}

--- unalias_command(ali)
#@todo

command��alias�������ޤ�.

--- install_system_commands(pre = "sys_")
#@todo

system_path��ˤ������Ƥμ¹Բ�ǽ�ե������Shell���������. �᥽��
��̾�ϸ��Υե�����̾��Ƭ��pre��Ĥ�����ΤȤʤ�.

--- new
#@todo

�ץ����Υ����ȥǥ��쥯�ȥ�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell��
�֥������Ȥ��������ޤ�.

--- cd(path)
#@todo

path�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell���֥������Ȥ��������ޤ�.

#@# bc-rdoc: detected missing name: debug=
--- debug
--- debug?
--- debug=(val)
#@todo


#@# bc-rdoc: detected missing name: default_record_separator
--- default_record_separator
--- default_record_separator=(rs)
#@todo



#@# bc-rdoc: detected missing name: default_system_path
--- default_system_path
--- default_system_path=(path)
#@todo


--- verbose   
--- verbose?  
--- verbose=  
#@todo


== Instance Methods
#@#=== �ץ�������

--- cwd
--- dir
--- getwd
--- pwd
#@todo

�����ȥǥ��쥯�ȥ���֤���

--- system_path
--- system_path=(path)
#@todo

���ޥ�ɥ������ѥ���������֤���

--- umask
#@todo

umask���֤���

--- jobs
#@todo

�������塼��󥰤���Ƥ���job�ΰ������֤�.

--- kill(sig, job)
#@todo

job�˥����ʥ�sig������

#@#=== �����ȥǥ��쥯�ȥ����

--- cd(path, &block)
--- chdir
#@todo

�����ȥǥ��쥯�ȥ��path�ˤ���. ���ƥ졼���Ȥ��ƸƤФ줿�Ȥ��ˤ�
�֥�å��¹���Τߥ����ȥǥ��쥯�ȥ���ѹ�����.

--- pushd(path = nil, &block)
--- pushdir
#@todo

�����ȥǥ��쥯�ȥ��ǥ��쥯�ȥꥹ���å��ˤĤ�, �����ȥǥ��쥯
�ȥ��path�ˤ���. path����ά���줿�Ȥ��ˤ�, �����ȥǥ��쥯�ȥ��
�ǥ��쥯�ȥꥹ���å��Υȥåפ�򴹤���. ���ƥ졼���Ȥ��ƸƤФ줿��
���ˤ�, �֥�å��¹���Τ�pushd����.

--- popd
--- popdir
#@todo

�ǥ��쥯�ȥꥹ���å�����ݥåפ�, ����򥫥��ȥǥ��쥯�ȥ�ˤ���.

#@#=== �ե�����/�ǥ��쥯�ȥ����
--- foreach(path = nil, &block)
#@todo

path���ե�����ʤ�, File#foreach
path���ǥ��쥯�ȥ�ʤ�, Dir#foreach

--- open(path, mode)
#@todo

path���ե�����ʤ�, File#open
path���ǥ��쥯�ȥ�ʤ�, Dir#open

--- unlink(path)
#@todo

path���ե�����ʤ�, File#unlink
path���ǥ��쥯�ȥ�ʤ�, Dir#unlink

--- test(command, file1, file2)
--- [](command, file1, file2)
#@todo

�ե�����ƥ��ȴؿ�test��Ʊ��.

��:

    sh[?e, "foo"]
    sh[:e, "foo"]
    sh["e", "foo"]
    sh[:exists?, "foo"]
    sh["exists?", "foo"]

--- mkdir(*path)
#@todo

Dir.mkdir��Ʊ�� (ʣ����)

--- rmdir(*path)
#@todo

Dir.rmdir��Ʊ�� (ʣ����)

--- system(command, *opts)
#@todo

command��¹Ԥ���.

��:

  print sh.system("ls", "-l")
  sh.system("ls", "-l") | sh.head > STDOUT

--- rehash
#@todo

��ϥå��夹��

--- transact { ... }
#@todo

�֥�å���Ǥ� shell �� self �Ȥ��Ƽ¹Ԥ���.

��:

  sh.transact{system("ls", "-l") | head > STDOUT}

--- out(dev = STDOUT, &block)
#@todo

[[m:Shell#transact]] ��ƤӽФ����η�̤� dev �˽��Ϥ���.

#@#=== �������ޥ��

--- echo(*strings)
--- cat(*files)
--- glob(patten)
--- tee(file)
#@todo

�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

#@#=== �ȹ��ߥ��ޥ��

--- atime(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- basename(file, *opt)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chmod(mode, *files)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chown(owner, group, *file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- ctime(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- delete(*file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- dirname(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- ftype(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- join(*file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- link(file_from, file_to)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- lstat(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- mtime(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readlink(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- rename(file_from, file_to)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- split(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- stat(file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- symlink(file_from, file_to)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- truncate(file, length)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- utime(atime, mtime, *file)
#@todo

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- blockdev?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- chardev?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- directory?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- executable?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- executable_real?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- exist?(file)
--- exists?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- file?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- grpowned?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- owned?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- pipe?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readable?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- readable_real?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- setgid?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- setuid?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- size(file)
--- size?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- socket?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- sticky?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- symlink?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- writable?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- writable_real?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- zero?(file)
#@todo

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- syscopy(filename_from, filename_to)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- copy(filename_from, filename_to)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- move(filename_from, filename_to)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- compare(filename_from, filename_to)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- safe_unlink(*filenames)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- makedirs(*filenames)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- install(filename_from, filename_to, mode)
#@todo

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- cmp
#@todo

[[m:Shell#compare]] ��Ʊ���Ǥ���

--- mv
#@todo

[[m:Shell#move]] ��Ʊ���Ǥ���

--- cp
#@todo

[[m:Shell#copy]] ��Ʊ���Ǥ���

--- rm_f
#@todo

[[m:Shell#safe_unlink]] ��Ʊ���Ǥ���

--- mkpath
#@todo

[[m:Shell#makedirs]] ��Ʊ���Ǥ���

#@# bc-rdoc: detected missing name: debug=
--- debug
--- debug?
--- debug=(val)
#@todo

--- verbose   
--- verbose?  
--- verbose=  
#@todo

#@# bc-rdoc: detected missing name: expand_path
--- expand_path(path)
#@todo


