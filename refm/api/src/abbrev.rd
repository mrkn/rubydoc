#@since 1.8.1
Ϳ����줿ʸ�����û�̷�����������⥸�塼��Ǥ���



= module Abbrev

Ϳ����줿ʸ�����û�̷�����������⥸�塼��Ǥ���

=== ��

  require 'abbrev'
  require 'pp'

  pp Abbrev.abbrev(%w[ruby rules]).sort
      # => [["rub", "ruby"],
      #    ["ruby", "ruby"],
      #    ["rul", "rules"],
      #    ["rule", "rules"],
      #    ["rules", "rules"]]

== Module Functions

--- abbrev(words, pattern = nil)
#@todo

words ��ʸ���������Ǥ���û�̷��ȸ���ʸ����������������֤��ޤ���
�����Τ褦��û�̷������ɬ������ʸ���󤬰�դ˷�ޤ�褦�ˤʤäƤ��ޤ���
�⤷ words ��Ʊ��ʸ���󤬴ޤޤ�Ƥ������
�ʲ��Τ褦�ˤ���ʸ���󤷤��֤��ޤ���

  pp Abbrev.abbrev(%w[ruby ruby]).sort
      # => [["ruby", "ruby"]]

���򤬴ޤޤ�Ƥ��Ƥ�Ŭ�ڤ˽������ޤ���

  pp Abbrev.abbrev(['ru by']).sort" 
      # => [["r", "ru by"],
      #     ["ru", "ru by"],
      #     ["ru ", "ru by"],
      #     ["ru b", "ru by"],
      #     ["ru by", "ru by"]]



= reopen Array

== Instance Methods

--- abbrev(pattern = nil)
#@todo

[[m:Abbrev.abbrev]](self, pattern) ��Ʊ���Ǥ���

#@end
