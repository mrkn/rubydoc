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

--- test(command, file1, file2 = nil) -> bool
--- [](command, file1, file2 = nil) -> bool

��ɮ���罸�� �ե�����ƥ��ȴؿ�test��Ʊ���Ǥ���

@param command �ե�����ƥ��ȴؿ�test��Ʊ���Ǥ���

@param file1 ʸ����ǥե�����ؤΥѥ�����ꤷ�ޤ���
             �ե�����ƥ��ȴؿ�test���Ϥ�����������Ȥʤ�ޤ���

@param file2 ʸ����ǥե�����ؤΥѥ�����ꤷ�ޤ���
             �ե�����ƥ��ȴؿ�test���Ϥ������������Ȥʤ�ޤ�����ά�ġ�


��:

  require 'shell'
  Shell.verbose = false
  sh = Shell.new
  begin
    sh.mkdir("foo")
  rescue
  end
  p sh[?e, "foo"]         #=> true
  p sh[:e, "foo"]         #=> true
  p sh["e", "foo"]        #=> true
  p sh[:exists?, "foo"]   #=> true
  p sh["exists?", "foo"]  #=> true

--- mkdir(*path) -> Array

Dir.mkdir��Ʊ���Ǥ��� (ʣ����)

@param *path ��������ǥ��쥯�ȥ�̾��ʸ����ǻ��ꤷ�ޤ���

@return ��������ǥ��쥯�ȥ�ΰ�����������֤��ޤ���

������
  require 'shell'
  Shell.verbose = false
  sh = Shell.new
  begin
    p sh.mkdir("foo") #=> ["foo"]
  rescue => err
    puts err
  end


--- rmdir(*path) -> ()

Dir.rmdir��Ʊ���Ǥ��� (ʣ����)

@param *path �������ǥ��쥯�ȥ�̾��ʸ����ǻ��ꤷ�ޤ���

--- system(command, *opts) -> Shell::Filter

command��¹Ԥ���.

@param command �¹Ԥ��륳�ޥ�ɤΥѥ���ʸ����ǻ��ꤷ�ޤ���

@param *opt command �Υ��ץ�����ʸ����ǻ��ꤷ�ޤ���ʣ���ġ�

������:

  require 'shell'
  Shell.verbose = false
  sh = Shell.new

  print sh.system("ls", "-l")
  Shell.def_system_command("head")
  sh.system("ls", "-l") | sh.head("-n 3") > STDOUT

--- rehash -> Hash
��ɮ���罸��
��ϥå��夹�롣�̾�Ȥ����Ϥ���ޤ���

--- transact { ... } -> object

�֥�å���� shell �� self �Ȥ��Ƽ¹Ԥ��ޤ���

��:

  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact{
    system("ls", "-l") | head > STDOUT
    # transact ����Ǥϡ�
    # sh.system("ls", "-l") | sh.head > STDOUT ��Ʊ���Ȥʤ롣
  }

--- out(dev = STDOUT, &block) -> ()

[[m:Shell#transact]] ��ƤӽФ����η�̤� dev �˽��Ϥ��ޤ���

@param dev  �������IO ���֥������Ȥʤɤǻ��ꤷ�ޤ���

@param block transact �����Ǽ¹Ԥ��륷�������ꤷ�ޤ���


������:
  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  File.open("out.txt", "w"){ |fp|
    sh.out(fp) {
      system("ls", "-l") | head("-n 3")
    }
  }


#@#=== �������ޥ��

--- echo(*strings) -> Shell::Filter
�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

@param *strings �����륳�ޥ�� echo ��Ϳ���������ʸ����ǻ��ꤷ�ޤ���

ư����
  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    glob("*.txt").to_a.each { |file|
      file.chomp!
      cat(file).each { |l|
        echo(l) | tee(file + ".tee") >> "all.tee"
      }
    }
  }


--- cat(*files) -> Shell::Filter
�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

@param *files �����륳�ޥ�� cat ��Ϳ����ե�����̾��ʸ����ǻ��ꤷ�ޤ���

ư����
  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    glob("*.txt").to_a.each { |file|
      file.chomp!
      cat(file).each { |l|
        echo(l) | tee(file + ".tee") >> "all.tee"
      }
    }
  }


--- glob(patten) -> Shell::Filter
�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

@param patten �����륳�ޥ�� glob ��Ϳ����ѥ��������ꤷ�ޤ���
              �ѥ�����ν񼰤ˤĤ��Ƥϡ�[[m:Dir.[]]]�򻲾Ȥ��Ƥ���������

ư����
  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    glob("*.txt").to_a.each { |file|
      file.chomp!
      cat(file).each { |l|
        echo(l) | tee(file + ".tee") >> "all.tee"
      }
    }
  }

@see [[m:Dir.[]]]


--- tee(file) -> Shell::Filter

�¹Ԥ����, ���������ƤȤ��� Filter ���֥������Ȥ��֤��ޤ�.

@param file �����륳�ޥ��tee ��Ϳ����ե�����̾��ʸ����ǻ��ꤷ�ޤ���

ư����
  require 'shell'
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    glob("*.txt").to_a.each { |file|
      file.chomp!
      cat(file).each { |l|
        echo(l) | tee(file + ".tee") >> "all.tee"
      }
    }
  }

#@#=== �ȹ��ߥ��ޥ��

--- atime(filename) -> Time
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:File.atime]]

--- basename(filename, suffix = "")     -> String
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@param suffix ���ե��å�����ʸ�����Ϳ���ޤ���'.*' �Ȥ���ʸ�����Ϳ������硢'*' �ϥ磻��ɥ����ɤȤ���Ư
��
              '.' ��ޤޤʤ�Ǥ�դ�ʸ����˥ޥå����ޤ���

@see [[m:File.basename]]


--- chmod(mode, *filename)    -> Integer

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@param mode [[man:chmod(2)]] ��Ʊ�ͤ������ǻ��ꤷ�ޤ���

@see [[m:File.chmod]]

--- chown(owner, group, *filename)    -> Integer
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param owner [[man:chown(2)]] ��Ʊ�ͤ˿��ͤǻ��ꤷ�ޤ���nil �ޤ��� -1 ����ꤹ�뤳�Ȥǡ������ʡ��򸽺ߤ�>�ޤޤˤ��뤳�Ȥ��Ǥ��ޤ���

@param group [[man:chown(2)]] ��Ʊ�ͤ˿��ͤǻ��ꤷ�ޤ���nil �ޤ��� -1 ����ꤹ�뤳�Ȥǡ����롼�פ򸽺ߤ�>�ޤޤˤ��뤳�Ȥ��Ǥ��ޤ���

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.chown]]

--- ctime(filename)    -> Time
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:File.ctime]]

--- delete(*filename)    -> Integer
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.delete]]

--- dirname(filename)    -> String

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[File.dirname]]

--- ftype(filename)    -> String

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.ftype]]

--- join(*item)    -> String
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param item Ϣ�뤷�����ǥ��쥯�ȥ�̾��ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.join]]

--- link(old, new)    -> 0

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param old �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@param new �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.link]]


--- lstat(filename)   -> File::Stat

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.lstat]]

--- mtime(filename)    -> Time

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:File.mtime]]

--- readlink(path)    -> String
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param path ����ܥ�å���󥯤�ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.readlink]]

--- rename(from, to)    -> 0
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param from �ե������̾����ʸ�����Ϳ���ޤ���

@param to �������ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.rename]]

--- split(pathname)    -> [String]

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param pathname �ѥ�̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.split]]

--- stat(filename)    -> File::Stat

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.stat]]


--- symlink(old, new)    -> 0
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param old �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@param new ����ܥ�å���󥯤�ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.symlink]]


--- truncate(path, length)    -> 0

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param path �ѥ���ɽ��ʸ�������ꤷ�ޤ���

@param length �ѹ���������������������Ϳ���ޤ���

@see [[m:File.truncate]]

--- utime(atime, mtime, *filename)    -> Integer
File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filename �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@param atime �ǽ�������������� [[c:Time]] ��������������ηв��ÿ�����ͤǻ��ꤷ�ޤ���

@param utime ��������� [[c:Time]] ��������������ηв��ÿ�����ͤǻ��ꤷ�ޤ���

@see [[m:File.utime]]

--- blockdev?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.blockdev?]]

--- chardev?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.chardev?]]

--- directory?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.directory?]]

--- executable?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.executable?]]

--- executable_real?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.executable_real?]]

--- exist?(file) -> bool
--- exists?(file) -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.exist?]] [[m:FileTest.exists?]]

--- file?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.file?]]

--- grpowned?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.grpowned?]]

--- owned?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.owned?]]

--- pipe?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ���� IO ���֥������Ȥ���ꤷ�ޤ���

@see [[m:FileTest.pipe?]]

--- readable?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.readable?]]

--- readable_real?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.readable_real?]]

--- setgid?(file)

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

--- setuid?(file)    -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.setuid?]]

--- size(file) -> Integer
--- size?(file) -> Integer | nil

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.size]] [[m:FileTest.size?]]

--- socket?(file) -> bool

FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.socket?]]


--- sticky?(file) -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.sticky?]]

--- symlink?(file)
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.symlink?]]

--- writable?(file) -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.writable?]]

--- writable_real?(file) -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.writable_real?]]

--- zero?(file) -> bool
FileTest���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:FileTest.zero?]]

#@if (version < "1.9.0")
--- syscopy(from, to) -> bool

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param from �ե������̾����ʸ�����Ϳ���ޤ���

@param to �������ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.syscopy]]

#@end

#@if (version < "1.9.0")
--- copy(from, to) -> bool
FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param from �ե������̾����ʸ�����Ϳ���ޤ���

@param to �������ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.copy]]

#@end


#@if (version < "1.9.0")
--- move(from, to) -> bool

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param from �ե������̾����ʸ�����Ϳ���ޤ���

@param to �������ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.move]]

#@end

#@if (version < "1.9.0")
--- compare(file1, file2) -> bool

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param file1 �ե������̾����ʸ�����Ϳ���ޤ���

@param file2 �������ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:File.compare]]

#@end

#@if (version < "1.9.0")
--- safe_unlink(*filenames) -> Array
FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param filenames �������ե��������ꤷ�ޤ���

@see [[m:File.safe_unlink]]

#@end

#@if (version < "1.9.0")
--- makedirs(*dirs) -> Array

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param dirs ��������ǥ��쥯�ȥ����ꤷ�ޤ���

@see [[m:File.makedirs]]

#@end

#@if (version < "1.9.0")
--- install(from, to, mode = nil, verbose = false) -> () 

FileTools���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param from ���ԡ����Υե����롣

@param to ���ԡ���Υե����롣

@param mode �ե�����Υ��������⡼�ɡ�8�ʿ��ǻ��ꤷ�ޤ���

@param verbose ������ꤹ��Ⱦܺ٤�ɽ�����ޤ���

@see [[m:File.install]]

#@end

#@if (version < "1.9.0")
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

#@end

--- expand_path(path)

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param path �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.expand_path]]


