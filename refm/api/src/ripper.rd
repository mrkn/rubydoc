require ripper/filter
require ripper/lexer
require ripper/sexp

Ruby �ץ�������Ϥ��뤿��Υ饤�֥��Ǥ���

= class Ripper

�ʲ��򻲾Ȥ��Ʋ�������

  * [[url:http://i.loveruby.net/w/RipperTutorial.html]]
  * [[url:http://i.loveruby.net/w/RipperTutorial.TokenStreamInterface.html]]

Ruby �ץ�����ƥ����ȤȤ��ư���������硢
�㤨�Х��������դ���Ԥ��������ϡ�
[[c:Ripper::Filter]] ���饹��Ȥ��Ȥ褤�Ǥ��礦��

== Class Methods

--- new(src, filename = "(ripper)", lineno = 1)
#@todo

Ripper ���֥������Ȥ�������ޤ���

������ src �ˤ� Ruby �ץ���� (ʸ����)��
������� filename �ˤ� src �Υե�����̾��
�軰���� lineno �ˤ� src �γ��Ϲ��ֹ�򡢤��줾��Ϳ���ޤ���

--- parse(src, filename = '(ripper)', lineno = 1)
#@todo

--- yydebug
--- yydebug=
#@todo

== Instance Methods

--- parse
#@todo

--- column
#@todo

--- lineno
#@todo

--- end_seen?
#@todo

== Private Instance Methods

--- warn(fmt, *args)
#@todo

--- warning(fmt, *args)
#@todo

--- compile_error(msg)
#@todo

== Constants

--- Version
#@todo

--- EVENTS 
#@todo

PARSER_EVENTS + SCANNER_EVENTS

--- PARSER_EVENTS
#@todo

�ѡ������٥�ȤΥ��٥�� ID (����ܥ�) �Υꥹ�Ȥ��֤��ޤ���

--- PARSER_EVENT_TABLE
#@todo

--- SCANNER_EVENTS
#@todo

������ʥ��٥�ȤΥ��٥�� ID (����ܥ�) �Υꥹ�Ȥ��֤��ޤ���

--- SCANNER_EVENT_TABLE
#@todo

