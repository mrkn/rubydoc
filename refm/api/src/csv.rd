#@since 1.8.0
CSV (Comma Separated Values) �򰷤��饤�֥��Ǥ���

= class CSV < Object

CSV (Comma Separated Values) �򰷤����饹�Ǥ���

�ƥ᥽�åɤζ��̥ѥ�᥿

  mode
     'r', 'w', 'rb', 'wb' ��������ǽ�Ǥ���

     - 'r' �ɤ߹���
     - 'w' �񤭹���
     - 'b' �Х��ʥ�⡼��
  fs
     �ե�����ɤζ��ڤ�ʸ��
     �ǥե���Ȥ� ','
  rs
     �Զ��ڤ�ʸ����nil (�ǥե����) �� CrLf / Lf��
     Cr �Ƕ��ڤꤿ������ ?\r ���Ϥ��ޤ���

== Class Methods

--- open(path, mode[, fs = nil[, rs = nil]]) {|row| ... } -> nil
--- open(path, mode[, fs = nil[, rs = nil]]) -> CSV::Reader
--- open(path, mode[, fs = nil[, rs = nil]]) -> CSV::Writer

CSV�ե�������ɤ߹���ǥѡ������ޤ���

�ɤ߹��ߥ⡼�ɻ��ˤ� path �ˤ���ե�����򳫤��ƹԤ�����Ȥ���
�֥�å����Ϥ��ޤ���

@param path �ѡ�������ե�����Υե�����̾
@param mode �����⡼�ɤλ���
            'r', 'w', 'rb', 'wb' ��������ǽ�Ǥ���
            - 'r' �ɤ߹���
            - 'w' �񤭹���
            - 'b' �Х��ʥ�⡼��
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

���:
  �ѡ�������""(��ʸ��)���ͤʤ�(nil)����̤��ޤ���
  �㤨�С��ɤ߹��ߥ⡼�ɻ���a, "", , b �ιԤ�ѡ����������ˤ� ["a", "", nil, "b"] ��������֤��ޤ���
 
��:

  CSV.open("/temp/test.csv", 'r') do |row|
    puts row.join("<>")
  end

tsv(Tab Separated Values)�ե�����ʤɤΥ��ѥ졼���򥫥�ްʳ��ǻ���

  CSV.open("/temp/test.tsv", 'r', "\t") do |row|
    puts row.join("<>")
  end

�֥�å����Ϥ��ʤ��ä���� CSV::Reader ���֤��ޤ���

�񤭹��ߥ⡼�ɻ��ˤ� path �ˤ���ե�����򳫤� CSV::Writer ��֥�å����Ϥ��ޤ���

��:

  CSV.open("/temp/test.csv", 'w') do |writer|
    writer << ["ruby", "perl", "python"]
    writer << ["java", "C", "C++"]
  end

�֥�å�̤����ξ�� CSV::Writer ���֤��ޤ���

#@since 1.8.2

--- foreach(path[, rs = nil]) {|row| ... } -> nil

�ɤ߹��ߥ⡼�ɤǥե�����򳫤����ƹԤ�����ǥ֥�å����Ϥ��ޤ���

@param path �ѡ�������ե�����Υե�����̾
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

���:
  �ѡ�������""(��ʸ��)���ͤʤ�����̤��ޤ���
  �㤨�С�a, "", , b �ιԤ�ѡ����������ˤ� ["a", "", nil, "b"] ��������֤��ޤ���

��:

  CSV.foreach('test.csv'){|row|
    puts row.join(':')
  }

--- read(path[, length = nil[, offset = nil]]) -> Array

path �ǻ��ꤵ�줿 CSV �ե�������ɤ߹��ߡ����������ǥǡ������֤��ޤ���

@param path �ѡ�������ե�����Υե�����̾
@param length �оݥե�������ɤ߹��ߥ�����
@param offset �ɤ߹��߳��ϰ���

���:
  �ѡ�������""(��ʸ��)���ͤʤ�����̤��ޤ���
  �㤨�С�a, "", , b �ιԤ�ѡ����������ˤ� ["a", "", nil, "b"] ��������֤��ޤ���

--- readlines(path[, rs = nil]) -> Array

path �ǻ��ꤵ�줿 CSV �ե�������ɤ߹��ߡ����������ǥǡ������֤��ޤ���

@param path �ѡ�������ե�����Υե�����̾
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

���:
  �ѡ�������""(��ʸ��)���ͤʤ�����̤��ޤ���
  �㤨�С�a, "", , b �ιԤ�ѡ����������ˤ� ["a", "", nil, "b"] ��������֤��ޤ���

#@end

--- generate(path[, fs = nil[, rs = nil]]) -> CSV::BasicWriter
--- generate(path[, fs = nil[, rs = nil]]) {|writer| ... } -> nil

path �ǻ��ꤵ�줿�ե������񤭹��ߥ⡼�ɤǳ������֥�å����Ϥ��ޤ���
�֥�å�̤����ξ��� [[c:CSV::BasicWriter]] ���֤��ޤ���

@param path �񤭹��ߥ⡼�ɤ�open����ե�����Υե�����̾
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

���:
  �ե�����񤭹��߻���""(��ʸ��)���ͤʤ�(nil)����̤��ޤ���
  �㤨�С�["a", "", nil, "b"] ��������Ϥ������� a, "", , b �Ȥ����Ԥ�ե�����˽񤭹��ߤޤ���

��:
  a = ["1","ABC","abc"]
  b = ["2","DEF","def"]
  c = ["3","GHI","ghi"]
  x = [a, b, c]

  CSV.generate("test2.csv"){|writer|
    x.each{|row|
      writer << row
    }
  }

--- parse(str_or_readable[, fs = nil[, rs = nil]]) -> Array
--- parse(str_or_readable[, fs = nil[, rs = nil]]){|rows| ... } -> nil

str_or_readable �ǻ��ꤵ�줿ʸ�����ѡ����������������Ѵ����֥�å����Ϥ��ޤ���
�֥�å�̤����ξ����Ѵ����줿�����������֤��ޤ���

@param str_or_readable �ѡ�������ʸ����
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

��:
  CSV.parse("A,B,C\nd,e,f\nG,H,I"){|rows|
    p rows
  }

--- generate_line(row[, fs = nil[, rs = nil]]) -> String
--- generate_line(row[, fs = nil[, rs = nil]]){|s| ... } -> nil

row �ǻ��ꤵ�줿�����ѡ�������fs �ǻ��ꤵ�줿ʸ����ե�����ɥ��ѥ졼���Ȥ���
1��ʬ��ʸ�����֥�å����Ϥ��ޤ���
�֥�å�̤����ξ����Ѵ����줿ʸ������֤��ޤ���

@param row �ѡ�����������
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

--- parse_line(src[, fs = nil[, rs = nil]]) -> Array
--- parse_line(src[, fs = nil[, rs = nil]]){|row| ... } -> nil

src �ǻ��ꤵ�줿ʸ�����1��ʬ�Ȥ��ƥѡ�����������Ѵ����֥�å����Ϥ��ޤ���
�֥�å�̤����ξ����Ѵ����줿������֤��ޤ���

@param src �ѡ�������ʸ����
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

--- generate_row(src, cells, out_dev[, fs = nil[, rs = nil]]) -> Fixnum

src �ǻ��ꤵ�줿�����ѡ������� csv������ʸ����Ȥ���(�Զ��ڤ�ʸ����ޤ��) out_dev �˽��Ϥ��ޤ���
�֤��ͤȤ��� fs �Ƕ��ڤä��ե������(cell)�ο����֤��ޤ���

@param src �ѡ�����������
@param cells �ѡ�������ե�����ɿ���
@param out_dev csv������ʸ����ν����衣
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���

���:
  ����Υѡ�������""(��ʸ��)���ͤʤ�(nil)����̤��ޤ���
  �㤨�С�["a", "", nil, "b"] ��������Ϥ������� a,"", , b �Ȥ���ʸ������������ޤ���

��:
  row1 = ['a', 'b', 'c']
  row2 = ['1', '2', '3']
  row3 = ['A', 'B', 'C']
  src = [row1, row2, row3]
  buf = ''
  src.each do |row|
    parsed_cells = CSV.generate_row(row, 2, buf)
  end
  p buf #=>"a,b\n1,2\n,A,B\n" 

--- parse_row(src, index, out_dev[, fs = nil[, rs = nil]]) -> Array

CSV������ʸ�����ѡ�������CSV1��(row)ʬ�Υǡ�����������Ѵ��� out_dev �˽��Ϥ��ޤ���

@param src �ѡ�������ʸ����(CSV����)
@param index �ѡ������ϰ���
@param out_dev �Ѵ������ǡ����ν����衣
@param fs �ե�����ɥ��ѥ졼���λ��ꡣ
          nil (�ǥե����) �� ',' �򥻥ѥ졼���Ȥ��ޤ���
@param rs �Զ��ڤ�ʸ���λ��ꡣnil (�ǥե����) �� CrLf / Lf��
          Cr ��Զ��ڤ�Ȥ��������� ?\r ���Ϥ��ޤ���
@return  �Ѵ�����Array�Υ��������Ѵ��򤷤�ʸ����ΰ��֤�Array�Ȥ����֤��ޤ���

���:
  �ѡ�������""(��ʸ��)���ͤʤ�����̤��ޤ���
  �㤨�С�a, "", , b �ιԤ�ѡ����������ˤ� ["a", "", nil, "b"] ��������֤��ޤ���

��:
   src = "a,b,c\n1,2\nA,B,C,D"
   i = 0

   x = [] #��̤��Ǽ��������
   begin
     parsed = []
     parsed_cells, i = CSV.parse_row(src, i, parsed)
     x.push(parsed)
   end while parsed_cells > 0

   x.each{ |row|
     p '-----'
     row.each{ |cell|
       p cell
     }
   }

�¹Է��:
  a
  b
  c
  -----
  1
  2
  -----
  A
  B
  C
  D

#@include(csv/CSV__BasicWriter)
#@include(csv/CSV__Cell)
#@include(csv/CSV__IOBuf)
#@include(csv/CSV__IOReader)
#@include(csv/CSV__IllegalFormatError)
#@include(csv/CSV__Reader)
#@include(csv/CSV__Row)
#@include(csv/CSV__StreamBuf)
#@include(csv/CSV__StringReader)
#@include(csv/CSV__Writer)
#@end
