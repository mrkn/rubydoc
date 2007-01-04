#@since 1.8.2

require tk
require tk/itemconfig
require tk/scrollable
require tk/txtwin_abst

= module TkListItemConfig
include TkItemConfigMethod

= class TkListbox < TkTextWin
include TkListItemConfig
include Tk::Scrollable

�ꥹ�ȥܥå������������åȤΥ��饹�Ǥ���
�ꥹ�ȥܥå������������åȤϹ��ܤΰ�����ɽ�����������åȤǤ���

  require "tk"
  list = TkListbox.new { setgrid 'yes'; pack }
  list.insert 'end', "abc"
  list.insert 'end', "def"
  list.insert 'end', "123"
  list.insert 'end', "456"
  Tk.mainloop

�᥽�åɤ����������((*����*))�ϡ��ʲ��Τ����줫��ؤ��ޤ���

  *����

   �����ǻ��ꤷ�����ǰ���(��ü��0)

  *"@x,y"

   x��y �Ͽ����Ǥ���
   �����ǻ��ꤷ���ԥ��������(������κ���ü��0����Ϥޤ�)

  *"active"

   �����ƥ���(����������֤Τ���)�Ǥ������Ǥΰ���

  *"end"

   �Ǹ�����Ǥΰ���

  *"anchor"

   ???

== Instance Methods

--- tagid(id)

--- activate(y)

((|y|))�ǻ��ꤷ��((*����*))�����Ǥ򥢥��ƥ��֤ˤ��ޤ������Υꥹ��
�ܥå�����((<���ϥե�������>))������С������ƥ��֤ʹԤˤϲ�������
����ޤ���

     require "tk"
     TkListbox.new {
       insert 'end', "foo"
       insert 'end', "bar"
       insert 'end', "baz"
       activate 1
       #focus
       pack
     }
     Tk.mainloop

--- curselection

((<����>))���줿���Ǥ������ֹ������ˤ����֤��ޤ�(�����ֹ�Ͼ�ü��0)

--- get(index)
--- get(first, last)

������1�Ĥξ�硢���ꤷ��((*����*))�����Ǥ�ʸ������֤��ޤ���
������2�Ĥξ�硢���ꤷ���ϰϤ����Ǥ�ʸ�����������֤��ޤ���

--- nearest(y)

((|y|))�ǻ��ꤷ��Y��ɸ�˶ᤤ���Ǥ������ֹ���֤��ޤ���

--- size

���Ǥο����֤��ޤ���

--- selection_anchor(index)

((|index|))�ǻ��ꤷ��((*����*))�����Ǥ�((<���󥫡�>))�ˤ��ޤ���

--- selection_clear(first, last = TkUtil::None)

((|first|))��((|last|))�ǻ��ꤷ��((*����*))���ϰϤ����Ǥ�((<����>))��
��Ƥ����������ˤ��ޤ���((|last|))���ά������硢((|first|))��((*��
��*))�����Ǥ�������ˤ��ޤ���

--- selection_includes(index)

(({index}))�ǻ��ꤷ��((*����*))�����Ǥ�((<����>))����Ƥ��뤫�ɤ�����
������(({true}))/(({false}))���֤��ޤ���

      require "tk"
      l = TkListbox.new {
        100.times {|i| insert "end", i}
      }.pack
      p l.selection_set(0)
      p l.selection_includes(0)
      Tk.mainloop

--- selection_set(first, last = TkUtil::None)

((|first|))��((|last|))�ǻ��ꤷ��((*����*))���ϰϤ����Ǥ�((<����>))��
�ޤ���((|last|))���ά������硢((|first|))��((*����*))�����Ǥ�����
�ޤ���

--- index(idx)

--- value

--- value=(vals)

--- clear
--- erase

== Constants

--- TkCommandNames

--- WidgetClassName

#@end
