GNU Readline �ˤ�륳�ޥ�ɥ饤�����ϥ��󥿥ե��������󶡤���饤�֥��Ǥ���

= module Readline

GNU Readline �ˤ�륳�ޥ�ɥ饤�����ϥ��󥿥ե��������󶡤���⥸�塼��Ǥ���

GNU Readline �ߴ��饤�֥��ΤҤȤĤǤ��� Edit Line(libedit) �⥵�ݡ��Ȥ��Ƥ��ޤ���

  * [[url:http://www.gnu.org/directory/readline.html]]
  * [[url:http://www.thrysoee.dk/editline/]]

Readline.readline ����Ѥ��ƥ桼����������Ϥ�����Ǥ��ޤ���
���ΤȤ��� GNU Readline �Τ褦�����Ϥ��䴰��
Emacs �Τ褦�ʥ������ʤɤ��Ǥ��ޤ���

��: �ץ��ץ�"> "��ɽ�����ơ��桼����������Ϥ�������롣

  while buf = Readline.readline("> ", true)
    print("-> ", buf, "\n")
  end

�桼�������Ϥ������Ƥ�����(�ʲ����ҥ��ȥ�)�Ȥ��Ƶ�Ͽ���뤳�Ȥ��Ǥ��ޤ���
��� [[m:Readline::HISTORY]] ����Ѥ�����������˥��������Ǥ��ޤ���
�㤨�С�Readline::HISTORY.to_a �ˤ�ꡢ
���Ƥ����Ϥ������Ƥ�ʸ���������Ȥ��Ƽ����Ǥ��ޤ���

��: �ҥ��ȥ������Ȥ��Ƽ������롣

  while buf = Readline.readline("> ", true)
    p Readline::HISTORY.to_a
    print("-> ", buf, "\n")
  end

== Module Functions

--- readline([prompt, [add_hist]]) -> String | nil

prompt ����Ϥ����桼������Υ������Ϥ��Ԥ��ޤ���
���󥿡������β����ʤɤǥ桼����ʸ��������Ϥ�������ȡ�
���Ϥ���ʸ������֤��ޤ���
���ΤȤ���add_hist �� true �Ǥ���С����Ϥ���ʸ���������������ɲä��ޤ���
�������Ϥ��Ƥ��ʤ����֤� EOF(UNIX �Ǥ� ^D) �����Ϥ���ʤɤǡ�
�桼����������Ϥ��ʤ����� nil ���֤��ޤ���

@param prompt �������������ɽ������ʸ�������ꤷ�ޤ����ǥե���Ȥ�""�Ǥ���
@param add_hist ���ʤ�С����Ϥ���ʸ�����ҥ��ȥ�˵�Ͽ���ޤ����ǥե���Ȥϵ��Ǥ���

���ξ���������������硢�㳰 IOError ��ȯ�����ޤ���
  (1) ɸ�����Ϥ� tty �Ǥʤ���
  (2) ɸ�����Ϥ򥯥������Ƥ��롣(isatty(2) �� errno �� EBADF �Ǥ��롣)

�ܥ᥽�åɤϥ���åɤ��б����Ƥ��ޤ���
�����Ԥ����֤ΤȤ��ϥ���åɥ���ƥ����Ȥ����ؤ���ȯ�����ޤ���

���ϻ��ˤϹ����Խ�����ǽ�ǡ�vi �⡼�ɤ� Emacs �⡼�ɤ��Ѱդ���Ƥ��ޤ���
�ǥե���Ȥ� Emacs �⡼�ɤǤ���

��: 

  require "readline"

  input = Readline.readline
  (�ץ��ץȤʤɤ�ɽ�������ˡ������Ԥ��ξ��֤ˤʤ�ޤ���
   �����Ǥϡ�abc�פ����ϸ塢���󥿡������򲡤��������ꤷ�ޤ���)
  abc

  p input # => "abc"

  input = Readline.readline("> ")
  (">"��ɽ�����������Ԥ��ξ��֤ˤʤ�ޤ���
   �����Ǥϡ�ls�פ����ϸ塢���󥿡������򲡤��������ꤷ�ޤ���)
  > ls

  p input # => "ls"

  input = Readline.readline("> ", true)
  (">"��ɽ�����������Ԥ��ξ��֤ˤʤ�ޤ���
   �����Ǥϡ�cd�פ����ϸ塢���󥿡������򲡤��������ꤷ�ޤ���)
  > cd

  p input # => "cd"

  input = Readline.readline("> ", true)
  (">"��ɽ�����������Ԥ��ξ��֤ˤʤ�ޤ���
   �����ǡ���������ξ奭�����ޤ��� ^P �򲡤��ȡ�
   ��ۤ����Ϥ�����cd�פ�ɽ������ޤ���
   �����ơ����󥿡������򲡤��������ꤷ�ޤ���)
  > cd

  p input # => "cd"

�ܥ᥽�åɤˤ���ջ��ब����ޤ���
�����Ԥ��ξ��֤� ^C ����� ruby ���󥿥ץ꥿����λ����ü�����֤��������ޤ���
�������򤹤뤿������2�ĵ󤲤ޤ���

��: ^C�ˤ��Interrupt�㳰����­���ơ�ü�����֤��������롣

  stty_save = `stty -g`.chomp
  begin
    while buf = Readline.readline
        p buf
        end
      rescue Interrupt
        system("stty", stty_save)
        exit
      end
    end
  end

��: INT�����ʥ����­���ơ�ü�����֤��������롣

  stty_save = `stty -g`.chomp
  trap("INT") { system "stty", stty_save; exit }

  while buf = Readline.readline
    p buf
  end

�ޤ���ñ�� ^C ��̵�뤹����ˡ�⤢��ޤ���

  trap("INT", "SIG_IGN")

  while buf = Readline.readline
    p buf
  end

�������� Readline::HISTORY ����Ѥ��ơ����Τ褦�ʤ��Ȥ�Ǥ��ޤ���

��: ���Ԥ�ľ�������Ϥ�Ʊ�����Ƥ���������˻Ĥ��ʤ���

  while buf = Readline.readline("> ", true)
    # p Readline::HISTORY.to_a
    Readline::HISTORY.pop if /^\s*$/ =~ buf
 
    begin
      if Readline::HISTORY[Readline::HISTORY.length-2] == buf
        Readline::HISTORY.pop 
      end
    rescue IndexError
    end
 
    # p Readline::HISTORY.to_a
    print "-> ", buf, "\n"
  end

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.vi_editing_mode=]]��[[m:Readline.vi_editing_mode]]��
     [[m:Readline.emacs_editing_mode=]]��[[m:Readline.emacs_editing_mode]]��
     [[m:Readline::HISTORY]]

== Singleton Methods

#@since 1.9.0
--- input=(input) -> input

readline �᥽�åɤǻ��Ѥ��������Ѥ� [[c:File]] ���֥������� input ����ꤷ�ޤ���
����ͤϻ��ꤷ�� [[c:File]] ���֥������� input �Ǥ���

@param input [[c:File]] ���֥������Ȥ���ꤷ�ޤ���

--- output=(output) -> output

readline �᥽�åɤǻ��Ѥ�������Ѥ� [[c:File]] ���֥������� output ����ꤷ�ޤ���
����ͤϻ��ꤷ�� [[c:File]] ���֥������� output �Ǥ���

@param output [[c:File]] ���֥������Ȥ���ꤷ�ޤ���
#@end

--- completion_proc=(proc)

�桼����������Ϥ��䴰������θ����������� [[c:Proc]] ���֥�������
proc ����ꤷ�ޤ���
proc �ϡ����Τ�Τ����ꤷ�Ƥ��ޤ���
  (1) call�᥽�åɤ���ġ�call�᥽�åɤ�����ʤ���硢�㳰 ArgumentError ��ȯ�����ޤ���
  (2) �����˥桼�����������ʸ������롣
  (3) �����ʸ�����������֤���

@param proc �桼����������Ϥ��䴰������θ����������� [[c:Proc]] ���֥������Ȥ���ꤷ�ޤ���

#@since 1.8.0
��/var/lib /v�פθ���䴰��Ԥ��ȡ�
�ǥե���ȤǤ� proc �ΰ����ˡ�/v�פ��Ϥ���ޤ���
���Τ褦�ˡ��桼�������Ϥ���ʸ�����
[[m:Readline.completer_word_break_characters]] �˴ޤޤ��ʸ���Ƕ��ڤä���Τ�ñ��Ȥ���ȡ�
�������뤬����ñ��κǽ��ʸ�����鸽�ߤΥ���������֤ޤǤ�ʸ���� proc �ΰ������Ϥ���ޤ���
#@end

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��: foo��foobar��foobaz���䴰���롣

  require 'readline'

  WORDS = %w(foo foobar foobaz)

  Readline.completion_proc = proc {|word|
      WORDS.grep(/\A#{Regexp.quote word}/)
  }

  while buf = Readline.readline("> ")
    print "-> ", buf, "\n"
  end

@see [[m:Readline.completion_proc=]]

--- completion_proc -> proc

�桼����������Ϥ��䴰������θ����������� [[c:Proc]] ���֥�������
proc ��������ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completion_proc]]

--- completion_case_fold=(bool)

�桼�������Ϥ��䴰����ݡ���ʸ���Ⱦ�ʸ������̤��롿���ʤ�����ꤷ�ޤ���
bool �����ʤ�ж��̤��ޤ��� bool �����ʤ�ж��̤��ޤ���
�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@param bool ��ʸ���Ⱦ�ʸ������̤���(true)�����ʤ�(false)����ꤷ�ޤ���

@see [[m:Readline.completion_case_fold]]

--- completion_case_fold -> bool

�桼�������Ϥ��䴰����ݡ���ʸ���Ⱦ�ʸ������̤��롿���ʤ���������ޤ���
bool �����ʤ�ж��̤��ޤ���bool �����ʤ�ж��̤��ޤ���

�ʤ���Readline.completion_case_fold= �᥽�åɤǻ��ꤷ�����֥������Ȥ�
���Τޤ޼�������Τǡ����Τ褦��ư��򤷤ޤ���

  Readline.completion_case_fold = "This is a String."
  p Readline.completion_case_fold # => "This is a String."

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completion_case_fold=]]

--- vi_editing_mode

�Խ��⡼�ɤ� vi �⡼�ɤˤ��ޤ���
vi �⡼�ɤξܺ٤ϡ�GNU Readline �Υޥ˥奢��򻲾Ȥ��Ƥ���������

  * [[url:http://www.gnu.org/directory/readline.html]]

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- emacs_editing_mode

�Խ��⡼�ɤ� Emacs �⡼�ɤˤ��ޤ����ǥե���Ȥ� Emacs �⡼�ɤǤ���

Emacs �⡼�ɤξܺ٤ϡ� GNU Readline �Υޥ˥奢��򻲾Ȥ��Ƥ���������

  * [[url:http://www.gnu.org/directory/readline.html]]

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- completion_append_character=(string)

�桼�������Ϥ��䴰����λ�������ˡ��Ǹ���ղä���ʸ�� string ����ꤷ�ޤ���

@param string 1ʸ������ꤷ�ޤ���

Ⱦ�ѥ��ڡ�����" "�פʤɤ�ñ�����ڤ�ʸ������ꤹ��С�
Ϣ³�������Ϥ���ݤ������Ǥ���

  Readline.readline("> ", true)
  Readline.completion_append_character = " "
  > /var/li
  �������䴰(TAB�����򲡤�)��Ԥ���
  > /var/lib 
  �Ǹ��" "���ɲä���Ƥ��뤿�ᡢ�����ˡ�/usr�פʤɤ����ϤǤ��롣
  > /var/lib /usr

�ʤ���1ʸ���������ꤹ�뤳�ȤϤǤ��ʤ����ᡢ
�㤨�С�"string"����ꤷ�����Ϻǽ��ʸ���Ǥ���"s"��������Ѥ��ޤ���

  Readline.completion_append_character = "string"
  p Readline.completion_append_character # => "s"

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completion_append_character]]

--- completion_append_character -> string

�桼�������Ϥ��䴰����λ�������ˡ��Ǹ���ղä���ʸ����������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completion_append_character=]]

#@since 1.8.0
--- basic_word_break_characters=(string)

�桼�������Ϥ��䴰��Ԥ��ݡ�
ñ��ζ��ڤ�򼨤�ʣ����ʸ���ǹ��������ʸ���� string ����ꤷ�ޤ���

@param string ʸ�������ꤷ�ޤ���

GNU Readline �Υǥե�����ͤϡ�Bash ���䴰�����ǻ��Ѥ��Ƥ���ʸ����
" \t\n\"\\'`@$><=;|&{(" (���ڡ�����ޤ�) �ˤʤäƤ��ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.basic_word_break_characters]]

--- basic_word_break_characters

�桼�������Ϥ��䴰��Ԥ��ݡ�
ñ��ζ��ڤ�򼨤�ʣ����ʸ���ǹ��������ʸ�����������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.basic_word_break_characters=]]

--- completer_word_break_characters=(string)

�桼�������Ϥ��䴰��Ԥ��ݡ�
ñ��ζ��ڤ�򼨤�ʣ����ʸ���ǹ��������ʸ���� string ����ꤷ�ޤ���
[[m:Readline.basic_word_break_characters=]] �Ȥΰ㤤�ϡ�
GNU Readline �� rl_complete_internal �ؿ��ǻ��Ѥ���뤳�ȤǤ���

@param string ʸ�������ꤷ�ޤ���

GNU Readline �Υǥե���Ȥ��ͤϡ� 
[[m:Readline.basic_word_break_characters]] ��Ʊ���Ǥ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completer_word_break_characters]]

--- completer_word_break_characters

�桼�������Ϥ��䴰��Ԥ��ݡ�
ñ��ζ��ڤ�򼨤�ʣ����ʸ���ǹ������줿ʸ�����������ޤ���
[[m:Readline.basic_word_break_characters]] �Ȥΰ㤤�ϡ�
GNU Readline �� rl_complete_internal �ؿ��ǻ��Ѥ���뤳�ȤǤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completer_word_break_characters=]]

--- basic_quote_characters=(string)

���ڡ����ʤɤ�ñ��ζ��ڤ�򥯥����Ȥ��뤿���
ʣ����ʸ���ǹ��������ʸ���� string ����ꤷ�ޤ���

@param string ʸ�������ꤷ�ޤ���

GNU Readline �Υǥե�����ͤϡ���"'�פǤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.basic_quote_characters]]

--- basic_quote_characters

���ڡ����ʤɤ�ñ��ζ��ڤ�򥯥����Ȥ��뤿���
ʣ����ʸ���ǹ��������ʸ�����������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.basic_quote_characters=]]

--- completer_quote_characters=(string)

�桼�������Ϥ��䴰��Ԥ��ݡ����ڡ����ʤɤ�ñ��ζ��ڤ��
�������Ȥ��뤿���ʣ����ʸ���ǹ��������ʸ���� string ����ꤷ�ޤ���
���ꤷ��ʸ���δ֤Ǥϡ�[[m:Readline::completer_word_break_characters=]]
�ǻ��ꤷ��ʸ����˴ޤޤ��ʸ���⡢���̤�ʸ����Ȥ��ư����ޤ���

@param string ʸ�������ꤷ�ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completer_quote_characters]]

--- completer_quote_characters

�桼�������Ϥ��䴰��Ԥ��ݡ����ڡ����ʤɤ�ñ��ζ��ڤ��
�������Ȥ��뤿���ʣ����ʸ���ǹ��������ʸ�����������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.completer_quote_characters=]]

--- filename_quote_characters=(string)

�桼�������ϻ��˥ե�����̾���䴰��Ԥ��ݡ����ڡ����ʤɤ�ñ��ζ��ڤ��
�������Ȥ��뤿���ʣ����ʸ���ǹ��������ʸ���� string ����ꤷ�ޤ���

@param string ʸ�������ꤷ�ޤ���

GNU Readline �Υǥե�����ͤ� nil(NULL) �Ǥ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.filename_quote_characters]]

--- filename_quote_characters

�桼�������ϻ��˥ե�����̾���䴰��Ԥ��ݡ����ڡ����ʤɤ�ñ��ζ��ڤ��
�������Ȥ��뤿���ʣ����ʸ���ǹ��������ʸ�����������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Readline.filename_quote_characters=]]
#@end

== Constants

--- VERSION

Readline�⥸�塼�뤬���Ѥ��Ƥ��� GNU Readline �� liedit �ΥС�������
����ʸ����Ǥ���

--- FILENAME_COMPLETION_PROC

GNU Readline ���������Ƥ���ؿ�����Ѥ��ƥե�����̾���䴰��Ԥ������
[[c:Proc]] ���֥������ȤǤ���
[[m:Readline.completion_proc=]] �ǻ��Ѥ��ޤ���

@see [[m:Readline.completion_proc=]]

--- USERNAME_COMPLETION_PROC

GNU Readline ���������Ƥ���ؿ�����Ѥ��ƥ桼��̾���䴰��Ԥ������
[[c:Proc]] ���֥������ȤǤ���
[[m:Readline.completion_proc=]] �ǻ��Ѥ��ޤ���

@see [[m:Readline.completion_proc=]]

= object Readline::HISTORY

extend Enumerable

Readline::HISTORY ����Ѥ��ƥҥ��ȥ�˥��������Ǥ��ޤ���
[[c:Enumerable]] �⥸�塼��� extend ���Ƥ��ꡢ
[[c:Array]] ���饹�Τ褦�˿����񤦤��Ȥ��Ǥ��ޤ���
�㤨�С�HISTORY[4] �ˤ�� 5 ���ܤ����Ϥ������Ƥ���Ф����Ȥ��Ǥ��ޤ���

--- to_s -> "HISTORY"

ʸ����"HISTORY"���֤��ޤ���

��:

  Readline::HISOTRY.to_s #=> "HISTORY"

--- [](index) -> string

�ҥ��ȥ꤫�� index �ǻ��ꤷ������ǥå��������Ƥ�������ޤ���
�㤨�� index �� 0 ����ꤹ��Ⱥǽ���������Ƥ������Ǥ��ޤ���
�ޤ��� -1 �ϺǸ���������ƤȤ����褦�ˡ�index ������ͤ���ꤹ�뤳�Ȥǡ�
�Ǹ夫���������Ƥ�������뤳�Ȥ�Ǥ��ޤ���

@param index �����оݤΥҥ��ȥ�Υ���ǥå����������ǻ��ꤷ�ޤ���
             ����ǥå����� [[c:Array]] �褦�� 0 ������ꤷ�ޤ���
             �ޤ��� -1 �ϺǸ���������ƤȤ����褦�ˡ���ο�����ꤹ�뤳�Ȥ�Ǥ��ޤ���

index �ǻ��ꤷ������ǥå����˳��������������Ƥ��ʤ���硢
�㳰 IndexError ��ȯ�����ޤ���

index �ǻ��ꤷ������ǥå����� int �������礭���ͤξ�硢
�㳰 RangeError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��:

  require "readline"

  Readline::HISTORY[0] #=> �ǽ����������
  Readline::HISTORY[4] #=> 5���ܤ���������
  Readline::HISTORY[-1] #=> �Ǹ����������
  Readline::HISTORY[-5] #=> �Ǹ夫��5���ܤ���������

��: 1000000 ���ܤ��������Ƥ�¸�ߤ��ʤ���硢�㳰 IndexError ��ȯ�����ޤ���

  Readline::HISTORY[1000000] #=> �㳰 IndexError ��ȯ�����ޤ���

��: 32 bit �Υ����ƥ�ξ�硢�㳰 RangeError ��ȯ�����ޤ���

  Readline::HISTORY[2 ** 32 + 1] #=> �㳰 RangeError ��ȯ�����ޤ���

��: 64 bit �Υ����ƥ�ξ�硢�㳰 RangeError ��ȯ�����ޤ���

  Readline::HISTORY[2 ** 64 + 1] #=> �㳰 RangeError ��ȯ�����ޤ���

--- []=(index, string) -> string

�ҥ��ȥ�� index �ǻ��ꤷ������ǥå��������Ƥ� string �ǻ��ꤷ��ʸ����ǽ񤭴����ޤ���
�㤨�� index �� 0 ����ꤹ��Ⱥǽ���������Ƥ��񤭴����ޤ���
�ޤ��� -1 �ϺǸ���������ƤȤ����褦�ˡ�index ������ͤ���ꤹ�뤳�Ȥǡ�
�Ǹ夫���������Ƥ�������뤳�Ȥ�Ǥ��ޤ���
���ꤷ�� string ���֤��ޤ���

@param index �����оݤΥҥ��ȥ�Υ���ǥå����������ǻ��ꤷ�ޤ���
             ����ǥå����� [[c:Array]] �褦�� 0 ������ꤷ�ޤ���
             �ޤ��� -1 �ϺǸ���������ƤȤ����褦�ˡ���ο�����ꤹ�뤳�Ȥ�Ǥ��ޤ���
@param string ʸ�������ꤷ�ޤ�������ʸ����ǥҥ��ȥ��񤭴����ޤ���
@return string �ǻ��ꤷ��ʸ������֤��ޤ���

index �ǻ��ꤷ������ǥå����˳��������������Ƥ��ʤ���硢
�㳰 IndexError ��ȯ�����ޤ���

index �ǻ��ꤷ������ǥå����� int �������礭���ͤξ�硢
�㳰 RangeError ��ȯ�����ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- <<(string) -> self

�ҥ��ȥ�κǸ�� string �ǻ��ꤷ��ʸ������ɲä��ޤ���
self ���֤��ޤ���

@param string ʸ�������ꤷ�ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��: "foo"���ɲä��롣

  require "readline"

  Readline::HISTORY << "foo"
  p Readline::HISTORY[-1] #=> "foo"

��: "foo"��"bar"���ɲä��롣

  require "readline"

  Readline::HISTORY << "foo" << "bar"
  p Readline::HISTORY[-1] #=> "bar"
  p Readline::HISTORY[-2] #=> "foo"

@see [[m:Readline::HISTORY.push]]

--- push(*string) -> self

�ҥ��ȥ�κǸ�� string �ǻ��ꤷ��ʸ������ɲä��ޤ���ʣ���� string �����Ǥ��ޤ���
self ���֤��ޤ���

@param string ʸ�������ꤷ�ޤ���ʣ������Ǥ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��: "foo"���ɲä��롣

  require "readline"

  Readline::HISTORY.push("foo")
  p Readline::HISTORY[-1] #=> "foo"

��: "foo"��"bar"���ɲä��롣

  require "readline"

  Readline::HISTORY.push("foo", "bar")
  p Readline::HISTORY[-1] #=> "bar"
  p Readline::HISTORY[-2] #=> "foo"

@see [[m:Readline::HISTORY.<<]]

--- pop -> string

�ҥ��ȥ�κǸ�����Ƥ���Ф��ޤ���
�Ǹ�����Ƥϡ��ҥ��ȥ꤫���������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��:

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  p Readline::HISTORY.pop #=> "baz"
  p Readline::HISTORY.pop #=> "bar"
  p Readline::HISTORY.pop #=> "foo"

@see [[m:Readline::HISTORY.push]]��[[m:Readline::HISTORY.shift]]��
     [[m:Readline::HISTORY.delete_at]]

--- shift -> string

�ҥ��ȥ�κǽ�����Ƥ���Ф��ޤ���
�ǽ�����Ƥϡ��ҥ��ȥ꤫���������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��:

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  p Readline::HISTORY.shift #=> "foo"
  p Readline::HISTORY.shift #=> "bar"
  p Readline::HISTORY.shift #=> "baz"

@see [[m:Readline::HISTORY.push]]��[[m:Readline::HISTORY.pop]]��
     [[m:Readline::HISTORY.delete_at]]

--- each -> Enumerable::Enumerator
--- each {|string| ... }

�ҥ��ȥ�����Ƥ��Ф��ƥ֥�å���ɾ�����ޤ���
�֥�å������ˤϥҥ��ȥ�κǽ餫��Ǹ�ޤǤ����Ƥ���֤��Ϥ��ޤ���
#@since 1.8.7
�֥�å���Ϳ�����ʤ��ä����ϡ����Ȥ� each ������������
[[c:Enumerable::Enumerator]] ���֥������Ȥ��֤��ޤ���
#@end

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��: �ҥ��ȥ�����Ƥ�ǽ餫����֤˽��Ϥ��롣

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  Readline::HISTORY.each do |s|
    p s #=> "foo", "bar", "baz"
  end

#@since 1.8.7
��: [[c:Enumerable::Enumerator]] ���֥������Ȥ��֤���硣

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  e = Readline::HISTORY.each
  e.each do |s|
    p s #=> "foo", "bar", "baz"
  end
#@end

--- length -> integer

�ҥ��ȥ�˳�Ǽ���줿���Ƥο���������ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��: �ҥ��ȥ�����Ƥ�ǽ餫����֤˽��Ϥ��롣

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  p Readline::HISTORY.length #=> 3

@see [[m:Readline::HISTORY.empty?]]

--- empty? -> bool

�ҥ��ȥ�˳�Ǽ���줿���Ƥο��� 0 �ξ��� true ��
�����Ǥʤ����� false ���֤��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��:

  require "readline"
  
  p Readline::HISTORY.empty? #=> true
  Readline::HISTORY.push("foo", "bar", "baz")
  p Readline::HISTORY.empty? #=> false

@see [[m:Readline::HISTORY.length]]

--- delete_at(index) -> string | nil

index �ǻ��ꤷ������ǥå��������Ƥ�ҥ��ȥ꤫���������������Ƥ��֤��ޤ���
�������� index �����Ƥ��ҥ��ȥ�ˤʤ���С� nil ���֤��ޤ���
index �� 0 ����ꤹ��� [[m:Readline::HISTORY.shift]] 
��Ʊ�ͤ˺ǽ���������Ƥ������ޤ���
�ޤ��� -1 �ϺǸ���������ƤȤ����褦�ˡ�index ������ͤ���ꤹ�뤳�Ȥǡ�
�Ǹ夫���������Ƥ�������뤳�Ȥ�Ǥ��ޤ���
index �� -1 �ξ��� [[m:Readline::HISTORY.pop]] ��Ʊ�ͤ�ư��ޤ���

@param index ����оݤΥҥ��ȥ�Υ���ǥå�������ꤷ�ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

��:

  require "readline"
  
  Readline::HISTORY.push("foo", "bar", "baz")
  Readline::HISTORY.delete_at(1)
  p Readline::HISTORY.to_a #=> ["foo", "baz"]
