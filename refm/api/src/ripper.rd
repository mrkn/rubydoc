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

Ripper ���֥������Ȥ�������ޤ���

������ src �ˤ� Ruby �ץ���� (ʸ����)��
������� filename �ˤ� src �Υե�����̾��
�軰���� lineno �ˤ� src �γ��Ϲ��ֹ�򡢤��줾��Ϳ���ޤ���

--- lex(src, filename = '-', lineno = 1)
--- lex(src, filename = '-', lineno = 1)
#@# �� [((Integer,Integer), Symbol, String)] 

Ruby �ץ���� str ��ȡ������ʬ�䤷�����Υꥹ�Ȥ��֤��ޤ���
������ tokenize �Ȱ㤤���ȡ�����μ���Ȱ��־������°���ޤ���

������

  require 'ripper'
  require 'pp'

  pp Ripper.lex("def m(a) nil end")
      #=> [[[1, 0], :on_kw, "def"],
           [[1, 3], :on_sp, " "],
           [[1, 4], :on_ident, "m"],
           [[1, 5], :on_lparen, "("],
           [[1, 6], :on_ident, "a"],
           [[1, 7], :on_rparen, ")"],
           [[1, 8], :on_sp, " "],
           [[1, 9], :on_kw, "nil"],
           [[1, 12], :on_sp, " "],
           [[1, 13], :on_kw, "end"]]

Ripper.lex ��ʬ�䤷���ȡ������ܤ�������ȤȤ���֤��ޤ���
�֤��ͤ���������Ǥ� 3 ���Ǥ����� (��ǰŪ�ˤϥ��ץ�) �Ǥ���
����������ʲ��˼����ޤ���

:���־��� (Integer,Integer) 
    �ȡ������֤���Ƥ���� (1-origin) �ȷ� (0-origin) �� 2 ���Ǥ�����Ǥ��� 
:���� (Symbol) 
    �ȡ�����μ��ब��:on_XXX�פη����Υ���ܥ���Ϥ���ޤ���
:�ȡ����� (String) 
    �ȡ�����ʸ����Ǥ���

--- parse(src, filename = '(ripper)', lineno = 1)

--- sexp(src, filename = '-', lineno = 1)

--- sexp_raw(src, filename = '-', lineno = 1)

--- slice(src, pattern, n = 0)
#@# �� String

Ruby �ץ����ʸ���� src ����
pattern �� n ���ܤγ�̤˥ޥå�����ƥ����Ȥ��֤��ޤ���
��������n �� 0 �ΤȤ��� pattern ���Τ�ɽ���ޤ���

pattern �ϥ��٥�� ID �ޤ��ϥ᥿�ѥ��������󤷤�ʸ�����ɽ�����ޤ���
�᥿�ѥ�����ˤ� Ruby ������ɽ����Ʊ���᥿���椬�Ȥ��ޤ���

������

  p Ripper.slice(%(<<HERE\nstring\#{nil}\nHERE),
                 "heredoc_beg .*? nl $(.*?) heredoc_end", 1)
      # => "string\#{nil}\n"

--- token_match(src, pattern)

--- tokenize(src, filename = '-', lineno = 1)
#@# �� [String]

Ruby �ץ���� str ��ȡ������ʬ�䤷�����Υꥹ�Ȥ��֤��ޤ���

������

  require 'ripper'
  p Ripper.tokenize("def m(a) nil end")
      #=> ["def", " ", "m", "(", "a", ")", " ", "nil", " ", "end"]

Ripper.tokenize �϶���䥳���Ȥ�ޤᡢ
����ʸ����ˤ���ʸ���� 1 �Х��Ȥ�Ĥ�����ʬ�䤷�ޤ���
�������������Ϥ����㳰�Ȥ��ơ�__END__ �ʹߤ�ʸ������ۤäƼΤƤ��ޤ���
����ϸ��ߤΤȤ�����ͤȹͤ��Ƥ���������

--- yydebug
--- yydebug=

== Instance Methods

--- parse

--- column

--- lineno

--- end_seen?

== Private Instance Methods

--- warn(fmt, *args)

--- warning(fmt, *args)

--- compile_error(msg)

== Constants

--- Version

--- EVENTS 

PARSER_EVENTS + SCANNER_EVENTS

--- PARSER_EVENTS

�ѡ������٥�ȤΥ��٥�� ID (����ܥ�) �Υꥹ�Ȥ��֤��ޤ���

--- PARSER_EVENT_TABLE

--- SCANNER_EVENTS

������ʥ��٥�ȤΥ��٥�� ID (����ܥ�) �Υꥹ�Ȥ��֤��ޤ���

--- SCANNER_EVENT_TABLE

