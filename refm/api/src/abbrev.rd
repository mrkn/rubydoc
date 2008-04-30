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

--- abbrev(words, pattern = nil) -> Hash

ʸ��������󤫤��դ˷�ޤ�û�̷���׻�����
û�̷��򥭡�������ʸ������ͤȤ���ϥå�����֤��ޤ���

�������������ɽ������ꤹ��ȡ�words �Τ������Υѥ�����˥ޥå�������Τ���û�̷���׻����ޤ���
���������ʸ�������ꤹ��ȡ�words �Τ�������ʸ����ǻϤޤ��Τ���û�̷���׻����ޤ���

@param words   ���Ȥʤ�ʸ���������
@param pattern [[c:Regexp]] �� [[c:String]] ����ꤷ�ޤ���

@return û�̷��򥭡�������ʸ������ͤȤ���ϥå�����֤��ޤ���

  # words ��Ʊ��ʸ���󤬴ޤޤ�Ƥ������
  # �ʲ��Τ褦�ˤ���ʸ���󤷤��֤��ޤ���
  pp Abbrev.abbrev(%w[ruby ruby]).sort
      # => [["ruby", "ruby"]]
  
  # ���򤬴ޤޤ�Ƥ��Ƥ�Ŭ�ڤ˽������ޤ���
  pp Abbrev.abbrev(['ru by']).sort" 
      # => [["r", "ru by"],
      #     ["ru", "ru by"],
      #     ["ru ", "ru by"],
      #     ["ru b", "ru by"],
      #     ["ru by", "ru by"]]
  # sort ���Ƥ��ʤ���
  p %w[ruby rubyist].abbrev
    #=> {"ruby"    => "ruby",
    #    "rubyi"   => "rubyist",
    #    "rubyis"  => "rubyist",
    #    "rubyist" => "rubyist"}

= reopen Array

== Instance Methods

--- abbrev(pattern = nil) -> Hash

self ��ʸ���������ξ�硢self �����դ˷�ޤ�û�̷���׻�����
û�̷��򥭡�������ʸ������ͤȤ���ϥå�����֤��ޤ���

����������ɽ������ꤹ��ȡ�self �Τ������Υѥ�����˥ޥå�������Τ���û�̷���׻����ޤ���
������ʸ�������ꤹ��ȡ�self �Τ�������ʸ����ǻϤޤ��Τ���û�̷���׻����ޤ���

[[m:Abbrev.#abbrev]](self, pattern) ��Ʊ���Ǥ���

@param pattern [[c:Regexp]] �� [[c:String]] ����ꤷ�ޤ���


  p %w[ruby rubyist].abbrev
  #=> {"ruby"    => "ruby",
  #    "rubyi"   => "rubyist",
  #    "rubyis"  => "rubyist",
  #    "rubyist" => "rubyist"}

@see [[m:Abbrev.#abbrev]]

#@end
