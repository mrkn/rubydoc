#@since 1.8.0

Ruby �� curses �饤�֥��(�ʲ���Ruby curses)�ϡ�C �Υץ���फ��ü��
�β��̤����椹�뤿��� curses �饤�֥��(�ʲ���C curses)�����Ѥ��ơ�ü
���˰�¸���ʤ������ǥƥ����ȥ桼�����󥿥ե��������ۤ��뤿��Υ饤��
���Ǥ���

C curses �ˤϡ����Τ褦�ʼ���������ޤ���
#@# ���Ѳ�ǽ�� curses �μ����򸫤Ĥ����顢����ɲä��Ƥ���������

  * [[url:http://www.gnu.org/software/ncurses/ncurses.html]]
  * [[url:http://pdcurses.sourceforge.net/]]

Ruby curses ��Ȥäƥƥ����ȥ桼�����󥿥ե�����(�ʲ���TUI)��
���ۤ���ή��ϼ��Τ褦�ˤʤ�ޤ���

  (1) [[m:Curses.#init_screen]] �ǽ������Ԥ��ޤ���
  (2) [[c:Curses]] �Υ⥸�塼��ؿ���Ȥ���
  ���ϤΥ�������̵���ˤ���ʤɤ� Ruby curses �������Ԥ��ޤ���
  (3) [[m:Curses.#stdscr]] �䤽�Υ��֥�����ɥ�������TUI ���ۤ��ޤ���
  (4) [[m:Curses.#getch]] �� [[m:Curses.#getstr]] �ˤ�ꡢ
  �桼����������Ϥ�������ޤ������Ϥ�������˽��äƽ�����Ԥ���
  �����ơ����Ϥ��ԤĤȤ������Ȥ򷫤��֤��ޤ���
  (5) �Ǹ�� [[m:Curses.#close_screen]] �ǽ�λ������Ԥ��ޤ���

��: ��������ˡ�Hello World!�פ�ɽ�������������Ϥ�����Ƚ�λ���롣

  require "curses"
  
  Curses.init_screen
  begin
    s = "Hello World!"
    Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (s.length / 2))
    Curses.addstr(s)
    Curses.refresh
    Curses.getch
  ensure
    Curses.close_screen
  end

��: �嵭�����Ʊ�ͤ�����Curses �⥸�塼��� include ������

  require "curses"

  include Curses
  
  init_screen
  begin
    s = "Hello World!"
    setpos(lines / 2, cols / 2 - (s.length / 2))
    addstr(s)
    refresh
    getch
  ensure
    close_screen
  end

�ʤ���C curses �����ѤǤ��ʤ��Ķ��� Ruby �򥳥�ѥ��뤷�Ƥ����硢
Ruby curses �����ѤǤ��ޤ���
���ѤǤ��ʤ���硢require �λ������㳰 LoadError ��ȯ�����ޤ���

  foo:1:in `require': no such file to load -- curses (LoadError)
          from foo:1:in `<main>'

Ruby curses �����ˤ�äƤϡ�
���Ѥ��� C curses ���󶡤��Ƥ��ʤ���ǽ��Ȥ���Τ�����ޤ���
���Τ褦������Ԥä���硢�㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�����Ĥ��������㳰 SecurityError ��ȯ�����ޤ���

= module Curses

Curses �⥸�塼��� [[c:Curses::Window]] ���饹�ϡ�curses �饤�֥������Ѥ��ơ�
ü���˰�¸���ʤ������ǥƥ����ȥ桼�����󥿥ե�����������Ǥ��ޤ���
curses �饤�֥��Ȥϡ�
C �Υץ���फ��ü���Υǥ����ץ쥤���̤����椹�뤿��Υ饤�֥��Τ��Ȥǡ�
���Τ褦�ʼ���������ޤ���
#@# ���Ѳ�ǽ�� curses �μ����򸫤Ĥ����顢����ɲä��Ƥ���������

  * [[url:http://pdcurses.sourceforge.net/]]
  * [[url:http://www.gnu.org/software/ncurses/ncurses.html]]

�ܥ⥸�塼���Ȥäƥƥ����ȥ桼�����󥿥ե��������������ή��ϼ��Τ褦�ˤʤ�ޤ���

  (1) [[m:Curses.#init_screen]] �ǽ������Ԥ��ޤ���
  (2) [[c:Curses]] �Υ⥸�塼��ؿ���Ȥäơ�
  ���ϤΥ�������̵���ˤ���ʤɤ� curses �������Ԥ��ޤ���
  (3) [[m:Curses.#stdscr]] �� [[c:Curses::Window]] ���֥������Ȥ��������
  �����Ȥäƥ��󥿥ե��������ۤ��롣
  (4) [[m:Curses.#getch]] �� [[m:Curses.#getstr]] �ˤ�ꡢ
  �桼����������Ϥ�������ޤ������Ϥ�������˽��äƽ�����Ԥ���
  �����ơ����Ϥ��ԤĤȤ������Ȥ򷫤��֤��ޤ���
  (5) �Ǹ�� [[m:Curses.#close_screen]] �ǽ�λ������Ԥ��ޤ���

��: ��������ˡ�Hello World!�פ�ɽ�������������Ϥ�����Ƚ�λ���롣

  require "curses"
  
  Curses.init_screen
  begin
    s = "Hello World!"
    Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (s.length / 2))
    Curses.addstr(s)
    Curses.refresh
    Curses.getch
  ensure
    Curses.close_screen
  end

�ʤ���curses �� ncurses �򥤥󥹥ȡ��뤷�Ƥ��ʤ��Ķ��Ǥϡ�
�ܥ⥸�塼������ѤǤ��ޤ���
���ѤǤ��ʤ���硢require �λ����ǰʲ��Τ褦���㳰��ȯ�����ޤ���

  foo:1:in `require': no such file to load -- bar (LoadError)
          from foo:1:in `<main>'

�����Ĥ������ˤ����ơ����ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ�
�㳰 NotImplementError ��ȯ�����ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�ۤȤ�ɤ������㳰 SecurityError ��ȯ�����ޤ���

== Constants

--- REPORT_MOUSE_POSITION
#@todo

--- ALL_MOUSE_EVENTS
#@todo

--- A_ALTCHARSET
#@todo

--- A_ATTRIBUTES
#@todo

--- A_BLINK
#@todo

--- A_BOLD
#@todo

--- A_CHARTEXT
#@todo

--- A_COLOR
#@todo

--- A_DIM
#@todo

--- A_HORIZONTAL
#@todo

--- A_INVIS
#@todo

--- A_LEFT
#@todo

--- A_LOW
#@todo

--- A_NORMAL
#@todo

--- A_PROTECT
#@todo

--- A_REVERSE
#@todo

--- A_RIGHT
#@todo

--- A_STANDOUT
#@todo

--- A_TOP
#@todo

--- A_UNDERLINE
#@todo

--- A_VERTICAL
#@todo

--- BUTTON1_CLICKED
#@todo

--- BUTTON1_DOUBLE_CLICKED
#@todo

--- BUTTON1_PRESSED
#@todo

--- BUTTON1_RELEASED
#@todo

--- BUTTON1_TRIPLE_CLICKED
#@todo

--- BUTTON2_CLICKED
#@todo

--- BUTTON2_DOUBLE_CLICKED
#@todo

--- BUTTON2_PRESSED
#@todo

--- BUTTON2_RELEASED
#@todo

--- BUTTON2_TRIPLE_CLICKED
#@todo

--- BUTTON3_CLICKED
#@todo

--- BUTTON3_DOUBLE_CLICKED
#@todo

--- BUTTON3_PRESSED
#@todo

--- BUTTON3_RELEASED
#@todo

--- BUTTON3_TRIPLE_CLICKED
#@todo

--- BUTTON4_CLICKED
#@todo

--- BUTTON4_DOUBLE_CLICKED
#@todo

--- BUTTON4_PRESSED
#@todo

--- BUTTON4_RELEASED
#@todo

--- BUTTON4_TRIPLE_CLICKED
#@todo

--- BUTTON_ALT
#@todo

--- BUTTON_CTRL
#@todo

--- BUTTON_SHIFT
#@todo

--- COLOR_BLACK
#@todo

--- COLOR_BLUE
#@todo

--- COLOR_CYAN
#@todo

--- COLOR_GREEN
#@todo

--- COLOR_MAGENTA
#@todo

--- COLOR_RED
#@todo

--- COLOR_WHITE
#@todo

--- COLOR_YELLOW
#@todo

--- KEY_A1
#@todo

--- KEY_A3
#@todo

--- KEY_B2
#@todo

--- KEY_BACKSPACE
#@todo

--- KEY_BEG
#@todo

--- KEY_BREAK
#@todo

--- KEY_BTAB
#@todo

--- KEY_C1
#@todo

--- KEY_C3
#@todo

--- KEY_CANCEL
#@todo

--- KEY_CATAB
#@todo

--- KEY_CLEAR
#@todo

--- KEY_CLOSE
#@todo

--- KEY_COMMAND
#@todo

--- KEY_COPY
#@todo

--- KEY_CREATE
#@todo

--- KEY_CTAB
#@todo

--- KEY_CTRL_A
#@todo

--- KEY_CTRL_B
#@todo

--- KEY_CTRL_C
#@todo

--- KEY_CTRL_D
#@todo

--- KEY_CTRL_E
#@todo

--- KEY_CTRL_F
#@todo

--- KEY_CTRL_G
#@todo

--- KEY_CTRL_H
#@todo

--- KEY_CTRL_I
#@todo

--- KEY_CTRL_J
#@todo

--- KEY_CTRL_K
#@todo

--- KEY_CTRL_L
#@todo

--- KEY_CTRL_M
#@todo

--- KEY_CTRL_N
#@todo

--- KEY_CTRL_O
#@todo

--- KEY_CTRL_P
#@todo

--- KEY_CTRL_Q
#@todo

--- KEY_CTRL_R
#@todo

--- KEY_CTRL_S
#@todo

--- KEY_CTRL_T
#@todo

--- KEY_CTRL_U
#@todo

--- KEY_CTRL_V
#@todo

--- KEY_CTRL_W
#@todo

--- KEY_CTRL_X
#@todo

--- KEY_CTRL_Y
#@todo

--- KEY_CTRL_Z
#@todo

--- KEY_DC
#@todo

--- KEY_DL
#@todo

--- KEY_DOWN
#@todo

--- KEY_EIC
#@todo

--- KEY_END
#@todo

--- KEY_ENTER
#@todo

--- KEY_EOL
#@todo

--- KEY_EOS
#@todo

--- KEY_EXIT
#@todo

--- KEY_F0
#@todo

--- KEY_F1
#@todo

--- KEY_F10
#@todo

--- KEY_F11
#@todo

--- KEY_F12
#@todo

--- KEY_F13
#@todo

--- KEY_F14
#@todo

--- KEY_F15
#@todo

--- KEY_F16
#@todo

--- KEY_F17
#@todo

--- KEY_F18
#@todo

--- KEY_F19
#@todo

--- KEY_F2
#@todo

--- KEY_F20
#@todo

--- KEY_F21
#@todo

--- KEY_F22
#@todo

--- KEY_F23
#@todo

--- KEY_F24
#@todo

--- KEY_F25
#@todo

--- KEY_F26
#@todo

--- KEY_F27
#@todo

--- KEY_F28
#@todo

--- KEY_F29
#@todo

--- KEY_F3
#@todo

--- KEY_F30
#@todo

--- KEY_F31
#@todo

--- KEY_F32
#@todo

--- KEY_F33
#@todo

--- KEY_F34
#@todo

--- KEY_F35
#@todo

--- KEY_F36
#@todo

--- KEY_F37
#@todo

--- KEY_F38
#@todo

--- KEY_F39
#@todo

--- KEY_F4
#@todo

--- KEY_F40
#@todo

--- KEY_F41
#@todo

--- KEY_F42
#@todo

--- KEY_F43
#@todo

--- KEY_F44
#@todo

--- KEY_F45
#@todo

--- KEY_F46
#@todo

--- KEY_F47
#@todo

--- KEY_F48
#@todo

--- KEY_F49
#@todo

--- KEY_F5
#@todo

--- KEY_F50
#@todo

--- KEY_F51
#@todo

--- KEY_F52
#@todo

--- KEY_F53
#@todo

--- KEY_F54
#@todo

--- KEY_F55
#@todo

--- KEY_F56
#@todo

--- KEY_F57
#@todo

--- KEY_F58
#@todo

--- KEY_F59
#@todo

--- KEY_F6
#@todo

--- KEY_F60
#@todo

--- KEY_F61
#@todo

--- KEY_F62
#@todo

--- KEY_F63
#@todo

--- KEY_F7
#@todo

--- KEY_F8
#@todo

--- KEY_F9
#@todo

--- KEY_FIND
#@todo

--- KEY_HELP
#@todo

--- KEY_HOME
#@todo

--- KEY_IC
#@todo

--- KEY_IL
#@todo

--- KEY_LEFT
#@todo

--- KEY_LL
#@todo

--- KEY_MARK
#@todo

--- KEY_MAX
#@todo

--- KEY_MESSAGE
#@todo

--- KEY_MIN
#@todo

--- KEY_MOUSE
#@todo

--- KEY_MOVE
#@todo

--- KEY_NEXT
#@todo

--- KEY_NPAGE
#@todo

--- KEY_OPEN
#@todo

--- KEY_OPTIONS
#@todo

--- KEY_PPAGE
#@todo

--- KEY_PREVIOUS
#@todo

--- KEY_PRINT
#@todo

--- KEY_REDO
#@todo

--- KEY_REFERENCE
#@todo

--- KEY_REFRESH
#@todo

--- KEY_REPLACE
#@todo

--- KEY_RESET
#@todo

--- KEY_RESIZE
#@todo

--- KEY_RESTART
#@todo

--- KEY_RESUME
#@todo

--- KEY_RIGHT
#@todo

--- KEY_SAVE
#@todo

--- KEY_SBEG
#@todo

--- KEY_SCANCEL
#@todo

--- KEY_SCOMMAND
#@todo

--- KEY_SCOPY
#@todo

--- KEY_SCREATE
#@todo

--- KEY_SDC
#@todo

--- KEY_SDL
#@todo

--- KEY_SELECT
#@todo

--- KEY_SEND
#@todo

--- KEY_SEOL
#@todo

--- KEY_SEXIT
#@todo

--- KEY_SF
#@todo

--- KEY_SFIND
#@todo

--- KEY_SHELP
#@todo

--- KEY_SHOME
#@todo

--- KEY_SIC
#@todo

--- KEY_SLEFT
#@todo

--- KEY_SMESSAGE
#@todo

--- KEY_SMOVE
#@todo

--- KEY_SNEXT
#@todo

--- KEY_SOPTIONS
#@todo

--- KEY_SPREVIOUS
#@todo

--- KEY_SPRINT
#@todo

--- KEY_SR
#@todo

--- KEY_SREDO
#@todo

--- KEY_SREPLACE
#@todo

--- KEY_SRESET
#@todo

--- KEY_SRIGHT
#@todo

--- KEY_SRSUME
#@todo

--- KEY_SSAVE
#@todo

--- KEY_SSUSPEND
#@todo

--- KEY_STAB
#@todo

--- KEY_SUNDO
#@todo

--- KEY_SUSPEND
#@todo

--- KEY_UNDO
#@todo

--- KEY_UP
#@todo


== Module Functions

--- init_screen -> Curses::Window
--- stdscr -> Curses::Window

ü���μ���� curses �˴ؤ���ǡ����������������̤򥯥ꥢ���ޤ���
stdscr �ȸƤФ��������Τ�ɽ��������ɥ����֤��ޤ���

ncurses �����Ѥ��Ƥ����硢
���Υ᥽�åɤ˼��Ԥ����ɸ�२�顼���Ϥ˥��顼��å���������Ϥ�����λ���ޤ���
�����Ǥʤ���硢���Υ᥽�åɤ˼��Ԥ�����㳰 RuntimeError ��ȯ�����ޤ���

�ܤ����ϡ� man �ڡ����� curs_initscr(3X) �� initscr �ؿ��ȡ�
curs_clear(3X) �� clear �ؿ��򻲾Ȥ���������

[[c:Curses]] �Τ����Ĥ��Υ᥽�åɤϡ������Ǥ��Υ᥽�åɤ�ƤӽФ��ޤ���
����ˤ�ꡢ���Υ᥽�åɤ�ƤӽФ��Ƥ��ʤ����Ǥ⡢
�����Ĥ��ν�����Ǥ���褦�ˤʤäƤ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Curses.#close_screen]]

--- close_screen -> nil

curses �ν�λ������Ԥ��ޤ���
ü���ξ��֤��������������������ü�˰�ư�����ޤ���

�ܤ����ϡ� man �ڡ����� curs_initscr(3X) �� endwin �ؿ��򻲾Ȥ���������

@see [[m:Curses.#init_screen]]��[[m:Curses.#stdscr]]

--- closed? -> bool

curses ����λ���Ƥ��뤫�ɤ������֤��ޤ���

�ܤ����ϡ� man �ڡ����� curs_initscr(3X) �� isendwin �ؿ��򻲾Ȥ���������

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

@see [[m:Curses.#close_screen]]

--- clear -> nil

�������Τ�ɽ��������ɥ� stdscr ��ʸ����õ�����̤򥯥ꥢ���ޤ���
���̤Υ��ꥢ��ȿ�Ǥ����뤿��ˡ�
�ܥ᥽�åɤΤ��Ȥ� [[m:Curses.#refresh]] ��ƤӽФ�ɬ�פϤ���ޤ���

�ܤ����ϡ� man �ڡ����� curs_clear(3X) �� clear �ؿ��򻲾Ȥ���������

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- refresh -> nil

�������Τ�ɽ��������ɥ� stdscr ��ɽ���򹹿����ޤ���

�ܤ����ϡ� man �ڡ����� curs_refresh(3X) �� refresh �ؿ��򻲾Ȥ���������

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- doupdate -> nil

�������Τ�ɽ��������ɥ� stdscr ��ɽ���򹹿����ޤ���
[[m:Curses.#refresh]] �ʾ��ǽΨ�ɤ�����������Ԥ��ޤ���

�ܤ����ϡ� man �ڡ����� curs_refresh(3X) �� doupdate �ؿ��򻲾Ȥ���������

���Ѥ��Ƥ��� curses �Υ饤�֥�꤬ doupdate �ؿ����󶡤��Ƥ��ʤ���硢
doupdate �ؿ�������ˡ�refresh �ؿ���ƤӽФ��ޤ���

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- echo -> nil

�桼�����������Ƥ���̤�ɽ������褦�ˤ��ޤ���
�Ĥޤꡢ���ϤΥ�������ͭ���ˤ��ޤ���

�ܤ����ϡ� man �ڡ����� curs_inopts(3X) �� echo �ؿ��򻲾Ȥ���������

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- noecho

�桼�����������Ƥ���̤�ɽ�����ʤ��褦�ˤ��ޤ���
�Ĥޤꡢ���ϤΥ�������ߤ�ޤ���

�ܤ����ϡ� man �ڡ����� curs_inopts(3X) �� noecho �ؿ��򻲾Ȥ���������

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

--- cbreak -> nil
--- crmode -> nil

�����ܡ������ϤΥХåե���󥰤��ᡢ�桼�������Ϥ�¨�¤˽����Ǥ���褦�ˤ��ޤ���

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Curses.#nocbreak]]��[[m:Curses.#nocrmode]]

--- nocbreak -> nil
--- nocrmode -> nil

�̾��ü���Τ褦�ˡ������ܡ������ϤΥХåե���󥰤�ͭ���ˤ��ޤ���
�桼�������Ϥϥ��󥿡������ʤɤ򲡤��ޤǽ����Ǥ��ޤ���
���ξ��֤Τ��Ȥ��coocked�ץ⡼�ɤȤ����ޤ���

���Υ᥽�åɤ���� [[m:Curses.#init_screen]] ��ƤӽФ��ޤ���

�����ե�٥� ($SAFE) �� 4 �ξ�硢�㳰 SecurityError ��ȯ�����ޤ���

@see [[m:Curses.#cbreak]]��[[m:Curses.#crmode]]

--- raw -> nil

[[m:Curses.#cbreak]] ��Ʊ�ͤˡ������ܡ������ϤΥХåե���󥰤��ᡢ
�桼�������Ϥ�¨�¤˽����Ǥ���褦�ˤ��ޤ����ʤ����ġ�
������(Ctrl-C)�������ڥ��(Ctrl-Z) �ʤɤ��ü쥭���ν�������ޤ���
���ξ��֤Τ��Ȥ��raw�ץ⡼�ɤȤ����ޤ���

@see [[m:Curses.#cbreak]]��[[m:Curses.#noraw]]

--- noraw -> nil

raw �⡼�ɤ�ȴ�����̾�ξ��֤ˤ��ޤ���
�Ĥޤꡢ�����ܡ������ϤΥХåե���󥰤�Ԥ���
������(Ctrl-C)�������ڥ��(Ctrl-Z) �ʤɤ��ü쥭���ν�����Ԥ��褦�ˤ��ޤ���

@see [[m:Curses.#raw]]

--- nl -> nil
#@todo

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
LF (Ctrl-j) ���֤��褦�ˤ��ޤ���

�ܤ����ϡ� man �ڡ����� curs_outopts(3X) �� nl �ؿ��򻲾Ȥ���������

--- nonl
#@todo

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
CR (Ctrl-m) ���֤��褦�ˤ��ޤ���

�ܤ����ϡ� man �ڡ����� curs_outopts(3X) �� nonl �ؿ��򻲾Ȥ���������

--- beep
#@todo

����Ф��ޤ���
���ε�ǽ���ʤ��Ȥ���Ǥ�ñ��̵�뤵��ޤ���

--- flash
#@todo

���̤������Ǥ����ޤ���
���ε�ǽ���ʤ��Ȥ���Ǥ�ñ��̵�뤵��ޤ���

--- getch
#@todo

ɸ�����Ϥ��� 1 �Х����ɤ߹��ߤޤ���
����ͤ� ASCII �����ɤ�ɽ�������Ǥ���

--- getstr
#@todo

ɸ�����Ϥ������ɤ߹��ߤޤ���
����ͤ�ʸ����Ǥ���

���Υ᥽�åɤ� getnstr() ����������Ƥ��ʤ�
�ץ�åȥۡ���ǤϥХåե������С��ե��򤪤������줬
����ޤ���

--- ungetch(ch)
#@todo

ʸ�� ch (ASCII �����ɤ򼨤�����) �򥹥ȥ꡼����ᤷ�ޤ���

--- setpos(y, x)
#@todo

stdscr �Υ���������ɸ (x,y) �˰�ư���ޤ���
��ɸ�ϤȤ�� 0 �������Ǥ���

ʸ�����ʤ����� setpos �������ε�ư�� OS �˰�¸���ޤ���

--- standout
#@todo

�ʹ߽񤭹���ʸ����Ĵ���ޤ���
�ֶ�Ĵ�פ�ȿž�Ǥ��뤳�Ȥ�¿���褦�Ǥ�����
���������Ƥ���櫓�ǤϤ���ޤ���

--- standend
#@todo

��Ĵ����ʸ���ν񤭹��ߤ򽪤��ޤ���

--- addch(ch)
#@todo

stdscr �Υ�������ΰ��֤� ch (1 �Х���) ���񤭤��ޤ���

--- insch(ch)
#@todo

stdscr �Υ�������ΰ��֤� ch (1 �Х���) ���������ޤ���

--- addstr(str)
#@todo

stdscr �Υ�������ΰ��֤�ʸ���� str ���������ޤ���

--- delch
#@todo

stdscr �Υ�������ΰ��֤��� 1 �Х��Ⱥ�����ޤ���

--- deleteln
#@todo

stdscr �Υ������뤬����Ԥ���������ιԤ��˵ͤ�ޤ���

--- lines
#@todo

���̤�ɽ����ǽ�ʹԿ����֤��ޤ���

--- cols
#@todo

���̤�ɽ����ǽ�ʷ��(�Х���)���֤��ޤ���
�������ºݤˤϤ⤦ 1 �Х��Ⱦ��ʤ�����ɽ���Ǥ��ʤ��饤�֥�꤬
����褦�Ǥ���

--- inch
#@todo

stdscr �Υ���������֤��� 1 �Х����ɤߤȤä��֤��ޤ���

#@since 1.8.3

--- clrtoeol
#@todo

--- insertln
#@todo

#@end

#@since 1.8.1

--- def_prog_mode
#@todo

--- reset_prog_mode
#@todo

--- timeout=
#@todo

#@end

--- attroff(attrs)
#@todo

--- attron(attron)
#@todo

--- attrset(attrs)
#@todo

--- bkgd(ch)
#@todo

--- bkgdset(ch)
#@todo

--- can_change_color?
#@todo

#@since 1.9.2
--- colors -> Integer
#@todo

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

@raise NotImplementError

#@end
--- color_content(color)
#@todo

--- color_pair(attr)
#@todo

#@since 1.9.2
--- color_pairs -> Integer
#@todo

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

@raise NotImplementError

#@end
--- curs_set(visibility)
#@todo

--- delch
#@todo

--- getmouse
#@todo

--- has_colors?
#@todo

--- init_color(color, r, g, b)
#@todo

--- init_pair(pair, f, b)
#@todo

--- keyname(c)
#@todo

--- mouseinterval(interval)
#@todo

--- mousemask(mask)
#@todo

--- pair_content(pair)
#@todo

--- pair_number(attrs)
#@todo

--- resize(lin, col)
--- resizeterm(lin, col)
#@todo

#@# ���Τ� resizeterm

--- scrl(n)
#@todo

--- setscrreg(top, bottom)
#@todo

--- start_color
#@todo

--- ungetmouse(mevent)
#@todo

--- ESCDELAY -> Integer

ESC �����Ϥ��˴��������(�ߥ���ñ��)��������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

--- ESCDELAY=(val) -> Integer

ESC �����Ϥ��˴��������(�ߥ���ñ��)�� val �����ꤷ�ޤ���
���ꤷ���ͤ��֤��ޤ���

@param val ESC �����Ϥ��˴��������(�ߥ���ñ��)����ꤷ�ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

--- TABSIZE -> Integer

��������������ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

--- TABSIZE=(val) -> Integer

�������� val �����ꤷ�ޤ������ꤷ���ͤ��֤��ޤ���

@param val ����������ꤷ�ޤ���

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���


--- use_default_colors -> nil

���ʿ����طʿ���ü���Υǥե������ (-1) �����ꤷ�ޤ���

�ܺ٤� man �ڡ����� defualt_colors(3X) �򻲾Ȥ���������

���ݡ��Ȥ��Ƥ��ʤ��Ķ��Ǥϡ��㳰 NotImplementError ��ȯ�����ޤ���

#@include(curses/Curses__Key)
#@include(curses/Curses__MouseEvent)
#@include(curses/Curses__Window)

#@end
