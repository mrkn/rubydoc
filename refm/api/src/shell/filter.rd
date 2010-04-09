
[[c:Shell::Filter]] ��������Ƥ���饤�֥��Ǥ���

= class Shell::Filter < Object

include Enumerable

���ޥ�ɤμ¹Է�̤Ϥ��٤� [[c:Shell::Filter]] �������Υ��֥��饹�Υ��󥹥��󥹤Ȥ����֤�ޤ��� 

== Class Methods

--- new(sh) -> Shell::Filter

[[c:Shell::Filter]] ���饹�Υ��󥹥��󥹤��֤��ޤ���
�̾盧�Υ᥽�åɤ�ľ�ܻȤ�����Ͼ��ʤ��Ǥ��礦��

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

src��ե��륿�����ϤȤ��롣 src��, ʸ����ʤ�Хե������, IO���֥������ȤǤ���
�Ф���򤽤Τޤ����ϤȤ��롣

@param src �ե��륿�����Ϥ�, ʸ����⤷����,IO ���֥������Ȥǻ��ꤷ�ޤ���

������
  Shell.def_system_command("head")
  sh = Shell.new
  sh.transact {
    (sh.head("-n 30") < "/etc/passwd") > "ugo.txt"
  }

--- >(to) -> self

to��ե��륿�ν��ϤȤ��롣 to��, ʸ����ʤ�Хե������, IO���֥������ȤǤ���
�Ф���򤽤Τޤ޽��ϤȤ��롣

@param to ���������ꤷ�ޤ���ʸ����ʤ�Хե������,IO���֥������Ȥʤ�Ф���˽��Ϥ��ޤ���

������
  Shell.def_system_command("tail")
  sh = Shell.new
  sh.transact {
    (sh.tail("-n 3") < "/etc/passwd") > File.open("tail.out", "w")
    #(sh.tail("-n 3") < "/etc/passwd") > "tail.out" # ��Ʊ��.
  }

--- >>(to) -> self

to��ե��륿���ɲä��롣 to��, ʸ����ʤ�Хե������, IO���֥������ȤǤ����
����򤽤Τޤ޽��ϤȤ��롣

@param to ���������ꤷ�ޤ���ʸ����ʤ�Хե�����ˡ�IO���֥������Ȥʤ�Ф���˽��Ϥ��ޤ���

������
  Shell.def_system_command("tail")
  sh = Shell.new
  sh.transact {
    (sh.tail("-n 3") < "/etc/passwd") >> "tail.out" 
    #(sh.tail("-n 3") < "/etc/passwd") >> File.open("tail.out", "w") # �Ǥ�Ʊ����
  }

--- |(filter) -> object

�ѥ��׷��� filter ���Ф��ƹԤ��ޤ���

@param filter Shell::Filter ���֥������Ȥ���ꤷ�ޤ���

@return filter ���֤��ޤ���

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

filter1 + filter2 �� filter1�ν��Ϥθ�, filter2�ν��Ϥ�Ԥ���

--- to_a -> [String]
�¹Է�̤�ʸ�����������֤��ޤ���

  Shell.def_system_command("wc")
  sh = Shell.new
  puts sh.cat("/etc/passwd").to_a

--- to_s -> String
�¹Է�̤�ʸ������֤��ޤ���

  Shell.def_system_command("wc")
  sh = Shell.new

  sh.transact {
    puts (cat("/etc/passwd") | wc("-l")).to_s
  }

--- inspect -> String

���֥������Ȥ�ʹ֤��ɤ��������Ѵ�����ʸ������֤��ޤ���

@see [[m:Object#inspect]]

--- input -> Shell::Filter | nil
���ߤΥե��륿�����֤��ޤ���

--- input=(filter)

�ե��륿�������ꤷ�ޤ���

@param filter �ե��륿������ꤷ�ޤ���


#@include(builtincommands)

