require tk
require tk/button

= class TkRadioButton < TkButton

�饸���ܥ��󥦥������åȤΥ��饹�Ǥ���
�饸���ܥ���ϡ�ʣ����������ܤΤ�����1�Ĥ����򤹤륦�������åȤǤ���

  require "tk"
  v  = TkVariable.new
  c = proc {print v, "\n"}
  TkRadioButton.new {text "a"; variable v; value 1; select;   command c; pack}
  TkRadioButton.new {text "b"; variable v; value 2; deselect; command c; pack}
  TkRadioButton.new {text "c"; variable v; value 3; deselect; command c; pack}
  Tk.mainloop

== Instance Methods

--- deselect

�饸���ܥ��������å����ʤ����֤ˤ��ޤ���

--- select

�饸���ܥ��������å��������֤ˤ��ޤ���

#@if (version <= "1.8.2")
--- variable(v)

�饸���ܥ���ξ��֤� [[c:TkVariable]] ���֥�������v���ͤ��Ϣ�դ��ޤ���
Ʊ��TkVariable���֥������Ȥ˴�Ϣ�դ����줿�饸���ܥ����Ʊ�����롼�פ�
�ʤ�ޤ����饸���ܥ��󤬥����å�������v��
[[m:TkRadioButton#value]] �ǻ��ꤷ���ͤˤʤ�ޤ���

#@end

--- get_value

--- set_value(val)

�饸���ܥ��������å������Ȥ����ͤ�val�ˤ��ޤ���

