#@since 1.9.1
���Х�å���¬�ꤹ�뤿��Υ饤�֥��Ǥ���

=== �Ȥ���

�ʲ��Τ褦�ˤ���¬���Ԥ��ޤ���

  (1) require "coverage" ����
  (2) Coverage.start ��¹Ԥ���
  (3) require �� load ��¹Ԥ���
  (4) Coverage.result �η�̤��ǧ����

=== ��

�ޤ�¬���оݤΥ��������Ѱդ��ޤ���

  # foo.rb
  s = 0
  10.times do |x|
    s += x
  end

  if s == 45
    p :ok
  else
    p :ng
  end

�ʲ��Τ褦�ˤ���¬���Ԥ��ޤ���

  require "coverage"
  Coverage.start
  require "foo"
  p Coverage.result # => {"foo.rb"=>[1, 1, 10, nil, nil, 1, 1, nil, 0, nil]}

Coverage.result["foo.rb"]��������������ϳƹԤμ¹Բ���ˤʤäƤ��ޤ���

= class Coverage

���Х�å���¬�ꤹ�뵡ǽ���󶡤��륯�饹�Ǥ���

�¸�Ū�ʵ�ǽ�Τ��ᡢAPI�Ͼ����ѹ��ˤʤ��ǽ��������ޤ���

== Class Methods

--- start  -> nil

���Х�å���¬��򳫻Ϥ��ޤ������˼¹Ԥ���Ƥ������ˤϲ��ⵯ����ޤ���

--- result  -> Hash

¬���̤�ե�����̾�򥭡����ƹԤμ¹Բ��������ˤ����ͤΥϥå������
���ޤ������Ԥ䥳���ȤΤߤιԤʤɤ�¬���̤� nil �ˤʤ�ޤ���result
�᥽�åɤ��¹Ԥ��줿��ϥ��Х�å���¬���Ԥ��ޤ���

@return ¬���̤�ɽ���ϥå���

@raise RuntimeError [[m:Coverage.start]] ��¹Ԥ������˼¹Ԥ��줿����
                    ȯ�����ޤ���

#@end
