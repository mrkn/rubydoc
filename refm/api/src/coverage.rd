#@since 1.9.1
���Х�å���¬�ꤹ�뤿��Υ饤�֥��Ǥ���

= class Coverage

Coverage provides coverage measurement feature for Ruby.
This feature is experimental, so these APIs may be changed in future.

=== �Ȥ���

(1) require "coverage"
(2) Coverage.start ��¹�
(3) Ruby �� source file �� require �ޤ��� load ����
(4) Coverage.result �Ƿ�̤�������

=== ��

  [foo.rb]
  s = 0
  10.times do |x|
    s += x
  end

  if s == 45
    p :ok
  else
    p :ng
  end
  [EOF]

  require "coverage"
  Coverage.start
  require "foo.rb"
  p Coverage.result  #=> {"foo.rb"=>[1, 1, 10, nil, nil, 1, 1, nil, 0, nil]}

== Class Methods

--- Coverage.start  -> nil
���Х�å���¬��򳫻Ϥ��ޤ���

--- Coverage.result  -> Hash
¬���̤��֤��ޤ���

Returns a hash that contains filename as key and coverage array as value
and disables coverage measurement.

#@end
