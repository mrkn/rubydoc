require complex
require rational
require matrix
#@if (version > "1.9.0")
require prime
[[c:Rational]] �� [[c:Complex]] ���ꥷ����쥹�����ѤǤ���褦�ˤ���饤�֥��Ǥ������ͥ饤�֥��ε�ư�򥰥��Х���ѹ����ޤ���
#@else
[[lib:rational]] �� [[lib:complex]] �򥷡���쥹�����ѤǤ���褦�ˤ���饤�֥��Ǥ������ͥ饤�֥��ε�ư�򥰥��Х���ѹ����ޤ���
#@end

 * �����ν���������ڤ�ʤ���硢 [[c:Rational]] ���֥������Ȥ��֤��褦�ˤʤ�ޤ���
 * ʣ�ǿ���ͭ�����α黻��̤��¿��������˼��ޤ��硢 [[c:Float]] ���֥������Ȥ� [[c:Integer]] ���֥������Ȥ��֤��ޤ���
 * [[c:Math]] �⥸�塼��ο��شؿ��������Ƚ���򡢼¿��Τߤ���ʣ�ǿ��ؤȳ��礷�ޤ���

=== ���Ѷ���

Integer �� Float ����� Rational �ϸ�̵����ɽ���Ǥ����ϰϤ��礭�����ᡢ
���ͤα黻�ˤ����� Rational �򥷡���쥹�����Ѥ��������Ȥ�����ޤ���
������ mathn �饤�֥��ϡ��ƿ��ͥ��饹�δ֤δط���
���礦�� Bignum �� Fixnum �ȤΤ褦�ʼ�ưŪ���Ѵ������ط��ˤ��ޤ���

==== ������ͭ����������Ѵ�

����Ū�ˤϡ�Rational �Υ��󥹥��󥹤������ʤ�С�����ϼ�ưŪ�� Integer
(Fixnum �ޤ��� Bignum)�Ȥʤꡢ�ޤ�������/�����η�̡�
����ڤ�ʤ����� Rational ���֤�褦�ˤʤ�ޤ�����Ԥϡ������Υ᥽�åɡ�/�פ�����(.div)�Ǥʤ�����(.quo)���֤��褦�ˤʤ롢�Ȥ������Ȥ��̣���ޤ���

��:
  1/2                #=> 0
  2 * Rational(1,2)  #=> Rational(1,1)

  require 'mathn'
  1/2                #=> Rational(1,2)  
  2 * Rational(1,2)  #=> 1 (Fixnum)

==== �¿���ʣ�ǿ�������Ѵ�

Ʊ�ͤˤ��� Complex �Υ��󥹥��󥹤ε����� 0 �ʤ�С������Ȥ��ƴޤޤ�Ƥ��� Rational, Float, �ޤ��� Integer ���֥������Ȥ��Ѵ�����ޤ���

���������ر黻������衦�����ʣ�ǿ��˳��礹��Τǡ� mathn �����Ѥ��ʤ����ˤ��ϰϥ��顼�㳰��ȯ�����Ƥ����褦�ʱ黻�� Complex ���֥������Ȥ��֤����⤢��ޤ���

��:
 Complex(0,-1)**2  #=> Complex(-1,0)
#@since 1.8.5
 Math.sqrt(-1)     #=> NaN
#@else
 Math.sqrt(-1)     #=> Errno::EDOM
#@end
 
 require 'mathn'
 Complex(0,-1)**2  #=> -1
 Math.sqrt(-1)     #=> Complex(0,1)
 

=== ���Ѿ�����
�ʤ������ε�ư�ϡ������Х�˱ƶ���Ϳ���ޤ���
�Ĥޤꡢ(Ruby �ǽ񤫤줿)���ѥ饤�֥��� require ���Ƥ�����硢
�饤�֥�����ư��⡢��Τ褦���ѹ�����뤳�Ȥˤʤ�ޤ���
¾�ͤν񤤤��饤�֥���Ȥ����ϡ�����ղ�����

�դˡ����ѥ饤�֥��κ�Ԥ������ϡ����� [[lib:mathn]] �� require
������ǽ����α�դ��ƽ񤤤Ʋ�����п��ڤ��Ȼפ��ޤ���
����Ʊ�Τ�������տޤ���ʤ�� [[m:Integer#/]] �ǤϤʤ� [[m:Integer#div]] ���Ѥ�����ɤ��Ǥ��礦��

  * [[ruby-list:1174]]

#@since 1.9
=== Prime

���饹 [[c:Prime]] ��Ruby 1.8�ޤǤ� [[lib:mathn]] ���������Ƥ��ޤ�����
���ߤϥ饤�֥�� [[lib:prime]] �˰�ư���Ƥ��ޤ����ߴ����Τ��� mathn ���ɤ߹���ȼ�ưŪ�� prime �� [[m:Kernel.#require]] ����ޤ���

@see prime.rd
#@end

#@until 1.9.1
= reopen Integer

== Class Methods

--- from_prime_division(pd) -> Integer
�ǰ���ʬ������� pd ���������ޤ���
pd �� [�ǰ���, �ؿ�] �Ȥ�����Ǥ���

��:

  Integer.from_prime_division [[2,3],[3,2]]
  # => 72 == 2**3 * 3**2

== Instance Methods

--- gcd2(int)
#@todo

��:

  12.gcd2 8
  # => 4

--- prime_division
#@todo

���ǰ��ҤˤĤ����ǰ��ҤȻؿ����Ȥ��¤٤�������֤��ޤ���

��:

  72.prime_division
  # => [[2, 3], [3, 2]]
#@end

= redefine Fixnum

== Instance Methods

--- /(other)
#@todo

Fixnum#quo ��Ʊ��Ư���򤷤ޤ�(ͭ�����ޤ����������֤��ޤ�)��

#@#* Fixnum#divmod�ξ����������ʲ��ޤǵ�ޤ�褦�ˤʤ롣
#@#* ��Ȥ�Ȥ�Fixnum#divmod��Fixnum#divmod!�Ȥʤ롣

= redefine Bignum

== Instance Methods

--- /(other)
#@todo

Bignum#quo ��Ʊ��Ư���򤷤ޤ�(ͭ�����ޤ����������֤��ޤ�)��

#@#* ��Ȥ�Ȥ�Bignum#divmod��Bignum#divmod!�Ȥʤ롣

= redefine Rational

== Instance Methods

--- **(rhs) -> Numeric
#@todo

self �Τ٤�����֤��ޤ��� Rational �ˤʤ�褦�Ǥ���� Rational ���֤��ޤ���

--- power2
#@todo

      ��꤫��(^^;;

--- inspect
ͭ�����ͤ�ʹ֤��ɤߤ䤹������ʸ����ɽ���ˤ����֤��ޤ���

���ߤΥС������Ǥ� "3/5", "-17/7" �Τ褦��10�ʿ��δ���ʬ��ɽ�����֤��ޤ���

= redefine Math

== Module Functions

--- sqrt(a) -> Numeric
#@todo

a ������ʿ�������֤��ޤ���
a �� Complex �λ��ϡ�Complex ���֤��ޤ���
a ����λ��ϡ�a �����ˤ��ơ�����ʿ������ Complex �ε�������������֤��ޤ���
����ʳ��ϡ�Math.rsqrt �η�̤��֤��ޤ���

--- rsqrt(a) -> Numeric
#@todo

ʣ�ǿ����θ���ʤ��Τǡ���ο��� Complex �򤢤����ʤ��Ǥ���������

a �� Float �λ��ϡ�Float ���֤��ޤ���
����ʳ��λ���ʿ������ͭ�����Ǥ���С�Rational �ޤ��� Integer ���֤��ޤ���
̵�����Ǥ���С�Float ���֤��ޤ���

#@until 1.9.1
= class Prime < Object

include Enumerable

== Class Methods

--- new
�ǿ�����󤹤륪�֥������Ȥ���ޤ���

��:
  q = Prime.new
  q.class    #=> Prime

== Instance Methods

--- succ
--- next

�����ǿ����֤��ޤ���

��:

  q = Prime.new
  q.succ # => 2
  q.succ # => 3
  q.succ # => 5

--- each {...} -> object
�ǿ��ˤĤ��Ʒ����֤����ƥ졼���Ǥ���
�����̵�¥롼�פˤʤ�Τ�ɬ�� break ������Ƥ���������

��:

  > q=Prime.new; i = 0; q.each  {|x| break if i > 5; puts x; i+=1;}
  2
  3
  5
  7
  11
  13

= reopen Rational
== Constants
--- Unify
�������������Ѥ��Ƥ��ޤ��������Ϲͤ��ʤ��Ǥ����������桼�����ץ����Ǥ����Ѥ��ʤ��Ǥ���������

���������Ruby 1.9.1�ʹߤǤϺ������ޤ���

= reopen Complex
== Constants
--- Unify
�������������Ѥ��Ƥ��ޤ��������Ϲͤ��ʤ��Ǥ����������桼�����ץ����Ǥ����Ѥ��ʤ��Ǥ���������

���������Ruby 1.9.1�ʹߤǤϺ������ޤ���
#@end
