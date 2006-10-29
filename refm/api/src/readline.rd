= module Readline
GNU Readline �ˤ�륳�ޥ�ɥ饤�����ϥ��󥿥ե��������󶡤���⥸�塼
��Ǥ���

=== ����
* Readline.readline �᥽�åɤϥ���åɤ��б����Ƥ��ޤ���
  �����Ԥ����֤ΤȤ��ϥ���åɥ���ƥ����Ȥ����ؤ���ȯ�����ޤ���

* [[url:http://www.gnu.org/directory/readline.html]]

#@#=== ����
#@#: version 1.8
#@#   * Readline.basic_word_break_characters
#@#   * Readline.completer_word_break_characters
#@#   * Readline.basic_quote_characters
#@#   * Readline.completer_quote_characters
#@#   * Readline.filename_quote_characters
#@#
#@#�ʾ夬�ɲä���ޤ�����
#@#
#@#: version 1.5 (ruby version 1.6.5?)
#@#   * Readline.completion_append_character ���ɲä���ޤ��� [[unknown:ruby-ext:01760]]��
#@#
#@#   * [[unknown:ruby-dev:14574]] �������

=== �Ȥ���
���Τ褦�ˤ��ƻȤ��ޤ���

  require "readline"

  while buf = Readline.readline("> ", true)
      print "-> ", buf, "\n"
  end

== Module Functions

--- readline([prompt, [add_hist]])
�桼������Υ������Ϥ��ᡢ���Ϥ���ʸ������֤��ޤ���EOF(UNIX ��
�� ^D)�����Ϥ���� nil ���֤��ޤ���

���ϻ��ˤϹ����Խ�����ǽ�ǡ�vi �⡼�ɤ� Emacs �⡼�ɤ��Ѱդ���Ƥ��ޤ���
([[m:Readline.vi_editing_mode]]��[[m:Readline.emacs_editing_mode]]
�򻲾�)���ǥե���Ȥ� Emacs �⡼�ɤǤ���

ʸ���� prompt ����ꤹ��ȥ�����������ˤ���ʸ�����ɽ�����ޤ���

add_hist �����ʤ�С����Ϥ���ʸ����ϥҥ��ȥ�˵�Ͽ����ޤ���
Emacs �⡼�ɤʤ� ^P �����Ϥ��뤳�Ȥ��������Ϥ���ʸ�����ƤӽФ���
�ꡢ[[m:Readline::HISTORY]] �⥸�塼��ˤ��ҥ��ȥ�����Ƥ���
�뤳�Ȥ��Ǥ��ޤ������Υǥե�����ͤ� nil �Ǥ���

: ���
�����Ԥ��ξ��֤� ^C ����� ruby ���󥿥ץ꥿���Ȥ⽪λ��ü����
�֤��������ޤ��󡣤������򤹤�ˤϡ�

    stty_save = `stty -g`.chomp
    begin
      while buf = Readline.readline
          p buf
          end
        rescue Interrupt
          system("stty", stty_save)
          exit
        end

�ޤ��ϡ�

    stty_save = `stty -g`.chomp
    trap("INT") { system "stty", stty_save; exit }

    while buf = Readline.readline
      p buf
    end

�ʤɤȤ��ޤ���ñ�ˡ�^C ������դ��ʤ���������ʤ�аʲ��ǽ�ʬ�Ǥ���

    trap("INT", "SIG_IGN")

    while buf = Readline.readline
      p buf
    end

== Singleton Methods

--- completion_proc=(proc)
�䴰����ư�����ꤹ��[[c:Proc]]���֥������Ȥ���ꤷ�ޤ���
proc�ϰ���������ʸ������ꡢ����ʸ�����������֤��褦�ˤ��Ƥ���������

#@since 1.8.0
����ʸ����� Readline.completer_word_break_characters �˴ޤޤ��ʸ����ñ�줴�Ȥ˶��ڤ��ޤ���
�Ĥޤꡢ������ʸ����ľ�夫�饫�������ľ���ޤǤ�ʸ���� proc �ΰ������Ϥ���ޤ���
#@end
    require 'readline'

    WORDS = %w(foo foobar foobaz)

    Readline.completion_proc = proc {|word|
        WORDS.grep(/\A#{Regexp.quote word}/)
    }

    while buf = Readline.readline("> ")
      p buf
    end

#@since 1.8.0
--- basic_word_break_characters=()
--- basic_word_break_characters
�䴰����ñ��Ʊ�Τζ��ڤ����ꤹ�� basic ��ʸ���󡣥ǥե���ȤǤ�
Bash�Ѥ�ʸ���� " \t\n\"\\'`@$><=;|&{(" (���ڡ����ޤ�)�ˤʤäƤ��ޤ���

--- completer_word_break_characters=()
--- completer_word_break_characters
rl_complete_internal() �ǻȤ��롢�䴰����ñ��Ʊ�Τζ��ڤ����ꤹ��
ʸ����Ǥ����ǥե���ȤǤ� Readline.basic_word_break_characters �Ǥ���

--- basic_quote_characters=()
--- basic_quote_characters
���������ꤷ�ޤ����ǥե���ȤǤϡ�/"'/ �Ǥ���

--- completer_quote_characters=()
--- completer_quote_character
�䴰���ΰ��������ꤷ�ޤ������ΰ�����δ֤Ǥϡ�completer_word_break_characters
�⡢���̤�ʸ����Ȥ��ư����ޤ���

--- filename_quote_characters=()
--- filename_quote_characters
�䴰���Υե�����̾�ΰ��������ꤷ�ޤ����ǥե���ȤǤ� nil �Ǥ���
#@end

--- completion_proc
�䴰����ư�����ꤹ��[[c:Proc]]���֥������Ȥ��֤��ޤ���

--- completion_case_fold=()
--- completion_case_fold
�����䴰������ʸ������ʸ���ζ��̤򤹤뤫�ɤ�������ꤷ�ޤ���
bool �����ʤ�ж��̤��ޤ���

--- vi_editing_mode
�Խ��⡼�ɤ� vi �⡼�ɤˤ��ޤ����ܺ٤ϡ�GNU Readline �Υޥ˥奢��
�򻲾Ȥ��Ƥ���������

--- emacs_editing_mode
�Խ��⡼�ɤ� Emacs �⡼�ɤˤ��ޤ����ǥե���Ȥ� Emacs �⡼�ɤǤ���

�ܺ٤ϡ�GNU Readline �Υޥ˥奢��򻲾Ȥ��Ƥ���������

== Constants

--- FILENAME_COMPLETION_PROC
--- USERNAME_COMPLETION_PROC
�饤�֥����Ȥ߹��ߤ��Ѱդ��줿�䴰�� [[c:Proc]] ���֥������ȤǤ���
���줾��ե�����̾���桼��̾���䴰��Ԥ��ޤ���
[[m:readline#Readline.completion_proc=]] �ǻ��Ѥ��ޤ���

--- HISTORY
Readline�⥸�塼������Ϥ������Ƥ���������Ȥ��Ƶ�Ͽ����ޤ�(ͭ���ˤ�
�Ƥ���ФǤ�����[[m:readline#Readline.readline]] �򻲾�)

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
