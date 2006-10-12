#@since 1.9
= class Ripper

((<��ɮ���罸>))

�ʲ��򻲾Ȥ��Ʋ�������

  * [[url:http://i.loveruby.net/w/RipperTutorial.html]]
  * [[url:http://i.loveruby.net/w/RipperTutorial.TokenStreamInterface.html]]

Ruby �ץ�����ƥ����ȤȤ��ư���������硢�㤨�Х��������դ���Ԥ��������ϡ�
[[c:Ripper::Filter]] �����Ѥ�Ƥ����Ȥ褤�Ǥ��礦��

== Class Methods

--- new(src, filename = "(ripper)", lineno = 1)

--- lex(src, filename = '-', lineno = 1)
--- lex(src, filename = '-', lineno = 1)
�� [((Integer,Integer), Symbol, String)] 

Ruby �ץ���� str ��ȡ������ʬ�䤷�����Υꥹ�Ȥ��֤��������� tokenize �Ȱ㤤���ȡ�����μ���Ȱ��־������Ӥ��롣 

������
  require 'ripper'
  require 'pp'

  pp Ripper.scan("def m(a) nil end")
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

Ripper.scan ��ʬ�䤷���ȡ������ܤ�������ȤȤ���֤��ޤ����֤��ͤ���������Ǥ� 3 ���Ǥ����� (��ǰŪ�ˤϥ��ץ�) �Ǥ�������������ʲ��˼����ޤ���

:���־��� (Integer,Integer) 
  �ȡ������֤���Ƥ���� (1-origin) �ȷ� (0-origin) �� 2 ���Ǥ����� 
:���� (Symbol) 
  ��:on_XXX�פη�����ɽ����롢�ȡ�����μ��ࡣ 
:�ȡ����� (String) 
  �ȡ�����ʸ����

--- parse(src, filename = '(ripper)', lineno = 1)

--- sexp(src, filename = '-', lineno = 1)

--- slice(src, pattern, n = 0)
�� String
pattern ������ɽ���˥���ѥ��뤷��src ��ʸ����˥���ѥ��뤷�ơ�����ɽ���ޥå���Ԥ���
�����ơ�n ���ܤΥ��å������Ф�

������

  p Ripper.slice(%(<<HERE\nstring\#{nil}\nHERE),
                 "heredoc_beg .*? nl $(.*?) heredoc_end", 1)
  # => "string\#{nil}\n"

--- token_match(src, pattern)

--- tokenize(src, filename = '-', lineno = 1)
�� [String]
Ruby �ץ���� str ��ȡ������ʬ�䤷�����Υꥹ�Ȥ��֤��� 

������

  require 'ripper'
  p Ripper.tokenize("def m(a) nil end")
      #=> ["def", " ", "m", "(", "a", ")", " ", "nil", " ", "end"]

Ripper.tokenize �ϺǤ�ñ��ʥȡ����󥹥ȥ꡼�� API �Ǥ����ä��������뤳�ȤϤ���ޤ���

Ripper.tokenize �϶���䥳���Ȥ�ޤᡢ����ʸ����ˤ���ʸ���� 1 �Х��Ȥ�Ĥ�����ʬ�䤷�ޤ��������Τ����Ϥ����㳰�Ȥ��ơ�__END__ �ʹߤ�ʸ������ۤäƼΤƤ��ޤ�������ϸ��ߤΤȤ�����ͤȹͤ��Ƥ���������

--- yydebug
--- yydebug=

== Instance Methods

--- parse

--- column

--- lineno

== Constants

--- Version

--- EVENTS 

PARSER_EVENTS + SCANNER_EVENTS

--- PARSER_EVENTS

--- PARSER_EVENT_TABLE

--- SCANNER_EVENTS

--- SCANNER_EVENT_TABLE

= class Ripper::Filter

���٥�ȥɥ�֥󥤥󥿡��ե���������ĥ��饹��

������

  require 'ripper'
  require 'cgi'
  
  class Ruby2HTML < Ripper::Filter
    def on_default(event, tok, f)
      f << CGI.escapeHTML(tok)
    end
  
    def on_comment(tok, f)
      f << %Q[<span class="comment">#{CGI.escapeHTML(tok)}</span>]
    end
  
    def on_tstring_beg(tok, f)
      f << %Q[<span class="string">#{CGI.escapeHTML(tok)}]
    end
  
    def on_tstring_end(tok, f)
      f << %Q[#{CGI.escapeHTML(tok)}</span>]
    end
  end
  
  Ruby2HTML.new(ARGF).parse('')
#@end
