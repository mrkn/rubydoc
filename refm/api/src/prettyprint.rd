pretty printing ���르�ꥺ��Τ���Υ饤�֥��Ǥ���

=== �Ȥ���

Pretty Print ���르�ꥺ��ϥ���ǥ�ȤȲ��Ԥ򡢥ĥ꡼��¤���뤳�Ȥˤ�äƷ��ꤷ�ޤ���
�桼���ϰʲ��Τ��Ȥ�Ԥ��ޤ���

 * [[m:PrettyPrint.new]] �ǥХåե����������롣���ΤȤ����Хåե������Ȳ���ʸ������ꤹ�롣
 * [[m:PrettyPrint#text]] ��Ȥäơ�ʸ�����Ŭ�� �������롣
 * [[m:PrettyPrint#group]] ��ȤäƻҥΡ��ɤ�Ĥ��롣Ʊ���˻ҥΡ��ɤΥ���ǥ�Ȥο�������롣
 * [[m:PrettyPrint#breakable]] ��ȤäƲ��Ԥ��Ƥ��ɤ�������ꤹ�롣

Ʊ���Ρ�����ǸƤФ줿 breakable �ϡ����Ԥ���ʤ������Ʊ���˲��Ԥ��ޤ���

 p2 = PrettyPrint.new('', 10)
 s = 'hello'
 p2.text(s)
 p2.group(p2.indent + s.size + 1) do
   p2.breakable
   p2.text('a')
   p2.breakable
   p2.text('b')
   p2.breakable
   p2.text('c')
 end
 p2.flush
 puts p2.output
 #=>
 hello
       a
       b
       c

=== References
Christian Lindig, Strictly Pretty, March 2000,
[[url:http://www.st.cs.uni-sb.de/~lindig/papers/pretty/strictly-pretty.html]]

Philip Wadler, A prettier printer, March 1998,
[[url:http://homepages.inf.ed.ac.uk/wadler/topics/language-design.html#prettier]]

= class PrettyPrint < Object

pretty printing ���르�ꥺ��Τ���Υ��饹�Ǥ���
���Ԥΰ��֤�õ�������줤�ʥ���ǥ�Ȥ�ܤ��ޤ���

�ǥե���ȤǤϡ����Υ��饹��ʸ����򰷤��ޤ���
�ޤ���ʸ��1�Х��Ȥ������������1����������Ȳ��ꤷ�Ƥ��ޤ���
���������ʲ��Υ᥽�åɤ��Ф���Ŭ�ڤʰ�����Ϳ���뤳�Ȥǡ�
�����Ǥʤ����ˤ����ѤǤ��ޤ���
 * [[m:PrettyPrint.new]]: ���ϥХåե�������������򤹤�֥�å�����ԥ��֥������Ȥ�����Ǥ��ޤ���
 * [[m:PrettyPrint#text]]: ��������Ǥ��ޤ���
 * [[m:PrettyPrint#breakable]] 
�Ǥ��Τǡ����Υ��饹�ϰʲ��Τ褦�ʤ��Ȥˤ���Ѥ���ǽ�Ǥ���
 * proportional font ��Ȥä��ƥ����Ȥ�����
 * �������ȥХ��ȿ����ۤʤ�褦��¿�Х���ʸ��
 * ʸ���ʳ�������

== Class Methods
--- new(output = '', maxwidth = 79, newline = "\n")               -> PrettyPrint
--- new(output = '', maxwidth = 79, newline = "\n"){|width| ...}  -> PrettyPrint
#@todo

pretty printing �Τ���ΥХåե����������ޤ���
output �Ͻ�����Ǥ���output �� << �᥽�åɤ���äƤ��ʤ���Фʤ�ޤ���
<< �᥽�åɤˤ�
 * [[m:PrettyPrint#text]] ����1���� obj 
 * [[m:PrettyPrint#breakable]] ����1���� sep 
 * [[m:PrettyPrint.new]] ����3���� newline 
 * [[m:PrettyPrint.new]] ��Ϳ�����֥�å���ɾ���������
�Τɤ줫�ҤȤĤ������Ȥ���Ϳ�����ޤ���

�֥�å������ꤵ�줿���ϡ�������������뤿��˻Ȥ��ޤ����֥�å��ϡ��������������������ɽ������������Ȥ��ƸƤФ�ޤ����֥�å������ꤵ��ʤ����ϡ�������������뤿��� {|width| ' ' * width} ���Ȥ��ޤ���

@param output ���������ꤷ�ޤ���output �� << �᥽�åɤ���äƤ��ʤ���Фʤ�ޤ���

@param maxwidth �Ԥκ���������ꤷ�ޤ��������������ԤǤ��ʤ���Τ��Ϥ��줿���ϡ��ºݤν������� maxwidth ��ۤ��뤳�Ȥ�����ޤ���

@param newline ���Ԥ˻Ȥ��ޤ���


--- format(output = '', maxwidth = 79, newline = "\n", genspace = lambda{|n| ' ' * n}) {|pp| ...}    -> object
#@todo

PrettyPrint ���֥������Ȥ������������������Ȥ��ƥ֥�å���¹Ԥ��ޤ���
Ϳ����줿 output ���֤��ޤ���

�ʲ���Ʊ��Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  begin
    pp = PrettyPrint.new(output, maxwidth, newline, &genspace)
    ...
    pp.flush
    output
  end

--- singleline_format(output = '', maxwidth = 79, newline = "\n", genspace = lambda{|n| ' ' * n}) {|pp| ...}    -> object
#@todo

PrettyPrint ���֥������Ȥ������������������Ȥ��ƥ֥�å���¹Ԥ��ޤ���
[[m:PrettyPrint.format]] �˻��Ƥ��ޤ��������Ԥ��ޤ���

���� maxwidth, newline �� genspace ��̵�뤵��ޤ����֥�å���� breakable �μ¹Ԥϡ�
���Ԥ����� text �μ¹ԤǤ��뤫�Τ褦�˰����ޤ���

== Instance Methods
--- text(obj)           -> ()
--- text(obj, width)    -> ()
#@todo

obj �� width �����Υƥ����ȤȤ��Ƽ��Ȥ��ɲä��ޤ���

@param obj ���Ȥ��ɲä���ƥ����Ȥ�ʸ����ǻ��ꤷ�ޤ���

@param width obj �Υ�������ꤷ�ޤ������ꤵ��ʤ��ä���硢obj.length �����Ѥ���ޤ���

--- breakable(sep = ' ')     -> ()
--- breakable(sep, width)    -> ()
#@todo

��ɬ�פʤ餳���ǲ��Խ����פȤ������Ȥ򼫿Ȥ����Τ��ޤ���
�⤷���ΰ��֤ǲ��Ԥ���ʤ���С�width �����Υƥ����� sep �����Ϥκݤˤ�������������ޤ���

@param sep ���Ԥ������ʤ��ä��������������ƥ����Ȥ�ʸ����ǻ��ꤷ�ޤ���

@param width �ƥ����� sep �� width �����Ǥ���Ȳ��ꤵ��ޤ������ꤵ��ʤ���С�sep.length �����Ѥ���ޤ����㤨�� sep ��¿�Х���ʸ���κݤ˻��ꤹ��ɬ�פ����뤫���Τ�ޤ���

--- nest(indent) {...}     -> ()
#@todo

���Ȥθ��ߤΥ���ǥ�Ȥ� indent �������ä����Ƥ��顢�֥�å���¹Ԥ��������ᤷ�ޤ���

@param indent ����ǥ�Ȥ�����ʬ�������ǻ��ꤷ�ޤ���

--- group(indent = 0, open_obj = '', close_obj = '', open_width = open_obj.length, close_width = close_obj.length){...}      -> ()
#@todo

Ϳ����줿�֥�å���¹Ԥ��ޤ���
�֥�å���Ǽ��Ȥ��ɲä����ʸ����䥪�֥������Ȥϡ�1�ԤˤޤȤ��ɽ�����Ƥ�
�褤Ʊ�����롼�פ�°����Ȳ��ꤵ��ޤ���

�⤦�����ܤ����������ޤ���Pretty Print ���르�ꥺ��ϥ���ǥ�ȤȲ��Ԥ�
�ĥ꡼��¤���뤳�Ȥˤ�äƷ��ꤷ�ޤ��������ơ�group �᥽�åɤϻҥΡ��ɤκ�����
�ҥΡ��ɤΥ���ǥ�Ȥο����η����ô�����ޤ���

Ʊ���Ρ�����ǸƤФ줿 breakable �ϡ����Ԥ���ʤ������Ʊ���˲��Ԥ��ޤ���

@param indent ���롼�פΥ���ǥ�Ȥο�������ꤷ�ޤ���

@param open_obj ���ꤵ�줿��硢self.text(open_obj, open_width) ���֥�å����¹Ԥ�������˸ƤФ�ޤ���������̤ʤɤ���Ϥ���Τ˻��Ѥ���ޤ���

@param close_obj ���ꤵ�줿��硢self.text(close_obj, close_width) ���֥�å����¹Ԥ��줿��˸ƤФ�ޤ����Ĥ���̤ʤɤ���Ϥ���Τ˻��Ѥ���ޤ���

--- flush     -> ()
#@todo

�Хåե����줿�ǡ�������Ϥ��ޤ���

--- first?    -> boolean
#@todo

#@since 1.8.2
���Υ᥽�åɤ� obsolete �Ǥ���
#@end

���ߤΥ��롼�פ� first? ���Ф���ǽ�θƤӽФ����ɤ�����Ƚ�ꤹ��
�Ҹ�Ǥ�������ϥ���ޤǶ��ڤ�줿�ͤ���������Τ�ͭ�ѤǤ���

  pp.group(1, '[', ']') {
    xxx.each {|yyy|
      unless pp.first?
        pp.text ','
        pp.breakable
      end
      ... pretty printing yyy ...
    }
  }

--- output    -> object
#@todo

���Ȥ� output ���֤��ޤ���

--- maxwidth    -> Integer
#@todo

���Ȥ������֤��ޤ���

--- newline    -> String
#@todo

���Ȥβ���ʸ�����֤��ޤ���

--- genspace    -> Proc
#@todo

������������� Proc ���֤��ޤ���

--- indent    -> Integer
#@todo

���ߤΥ���ǥ�Ȥο������֤��ޤ���
