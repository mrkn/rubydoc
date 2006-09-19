mathn

[[lib:rational]] �� [[lib:complex]] �򥷡���쥹�����Ѥ���褦�ˤ���饤�֥��Ǥ���

Integer �� Float ����� Rational �ϸ�̵����ɽ���Ǥ����ϰϤ��礭�����ᡢ
���ͤα黻�ˤ����� Rational �򥷡���쥹�����Ѥ��������Ȥ�����ޤ���

��:

  1/2 -> Rational(1,2)
  2 * Rational(1,2) -> 1 (Fixnum)

�ޤ���Complex ��黻��̤�ɽ���ϰϤ򹭤���Τ����ѤǤ��ޤ���

��:

  Complex(0,-1)**2 -> -1 (Fixnum)
  Complex(1,-1) - Complex(0,-1) -> 1 (Fixnum)

require 'mathn' ����Ⱦ���ͤ�ư���Ԥʤ��褦�ˤʤ�ޤ���
�ĤޤꡢRational (�� Rational��ޤ� Complex) �� Integer (Fixnum �� Bignum) �Ȥδ֤δط���
���礦�� Bignum �� Fixnum �Ȥδ֤Τ褦�ʴط��ˤ��ޤ���
����Ū�ˤϡ�Rational �Υ��󥹥��󥹤������ʤ�С�����ϼ�ưŪ�� Integer
(Fixnum �ޤ��� Bignum)�Ȥʤꡢ�ޤ�������/�����η�̡�
����ڤ�ʤ����� Rational ���֤�褦�ˤʤ�ޤ���
��Ԥϡ������Υ᥽�åɡ�/�פ�����(.div)�Ǥʤ���
��(.quo)���֤��褦�ˤʤ롢�Ȥ������Ȥ��̣���ޤ���

�ʤ������ε�ư�ϡ������Х�˱ƶ���Ϳ���ޤ���
�Ĥޤꡢ(Ruby �ǽ񤫤줿)���ѥ饤�֥��� require ���Ƥ�����硢
�饤�֥�����ư��⡢��Τ褦���ѹ�����뤳�Ȥˤʤ�ޤ���
¾�ͤν񤤤��饤�֥���Ȥ����ϡ�����ղ�����
(�դˡ����ѥ饤�֥��κ�Ԥ������ϡ����� [[lib:mathn]] �� require
������ǽ����α�դ��ƽ񤤤Ʋ�����С����ڤ��Ȼפ��ޤ�)��

=== ����

  * [[unknown:ruby-list:1174]]

= reopen Integer

== Class Methods

--- from_prime_division(pd)

�ǰ���ʬ������� pd ���������ޤ���
pd �� [�ǰ���, �ؿ�] �Ȥ�����Ǥ���

��:

  Integer.from_prime_division [[2,3],[3,2]]
  # => 72 # == 2**3 * 3**2

=== Instance Methods

--- gcd2(int)

self �� int �κ�����������ޤ���

��:

  12.gcd2 8
  # => 4

--- prime_division

self ���ǰ���ʬ��(������)����ޤ���

��:

  72.prime_division
  # => [[2, 3], [3, 2]]

= redefine Fixnum

== Instance Methods

--- /(other)

Fixnum#quo ��Ʊ��Ư���򤷤ޤ�(ͭ�����ޤ����������֤��ޤ�)��

#@#* Fixnum#divmod�ξ����������ʲ��ޤǵ�ޤ�褦�ˤʤ롣
#@#* ��Ȥ�Ȥ�Fixnum#divmod��Fixnum#divmod!�Ȥʤ롣

= redefine Bignum

== Instance Methods

--- /(other)

Bignum#quo ��Ʊ��Ư���򤷤ޤ�(ͭ�����ޤ����������֤��ޤ�)��

#@#* ��Ȥ�Ȥ�Bignum#divmod��Bignum#divmod!�Ȥʤ롣

= redefine Rational

== Instance Methods

--- **

self �Τ٤�����֤��ޤ��� Rational �ˤʤ�褦�Ǥ���� Rational ���֤��ޤ���

--- power2

      ��꤫��(^^;;

--- inspect

��3/5�פʤɤη����֤��ޤ���

= redefine Math

== Module Functions

--- sqrt(a)

a ������ʿ�������֤��ޤ���
a �� Complex �λ��ϡ�Complex ���֤��ޤ���
a ����λ��ϡ�a �����ˤ��ơ�����ʿ������ Complex �ε�������������֤��ޤ���
����ʳ��ϡ�Math.rsqrt �η�̤��֤��ޤ���

--- rsqrt(a)

ʣ�ǿ����θ���ʤ��Τǡ���ο��� Complex �򤢤����ʤ��Ǥ���������

a �� Float �λ��ϡ�Float ���֤��ޤ���
����ʳ��λ���ʿ������ͭ�����Ǥ���С�Rational �ޤ��� Interger ���֤��ޤ���
̵�����Ǥ���С�Float ���֤��ޤ���

= class Prime < Object

include Enumerable

== Class Methods

--- new

�ǿ����������륪�֥������Ȥ���ޤ���

== Instance Methods

--- succ
--- next

�����ǿ����֤��ޤ���

��:

  q = Prime.new
  q.succ # => 2
  q.succ # => 3
  q.succ # => 5

--- each

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

#@if (version >= "1.9.0")
--- primes

((<ruby 1.9 feature>))

����ޤǤ˵�᤿�ǿ���������֤��ޤ���
#@end
