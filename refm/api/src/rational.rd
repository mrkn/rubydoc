ͭ�����Τ���Υ��饹��
rational �� require ����� [[c:Integer]] �Υ᥽�åɤ��ʲ��Τ褦�˺��������롣

= reopen Kernel
== Private Instance Methods
--- Rational(a, b)
[[c:Rational]] ���֥������Ȥ��������롣

Creates a Rational number (i.e. a fraction).  +a+ and +b+ should be Integers:
 
  Rational(1,3)           # -> 1/3

Note: trying to construct a Rational with floating point or real values
produces errors:

  Rational(1.1, 2.3)      # -> NoMethodError


= redefine Integer

== Instance Methods

--- /(other)

������

  * other��ͭ����(Rational)�ʤ�С�ͭ����(Rational)���֤���
  * other������ʳ��ʤ顢[[m:Integer#/]]��Ʊ�����Ĥޤꡢ
    other ������(Integer)�ʤ�С�����(Integer)��(����)����ư����(Float)�ʤ�С�
    ��ư����(Float)���֤���
    ��������������⡢other == 0 �λ��ϡ�[[c:ZeroDivisionError]]�Ȥʤ롣

--- **(other)

�٤��衣

  * other�����ޤ���0������(Integer)�ʤ�С�����(Integer)���֤���
  * other���������(Integer)�ʤ�С�ͭ����(Rational)���֤���
  * other��ͭ����(Rational)����ư����(Float)�ʤ�С���ư����(Float)���֤���

  2 **  3          #=> 8
  2 ** -3          #=> Rational(1, 8)
  2 ** Rational(3) #=> 8.0

= reopen Integer

== Instance Methods

--- power!(other)

[[lib:rational]]�Ǻ�������������[[m:Integer#**]]����̾��
other �����ޤ��� 0 ������ (Integer) �ʤ�С�
���� (Integer) �򡢤���ʳ��ʤ顢��ư���� (Float) ���֤���

--- to_r
�б�����ͭ���� (Rational) ���֤���
Rational(self, 1) ��Ʊ����

--- gcd(n)

self �� n �κ��������� Fixnum �Ȥ����֤���
self �� n ����ξ��ϡ������Ѵ����Ƥ���׻����롣

   72.gcd 168           # -> 24
   19.gcd 36            # -> 1

--- lcm(n)

self �� n �κǾ����ܿ����֤���
self �� n ����ξ��ϡ������Ѵ����Ƥ���׻����롣

   6.lcm 7        # -> 42
   6.lcm 9        # -> 18

--- gcdlcm(int)

���������ȺǾ����ܿ������� [self.gcd, self.lcm] ���֤��ޤ���

   6.gcdlcm 9     # -> [3, 18]

--- numerator
In an integer, the value is the numerator of its rational equivalent.
Therefore, this method returns self.

--- denominator
In an integer, the denominator is 1.  Therefore, this method returns 1.


= redefine Fixnum
== Instance Methods

--- quo(other)
If Rational is defined, returns a Rational number instead of a Fixnum.

--- **(other)
--- rpower (other)
Returns a Rational number if the result is in fact rational (i.e. other < 0).

= reopen Fixnum
== Instance Methods
--- power!(other)

= redefine Bignum
== Instance Methods
--- quo(other)
If Rational is defined, returns a Rational number instead of a Bignum.

--- **(other)
--- rpower(other)
Returns a Rational number if the result is in fact rational (i.e. +other+ < 0).

= reopen  Bignum
== Instance Methods
--- power!(other)

= class Rational < Numeric

#@#�������򸫤Ƥ� include ���Ƥʤ��褦��
#@#include Comparable

Integer < Rational < Float �ν�˶����Ǥ����Ĥޤ� other �� Float �ʤ顢
self �� Float ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ���other �� Integer �ʤ� other ��
Rational ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ����Ѿ���㳰�Ǥ���

== Class Methods
--- new!(num, den = 1)

Implements the constructor. This method does not reduce to lowest
terms or check for division by zero. Therefore #Rational() should
be preferred in normal use.

  puts Rational.new!(6,10) #=> 6/10

--- reduce(num, den = 1)

Reduces the given numerator and denominator to their lowest terms.
Use Rational() instead.

== Instance Methods

--- numerator

ʬ�Ҥ� Fixnum �Ȥ����֤��ޤ���

--- denominator

ʬ��� Fixnum �Ȥ����֤��ޤ���

--- +(other)

�¤�׻����ޤ���

  Rational(3, 4) + 2               # => Rational(11, 4)
  Rational(3, 4) + Rational(2, 1)  # => Rational(11, 4)
  Rational(3, 4) + 2.0             # => 2.75

--- -(other)

����׻����ޤ���

--- *(other)

�Ѥ�׻����ޤ���

  r = Rational(3,4)    # -> Rational(3,4)
  r * 2                # -> Rational(3,2)
  r * 4                # -> Rational(3,1)
  r * 0.5              # -> 0.375
  r * Rational(1,2)    # -> Rational(3,8)

--- /(other)

����׻����ޤ���
other �� 0 �λ��ϡ��㳰 [[c:ZeroDivisionError]] ���ꤲ�ޤ���

  Rational(3, 4) / 2              # => Rational(3, 8)
  Rational(3, 4) / Rational(2, 1) # => Rational(3, 8)
  Rational(3, 4) / 2.0            # => 0.375

--- %(other)

��;��׻����ޤ��������ͤ� self �������ͤ�ۤ��ʤ�����礬 self ��Ʊ��
Numeric ���֤��ޤ���

  Rational(3, 4) % 2               # => Rational(3, 4)
  Rational(3, 4) % Rational(2, 1)  # => Rational(3, 4)
  Rational(3, 4) % 2.0             # => 0.75

--- **(other)

�Ѥ�׻����ޤ���

  Rational(3, 4) ** 2              # => Rational(9, 16)
  Rational(3, 4) ** Rational(2, 1) # => 0.5625
  Rational(3, 4) ** 2.0            # => 0.5625

--- divmod(other)

self �� other �ǳ�ä�������;���������֤��ޤ���
���� Fixnum��;��������ͤ� other �������ͤ�ۤ�������礬 other ��Ʊ��
Numeric �Ǥ���[[m:Numeric#divmod]] �⻲�Ȥ��Ʋ�������

 Rational(3,4).divmod(Rational(2,3))  # => [1, Rational(1, 12)]
 Rational(-3,4).divmod(Rational(2,3)) # => [-2, Rational(7, 12)]
 Rational(3,4).divmod(Rational(-2,3)) # => [-2, Rational(-7, 12)]

 Rational(9,4).divmod(2)              # => [1, Rational(1, 4)]
 Rational(9,4).divmod(Rational(2, 1)) # => [1, Rational(1, 4)]
 Rational(9,4).divmod(2.0)            # => [1, 0.25]

--- abs

self �����ʤ� self����ʤ� -1 * self ���֤��ޤ���

--- <=>(other)

other ����٤� self ���礭���ʤ� 1��Ʊ���ʤ� 0���������ʤ� -1 ���֤��ޤ���

--- to_i

[[c:Fixnum]] ���Ѵ����ޤ���

--- to_f

[[c:Float]] ���Ѵ����ޤ���

--- to_s

ʸ������Ѵ����ޤ���

  Rational(-3,4).to_s # => "-3/4"
