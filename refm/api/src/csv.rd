#@since 1.8.0
CSV (Comma Separated Value) �򰷤��饤�֥��Ǥ���

= class CSV < Object

CSV (Comma Separated Value) �򰷤����饹�Ǥ���

�᥽�åɤζ��̥ѥ�᥿

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

--- open(path, mode[, fs = nil[, rs = nil]]) { ... }

�ɤ߹��ߥ⡼�ɻ��ˤ� path �ˤ���ե�����򳫤��ƹԤ�����Ȥ���
�֥�å����Ϥ��ޤ���

��:

  CSV.open("/temp/test.csv", 'r') do |row|
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

--- foreach(path[, rs = nil]) { ... }

�ɤ߹��ߥ⡼�ɤǥե�����򳫤����ƹԤ�����ǥ֥�å����Ϥ��ޤ���

��:

  CSV.foreach('test.csv'){|row|
    puts row.join('<>')
  }

--- read(path[, length = nil[, offset = nil]])
--- readlines(path[, rs = nil])

path �ǻ��ꤵ�줿 CSV �ե�������ɤ߹��ߡ����������ǥǡ������֤��ޤ���

#@end

--- generate(path[, fs = nil[, rs = nil]]) { ... }

--- parse(str_or_readable[, fs = nil[, rs = nil]])

--- parse_line(src[, fs = nil[, rs = nil]])

--- generate_line(row[, fs = nil[, rs = nil]])

--- parse_row(src, index, out_dev[, fs = nil[, rs = nil]])

--- generate_row(src, cells, out_dev[, fs = nil[, rs = nil]])

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
