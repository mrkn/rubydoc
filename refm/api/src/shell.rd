Ruby ��� sh/csh �Τ褦�˥��ޥ�ɤμ¹Եڤӥե��륿��󥰤��ڤ˹Ԥ�����Υ饤�֥��Ǥ���
#@# Author: Keiju ISHITSUKA

sh/csh ������ʸ�� Ruby �ε�ǽ���Ѥ��Ƽ¸����ޤ���

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

���ޥ�ɤμ¹Է�̤Ϥ��٤�Shell::Filter�Ȥ��Ƥ�����ޤ�. 

== Class Methods

--- new -> Shell::Filter

��ɮ���罸��
Shell::Filter ���饹 �Υ��󥹥��󥹤��֤��ޤ���
�̾盧��new��ľ�ܻȤ�����Ϥ����ʤ��Ǥ��礦��

== Instance Methods

--- each(rs = nil) -> ()

�ե��륿�ΰ�Ԥ��Ĥ�block���Ϥ��ޤ���

@param rs �쥳���ɥ��ѥ졼������ɽ��ʸ�������ꤷ�ޤ���
          nil �ʤ�С�[[m:Shell.record_separator]]���ͤ����Ѥ���ޤ���

������
  sh = Shell.new
  sh.cat("/etc/passwd").each { |line|
    puts line
  }

--- <(src) -> self

src��ե��륿�����ϤȤ���. src��, ʸ����ʤ�Хե������, IO���֥������ȤǤ���
�Ф���򤽤Τޤ����ϤȤ���.

@param src �ե��륿�����Ϥ�, ʸ����⤷����,IO ���֥������Ȥǻ��ꤷ�ޤ�.

������
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    (sh.head("-n 30") < "/etc/passwd") > "ugo.txt"
  }

--- >(to) -> self

to��ե��륿�ν��ϤȤ���. to��, ʸ����ʤ�Хե������, IO���֥������ȤǤ���
�Ф���򤽤Τޤ޽��ϤȤ���.

@param to ���������ꤷ�ޤ�.ʸ����ʤ�Хե������,IO���֥������Ȥʤ�Ф���˽��Ϥ��ޤ�.

������
  Shell.def_system_command("tail")
  sh = Shell.new
  sh.transact {
    (sh.tail("-n 3") < "/etc/passwd") > File.open("tail.out", "w")
    #(sh.tail("-n 3") < "/etc/passwd") > "tail.out" # ��Ʊ��.
  }

--- >>(to) -> self

to��ե��륿���ɲä���. to��, ʸ����ʤ�Хե������, IO���֥������ȤǤ����
����򤽤Τޤ޽��ϤȤ���.

@param to ���������ꤷ�ޤ���ʸ����ʤ�Хե�����ˡ�IO���֥������Ȥʤ�Ф���˽��Ϥ��ޤ���

������
  Shell.def_system_command("tail")
  sh = Shell.new
  sh.transact {
    (sh.tail("-n 3") < "/etc/passwd") >> "tail.out" 
    #(sh.tail("-n 3") < "/etc/passwd") >> File.open("tail.out", "w") # �Ǥ�Ʊ��.
  }

--- |(filter) -> object

�ѥ��׷��� filter ���Ф��ƹԤ��ޤ���

@param filter Shell::Filter ���֥������Ȥ���ꤷ�ޤ�.

@return filter ���֤��ޤ�.

������
  Shell.def_system_command("tail")
  Shell.def_system_command("head")
  Shell.def_system_command("wc")
  sh = Shell.new
  sh.transact {
    i = 1
    while i <= (cat("/etc/passwd") | wc("-l")).to_s.chomp.to_i
      puts (cat("/etc/passwd") | head("-n #{i}") | tail("-n 1")).to_s
      i += 1
    end
  }

--- +(filter)
��ɮ���罸

filter1 + filter2 �� filter1�ν��Ϥθ�, filter2�ν��Ϥ�Ԥ�.

--- to_a -> Array
--- to_s -> String

�¹Է�̤�ʸ���󡢤��줾��ʸ�����������֤��ޤ���

������
  Shell.def_system_command("wc")
  sh = Shell.new
  puts sh.cat("/etc/passwd").to_a

  sh.transact {
    puts (cat("/etc/passwd") | wc("-l")).to_s
  }

--- input
--- input=
��ɮ���罸

�ե��륿�������ꤷ�ޤ���

= class Shell < Object

Shell���֥������Ȥϥ����ȥǥ��쥯�ȥ�����, 
���ޥ�ɼ¹ԤϤ�����������Хѥ��ˤʤ�ޤ�.

== Class Methods

#@#=== ���ޥ�����
#@#OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
#@#��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

--- def_system_command(command, path = command) -> nil

Shell�Υ᥽�åɤȤ���command����Ͽ���ޤ�.

OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ���Shell#system���ޥ�ɤ⤢��ޤ�.

@param command Shell �Υ᥽�åɤȤ���������륳�ޥ�ɤ�ʸ����ǻ��ꤷ�ޤ���

@param path command �Υѥ�����ꤷ�ޤ���
            ���ꤷ�ʤ�����command ��Ʊ���ˤʤ�ޤ���

��)
  Shell.def_system_command "ls"
  # ls �����

  Shell.def_system_command "sys_sort", "sort"
  # sort���ޥ�ɤ�sys_sort�Ȥ������

  sh = Shell.new
  sh.transact {
    ls.each { |l|
      puts l
    }
    (ls("-l") | sys_sort("-k 5")).each {|l|
      puts l
    }
  }


--- undef_system_command(command) -> Shell::CommandProcessor

command�������ޤ�.

@param command ������륳�ޥ�ɤ�ʸ�������ꤷ�ޤ���

ư���㡧
  Shell.def_system_command("ls")
  # ls �����
  Shell.undef_system_command("ls")
  # ls �� ���

  sh = Shell.new
  begin
    sh.transact {
      ls("-l").each {|l|
        puts l
      }
    }
  rescue NameError => err
    puts err
  end

--- alias_command(alias, command, *opts) {...} -> self

���ޥ�ɤ���̾(�����ꥢ��)��������ޤ���
���ޥ�ɤ�̵�����ϡ�[[m:Shell.def_system_command]] �ʤɤǤ��餫����������ޤ�.

@param alias �����ꥢ����̾����ʸ����ǻ��ꤷ�ޤ�.

@param command ���ޥ��̾��ʸ����ǻ��ꤷ�ޤ�.

@param *opts command �ǻ��ꤷ�����ޥ�ɤΥ��ץ�������ꤷ�ޤ�.

������: ls -la | sort -k 5 �Τ褦���㡣

  Shell.def_system_command("ls")
  Shell.alias_command("lsla", "ls", "-a", "-l")
  Shell.def_system_command("sort")
  sh = Shell.new
  sh.transact {
    (lsla | sort("-k 5")).each {|l|
      puts l
    }
  }

--- unalias_command(alias) -> ()

command��alias�������ޤ�.

@param alias ��������������ꥢ����̾����ʸ����ǻ��ꤷ�ޤ���

@raise NameError alias �ǻ��ꤷ�����ޥ�ɤ�̵������ȯ�����ޤ���

������: ls -la | sort -k 5 �Τ褦���㡣
  Shell.def_system_command("ls")
  Shell.alias_command("lsla", "ls", "-a", "-l")
  Shell.def_system_command("sort")
  sh = Shell.new
  sh.transact {
    (lsla | sort("-k 5")).each {|l|
      puts l
    }
  }
  Shell.unalias_command("lsla")
  begin
    Shell.unalias_command("lsla")
  rescue NameError => err
    puts err
  end

--- install_system_commands(pre = "sys_") -> ()

system_path��ˤ������Ƥμ¹Բ�ǽ�ե������Shell���������. �᥽��
��̾�ϸ��Υե�����̾��Ƭ��pre��Ĥ�����ΤȤʤ�.

@param pre Shell���������᥽�å�̾����Ƭ���ղä����ʸ�������ꤷ�ޤ���

������: ls -l | head -n 5 �Τ褦���㡣

  Shell.install_system_commands
  sh = Shell.new
  sh.verbose = false
  sh.transact {
    (sys_ls("-l") | sys_head("-n 5")).each {|l|
      puts l
    } 
  }

#@since 1.9.0
--- new(pwd = Dir.pwd, umask = nil) -> Shell

�ץ����Υ����ȥǥ��쥯�ȥ��pwd �ǻ��ꤵ�줿�ǥ��쥯�ȥ�Ȥ���Shell��
�֥������Ȥ��������ޤ�.

@param pwd �ץ����Υ����ȥǥ��쥯�ȥ��pwd �ǻ��ꤵ�줿�ǥ��쥯�ȥ�Ȥ��ޤ���
           ���ꤷ�ʤ����ϡ�[[m:Dir.pwd]] �����Ѥ���ޤ���

@param umask �ե���������κݤ��Ѥ����� umask ����Ѥ��ޤ���


#@else
--- new -> Shell

�ץ����Υ����ȥǥ��쥯�ȥ�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell��
�֥������Ȥ��������ޤ�.

�����㡧�����ȥǥ��쥯�ȥ��ɽ��

  sh = Shell.new
  puts sh.pwd.to_s

#@end

#@since 1.9.0

--- cd(path = nil, verbose = self.verbose) -> self

path�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell���֥������Ȥ��������ޤ�.

@param path �����ȥǥ��쥯�ȥ�Ȥ���ǥ��쥯�ȥ��ʸ����ǻ��ꤷ�ޤ���

@param verbose true ����ꤹ��Ⱦ�Ĺ�ʽ��Ϥ�Ԥ��ޤ���

#@else
--- cd(path = nil) -> self

path�򥫥��ȥǥ��쥯�ȥ�Ȥ���Shell���֥������Ȥ��������ޤ�.

@param path �����ȥǥ��쥯�ȥ�Ȥ���ǥ��쥯�ȥ��ʸ����ǻ��ꤷ�ޤ���

#@end

������
  require 'shell'
  sh = Shell.new
  sh.cd("/tmp")


--- debug -> bool | Integer
--- debug? -> bool | Integer
--- debug=(val) 

�ǥХå��ѤΥե饰�����ꤪ��ӡ����Ȥ�Ԥ��ޤ���

@param val bool �ͤ������ͤ���ꤷ�ޤ����ܺ٤ϲ����򻲾Ȥ��Ƥ���������

  # debug: true -> normal debug
  # debug: 1    -> eval definition debug
  # debug: 2    -> detail inspect debug

--- default_record_separator -> String
--- default_record_separator=(rs)

��ɮ���罸

Shell ���Ѥ��������ϥ쥳���ɥ��ѥ졼����ɽ��ʸ��������ꤪ��ӻ��Ȥ��ޤ���
�ʤˤ���ꤷ�ʤ�����[[m:$/]] ���ͤ��Ѥ����ޤ���

@param rs Shell ���Ѥ��������ϥ쥳���ɥ��ѥ졼����ɽ��ʸ�������ꤷ�ޤ���


--- default_system_path -> Array
--- default_system_path=(path)

Shell�Ǥ�������륳�ޥ�ɤ򸡺������оݤΥѥ������ꤪ��ӡ����Ȥ��ޤ���

@param path Shell�Ǥ�������륳�ޥ�ɤ򸡺������оݤΥѥ���ʸ����ǻ��ꤷ�ޤ���

ư����
  require 'shell'
  p Shell.default_system_path 
  # ��
  #=> [ "/opt/local/bin", "/opt/local/sbin", "/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/X11/bin", "/Users/kouya/bin"]
  Shell.default_system_path = ENV["HOME"] + "/bin"
  p Shell.default_system_path
  # => "/Users/kouya/bin"

--- verbose -> bool  
--- verbose? -> bool
--- verbose=(flag)

true �ʤ�о�Ĺ�ʽ��Ϥ������Ԥ��ޤ���

@param flag true �ʤ�о�Ĺ�ʽ��Ϥ������Ԥ��ޤ���

== Instance Methods
#@#=== �ץ�������

--- cwd -> String
--- dir -> String
--- getwd -> String
--- pwd -> String

�����ȥǥ��쥯�ȥ�Υѥ���ʸ������֤��ޤ���

������
  require 'shell'
  sh = Shell.new
  p sh.cwd 
  # ��
  #=> "/Users/kouya/tall"


--- system_path -> Array 
--- system_path=(path)
���ޥ�ɥ������ѥ���������֤���

@param path ���ޥ�ɥ������ѥ����������ꤷ�ޤ���

������

  require 'shell'
  sh = Shell.new
  sh.system_path = [ "./" ]
  p sh.system_path #=> ["./"]

--- umask -> object

umask���֤��ޤ���

--- jobs -> Array

��ɮ���罸. �������塼��󥰤���Ƥ���job�ΰ������֤�.

--- kill(sig, job)
#@todo

��ɮ���罸. job�˥����ʥ�sig������.

#@#=== �����ȥǥ��쥯�ȥ����

--- cd(path, &block) -> self
--- chdir(path, &block) -> self

�����ȥǥ��쥯�ȥ��path�ˤ���. ���ƥ졼���Ȥ��ƸƤФ줿�Ȥ��ˤ�
�֥�å��¹���Τߥ����ȥǥ��쥯�ȥ���ѹ�����.

@param path �����ȥǥ��쥯�ȥ��ʸ����ǻ��ꤷ�ޤ�.  

@param block path �ǻ��ꤷ���ǥ��쥯�ȥ�ǹԤ�����֥�å��ǻ��ꤷ�ޤ�.

������
  require 'shell'
  sh = Shell.new
  sh.transact {
    cd("/tmp"){
      p cwd #=> "/tmp"
    }
    p cwd #=> "/Users/kouya/rbmanual"
  }

--- pushd(path = nil, &block) -> object
--- pushdir(path = nil, &block) -> object

�����ȥǥ��쥯�ȥ��ǥ��쥯�ȥꥹ���å��ˤĤ�, �����ȥǥ��쥯
�ȥ��path�ˤ���. path����ά���줿�Ȥ��ˤ�, �����ȥǥ��쥯�ȥ��
�ǥ��쥯�ȥꥹ���å��Υȥåפ�򴹤���. ���ƥ졼���Ȥ��ƸƤФ줿��
���ˤ�, �֥�å��¹���Τ�pushd����.

@param path  �����ȥǥ��쥯�ȥ��path�ˤ��롣ʸ����ǻ��ꤷ�ޤ���

@param block ���ƥ졼���Ȥ��ƸƤ־��, �֥�å�����ꤷ�ޤ���
 
ư����
  require 'shell'
  Shell.verbose = false
  sh = Shell.new
  sh.pushd("/tmp")
  p sh.cwd #=> "/tmp"
  sh.pushd("/usr")
  p sh.cwd #=> "/usr"
  sh.popd
  p sh.cwd #=> "/tmp"
  sh.pushd("/usr/local"){
    p sh.cwd #=> "/usr/local"
  }
  p sh.cwd #=> "/tmp"

--- popd -> ()
--- popdir -> ()

�ǥ��쥯�ȥꥹ���å�����ݥåפ�, ����򥫥��ȥǥ��쥯�ȥ�ˤ���.

ư����
  require 'shell'
  Shell.verbose = false
  sh = Shell.new
  sh.pushd("/tmp")
  p sh.cwd #=> "/tmp"
  sh.pushd("/usr")
  p sh.cwd #=> "/usr"
  sh.popd
  p sh.cwd #=> "/tmp"

#@#=== �ե�����/�ǥ��쥯�ȥ����
--- foreach(path = nil, &block) -> ()

path���ե�����ʤ�, File#foreach
path���ǥ��쥯�ȥ�ʤ�, Dir#foreach
��ư��򤷤ޤ���

@param path �ե�����⤷���ϥǥ��쥯�ȥ�Υѥ���ʸ����ǻ��ꤷ�ޤ���

������
  require 'shell'
  Shell.verbose = false
  sh = Shell.new
  sh.foreach("/tmp"){|f|
    puts f
  }

--- open(path, mode) -> object

path���ե�����ʤ�, File#open
path���ǥ��쥯�ȥ�ʤ�, Dir#open
��ư��򤷤ޤ���

@param path ���路���ϡ�[[m:File.open]], [[m:Dir.open]]�򻲾Ȥ��Ƥ���������

@param mode ���路���ϡ�[[m:File.open]], [[m:Dir.open]]�򻲾Ȥ��Ƥ���������

--- unlink(path) -> self

path���ե�����ʤ�, File#unlink
path���ǥ��쥯�ȥ�ʤ�, Dir#unlink
��ư��򤷤ޤ���

@param path ���路���ϡ�[[m:File.unlink]], [[m:Dir.unlink]]�򻲾Ȥ��Ƥ���������

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


