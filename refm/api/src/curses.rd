#@since 1.8.0

ü�����饤�֥�� curses �� Ruby ���󥿡��ե������Ǥ���

= module Curses

== Constants

--- REPORT_MOUSE_POSITION

--- ALL_MOUSE_EVENTS

--- A_ALTCHARSET

--- A_ATTRIBUTES

--- A_BLINK

--- A_BOLD

--- A_CHARTEXT

--- A_COLOR

--- A_DIM

--- A_HORIZONTAL

--- A_INVIS

--- A_LEFT

--- A_LOW

--- A_NORMAL

--- A_PROTECT

--- A_REVERSE

--- A_RIGHT

--- A_STANDOUT

--- A_TOP

--- A_UNDERLINE

--- A_VERTICAL

--- BUTTON1_CLICKED

--- BUTTON1_DOUBLE_CLICKED

--- BUTTON1_PRESSED

--- BUTTON1_RELEASED

--- BUTTON1_TRIPLE_CLICKED

--- BUTTON2_CLICKED

--- BUTTON2_DOUBLE_CLICKED

--- BUTTON2_PRESSED

--- BUTTON2_RELEASED

--- BUTTON2_TRIPLE_CLICKED

--- BUTTON3_CLICKED

--- BUTTON3_DOUBLE_CLICKED

--- BUTTON3_PRESSED

--- BUTTON3_RELEASED

--- BUTTON3_TRIPLE_CLICKED

--- BUTTON4_CLICKED

--- BUTTON4_DOUBLE_CLICKED

--- BUTTON4_PRESSED

--- BUTTON4_RELEASED

--- BUTTON4_TRIPLE_CLICKED

--- BUTTON_ALT

--- BUTTON_CTRL

--- BUTTON_SHIFT

--- COLOR_BLACK

--- COLOR_BLUE

--- COLOR_CYAN

--- COLOR_GREEN

--- COLOR_MAGENTA

--- COLOR_RED

--- COLOR_WHITE

--- COLOR_YELLOW

--- KEY_A1

--- KEY_A3

--- KEY_B2

--- KEY_BACKSPACE

--- KEY_BEG

--- KEY_BREAK

--- KEY_BTAB

--- KEY_C1

--- KEY_C3

--- KEY_CANCEL

--- KEY_CATAB

--- KEY_CLEAR

--- KEY_CLOSE

--- KEY_COMMAND

--- KEY_COPY

--- KEY_CREATE

--- KEY_CTAB

--- KEY_CTRL_A

--- KEY_CTRL_B

--- KEY_CTRL_C

--- KEY_CTRL_D

--- KEY_CTRL_E

--- KEY_CTRL_F

--- KEY_CTRL_G

--- KEY_CTRL_H

--- KEY_CTRL_I

--- KEY_CTRL_J

--- KEY_CTRL_K

--- KEY_CTRL_L

--- KEY_CTRL_M

--- KEY_CTRL_N

--- KEY_CTRL_O

--- KEY_CTRL_P

--- KEY_CTRL_Q

--- KEY_CTRL_R

--- KEY_CTRL_S

--- KEY_CTRL_T

--- KEY_CTRL_U

--- KEY_CTRL_V

--- KEY_CTRL_W

--- KEY_CTRL_X

--- KEY_CTRL_Y

--- KEY_CTRL_Z

--- KEY_DC

--- KEY_DL

--- KEY_DOWN

--- KEY_EIC

--- KEY_END

--- KEY_ENTER

--- KEY_EOL

--- KEY_EOS

--- KEY_EXIT

--- KEY_F0

--- KEY_F1

--- KEY_F10

--- KEY_F11

--- KEY_F12

--- KEY_F13

--- KEY_F14

--- KEY_F15

--- KEY_F16

--- KEY_F17

--- KEY_F18

--- KEY_F19

--- KEY_F2

--- KEY_F20

--- KEY_F21

--- KEY_F22

--- KEY_F23

--- KEY_F24

--- KEY_F25

--- KEY_F26

--- KEY_F27

--- KEY_F28

--- KEY_F29

--- KEY_F3

--- KEY_F30

--- KEY_F31

--- KEY_F32

--- KEY_F33

--- KEY_F34

--- KEY_F35

--- KEY_F36

--- KEY_F37

--- KEY_F38

--- KEY_F39

--- KEY_F4

--- KEY_F40

--- KEY_F41

--- KEY_F42

--- KEY_F43

--- KEY_F44

--- KEY_F45

--- KEY_F46

--- KEY_F47

--- KEY_F48

--- KEY_F49

--- KEY_F5

--- KEY_F50

--- KEY_F51

--- KEY_F52

--- KEY_F53

--- KEY_F54

--- KEY_F55

--- KEY_F56

--- KEY_F57

--- KEY_F58

--- KEY_F59

--- KEY_F6

--- KEY_F60

--- KEY_F61

--- KEY_F62

--- KEY_F63

--- KEY_F7

--- KEY_F8

--- KEY_F9

--- KEY_FIND

--- KEY_HELP

--- KEY_HOME

--- KEY_IC

--- KEY_IL

--- KEY_LEFT

--- KEY_LL

--- KEY_MARK

--- KEY_MAX

--- KEY_MESSAGE

--- KEY_MIN

--- KEY_MOUSE

--- KEY_MOVE

--- KEY_NEXT

--- KEY_NPAGE

--- KEY_OPEN

--- KEY_OPTIONS

--- KEY_PPAGE

--- KEY_PREVIOUS

--- KEY_PRINT

--- KEY_REDO

--- KEY_REFERENCE

--- KEY_REFRESH

--- KEY_REPLACE

--- KEY_RESET

--- KEY_RESIZE

--- KEY_RESTART

--- KEY_RESUME

--- KEY_RIGHT

--- KEY_SAVE

--- KEY_SBEG

--- KEY_SCANCEL

--- KEY_SCOMMAND

--- KEY_SCOPY

--- KEY_SCREATE

--- KEY_SDC

--- KEY_SDL

--- KEY_SELECT

--- KEY_SEND

--- KEY_SEOL

--- KEY_SEXIT

--- KEY_SF

--- KEY_SFIND

--- KEY_SHELP

--- KEY_SHOME

--- KEY_SIC

--- KEY_SLEFT

--- KEY_SMESSAGE

--- KEY_SMOVE

--- KEY_SNEXT

--- KEY_SOPTIONS

--- KEY_SPREVIOUS

--- KEY_SPRINT

--- KEY_SR

--- KEY_SREDO

--- KEY_SREPLACE

--- KEY_SRESET

--- KEY_SRIGHT

--- KEY_SRSUME

--- KEY_SSAVE

--- KEY_SSUSPEND

--- KEY_STAB

--- KEY_SUNDO

--- KEY_SUSPEND

--- KEY_UNDO

--- KEY_UP


== Module Functions

--- init_screen

�����꡼��� curses �Τ���˽�������ޤ���
Curses �⥸�塼��Τ��٤ƤΥ᥽�åɤϤ��Υ᥽�åɤ�
�ƤӽФ��Ƥ���Ǥʤ��ȻȤ��ޤ���

---  close_screen

curses �����꡼����Ĥ��ޤ�������ʸ� Curses �⥸�塼��
�Υ᥽�åɤ�ƤӽФ��Ȥ��٤��㳰�ˤʤ�ޤ���

--- stdscr

�������Τ�ɽ�� Curses::Window ���֥������Ȥ��֤��ޤ���

--- refresh

stdscr ��ɽ���򹹿����ޤ���

--- doupdate

��

--- clear

stdscr ��ʸ����õ�ޤ���
���ξõ�� refresh ���Ԥ����ˤ����¹Ԥ���ޤ���

--- echo

���ϤΥ�������ͭ���ˤ��ޤ���

--- noecho

���ϤΥ���������ޤ���

--- cbreak
--- crmode

�����ܡ������ϤΥХåե���󥰤���ޤ���

--- nocbreak
--- nocrmode

�����ܡ������ϤΥХåե���󥰤�ͭ���ˤ��ޤ���

--- nl

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
LF (Ctrl-j) ���֤��褦�ˤ��ޤ���

--- nonl

cooked �⡼�ɤΤȤ���return ���������Ϥ��Ф���
CR (Ctrl-m) ���֤��褦�ˤ��ޤ���

--- raw

�����ܡ������ϤΥХåե���󥰤� Ctrl-C �ʤɤ�
�ü쥭���ν�������ޤ� (raw �⡼��)��

--- noraw

�����ܡ������ϤΥХåե���󥰤� Ctrl-C �ʤ�
�ü쥭���ν�����Ԥ��褦�ˤ��ޤ� (cooked �⡼��)��

--- beep

����Ф��ޤ���
���ε�ǽ���ʤ��Ȥ���Ǥ�ñ��̵�뤵��ޤ���

--- flash

���̤������Ǥ����ޤ���
���ε�ǽ���ʤ��Ȥ���Ǥ�ñ��̵�뤵��ޤ���

--- getch

ɸ�����Ϥ��� 1 �Х����ɤ߹��ߤޤ���
����ͤ� ASCII �����ɤ�ɽ�������Ǥ���

--- getstr

ɸ�����Ϥ������ɤ߹��ߤޤ���
����ͤ�ʸ����Ǥ���

���Υ᥽�åɤ� getnstr() ����������Ƥ��ʤ�
�ץ�åȥۡ���ǤϥХåե������С��ե��򤪤������줬
����ޤ���

--- ungetch(ch)

ʸ�� ch (ASCII �����ɤ򼨤�����) �򥹥ȥ꡼����ᤷ�ޤ���

--- setpos(y, x)

stdscr �Υ���������ɸ (x,y) �˰�ư���ޤ���
��ɸ�ϤȤ�� 0 �������Ǥ���

ʸ�����ʤ����� setpos �������ε�ư�� OS �˰�¸���ޤ���

--- standout

�ʹ߽񤭹���ʸ����Ĵ���ޤ���
�ֶ�Ĵ�פ�ȿž�Ǥ��뤳�Ȥ�¿���褦�Ǥ�����
���������Ƥ���櫓�ǤϤ���ޤ���

--- standend

��Ĵ����ʸ���ν񤭹��ߤ򽪤��ޤ���

--- addch(ch)

stdscr �Υ�������ΰ��֤� ch (1 �Х���) ���񤭤��ޤ���

--- insch(ch)

stdscr �Υ�������ΰ��֤� ch (1 �Х���) ���������ޤ���

--- addstr(str)

stdscr �Υ�������ΰ��֤�ʸ���� str ���������ޤ���

--- delch

stdscr �Υ�������ΰ��֤��� 1 �Х��Ⱥ�����ޤ���

--- deleteln

stdscr �Υ������뤬����Ԥ���������ιԤ��˵ͤ�ޤ���

--- lines

���̤�ɽ����ǽ�ʹԿ����֤��ޤ���

--- cols

���̤�ɽ����ǽ�ʷ��(�Х���)���֤��ޤ���
�������ºݤˤϤ⤦ 1 �Х��Ⱦ��ʤ�����ɽ���Ǥ��ʤ��饤�֥�꤬
����褦�Ǥ���

--- inch

stdscr �Υ���������֤��� 1 �Х����ɤߤȤä��֤��ޤ���

#@since 1.8.3

--- clrtoeol

--- insertln

#@end

#@since 1.8.1

--- def_prog_mode

--- reset_prog_mode

--- timeout=

#@end

--- attroff(attrs)

--- attron(attron)

--- attrset(attrs)

--- bkgd(ch)

--- bkgdset(ch)

--- can_change_color?

--- closed?

--- color_content(color)

--- color_pair(attr)

--- curs_set(visibility)

--- delch

--- getmouse

--- has_colors?

--- init_color(color, r, g, b)

--- init_pair(pair, f, b)

--- keyname(c)

--- mouseinterval(interval)

--- mousemask(mask)

--- pair_content(pair)

--- pair_number(attrs)

--- resize(lin, col)
--- resizeterm(lin, col)

#@# ���Τ� resizeterm

--- scrl(n)

--- setscrreg(top, bottom)

--- start_color

--- ungetmouse(mevent)




#@include(curses/Curses__Key)
#@include(curses/Curses__MouseEvent)
#@include(curses/Curses__Window)

#@end
