ͭ�����Τ���Υ��饹��
rational �� require ����� [[c:Integer]] �Υ᥽�åɤ��ʲ��Τ褦�˺��������롣

= reopen Kernel

== Module Functions

--- Rational(a, b)
#@todo
[[c:Rational]] ���֥������Ȥ��������롣

Creates a Rational number (i.e. a fraction).  +a+ and +b+ should be Integers:
 
  Rational(1,3)           # -> 1/3

Note: trying to construct a Rational with floating point or real values
produces errors:

  Rational(1.1, 2.3)      # -> NoMethodError


= redefine Integer

== Instance Methods

--- /(other)
#@todo

������

  * other��ͭ����(Rational)�ʤ�С�ͭ����(Rational)���֤���
  * other������ʳ��ʤ顢[[m:Integer#/]]��Ʊ�����Ĥޤꡢ
    other ������(Integer)�ʤ�С�����(Integer)��(����)����ư����(Float)�ʤ�С�
    ��ư����(Float)���֤���
    ��������������⡢other == 0 �λ��ϡ�[[c:ZeroDivisionError]]�Ȥʤ롣

--- **(other)
#@todo

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
#@todo

[[lib:rational]]�Ǻ�������������[[m:Integer#**]]����̾��
other �����ޤ��� 0 ������ (Integer) �ʤ�С�
���� (Integer) �򡢤���ʳ��ʤ顢��ư���� (Float) ���֤���

--- to_r
#@todo
�б�����ͭ���� (Rational) ���֤���
Rational(self, 1) ��Ʊ����

--- gcd(n)
#@todo

self �� n �κ��������� Fixnum �Ȥ����֤���
self �� n ����ξ��ϡ������Ѵ����Ƥ���׻����롣

   72.gcd 168           # -> 24
   19.gcd 36            # -> 1

--- lcm(n)
#@todo

self �� n �κǾ����ܿ����֤���
self �� n ����ξ��ϡ������Ѵ����Ƥ���׻����롣

   6.lcm 7        # -> 42
   6.lcm 9        # -> 18

--- gcdlcm(int)
#@todo

���������ȺǾ����ܿ������� [self.gcd, self.lcm] ���֤��ޤ���

   6.gcdlcm 9     # -> [3, 18]

--- numerator
#@todo
In an integer, the value is the numerator of its rational equivalent.
Therefore, this method returns self.

--- denominator
#@todo
In an integer, the denominator is 1.  Therefore, this method returns 1.


= redefine Fixnum
== Instance Methods

--- quo(other)
#@todo
If Rational is defined, returns a Rational number instead of a Fixnum.

--- **(other)
--- rpower (other)
#@todo
Returns a Rational number if the result is in fact rational (i.e. other < 0).

= reopen Fixnum
== Instance Methods
--- power!(other)
#@todo

= redefine Bignum
== Instance Methods
--- quo(other)
#@todo
If Rational is defined, returns a Rational number instead of a Bignum.

--- **(other)
--- rpower(other)
#@todo
Returns a Rational number if the result is in fact rational (i.e. +other+ < 0).

= reopen  Bignum
== Instance Methods
--- power!(other)
#@todo

= class Rational < Numeric

#@#�������򸫤Ƥ� include ���Ƥʤ��褦��
#@#include Comparable

Integer < Rational < Float �ν�˶����Ǥ����Ĥޤ� other �� Float �ʤ顢
self �� Float ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ���other �� Integer �ʤ� other ��
Rational ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ����Ѿ���㳰�Ǥ���

== Class Methods
--- new!(num, den = 1)
#@todo

Implements the constructor. This method does not reduce to lowest
terms or check for division by zero. Therefore #Rational() should
be preferred in normal use.

  puts Rational.new!(6,10) #=> 6/10

--- reduce(num, den = 1)
#@todo

Reduces the given numerator and denominator to their lowest terms.
Use Rational() instead.

== Instance Methods

--- numerator
#@todo

ʬ�Ҥ� Fixnum �Ȥ����֤��ޤ���

--- denominator
#@todo

ʬ��� Fixnum �Ȥ����֤��ޤ���

--- +(other)
#@todo

�¤�׻����ޤ���

  Rational(3, 4) + 2               # => Rational(11, 4)
  Rational(3, 4) + Rational(2, 1)  # => Rational(11, 4)
  Rational(3, 4) + 2.0             # => 2.75

--- -(other)
#@todo

����׻����ޤ���

--- *(other)
#@todo

�Ѥ�׻����ޤ���

  r = Rational(3,4)    # -> Rational(3,4)
  r * 2                # -> Rational(3,2)
  r * 4                # -> Rational(3,1)
  r * 0.5              # -> 0.375
  r * Rational(1,2)    # -> Rational(3,8)

--- /(other)
#@todo

����׻����ޤ���
other �� 0 �λ��ϡ��㳰 [[c:ZeroDivisionError]] ���ꤲ�ޤ���

  Rational(3, 4) / 2              # => Rational(3, 8)
  Rational(3, 4) / Rational(2, 1) # => Rational(3, 8)
  Rational(3, 4) / 2.0            # => 0.375

--- %(other)
#@todo

��;��׻����ޤ��������ͤ� self �������ͤ�ۤ��ʤ�����礬 self ��Ʊ��
Numeric ���֤��ޤ���

  Rational(3, 4) % 2               # => Rational(3, 4)
  Rational(3, 4) % Rational(2, 1)  # => Rational(3, 4)
  Rational(3, 4) % 2.0             # => 0.75

--- **(other)
#@todo

�Ѥ�׻����ޤ���

  Rational(3, 4) ** 2              # => Rational(9, 16)
  Rational(3, 4) ** Rational(2, 1) # => 0.5625
  Rational(3, 4) ** 2.0            # => 0.5625

--- divmod(other)
#@todo

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
#@todo

self �����ʤ� self����ʤ� -1 * self ���֤��ޤ���

--- <=>(other)
#@todo

other ����٤� self ���礭���ʤ� 1��Ʊ���ʤ� 0���������ʤ� -1 ���֤��ޤ���

--- to_i
#@todo

[[c:Fixnum]] ���Ѵ����ޤ���

--- to_f
#@todo

[[c:Float]] ���Ѵ����ޤ���

--- to_s
#@todo

ʸ������Ѵ����ޤ���

  Rational(-3,4).to_s # => "-3/4"
