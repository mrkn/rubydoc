�����ɽ�� Set ���饹�ȡ����Ф�������ݾڤ��� SortedSet ���饹����
���ޤ���

����ȤϽ�ʣ�Τʤ����֥������Ȥν��ޤ�Ǥ���
[[c:Array]] �λ��ı黻��ǽ�� [[c:Hash]] �ι�®�ʸ�����ǽ���碌�����ޤ���

Set ����� SortedSet �����������Ȥ��� [[c:Hash]] ��Ȥ����ᡢ�������Ǥ�
�������� [[m:Object#eql?]] �� [[m:Object#hash]] ���Ѥ���Ƚ�Ǥ���ޤ���
�������äơ�����γ����Ǥˤϡ������Υ᥽�åɤ�Ŭ�ڤ��������Ƥ���
ɬ�פ�����ޤ���

Set ���饹�Ǥϡ��������Ǥ���Ф��ݤν�����ݾڤ���ޤ���
������SortedSort �Ǥϡ��������Ǥϥ����Ȥ��줿����Ǽ��Ф���ޤ���

�ޤ���set �饤�֥��� require ����� [[c:Enumerable]] �⥸�塼�뤬
��ĥ���졢[[m:Enumerable#to_set]] �η��ǽ��祪�֥������Ȥ������Ǥ���
�褦�ˤʤ�ޤ���

=== ��ջ���

#@if (version < "1.9.1")
Ruby 1.8 �Ǥϡ����祪�֥������Ȥ��Ф��� taint, untaint, freeze �γ�
�᥽�åɤϡ����������Ȥ����ݻ�����ϥå���ˤϱƶ����ޤ���
���Τ��ᡢ���祪�֥������Ȥ���뤪��ӱ����ޡ����Υ��åȤϼ¼�Ū��
���̤�����ޤ���
�㤨�С�set.freeze ��³���� set.add ��ƤӽФ��Ƥ⡢���顼��ȯ��
���ޤ���
#@else
Ruby 1.9 �Ǥϡ����祪�֥������Ȥ��Ф��� taint, untaint, freeze �γ�
�᥽�åɤθ��̤ϡ����������Ȥ����ݻ�����ϥå���ˤ�Ŭ�Ѥ���ޤ���

���祪�֥������Ȥ���Ӥ������������˥��åȤ��줿 taint ����ϡ�
dup����� clone �᥽�åɤˤ�ä�ʣ�����줿���祪�֥������Ȥˤ⥳�ԡ�
����ޤ���

��������freeze ���줿����� clone ������硢ʣ�����줿�������������
�ˤ� freeze ���󤬰����Ѥ���ޤ���
�������äơ��������줿������Ф������Ǥ��ѹ��ϥ��顼�ˤʤ�ޤ���
#@end


=== ��
  require 'set'
  
  set1 = Set.new ["foo", "bar", "baz", "foo"]

  p set1                  #=> #<Set: {"baz", "foo", "bar"}>
  p set1.include?("bar")  #=> true
  
  set1.add("heh")
  set1.delete("foo")
  p set1                  #=> #<Set: {"heh", "baz", "bar"}>


= class Set < Object

include Enumerable

�����ɽ�����饹�Ǥ������Ǥδ֤˽���ط��Ϥ���ޤ���

== Class Methods
--- new(enum = nil) -> Set
--- new(enum = nil) {|o| ... } -> Set

���� enum ��Ϳ����줿���Ǥ򸵤ˡ��������������ޤ���

��������ꤷ�ʤ���硢�ޤ��ϰ����� nil �Ǥ�����ˤϡ����ν����
���ޤ���

������Ϳ���ƥ֥�å���Ϳ���ʤ���硢enum �γ����Ǥ���ʤ뽸���
���ޤ���

�����ȥ֥�å���ξ����Ϳ������硢enum �γ����ǤˤĤ��ƥ֥�å���
ɾ���������η�̤򿷤�����������ǤȤ��ޤ���

#@if (version >= "1.9.1")
@param enum �������Ǥ��Ǽ���륪�֥������Ȥ���ꤷ�ޤ���
       enum �ˤ� each �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���
@raise NoMethodError ���� enum ��Ϳ�����ơ����� enum �� each �᥽�åɤ�
       �������Ƥ��ʤ�����ȯ�����ޤ���
#@else
@param enum Enumerable ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError Enumerable ���֥������ȤǤʤ�������Ϳ����줿����
       ȯ�����ޤ���
#@end

  p Set.new                      #=> #<Set: {}>
  p Set.new([1, 2])              #=> #<Set: {1, 2}>
  p Set.new([1, 2]) {|o| o * 2}  #=> #<Set: {2, 4}>

--- [](*ary) -> Set

Ϳ����줿���֥������Ȥ����ǤȤ��뿷�����������ޤ���

@param ary ��������������Ǥ���ꤷ�ޤ���

  p Set[1, 2] #=> #<Set: {1, 2}>


== Instance Methods
--- clone -> Set
--- dup -> Set

�����ʣ�������֤��ޤ���

dup �ϡ���������Ƥ� taint ����Τߥ��ԡ����ޤ���
clone �ϡ�����˲ä��ơ�freeze ������ðۥ᥽�åɤ򥳥ԡ����ޤ���
������ⶦ�̤��ơ����������Ȥ����ݻ�����ϥå���⥳�ԡ����ޤ�����
��������Ǥ��Τ�Τϥ��ԡ����ޤ���

#@if (version < "1.9.1")
��������Ruby 1.8 �� Set ���饹�Ǥϡ����������Ȥ����Ѥ���ϥå���ˤ�
taint ���󤪤�� freeze �����ղä���ʤ��Τǡ�taint ���󤪤��
freeze ����Υ��ԡ��ϼ¼�Ū�ʸ��̤�����ޤ���
#@else
Ruby 1.9 �� Set ���饹�Ǥϡ�dup �� clone �˶��̤��ơ����������Ȥ���
�Ѥ���ϥå����ޤ�� taint ����򥳥ԡ����ޤ���
��������clone �Ǥ����������� freeze ����ϥ��ԡ�����ޤ���
���Τ��ᡢfreeze ���줿����� clone ������硢�������줿��������Ǥ�
�ѹ���ǽ�Ǥ���������դ��Ƥ���������
#@end

  s1 = Set[10, 20]
  
  s2 = s1.dup
  s2 << 30
  p s1 #=> #<Set: {20, 10}>
  p s2 #=> #<Set: {30, 20, 10}>

@see [[m:Object#clone]]

--- size -> Integer
--- length -> Integer

��������ǿ����֤��ޤ���

  p Set[10, 20, 30, 10].size #=> 3

--- empty? -> bool

���礬���Ǥ� 1 �Ĥ�����ʤ��Ȥ��� true ���֤��ޤ���

  p Set[10, 20].empty? #=> false
  p Set[].empty?       #=> true

--- clear -> self

��������Ǥ򤹤٤ƺ���������ˤ������ self ���֤��ޤ���

  p s = Set[10, 20, 30] #=> #<Set: {30, 20, 10}>
  s.clear
  p s #=> #<Set: {}>

--- replace(enum) -> self

��������Ǥ򤹤٤ƺ������enum ��Ϳ����줿���Ǥ��֤������ޤ���

#@if (version >= "1.9.1")
���� enum �ˤ� each �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

@param enum �֤�������ν������Ǥ��Ǽ���륪�֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum �֤�������ν������Ǥ��Ǽ���� Enumerable ���֥������Ȥ�
            ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  p s = Set[10, 20, 30] #=> #<Set: {30, 20, 10}>
  s.replace([15, 25])
  p s #=> #<Set: {25, 15}>

--- flatten -> Set
--- flatten! -> self | nil

�����Ƶ�Ū��ʿ�경���ޤ���

flatten �ϡ�ʿ�경��������򿷤�����������������֤��ޤ���

flatten! �ϡ����ν�����˲�Ū��ʿ�경���ޤ�����������Ǥ��ѹ���
ȯ���������ˤ� self �򡢤����Ǥʤ����ˤ� nil ���֤��ޤ���

@raise ArgumentError ��������ǤȤ��Ƽ��Ȥ��Ƶ�Ū�˸��줿����ȯ��
                     ���ޤ���

  s = Set[Set[1,2], 3]
  p s.flatten #=> #<Set: {1, 2, 3}>
  p s         #=> #<Set: {#<Set: {1, 2}>, 3}>
  s.flatten!
  p s         #=> #<Set: {1, 2, 3}>

@see [[m:Array#flatten]]


--- to_a -> Array
���Ȥ�������Ѵ����ޤ������Ǥν��������Ǥ���

  set = Set['hello', 'world']
  p set.to_a
  #=> ["world", "hello"]

--- include?(o) -> bool
--- member?(o) -> bool

���֥������� o �����ν����°������� true ���֤��ޤ���

@param o ���֥������Ȥ���ꤷ�ޤ���

  set = Set['hello', 'world']
  p set.include?('world') #=> true
  p set.include?('bye') #=> false

--- superset?(set) -> bool
--- proper_superset?(set) -> bool

���Ȥ����� set �ξ�̽��� (�����ѡ����å�) �Ǥ������ true ��
�֤��ޤ���

superset? �ϡ�2 �Ĥν��礬���������ˤ� true �Ȥʤ�ޤ���

proper_superset? �ϡ�2 �Ĥν��礬���������ˤ� false ���֤��ޤ���

@param set ����оݤ� Set ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Set ���֥������ȤǤʤ�����ȯ�����ޤ���

  s = Set[1, 2, 3]
  p s1.superset?(Set[1, 2]) #=> true
  p s1.superset?(Set[1, 4]) #=> false
  p s1.superset?(Set[1, 2, 3]) #=> true
  p s.proper_superset?(Set[1, 2]) #=> true
  p s.proper_superset?(Set[1, 4]) #=> false
  p s.proper_superset?(Set[1, 2, 3]) #=> false

@see [[m:Set#subset?]]

--- subset?(set) -> bool
--- proper_subset?(set) -> bool

���Ȥ����� set ����ʬ����Ǥ������ true ���֤��ޤ���

subset? �ϡ�2 �Ĥν��礬���������ˤ� true �Ȥʤ�ޤ���

proper_subset? �ϡ�2 �Ĥν��礬���������ˤ� false ���֤��ޤ���

@param set ����оݤ� Set ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Set ���֥������ȤǤʤ�����ȯ�����ޤ���

  s = Set[1, 2]
  p s.subset?(Set[1, 2, 3]) #=> true
  p s.subset?(Set[1, 4]) #=> false
  p s.subset?(Set[1, 2]) #=> true
  p s.proper_subset?(Set[1, 2, 3]) #=> true
  p s.proper_subset?(Set[1, 4]) #=> false
  p s.proper_subset?(Set[1, 2]) #=> false

@see [[m:Set#superset?]]

--- each {|o| ... } -> self

����γ����ǤˤĤ��ƥ֥�å���¹Ԥ��ޤ���

  s = Set[10, 20]
  ary = []
  s.each {|num| ary << num + 1}
  p ary #=> [21, 11]

--- collect! {|o| ...} -> self
--- map! {|o| ...} -> self

����γ����ǤˤĤ��ƥ֥�å���ɾ���������η�̤Ǹ��ν�����֤������ޤ���

  set = Set['hello', 'world']
  set.map! {|str| str.capitalize}
  p set  #=> #<Set: {"Hello", "World"}>

@see [[m:Enumerable#collect]]

--- add(o) -> self
--- <<(o) -> self
--- add?(o) -> self | nil

����˥��֥������� o ��ä��ޤ���

add �Ͼ�� self ���֤��ޤ���<< �� add ����̾�Ǥ���

add? �ϡ���������Ǥ��ɲä��줿���ˤ� self ���Ѳ����ʤ��ä����ˤ�
nil ���֤��ޤ���

@param o �ɲ��оݤΥ��֥������Ȥ���ꤷ�ޤ���

  s = Set[1, 2]
  s << 10
  p s          #=> #<Set: {1, 2, 10}>
  p s.add?(20) #=> #<Set: {1, 2, 20, 10}>
  p s.add?(2)  #=> nil


--- delete(o) -> self
--- delete?(o) -> self | nil

���礫�饪�֥������� o �������ޤ���

delete �Ͼ�� self ���֤��ޤ���

delete? �ϡ���������Ǥ�������줿���ˤ� self ���Ѳ����ʤ��ä����
�ˤ� nil ���֤��ޤ���

@param o ����оݤΥ��֥������Ȥ���ꤷ�ޤ���

  s = Set[10, 20, 30]
  s.delete(10)
  p s             #=> #<Set: {30, 20}>
  p s.delete?(20) #=> #<Set: {30}>
  p s.delete?(10) #=> nil

--- delete_if {|o| ... } -> self
--- reject! {|o| ... } -> self | nil

����γ����Ǥ��Ф��ƥ֥�å���¹Ԥ������η�̤����Ǥ���褦�ʤ��٤Ƥ�
���Ǥ������ޤ���

delete_if �Ͼ�� self ���֤��ޤ���

reject! �ϡ����Ǥ� 1 �İʾ��������� self ��1 �Ĥ�������ʤ����
nil ���֤��ޤ���

  s1 = Set['hello.rb', 'test.rb', 'hello.rb.bak']
  s1.delete_if {|str| str =~ /\.bak$/}
  p s1 #=> #<Set: {"test.rb", "hello.rb"}>
  
  s2 = Set['hello.rb', 'test.rb', 'hello.rb.bak']
  p s2.reject! {|str| str =~ /\.bak$/} #=> #<Set: {"test.rb", "hello.rb"}>
  p s2.reject! {|str| str =~ /\.o$/}   #=> nil

@see [[m:Enumerable#reject]]

--- merge(enum) -> self

���ν���� enum ��Ϳ����줿���Ǥ��ɲä��ޤ���

#@if (version >= "1.9.1")
���� enum �ˤ� each �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

@param enum �ɲ��оݤ����Ǥ��Ǽ�������֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum �ɲ��оݤ����Ǥ��Ǽ���� Enumerate ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  set = Set[10, 20]
  set.merge([10, 30])
  p set #=> #<Set: {30, 20, 10}>

--- subtract(enum) -> self

���ν��礫�顢enum ��Ϳ����줿���Ǥ������ޤ���

#@if (version >= "1.9.1")
���� enum �ˤ� each �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

@param enum ����оݤ����Ǥ��Ǽ�������֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum ����оݤ����Ǥ��Ǽ���� Enumerate ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  set = Set[10, 20, 40]
  set.subtract([10, 20, 30])
  p set #=> #<Set: {40}>

--- union(enum) -> Set
--- +(enum) -> Set
--- |(enum) -> Set

�½��硢���ʤ����2 �Ĥν���ξ��ʤ��Ȥ�ɤ��餫������°���뤹�٤Ƥ�
���Ǥ���ʤ뿷�����������ޤ���

#@if (version >= "1.9.1")
@param enum each �᥽�åɤ�������줿���֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum Enumerable ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  p Set[10, 20, 30] + Set[10, 20, 40]
  #=> #<Set: {40, 30, 20, 10}>

--- difference(enum) -> Set
--- -(enum) -> Set

�����硢���ʤ�������ν�������ǤΤ������� enum �˴ޤޤ�����Ǥ��������
�������������ޤ���

#@if (version >= "1.9.1")
@param enum each �᥽�åɤ�������줿���֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum Enumerable ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  p Set[10, 20, 30] - Set[10, 20, 40]
  #=> #<Set: {30}>

--- intersection(enum) -> Set
--- &(enum) -> Set

������ʬ�����ʤ����2�Ĥν���Τ�����ˤ�°���뤹�٤Ƥ����Ǥ���ʤ�
�������������ޤ���

#@if (version >= "1.9.1")
@param enum each �᥽�åɤ�������줿���֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum Enumerable ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  s1 = Set[10, 20, 30]
  s2 = Set[10, 30, 50]
  p s1 & s2 #=> #<Set: {30, 10}>

--- ^(enum) -> Set

�оκ������ʤ����2 �Ĥν���Τ����줫�����ˤ���°���뤹�٤Ƥ����Ǥ���ʤ�
�������������ޤ���

#@if (version >= "1.9.1")
@param enum each �᥽�åɤ�������줿���֥������Ȥ���ꤷ�ޤ���
@raise NoMethodError ���� enum �� each �᥽�åɤ��������Ƥ��ʤ�����
       ȯ�����ޤ���
#@else
@param enum Enumerable ���֥������Ȥ���ꤷ�ޤ���
@raise ArgumentError ������ Enumerable ���֥������ȤǤʤ�����ȯ�����ޤ���
#@end

  s1 = Set[10, 20, 30]
  s2 = Set[10, 30, 50]
  p s1 ^ s2 #=> #<Set: {50, 20}>

--- ==(set) -> bool

2 �Ĥν��礬�������Ȥ��� true ���֤��ޤ���

��긷̩�ˤϡ����� set �� Set ���֥������ȤǤ��ꡢ���Ȥ� set ��Ʊ����
���Ǥ���������Ĥ��������Ǥ����٤����������� true �Ȥʤ�ޤ���
����ʳ��ξ��ˤϡ�false ���֤��ޤ���
���Ǥ��������� [[m:Object#eql?]] �ˤ��Ƚ�ꤵ��ޤ���

@param set ����оݤΥ��֥������Ȥ���ꤷ�ޤ���

  s1 = Set[10, 20, 30]
  s2 = Set[10, 30, 40]
  s3 = Set[30, 10, 30, 20]
  p s1 == s2 #=> false
  p s1 == s3 #=> true

--- classify {|o| ... } -> Hash

�����֥�å����ͤˤ�ä�ʬ�ष����̤�ϥå���Ȥ����֤��ޤ���

�֥�å��Ͻ���γ����ǤˤĤ��Ƽ¹Ԥ��졢���� o �ˤϤ������Ǥ�
�Ϥ���ޤ���

���������ϥå���Υ����ϥ֥�å��μ¹Է�̡��ͤ�ʬ�व�줿�����
�ʤ�ޤ���

  numbers = Set[10, 4.5, 20, 30, 31.2]
  p numbers.classify {|o| o.class}
  #=> {Float=>#<Set: {4.5, 31.2}>, Fixnum=>#<Set: {30, 20, 10}>}

--- divide {|o| ... } -> Set
--- divide {|o1, o2| ... } -> Set

���ν����֥�å�����������ط���ʬ�䤷�����η�̤򽸹�Ȥ����֤��ޤ���

�֥�å��ѥ�᡼���� 1 �Ĥξ�硢block.call(o1) == block.call(o2) ����
�ʤ�С�o1 �� o2 ��Ʊ��ʬ���°���ޤ���

�֥�å��ѥ�᡼���� 2 �Ĥξ�硢block.call(o1, o2) �����ʤ�С�
o1 �� o2 ��Ʊ��ʬ���°���ޤ���
���ξ�硢block.call(o1, o2) == block.call(o2, o1)
����Ω���ʤ��֥�å���Ϳ����ȴ����̤�η�̤������ޤ���

==== ��1
  numbers = Set.new(1..6)
  set = numbers.divide {|i| i % 3}
  p set
  #=> #<Set: {#<Set: {5, 2}>, #<Set: {1, 4}>, #<Set: {6, 3}>}>

==== ��2
  numbers = Set[1, 3, 4, 6, 9, 10, 11]
  set = numbers.divide {|i, j| (i - j).abs == 1}
  p set     #=> #<Set: {#<Set: {1}>,
            #           #<Set: {11, 9, 10}>,
            #           #<Set: {3, 4}>,
            #           #<Set: {6}>}>

==== ������
8x2 �Υ������׾�ǡ��ʥ��Ȥ���ã�Ǥ�����֤˴ؤ���ʬ���������ޤ���

  require 'set'

  board = Set.new
  m, n = 8, 2
  for i in 1..m
    for j in 1..n
      board << [i,j]
    end
  end
  knight_move = Set[1,2]
  p board.divide { |i,j|
    Set[(i[0] - j[0]).abs, (i[1] - j[1]).abs] == knight_move
  }
  #=> #<Set: {#<Set: {[6, 2], [4, 1], [2, 2], [8, 1]}>,
  #            #<Set: {[2, 1], [8, 2], [6, 1], [4, 2]}>,
  #            #<Set: {[1, 1], [3, 2], [5, 1], [7, 2]}>,
  #            #<Set: {[1, 2], [5, 2], [3, 1], [7, 1]}>}>

--- inspect -> String

�ʹ֤��ɤߤ䤹������ɽ������ʸ������֤��ޤ���

  puts Set.new(['element1', 'element2']).inspect
  #=> #<Set: {"element1", "element2"}>


= class SortedSet < Set

�����Ǥ򥽡��Ȥ��줿���ǰ������祯�饹�Ǥ���

�ƥ᥽�åɤλ�����ˡ�ˤĤ��Ƥϡ�[[c:Set]] �򻲾Ȥ��Ƥ���������

RBTree �饤�֥�� ([[url:http://raa.ruby-lang.org/project/ruby-rbtree]])
�����Ѳ�ǽ�Ǥ����硢���������Ȥ��ƥϥå��������� RBTree����Ѥ��ޤ���

= reopen Enumerable

== Instance Methods

--- to_set(klass = Set, *args) -> Set
--- to_set(klass = Set, *args) {|o| ... } -> Set

Enumerable ���֥������Ȥ����Ǥ��顢���������祪�֥������Ȥ���ޤ���

���� klass ��Ϳ������硢Set ���饹������ˡ����ꤷ�����祯�饹��
���󥹥��󥹤���ޤ���
���ΰ�������ꤹ�뤳�Ȥǡ�SortedSet ���뤤�Ϥ���¾�Υ桼�������
���祯�饹�Υ��󥹥��󥹤��뤳�Ȥ��Ǥ��ޤ���

���� args ����ӥ֥�å��ϡ����祪�֥������Ȥ��������뤿��� new 
�᥽�åɤ��Ϥ���ޤ���

@param klass �������뽸�祯�饹����ꤷ�ޤ���
@param args ���祯�饹�Υ��֥������Ƚ�����᥽�åɤ��Ϥ���������ꤷ�ޤ���
@param block ���祯�饹�Υ��֥������Ƚ�����᥽�åɤ��Ϥ��֥�å�����ꤷ�ޤ���
@return �������줿���祪�֥������Ȥ��֤��ޤ���

  p [10, 20, 30].to_set 
  #=> #<Set: {30, 20, 10}>
  p [10, 20, 30].to_set(SortedSet)
  #=> #<SortedSet: {10, 20, 30}>
  p [10, 20, 30].to_set {|num| num / 10}
  #=> #<Set: {1, 2, 3}>

@see [[m:Set.new]]
