= class PrettyPrint < Object

���Υ��饹�� pretty printing ���르�ꥺ��μ����Ǥ���
���Ԥΰ��֤�õ�������줤�ʥ���ǥ�Ȥ�ܤ��ޤ���

�ǥե���ȤǤϡ����Υ��饹��ʸ����򰷤��ޤ���
�ޤ���ʸ��1�Х��Ȥ������������1����������Ȳ��ꤷ�Ƥ��ޤ���
���������ʲ��Υ᥽�åɤ��Ф���Ŭ�ڤʰ�����Ϳ���뤳�Ȥǡ�
�����Ǥʤ����ˤ����ѤǤ��ޤ���
 * [[m:PrettyPrint.new]]: ����������򤹤�֥�å�����ԥ��֥������Ȥ�����Ǥ��ޤ���
 * [[m:PrettyPrint#text]]: ��������Ǥ��ޤ���
 * [[m:PrettyPrint#breakable]] 
�Ǥ��Τǡ����Υ��饹�ϰʲ��Τ褦�ʤ��Ȥˤ���Ѥ���ǽ�Ǥ���
 * proportional font ��Ȥä��ƥ����Ȥ�����
 * �������ȥХ��ȿ����ۤʤ�褦��¿�Х���ʸ��
 * ʸ���ʳ�������

=== References
Christian Lindig, Strictly Pretty, March 2000,
[[url:http://www.st.cs.uni-sb.de/~lindig/papers/pretty/strictly-pretty.html]]

Philip Wadler, A prettier printer, March 1998,
[[url:http://homepages.inf.ed.ac.uk/wadler/topics/language-design.html#prettier]]


== Class Methods
--- new(output = '', maxwidth = 79, newline = "\n") [{|width| ...}]

pretty printing �Τ���ΥХåե����������ޤ���
output �Ͻ�����Ǥ���
�⤷���ꤵ��ʤ���� '' �����ꤵ��ޤ���
output �� << �᥽�åɤ���äƤ��ʤ���Фʤ�ޤ���
<< �᥽�åɤˤ�
 * [[m:PrettyPrint#text]] ����1���� obj 
 * [[m:PrettyPrint#breakable]] ����1���� sep 
 * [[m:PrettyPrint.new]] ����1���� newline 
 * [[m:PrettyPrint.new]] ��Ϳ�����֥�å���ɾ���������
�Τɤ줫�ҤȤĤ������Ȥ���Ϳ�����ޤ���

maxwidth �ϹԤκ���������ꤷ�ޤ���
Ϳ�����ʤ����� 79 �����ꤵ��ޤ���
�����������ԤǤ��ʤ���Τ��Ϥ��줿����
�ºݤν������� maxwidth ��ۤ��뤳�Ȥ�����ޤ���

newline �ϲ��Ԥ˻Ȥ��ޤ���
���ꤵ��ʤ����� "\n" �����ꤵ��ޤ���

�֥�å��϶�����������ޤ���
���ꤵ��ʤ����� {|width| ' ' * width} ���Ȥ��ޤ���

--- format([output[, maxwidth[, newline[, genspace]]]]) {|pp| ...}

�ʲ���Ʊ��Ư���򤹤��ΤǴ��ؤΤ�����Ѱդ���Ƥ��ޤ���

  begin
    pp = PrettyPrint.new(output, maxwidth, newline, &genspace)
    ...
    pp.flush
    output
  end

--- singleline_format([output[, maxwidth[, newline[, genspace]]]]) {|pp| ...}

[[m:PrettyPrint.format]] �˻��Ƥ��ޤ��������Ԥ��ޤ��󡣰���
maxwidth, newline �� genspace ��̵�뤵��ޤ����֥��
����� breakable �μ¹Ԥϡ����Ԥ����� text �μ¹ԤǤ��뤫
�Τ褦�˰����ޤ���

== Instance Methods
--- text(obj[, width])

obj �� width �����Υƥ����ȤȤ����ɲä��ޤ���

width �����ꤵ��ʤ��ä���硢obj.length �����Ѥ���ޤ���

--- breakable([sep[, width]])

��ɬ�פʤ餳���ǲ��Խ����פȤ������Ȥ����Τ��ޤ���
�⤷���ΰ��֤ǲ��Ԥ���ʤ���С�
width�����Υƥ����� sep ����������������ޤ���

sep �����ꤵ��ʤ���� " " �����Ѥ���ޤ���

width �����ꤵ��ʤ���С�sep.length �����Ѥ���ޤ���
�㤨�� sep ��¿�Х���ʸ���κݤ˻��ꤹ��ɬ�פ����뤫���Τ�ޤ���

--- nest(indent) {...}

�֥�å�������ɲä��줿���Ԥθ�κ��ޡ������ indent �֤����
���ä����ޤ���

--- group([indent[, open_obj[, close_obj[, open_width[, close_width]]]]]) {...}

�֥�å�����ɲä��줿���ԤΥҥ�Ȥ򥰥롼�ײ����ޤ���

indent �����ꤵ�줿��硢���Υ᥽�åɸƤӽФ���
nest(indent) { ... } �ǥͥ��Ȥ��Ƥ����ΤȤ��ư����ޤ���

open_obj �����ꤵ�줿��硢text open_obj, open_width ��
�ǽ�˸ƤФ�ޤ���
close_obj �����ꤵ�줿��硢text close_obj, close_width ��
�Ǹ�˸ƤФ�ޤ���

--- flush

�Хåե����줿�ǡ�������Ϥ��ޤ���

--- first?

���ߤΥ��롼�פ� first? ���Ф���ǽ�θƤӽФ����ɤ�����Ƚ�ꤹ��
�Ҹ�Ǥ���
����ϥ���ޤǶ��ڤ�줿�ͤ���������Τ�ͭ�ѤǤ���

  pp.group(1, '[', ']') {
    xxx.each {|yyy|
      unless pp.first?
        pp.text ','
        pp.breakable
      end
      ... pretty printing yyy ...
    }
  }
