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

#@todo ����(2008/07/24)�Ϥ����ޤ�

#@since 1.8.0
--- basic_word_break_characters=(s)
--- basic_word_break_characters
#@todo
�䴰����ñ��Ʊ�Τζ��ڤ����ꤹ�� basic ��ʸ���󡣥ǥե���ȤǤ�
Bash�Ѥ�ʸ���� " \t\n\"\\'`@$><=;|&{(" (���ڡ����ޤ�)�ˤʤäƤ��ޤ���

--- completer_word_break_characters=(s)
--- completer_word_break_characters
#@todo
rl_complete_internal() �ǻȤ��롢�䴰����ñ��Ʊ�Τζ��ڤ����ꤹ��
ʸ����Ǥ����ǥե���ȤǤ� Readline.basic_word_break_characters �Ǥ���

--- basic_quote_characters=(s)
--- basic_quote_characters
#@todo
���������ꤷ�ޤ����ǥե���ȤǤϡ�/"'/ �Ǥ���

--- completer_quote_characters=(s)
--- completer_quote_characters
#@todo
�䴰���ΰ��������ꤷ�ޤ������ΰ�����δ֤Ǥϡ�completer_word_break_characters
�⡢���̤�ʸ����Ȥ��ư����ޤ���

--- filename_quote_characters=(s)
--- filename_quote_characters
#@todo
�䴰���Υե�����̾�ΰ��������ꤷ�ޤ����ǥե���ȤǤ� nil �Ǥ���
#@end

--- completion_append_character
--- completion_append_character=
#@todo

== Constants

--- FILENAME_COMPLETION_PROC
--- USERNAME_COMPLETION_PROC
#@todo
�饤�֥����Ȥ߹��ߤ��Ѱդ��줿�䴰�� [[c:Proc]] ���֥������ȤǤ���
���줾��ե�����̾���桼��̾���䴰��Ԥ��ޤ���
[[m:Readline.completion_proc=]] �ǻ��Ѥ��ޤ���

--- VERSION
#@todo

= object Readline::HISTORY

extend Enumerable

#@todo
Readline�⥸�塼������Ϥ������Ƥ���������Ȥ��Ƶ�Ͽ����ޤ�(ͭ���ˤ�
�Ƥ���ФǤ�����[[m:Readline.#readline]] �򻲾�)

��������ˤ�ꡢ������������Ƥ˥����������뤳�Ȥ��Ǥ��ޤ��������褽��
[[c:Array]] ���饹�Υ��󥹥��󥹤Τ褦�˿��񤤤ޤ���
([[c:Enumerable]] �⥸�塼���extend ���Ƥ��ޤ�)

  while buf = Readline.readline("> ", true)
    p Readline::HISTORY.to_a
    print "-> ", buf, "\n"
  end

���Ԥ�ľ�������Ϥ�Ʊ�����Ƥ���������˻Ĥ������ʤ��Ȼפ������Τ�ޤ���
���ξ�硢�ʲ��Τ褦�ˤ��ޤ���

  while buf = Readline.readline("> ", true)
    # p Readline::HISTORY.to_a
    Readline::HISTORY.pop if /^\s*$/ =~ buf

    begin
      Readline::HISTORY.pop if Readline::HISTORY[Readline::HISTORY.length-2] == buf
    rescue IndexError
    end

    # p Readline::HISTORY.to_a
    print "-> ", buf, "\n"
  end
