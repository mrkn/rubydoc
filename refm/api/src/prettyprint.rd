= class PrettyPrint < Object

���Υ��饹�� pretty printing ���르�ꥺ��μ����Ǥ���
���Ԥΰ��֤�õ������¤�ΤޤȤޤ�Τ���ˤ��줤�ʥ���ǥ�Ȥ�ܤ��ޤ���

�ǥե���ȤǤϡ����Υ��饹�ϺǤ����Ū�����Ǥ�ʸ����Ǥ��ꡢ
����1�Х��Ȥ������������1����������Ȳ��ꤷ�Ƥ��ޤ���
�������������Ĥ��Υ᥽�åɤ��Ф���Ŭ�ڤʰ�����Ϳ���뤳�Ȥǡ�
�����Ǥʤ������ˤ����ѤǤ��ޤ�:
PrettyPrint.new �ˤϲ��ԥ��֥������Ȥȶ����������ɽ���֥�å���
PrettyPrint#text �� PrettyPrint#breakable �ˤ����Ȥ��ä����ˡ�
������Ȥ������Ĥ��θ�����㤨�м��Τ褦�ʤ�ΤǤ��礦��
proportional font ��Ȥä��ƥ����Ȥ�������
�������ȥХ��ȿ����ۤʤ�褦��¿�Х���ʸ����
ʸ���ʳ��ν��ϤʤɤǤ���

=== References
Christian Lindig, Strictly Pretty, March 2000,
[[url:http://www.st.cs.uni-sb.de/~lindig/papers/pretty/strictly-pretty.html]]

Philip Wadler, A prettier printer, March 1998,
[[url:http://homepages.inf.ed.ac.uk/wadler/topics/language-design.html#prettier]]


== Class Methods
--- new([output[, maxwidth[, newline]]]) [{|width| ...}]

pretty printing �Τ���ΥХåե����������ޤ���
output �Ͻ�����ǡ�
�⤷���ꤵ��ʤ���� '' �����ꤵ��ޤ���
���Υ��֥������Ȥϼ��Τ�Τ�����դ��� <<
�᥽�åɤ���äƤ��ʤ���Фʤ�ޤ��󡣤���ϡ�
PrettyPrint#text ����1���� obj��
PrettyPrint#breakable ����1���� sep��
PrettyPrint.new ����1���� newline
�����
PrettyPrint.new ��Ϳ����줿�֥�å���ɾ��������̤Ǥ���

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

PrettyPrint.format �˻��Ƥ��ޤ��������Ԥ��ޤ��󡣰���
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
