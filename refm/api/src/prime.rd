#@since 1.9.1

�ǿ����ǰ���ʬ��򰷤��饤�֥��Ǥ���

�饤�֥����濴�ˤ���Τ� [[c:Prime]] ���饹�ǡ�������ǿ����Τ�ɽ�����󥰥�ȥ�Ǥ����ޤ����ǿ������ǰ���ʬ��˴ؤ���᥽�åɤ� [[c:Integer]] ���ɲä��ޤ���
����ˡ� Prime ���饹�ε�ǽ��¸����뤿�������Υ��饹����Ĥ��󶡤���Ƥ��ޤ���

=== ��

  Prime.each(100) do |prime|
    p prime #=> 2, 3, 5, 7, 11, ..., 97
  end

  2.prime? #=> true
  4.prime? #=> false

=== ������

[[c:Prime]] �Υ᥽�åɤ�����������ε����ǿ����������Ѥ��ޤ���
������ϵ����ǿ��������ˡ�μ������󶡤��ޤ����ޤ������֤����ξ峦�򵭲����뵡ǽ�⤢��ޤ���
���ˡ� [[c:Enumerator]] �ȸߴ����Τ��볰�����ƥ졼���Ǥ⤢��ޤ���

�����˱�����Ŭ�ڤʵ����ǿ��������르�ꥺ��ϰۤʤ�Τǡ������Ĥ���������μ������Ѱդ���Ƥ��ޤ��� 
[[c:Prime::PseudoPrimeGenerator]] ��������δ���Ȥʤ륯�饹�Ǥ���

: [[c:Prime::EratosthenesGenerator]]
  ����ȥ��ƥͥ�����������Ѥ��ޤ���
: [[c:Prime::TrialDivisionGenerator]]
  ��Խ���ˡ����Ѥ��ޤ���
: [[c:Prime::Generator23]]
  2 �� 3 �ǳ���ڤ�ʤ����Ƥ������������������ޤ���
  ���ο�����ǿ��ο���Ȥ��ƤϻȤ�ʪ�ˤʤ�ޤ��󡣤�������¾����������®����
  ����λ����̤⾯�ʤ��Ȥ�����ħ������ޤ������Τ��ᡢ����ۤ��礭���ʤ��ơ�
  �ǿ������Ǥ�¿�����������ΰ���ʬ��˸����Ƥ��ޤ���

Prime ���饹�γƥ᥽�åɤϡ�����Ū�����Ӥ����ꤷ��Ŭ�ڤ����������Ѥ��ޤ���
�桼������ɬ�פ˱�����������������������Ѥ���褦�˥��ץ������������ꤹ�뤳�Ȥ�Ǥ��ޤ����ޤ����桼�������ȼ����������������뤳�Ȥ�Ǥ��ޤ���

= class Prime < Object
include Enumerable

�ǿ����Τ�ɽ���ޤ���

=== ���󥹥��󥹤����������ˡ

Prime ���饹�ϥ��󥰥�ȥ�Ǥ���ȹͤ��Ƥ���������Prime ���饹�ϥǥե���ȤΥ��󥹥��󥹤���äƤ��ꡢ�桼�����Ϥ��Υ��󥹥��󥹤����Ѥ��٤��Ǥ��� [[m:Prime.instance]] �ˤ�äƤ��Υ��󥹥��󥹤�����Ǥ��ޤ���

���Ȥθߴ����Τ���� [[m:Prime.new]] ��ĤäƤ��ޤ������Υ᥽�åɤ���侩�Ǥ��Τǡ��������ץ����Ǥ����Ѥ��ʤ��Ǥ���������

�ʤ����������Τ���˥ǥե���ȥ��󥹥��󥹤Υ᥽�åɤ򥯥饹�᥽�åɤȤ��Ƥ����ѤǤ��ޤ���

��:
  Prime.instance.prime?(2)  #=> true
  Prime.prime?(2)           #=> true


== Class Methods
--- new -> Prime
���Ȥθߴ����Τ���Υ᥽�åɤǤ����������ץ����Ǥ� [[m:Prime.instance]] �䥯�饹�᥽�åɤ����Ѥ��Ƥ���������

���Υ᥽�åɤ��֤����󥹥��󥹤ϡ��ǥե���ȤΥ��󥹥��󥹤Ȥϰ�ä�[[c:Prime::OldCompatibility]] �ǳ�ĥ����Ƥ��ޤ���

--- instance -> Prime

[[c:Prime]] �Υǥե���ȤΥ��󥹥��󥹤��֤��ޤ���


== Instance Methods

--- each(upper_bound = nil, generator = EratosthenesGenerator.new){|prime| ... } -> object
--- each(upper_bound = nil, generator = EratosthenesGenerator.new)               -> Enumerator

���Ƥ��ǿ�����֤�Ϳ����줿�֥�å����Ϥ���ɾ�����ޤ���

@param upper_bound Ǥ�դ�������������ꤷ�ޤ������ξ峦�Ǥ���
                   nil ��Ϳ����줿����̵�¤����³���ޤ���

@param generator �ǿ�������Υ��󥹥��󥹤���ꤷ�ޤ���

@return �֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å���Ϳ�����ʤ��ä����ϡ�[[c:Enumerator]] �ȸߴ����Τ��볰�����ƥ졼�����֤��ޤ���

=== ��:
  Prime.each(6).each{|prime| prime }  # => 5
  Prime.each(7).each{|prime| prime }  # => 7
  Prime.each(10).each{|prime| prime } # => 7
  Prime.each(11).each{|prime| prime } # => 11

=== ��: 30�ʲ����л��ǿ�
  Prime.each(30).each_cons(2).select{|p,r| r-p == 2} 
    #=> [[3, 5], [5, 7], [11, 13], [17, 19]]

=== ��
���Υ᥽�åɤˡ������ǿ���Ǥʤ������ǿ���Ϳ����٤��ǤϤ���ޤ���

���Υ᥽�åɤϡ��ǿ���γ������ƥ졼�����������ƥ졼�����Ѵ�����Ruby�餷���ץ���ߥ󥰤��󶡤��뤳�Ȥ���̳�Ǥ����ȼ����ǿ������ݾ㤹��Τϥ᥽�åɤ���̳�ǤϤ���ޤ��󡣽��äơ����Τ褦�����٤��㤤�ǿ��������Ϳ����ȡ������ǿ��Ȥϸ¤�ʤ�����ȯ�����ޤ���
 Prime.each(50, Prime::Generator23.new) do |n|
   p n #=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 25, 29, 31, 35, 37, 41, 43, 47, 49]
 end

@see [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]

--- int_from_prime_division(pd) -> Integer

�ǰ���ʬ�򤵤줿��̤򸵤ο��ͤ��ᤷ�ޤ���

������ [[p_1, e_1], [p_2, e_2], ...., [p_n, e_n]] �Τ褦�Ǥ���Ȥ���
��̤�  p_1**e_1 * p_2**e_2 * .... * p_n**e_n �Ȥʤ�ޤ���

@param pd �����Υڥ����������ꤷ�ޤ����ޤޤ�Ƥ���ڥ���������Ǥ��ǰ�����
          �������ǤϤ����ǰ����λؿ��򤢤�路�ޤ���

��:
  Prime.int_from_prime_division([[2,2], [3,1]])  #=> 12
  Prime.int_from_prime_division([[2,2], [3,2]])  #=> 36

--- prime?(value, generator = Prime::Generator23.new) -> bool

Ϳ����줿�������ǿ��Ǥ�����ϡ������֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

@param value �ǿ����ɤ��������å�����Ǥ�դ���������ꤷ�ޤ���

@param generator �ǿ�������Υ��󥹥��󥹤���ꤷ�ޤ���

@see [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]

--- prime_division(value, generator= Prime::Generator23.new) -> [[Integer, Integer]]

Ϳ����줿�������ǰ���ʬ�򤷤ޤ���

@param value �ǰ���ʬ�򤹤�Ǥ�դ���������ꤷ�ޤ���

@param generator �ǿ�������Υ��󥹥��󥹤���ꤷ�ޤ���

@return �ǰ����Ȥ��λؿ���������ڥ������ǤȤ�������Ǥ����Ĥޤꡢ����ͤγ����Ǥ�2���Ǥ����� [n,e] �Ǥ��ꡢ���줾��������������1���� n �� value ���ǰ�������2���Ǥ� n**e �� value �����ڤ����μ����� e �Ǥ���

@raise ZeroDivisionError Ϳ����줿���ͤ�����Ǥ������ȯ�����ޤ���

��:
    Prime.prime_division(12) #=> [[2,2], [3,1]]
    Prime.prime_division(10) #=> [[2,1], [5,1]]

@see [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]

== Instance Methods

= class Prime::PseudoPrimeGenerator < Object
include Enumerable

�����ǿ�������ҤΤ������ݥ��饹�Ǥ���

[[c:Prime]] �γƥ᥽�åɤ����Ѥ�������ε����ǿ����Ҥϡ� Prime::PseudoPrimeGenerator �Υ��󥹥��󥹤Ǥ��뤳�Ȥ����Ԥ���Ƥ��ޤ���
���Υ��饹��Ѿ������ݥ��饹�� succ, next, rewind �򥪡��С��饤�ɤ��ʤ���Фʤ�ޤ���

�ȼ����ǿ���󥢥르�ꥺ���������褦�Ȥ����������ơ��桼���������Υ��饹�����Ѥ���ɬ�פϤ���ޤ��󡣹���� [[c:Prime]] ���饹�����Ѥ��Ƥ���������

== Class Methods

--- new(upper_bound = nil)

���Ȥ��������ޤ���

@param upper_bound ��󤹤��ǿ��ξ峦����ꤷ�ޤ���

== Instance Methods

--- each {|prime| ... } -> object
--- each -> self

�ǿ���Ϳ����줿�֥�å����Ϥ���ɾ�����ޤ���

--- next -> ()
--- succ -> ()

���ε����ǿ����֤��ޤ���
�ޤ�����Ū�ʰ��֤�ʤ�ޤ���

���֥��饹�Ǽ������Ƥ���������

@raise NotImplementedError ɬ��ȯ�����ޤ���

--- rewind -> ()

�����֤򴬤��ᤷ�ޤ���

���֥��饹�Ǽ������Ƥ���������

@raise NotImplementedError ɬ��ȯ�����ޤ���

@see [[m:Enumerator#rewind]]

--- upper_bound -> Integer | nil

���ߤ����峦���֤��ޤ��� nil �Ͼ峦���ʤ�̵�¤��ǿ�����󤹤٤��Ǥ��뤳�Ȥ��̣���ޤ���

--- upper_bound=(upper_bound)

���������峦�򥻥åȤ��ޤ���

@param upper_bound �������峦�������ޤ��� nil �ǻ��ꤷ�ޤ��� nil �Ͼ峦���ʤ�̵�¤��ǿ�����󤹤٤��Ǥ��뤳�Ȥ��̣���ޤ���

--- with_index{|prime, index| ... }      -> self
--- each_with_index{|prime, index| ... } -> self
--- with_index      -> Enumerator
--- each_with_index -> Enumerator

Ϳ����줿�֥�å����Ф��ơ��ǿ���0������Ϣ�֤��Ϥ���ɾ�����ޤ���

@return �֥�å���Ϳ����줿���� self ���֤��ޤ��� �֥�å���Ϳ�����ʤ��ä����� Enumerator ���֤��ޤ���

��:
  Prime::EratosthenesGenerator.new(10).each_with_index do |prime, index|
    p [prime, index]
  end
  # [2, 0]
  # [3, 1]
  # [5, 2]
  # [7, 3]

@see [[m:Enumerator#with_index]]

--- with_object(obj){|prime, obj| ... } -> object
--- with_object(obj) -> Enumerator

Ϳ����줿Ǥ�դΥ��֥������Ȥ����Ǥ�֥�å����Ϥ���ɾ�����ޤ���

@param obj Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���
@return �ǽ��Ϳ����줿���֥������Ȥ��֤��ޤ���
@return �֥�å���Ϳ����줿���� obj ���֤��ޤ����֥�å���Ϳ�����ʤ��ä����� Enumerator ���֤��ޤ���

@see [[m:Enumerator#with_object]]

= class Prime::EratosthenesGenerator < Prime::PseudoPrimeGenerator

[[c:Prime::PseudoPrimeGenerator]] �ζ�ݥ��饹�Ǥ���
�ǿ��������˥���ȥ��ƥͥ��Τդ뤤����Ѥ��Ƥ��ޤ���

== Instance Methods

--- next -> Integer
--- succ -> Integer

����(����)�ǿ����֤��ޤ����ʤ������μ����ˤ����Ƥϵ����ǿ��Ͽ����ǿ��Ǥ���

�ޤ�����Ū�������֤�ʤ�ޤ���

��:
 generator = Prime::EratosthenesGenerator.new
 p generator.next #=> 2
 p generator.next #=> 3
 p generator.succ #=> 5
 p generator.succ #=> 7
 p generator.next #=> 11

--- rewind -> nil

�����֤򴬤��ᤷ�ޤ���

��:
 generator = Prime::EratosthenesGenerator.new
 p generator.next #=> 2
 p generator.next #=> 3
 p generator.next #=> 5

 generator.rewind

 p generator.next #=> 2


= class Prime::TrialDivisionGenerator < Prime::PseudoPrimeGenerator

[[c:Prime::PseudoPrimeGenerator]] �ζ�ݥ��饹�Ǥ���
�ǿ��������˻�Խ���ˡ����Ѥ��Ƥ��ޤ���

== Instance Methods

--- next -> Integer
--- succ -> Integer

����(����)�ǿ����֤��ޤ����ʤ������μ����ˤ����Ƥϵ����ǿ��Ͽ����ǿ��Ǥ���

�ޤ�����Ū�������֤�ʤ�ޤ���

--- rewind -> nil

�����֤򴬤��ᤷ�ޤ���

= class Prime::Generator23 < Prime::PseudoPrimeGenerator

2��3�ȡ�3 ����礭���� 2 �Ǥ� 3 �Ǥ����ڤ�ʤ����Ƥ��������������ޤ���

�����������ǿ����򵿻��ǿ��ˤ�����ǥ����å������硢���Τ褦�������٤�����®�ǥ������񤷤ʤ������ǿ������郎Ŭ���Ƥ��ޤ���

������ [[m:Prime#each]] �Τ褦���ǿ��������������Ū�ˤϤޤä������Ω���ޤ���

== Instance Methods

--- next -> Integer
--- succ -> Integer

���ε����ǿ����֤��ޤ���

�ޤ�����Ū�������֤�ʤ�ޤ���

--- rewind -> nil

�����֤򴬤��ᤷ�ޤ���


#@# = class Prime::EratosthenesSieve < Object
#@# internal use

#@# = class Prime::TrialDivision < Object
#@# internal use


= module Prime::OldCompatibility

Ruby1.8 �Ȥθߴ����Τ���Υ⥸�塼��Ǥ��� 
[[c:Prime]] ���֥������Ȥ�Ruby 1.8�ߴ��ε�ǽ��Ϳ���ޤ���

[[m:Prime.new]] ���֤����󥹥��󥹤Ϥ��Υ⥸�塼��� [[m:Object#extend]] ����Ƥ��ޤ��������� [[m:Prime.instance]] ���֤����󥹥��󥹤� extend ����Ƥ��ޤ���

== Instance Methods

--- next -> Integer
--- succ -> Integer

[[m:Prime#next]] ���������ޤ���

�����ǿ����֤��ޤ���

--- each{|prime| ... } -> object
--- each               -> object

[[m:Prime#each]] ���������ޤ���

���Ƥ��ǿ�����󤷡����줾����ǿ���֥�å����Ϥ���ɾ�����ޤ���
̵�¥롼�פˤʤ�Τ�ɬ�� break ������Ƥ���������

break ��˺��ٸƤӽФ��ȡ��ǽ餫��ǤϤʤ����󥹥�����������¸����Ƥ������ǰ��֤�������Ƴ����ޤ���

@return �֥�å��դ��ǸƤӽФ��줿���� break �ΰ������֤��ͤˤʤ�ޤ���
        �֥�å�̵���ǸƤӽФ��줿���� [[c:Prime::EratosthenesGenerator]] �Υ��󥹥��󥹤��֤��ޤ���


= reopen Integer

== Class Methods

--- from_prime_division(pd) -> Integer

�ǰ���ʬ�򤵤줿��̤򸵤ο��ͤ��ᤷ�ޤ���

@param pd �����Υڥ����������ꤷ�ޤ����ޤޤ�Ƥ���ڥ���������Ǥ��ǰ�����
          �������ǤϤ����ǰ����λؿ��򤢤�路�ޤ���

@see [[m:Prime#int_from_prime_division]]

��:
  Prime.int_from_prime_division([[2,2], [3,1]])  #=> 12
  Prime.int_from_prime_division([[2,2], [3,2]])  #=> 36


--- each_prime(upper_bound){|prime| ... } -> object
--- each_prime(upper_bound) -> Enumerator

���Ƥ��ǿ�����󤷡����줾����ǿ���֥�å����Ϥ���ɾ�����ޤ���

@param upper_bound Ǥ�դ�������������ꤷ�ޤ������ξ峦�Ǥ���
                   nil ��Ϳ����줿����̵�¤����³���ޤ���
@return �֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å���Ϳ�����ʤ��ä����ϡ�[[c:Enumerator]] �ȸߴ����Τ��볰�����ƥ졼�����֤��ޤ���

@see [[m:Prime#each]]

== Instance Methods

--- prime_division(generator = Prime::Generator23.new) -> [[Integer, Integer]]

���Ȥ��ǰ���ʬ�򤷤���̤��֤��ޤ���

@param generator �ǿ�������Υ��󥹥��󥹤���ꤷ�ޤ���

@return �ǰ����Ȥ��λؿ���������ڥ������ǤȤ�������Ǥ����Ĥޤꡢ����ͤγ����Ǥ�2���Ǥ����� [n,e] �Ǥ��ꡢ���줾��������������1���� n �� self ���ǰ�������2���Ǥ� n**e �� self �����ڤ����μ����� e �Ǥ���

@raise ZeroDivisionError self ������Ǥ������ȯ�����ޤ���

@see [[m:Prime#prime_division]]

��:
    12.prime_division #=> [[2,2], [3,1]]
    10.prime_division #=> [[2,1], [5,1]]

--- prime? -> bool

���Ȥ��ǿ��Ǥ����硢�����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

��:

  1.prime? # => false
  2.prime? # => true

@see [[m:Prime#prime?]]

#@end
