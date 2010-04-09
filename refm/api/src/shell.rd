require shell/error
require shell/command-processor
require shell/process-controller

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



= class Shell < Object
extend Exception2MessageMapper
include Shell::Error

Shell ���֥������Ȥϥ����ȥǥ��쥯�ȥ�����, 
���ޥ�ɼ¹ԤϤ�����������Хѥ��ˤʤ�ޤ�.

== Class Methods

--- def_system_command(command, path = command) -> nil

Shell �Υ᥽�åɤȤ��� command ����Ͽ���ޤ�.

OS��Υ��ޥ�ɤ�¹Ԥ���ˤϤޤ�, Shell�Υ᥽�åɤȤ���������ޤ�.
��) ���ޥ�ɤ�������ʤ��Ȥ�ľ�ܼ¹ԤǤ��� [[m:Shell#system]] ���ޥ�ɤ⤢��ޤ�.

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

@param opts command �ǻ��ꤷ�����ޥ�ɤΥ��ץ�������ꤷ�ޤ�.

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

#@since 1.9.1
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

#@since 1.9.1

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
#@todo

�ǥХå��ѥե饰�򻲾Ȥ��ޤ���

--- debug=(val) 

�ǥХå��ѤΥե饰�����ꤷ�ޤ���

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
#@todo

--- verbose=(flag)

true �ʤ�о�Ĺ�ʽ��Ϥ������Ԥ��ޤ���

@param flag true �ʤ�о�Ĺ�ʽ��Ϥ������Ԥ��ޤ���


--- cascade -> bool
#@todo

--- cascade=(flag)
#@todo

--- notify(*opts){|message| ... } -> String
#@todo

#@since 1.9.1

--- debug_output_exclusive_unlock{ ... } -> Mutex | nil
#@todo

@see [[m:Mutex#exclusive_unlock]]

--- debug_output_lock -> Mutex
#@todo

@see [[m:Mutex#lock]]

--- debug_output_locked? -> bool
#@todo

@see [[m:Mutex#locked?]]

--- debug_output_synchronize
#@todo

@see [[m:Mutex#synchronize]]

--- debug_output_try_lock -> bool
#@todo

@see [[m:Mutex#try_lock]]

--- debug_output_unlock -> Mutex | nil
#@todo

@see [[m:Mutex#unlock]]

#@end

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
#@todo

umask���֤��ޤ���

--- umask=(umask)
#@todo

--- jobs -> Array

�������塼��󥰤���Ƥ���job�ΰ������֤��ޤ���

--- kill(signal, job) -> Integer
#@todo

����֤˥����ʥ������ޤ���

@param signal

@param job

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


#@# �ȹ��ߥ��ޥ��
#@include(shell/builtincommands)

--- expand_path(path) -> String

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param path �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.expand_path]]

--- verbose -> bool  
--- verbose? -> bool
#@todo

--- verbose=(flag)
#@todo

--- debug -> bool | Integer
--- debug? -> bool | Integer
#@todo

--- debug=(flag)
#@todo

--- dirs -> [String]
--- dir_stack -> [String]
#@todo

--- command_processor -> Shell::CommandProcessor
#@todo

--- process_controller -> Shell::ProcessController
#@todo

--- record_separator -> String
#@todo

--- record_separator=(rs)
#@todo


