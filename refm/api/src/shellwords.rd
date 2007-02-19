= module Shellwords

== Module Functions

--- shellwords(line)
#@todo

Unix ������Υ��ޥ�ɥ饤����Ϥ˻���������ڤ��ñ��ʬ���Ԥ���
ñ��(ʸ����)��������֤��ޤ���

���򡢥��󥰥륯������(')�����֥륯������(")���Хå�����å���(\)
���ᤷ�ޤ���


    require 'shellwords'
    
    p Shellwords.shellwords(%q{  foo bar "foo bar"\ baz 'foo bar'  })
    
    # => ["foo", "bar", "foo bar baz", "foo bar"]
     
    p Shellwords.shellwords(%q{  A B C "D E F" "G","H I"  })
    
    # => ["A", "B", "C", "D E F", "G,H I"]
