#@until  1.9.1
each �ʳ��Υ᥽�åɤ� enumerate �Ǥ���褦�ˤ���饤�֥��Ǥ���

#@since 1.8.7
���Υ饤�֥��ϸ����ߴ����Τ���ˤΤ��󶡤���Ƥ��ޤ���

ruby-1.8.7 ��� [[c:Enumerable::Enumerator]] ���Ȥ߹��ߥ��饹�ˤʤ�ޤ�����
require 'enumerator' ��¹Ԥ��Ƥ� false ���֤������ǲ��⤷�ޤ���

#@else
#@include(_builtin/Enumerable__Enumerator)

#@since 1.8.4
= reopen Enumerable

== Instance Methods

--- each_slice(n) {|list| ... } -> nil

n ���Ǥ��ĥ֥�å����Ϥ��Ʒ����֤��ޤ���
���ǿ��� n �ǳ���ڤ�ʤ��Ȥ��ϡ�
�Ǹ�β�������ǿ�������ޤ���

nil ���֤��ޤ���

@arg n   ���ڤ����ǿ��򼨤������Ǥ���

��:

  (1..10).each_slice(3) {|a| p a}
      # => [1, 2, 3]
      #    [4, 5, 6]
      #    [7, 8, 9]
      #    [10]

@see [[m:Enumerable#each_cons]]

--- each_cons(n) {|list| ... } -> nil

���Ǥ��ʣ����� n ���Ǥ��Ĥ˶��ڤꡢ
�֥�å����Ϥ��Ʒ����֤��ޤ���

nil ���֤��ޤ���

@arg n   ���ڤ����ǿ��򼨤������Ǥ���

��:

  [1, 2, 3, 4, 5].each_cons(3) {|a| p a }
      # => [1, 2, 3]
      #    [2, 3, 4]
      #    [3, 4, 5]

@see [[m:Enumerable#each_slice]]

--- enum_slice(n) -> Enumerable::Enumerator

n ���Ǥ��ķ����֤� Enumerator ���֤��ޤ���
Enumerable::Enumerator.new(self, :each_slice, n) ��Ʊ���Ǥ���

@arg n   ���ڤ����ǿ��򼨤������Ǥ���
@see [[m:Enumerable#each_cons]]

--- enum_cons(n) -> Enumerable::Enumerator

���Ǥ��ʣ����� n ���Ǥ��Ĥ˶��ڤäƷ����֤� Enumerator ���֤��ޤ���

Enumerable::Enumerator.new(self, :each_cons, n) ���֤��ޤ���

@arg n   ���ڤ����ǿ��򼨤������Ǥ���
@see [[m:Enumerable#each_slice]]

--- enum_with_index -> Enumerable::Enumerator

���ǤȤ��Υ���ǥå������Ф��Ʒ����֤� Enumerator ���֤��ޤ���
Enumerable::Enumerator.new(self, :each_with_index) ��Ʊ���Ǥ���

@see [[m:Enumerable#each_with_index]]

#@end
#@end
#@end
