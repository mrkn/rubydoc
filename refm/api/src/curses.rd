#@since 1.8.0

ü�����饤�֥�� curses �� Ruby ���󥿡��ե������Ǥ���

= module Curses

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

--- init_screen
#@todo

�����꡼��� curses �Τ���˽�������ޤ���
Curses �⥸�塼��Τ��٤ƤΥ᥽�åɤϤ��Υ᥽�åɤ�
�ƤӽФ��Ƥ���Ǥʤ��ȻȤ��ޤ���

---  close_screen
#@todo

curses �����꡼����Ĥ��ޤ�������ʸ� Curses �⥸�塼��
�Υ᥽�åɤ�ƤӽФ��Ȥ��٤��㳰�ˤʤ�ޤ���

--- stdscr
#@todo

�������Τ�ɽ�� Curses::Window ���֥������Ȥ��֤��ޤ���

--- refresh
#@todo

stdscr ��ɽ���򹹿����ޤ���

--- doupdate
#@todo

��

--- clear
#@todo

stdscr ��ʸ����õ�ޤ���
���ξõ�� refresh ���Ԥ����ˤ����¹Ԥ���ޤ���

--- echo
#@todo

���ϤΥ�������ͭ���ˤ��ޤ���

--- noecho
#@todo

���ϤΥ���������ޤ���

--- cbreak
--- crmode
#@todo

�����ܡ������ϤΥХåե���󥰤���ޤ���

--- nocbreak
--- nocrmode
#@todo

�����ܡ������ϤΥХåե���󥰤�ͭ���ˤ��ޤ���

--- nl
#@todo

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
LF (Ctrl-j) ���֤��褦�ˤ��ޤ���

--- nonl
#@todo

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
CR (Ctrl-m) ���֤��褦�ˤ��ޤ���

--- raw
#@todo

�����ܡ������ϤΥХåե���󥰤� Ctrl-C �ʤɤ�
�ü쥭���ν�������ޤ� (raw �⡼��)��

--- noraw
#@todo

�����ܡ������ϤΥХåե���󥰤� Ctrl-C �ʤ�
�ü쥭���ν�����Ԥ��褦�ˤ��ޤ� (cooked �⡼��)��

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

--- closed?
#@todo

--- color_content(color)
#@todo

--- color_pair(attr)
#@todo

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




#@include(curses/Curses__Key)
#@include(curses/Curses__MouseEvent)
#@include(curses/Curses__Window)

#@end
