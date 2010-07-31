ͭ�����򰷤�����Υ饤�֥��Ǥ���

require ������ǿ��ͷ׻��η�̤� [[c:Rational]] ���֥������Ȥ��֤����
���Ǥ��ޤ���

  1.quo(2)              # => 0.5
  require 'rational'
  1.quo(2)              # => Rational(1,2)

#@since 1.9.1

1.9�ϤǤ� Rational ���饹���Ȥ߹��ߥ��饹�ˤʤ�ޤ�����

#@else
= reopen Kernel
== Module Functions
--- Rational(num, den = 1)

[[c:Rational]] ���֥������Ȥ��������ޤ���

@param num ʬ�Ҥ���ꤷ�ޤ���

@param den ʬ�����ꤷ�ޤ�����ά�������� 1 �Ǥ���

@raise ZeroDivisionError den �� 0 ����ꤷ������ȯ�����ޤ���

���� num��den ��ξ������ꤷ����硢num/den �����ˤʤ�ޤ���ʬ����
[[c:Rational]] ���֥������Ȥ��֤��ޤ���

num �� den �ˤ���������ꤷ�ޤ���den �� 1 �λ��˸¤ꡢnum ��
[[c:Rational]] ���֥������Ȥ���ꤹ�����Ǥ��ޤ���

��:

  Rational(1, 3)              # => Rational(1, 3)
  Rational(2, 6)              # => Rational(1, 3)
  Rational(Rational(1, 3), 1) # => Rational(1, 3)

����ʳ��Υ��֥������Ȥ���ꤹ����㳰��ȯ�����ޤ���

  Rational(Rational(1, 3), 2) # => NoMethodError
  Rational(1.1, 2.3)          # => NoMethodError
  Rational("1/3")             # => NoMethodError
  Rational(nil)               # => NoMethodError

��ʬ���Ƥ��ʤ� [[c:Rational]] ���֥������Ȥ�����������
[[m:Rational.new!]] ����Ѥ��ޤ�����������1.9�ϤǤϻ��ѤǤ��ʤ��������
���Ƥ���������

@see [[m:Rational.new!]], [[m:Rational.reduce]]

= redefine Integer

== Instance Methods

--- /(other)   -> Rational | Float | Integer

����׻����ޤ���

�׻���̤ϰʲ��Τ褦�ˤʤ�ޤ���

  * other��ͭ����(Rational)�ʤ�С�ͭ����(Rational)���֤���
  * other������ʳ��ʤ顢[[m:Integer#/]]��Ʊ�����Ĥޤꡢ
    other ������(Integer)�ʤ�С�����(Integer)��(����)����ư����(Float)�ʤ�С�
    ��ư����(Float)���֤���
    ��������������⡢other == 0 �λ��ϡ�[[c:ZeroDivisionError]]�Ȥʤ롣

@raise ZeroDivisionError other �� 0 �λ���ȯ�����ޤ���

--- **(other)  -> Rational | Float | Integer

��(�٤�)���׻����ޤ���

�׻���̤ϰʲ��Τ褦�ˤʤ�ޤ���

  * other�����ޤ���0������(Integer)�ʤ�С�����(Integer)���֤���
  * other���������(Integer)�ʤ�С�ͭ����(Rational)���֤���
  * other��ͭ����(Rational)����ư����(Float)�ʤ�С���ư����(Float)���֤���

  2 **  3          #=> 8
  2 ** -3          #=> Rational(1, 8)
  2 ** Rational(3) #=> 8.0

= reopen Integer

== Instance Methods

--- power!(other) -> Integer | Float

��(�٤�)���׻����ޤ���

[[lib:rational]]�Ǻ�������������[[m:Integer#**]]����̾�Ǥ���
other �����ޤ��� 0 ������ (Integer) �ʤ�С����� (Integer) �򡢤���ʳ�
�ʤ顢��ư���� (Float) ���֤��ޤ���

--- to_r

���Ȥ� [[c:Rational]] ���Ѵ����ޤ���

��:

  1.to_r        # => Rational(1, 1)
  (1<<64).to_r  # => Rational(18446744073709551616, 1)

--- gcd(n) -> Integer

���Ȥ����� n �κ����������֤��ޤ���

  2.gcd(2)                    # => 2
  3.gcd(7)                    # => 1
  3.gcd(-7)                   # => 1
  ((1<<31)-1).gcd((1<<61)-1)  # => 1

�ޤ���self �� n �� 0 ���ä����ϡ�0 �ǤϤʤ����������������ͤ��֤��ޤ���

  3.gcd(0)              # => 3
  0.gcd(-7)             # => 7

@see [[m:Integer#lcm]], [[m:Integer#gcdlcm]]

--- lcm(n) -> Integer

���Ȥ����� n �κǾ����ܿ����֤��ޤ���

��:

  2.lcm(2)                    # => 2
  3.lcm(-7)                   # => 21
  ((1<<31)-1).lcm((1<<61)-1)  # => 4951760154835678088235319297

�ޤ���self �� n �� 0 ���ä����ϡ�0 ���֤��ޤ���

  3.lcm(0)                    # => 0
  0.lcm(-7)                   # => 0

@see [[m:Integer#gcd]], [[m:Integer#gcdlcm]]

--- gcdlcm(int)

���Ȥ����� n �κ��������ȺǾ����ܿ������� [self.gcd(n), self.lcm(n)]
���֤��ޤ���

@raise ArgumentError n �������ʳ��Τ�Τ���ꤹ���ȯ�����ޤ���

��:

  6.gcdlcm 9                     # => [3, 18]
  2.gcdlcm(2)                    # => [2, 2]
  3.gcdlcm(-7)                   # => [1, 21]
  ((1<<31)-1).gcdlcm((1<<61)-1)  # => [1, 4951760154835678088235319297]

@see [[m:Integer#gcd]], [[m:Integer#lcm]]

--- numerator -> Integer

ʬ��(��˼���)���֤��ޤ���

@return ʬ�Ҥ��֤��ޤ���

@see [[m:Integer#denominator]]

--- denominator -> Integer

ʬ��(���1)���֤��ޤ���

@return ʬ����֤��ޤ���

@see [[m:Integer#numerator]]

#@end

= redefine Fixnum
== Instance Methods

--- quo(other) -> Rational

����׻����Ʒ׻���̤� [[c:Rational]] ���֥������Ȥ��֤��ޤ���

��:

  1.quo(2)              # => Rational(1,2)

--- **(other) -> Integer | Float | Rational
--- rpower (other) -> Integer | Float | Rational

��(�٤�)���׻����ޤ���other �� 0 �ʲ��ξ�硢�׻���̤�
[[c:Rational]] ���֥������Ȥ��֤��ޤ���

  2.rpower(3)           # => 8
  2.rpower(-3)          # => Rational(1, 8)

= reopen Fixnum
== Instance Methods
--- power!(other) -> Integer | Float

��(�٤�)���׻����ޤ���

[[lib:rational]]�Ǻ�������������[[m:Fixnum#**]]����̾�Ǥ���
other �����ޤ��� 0 ������ (Integer) �ʤ�С����� (Integer) �򡢤���ʳ�
�ʤ顢��ư���� (Float) ���֤��ޤ���

#@since 1.8.8
#@until 1.9.1
--- gcd

���Ȥ����� n �κ����������֤��ޤ���

#@end
#@end

= redefine Bignum
== Instance Methods
--- quo(other) -> Rational

����׻����Ʒ׻���̤� [[c:Rational]] ���֥������Ȥ��֤��ޤ���

��:

  (1<<32).quo(2)              # => Rational(2147483648, 1)

--- **(other) -> Integer | Float | Rational
--- rpower (other) -> Integer | Float | Rational

��(�٤�)���׻����ޤ���other �� 0 �ʲ��ξ�硢�׻���̤�
[[c:Rational]] ���֥������Ȥ��֤��ޤ���

  (1<<32).rpower(2)           # => 18446744073709551616
  (1<<32).rpower(-2)          # => Rational(1, 18446744073709551616)

= reopen  Bignum
== Instance Methods
--- power!(other) -> Integer | Float

��(�٤�)���׻����ޤ���

[[lib:rational]]�Ǻ�������������[[m:Bignum#**]]����̾�Ǥ���
other �����ޤ��� 0 ������ (Integer) �ʤ�С����� (Integer) �򡢤���ʳ�
�ʤ顢��ư���� (Float) ���֤��ޤ���

#@until 1.9.1
= class Rational < Numeric

ͭ�����򰷤����饹�Ǥ���

��1/3�פΤ褦��ͭ�����򰷤������Ǥ��ޤ���[[c:Integer]] �� [[c:Float]]
��Ʊ�ͤ� Rational.new �ǤϤʤ��� [[m:Kernel.#Rational]] ����Ѥ���
[[c:Rational]] ���֥������Ȥ�������ޤ���

Integer < Rational < Float �ν�˶����Ǥ����Ĥޤ� other �� Float �ʤ顢
self �� Float ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ���other �� Integer �ʤ� other ��
Rational ���Ѵ����Ƥ���黻�Ҥ�Ŭ�Ѥ��ޤ����Ѿ���㳰�Ǥ���

== Class Methods
--- new!(num, den = 1)

[[c:Rational]] ���֥������Ȥ��������ޤ���

@param num ʬ�Ҥ���ꤷ�ޤ���

@param den ʬ�����ꤷ�ޤ�����ά�������� 1 �Ǥ���

[[m:Kernel#Rational]] �Ȥϰۤʤꡢ��ʬ���Ƥ��ʤ� [[c:Rational]] ���֥���
���Ȥ��֤��ޤ���

��:

  Rational.new!(1, 3)         # => Rational(1, 3)
  Rational.new!(2, 6)         # => Rational(2, 6)

�ޤ��������Υ����å���Ԥ��ޤ���

��:

  Rational.new!(1, 0)         # => Rational(1, 0)
  Rational(1, 0)              # => ZeroDivisionError

���:

Rational.new! �� 1.9�� �Ǥ��ѻߤ���ޤ�����[[m:Kernel.#Rational]] ����
����Ѥ��Ƥ���������

  # 1.9.1 �ξ��
  Rational.new!(1, 3)  # => NoMethodError

--- reduce(num, den = 1) -> Rational

��ʬ���줿 [[c:Rational]] ���֥������Ȥ��������ޤ���

@param num ʬ�Ҥ���ꤷ�ޤ���

@param den ʬ�����ꤷ�ޤ�����ά�������� 1 �Ǥ���

@raise ZeroDivisionError den �� 0 ����ꤷ������ȯ�����ޤ���

���� num��den ��ξ������ꤷ����硢num/den �����ˤʤ�ޤ���ʬ����
[[c:Rational]] ���֥������Ȥ��֤��ޤ���

[[m:Kernel#Rational]] �Ȥϰۤʤꡢnum �� den �ˤ�������������Ǥ��ޤ���

��:

  Rational.reduce(2, 6)              # => Rational(1, 3)
  Rational.reduce(Rational(1, 3), 1) # => NoMethodError: undefined method `gcd' for Rational(1, 3):Rational

���:

Rational.reduce �� 1.9 �� �Ǥ��ѻߤ���ޤ�����[[m:Kernel.#Rational]] ��
������Ѥ��Ƥ���������

  # 1.9.1 �ξ��
  Rational.reduce(2, 6)  # => NoMethodError

== Instance Methods

--- numerator -> Integer

ʬ�Ҥ��֤��ޤ���

@return ʬ�Ҥ��֤��ޤ���

��:

  Rational(7).numerator       # => 7
  Rational(7, 1).numerator    # => 7
  Rational(9, -4).numerator   # => -9
  Rational(-2, -10).numerator # => 1

@see [[m:Rational#denominator]]

--- denominator -> Integer

ʬ����֤��ޤ�����������������֤��ޤ���

@return ʬ����֤��ޤ���

��:

  Rational(7).denominator       # => 1
  Rational(7, 1).denominator    # => 1
  Rational(9, -4).denominator   # => 4
  Rational(-2, -10).denominator # => 5

@see [[m:Rational#numerator]]

--- +(other) -> Rational | Float

�¤�׻����ޤ���

other �� [[c:Float]] ����ꤷ�����ϡ��׻���̤� [[c:Float]] ���֤���
����

  Rational(3, 4) + 2               # => Rational(11, 4)
  Rational(3, 4) + Rational(2, 1)  # => Rational(11, 4)
  Rational(3, 4) + 2.0             # => 2.75

--- -(other) -> Rational | Float

����׻����ޤ���

other �� [[c:Float]] ����ꤷ�����ϡ��׻���̤� [[c:Float]] ���֤���
����

��:

  r = Rational(3, 4)
  r - 1                # => Rational(-1, 4)
  r - 0.5              # => 0.25

--- *(other) -> Rational | Float

�Ѥ�׻����ޤ���

other �� [[c:Float]] ����ꤷ�����ϡ��׻���̤� [[c:Float]] ���֤���
����

��:

  Rational(3, 4) * 2              # => Rational(3, 2)
  Rational(3, 4) * 4              # => Rational(3, 1)
  Rational(3, 4) * 0.5            # => 0.375
  Rational(3, 4) * Rational(1, 2) # => Rational(3, 8)

other �� 0 ����ꤷ������ [[c:Rational]] ���֤��ޤ���

  Rational(3, 4) * 0              # => Rational(0, 1)

--- /(other)   -> Rational | Float

����׻����ޤ���

other �� [[c:Float]] ����ꤷ�����ϡ��׻���̤� [[c:Float]] ���֤���
����

��:

  Rational(3, 4) / 2              # => Rational(3, 8)
  Rational(3, 4) / Rational(2, 1) # => Rational(3, 8)
  Rational(3, 4) / 2.0            # => 0.375
  Rational(3, 4) / 0              # => ZeroDivisionError

@raise ZeroDivisionError other �� 0 �λ���ȯ�����ޤ���

--- %(other)      -> Rational | Float

��;��׻����ޤ��������ͤ� self �������ͤ�ۤ��ʤ�����椬 self ��Ʊ��
Numeric ���֤��ޤ���

  Rational(3, 4) % 2               # => Rational(3, 4)
  Rational(3, 4) % Rational(2, 1)  # => Rational(3, 4)
  Rational(3, 4) % 2.0             # => 0.75

--- **(other) -> Rational | Float

��(�٤�)���׻����ޤ���

other ����������ꤷ�����ϡ��׻���̤� [[c:Rational]] ���֤��ޤ���
other �������ʳ�����ꤷ�����Ϸ׻���̤� [[c:Float]] ���֤��ޤ���

��:

  Rational(3, 4) ** 2              # => Rational(9, 16)
  Rational(3, 4) ** Rational(2, 1) # => 0.5625
  Rational(3, 4) ** 2.0            # => 0.5625

���:

1.9 �ϤȤϷ׻���̤Υ��֥������Ȥ��ۤʤ��礬���������դ��Ƥ���������
other �� [[c:Rational]] ����ꤷ�����ˤ�����ͤ� [[c:Rational]] ����
����礬����ޤ���

  # 1.9.1 �ξ��
  r = Rational(3, 4)
  r ** Rational(2, 1)  # => (9/16)

#@since 1.8.7
--- div(other) -> Integer

self �� other �ǳ�ä������ξ����֤��ޤ���

@param other ���Ȥ����

��:

  Rational(1, 2).div(Rational(2, 3)) # => 0

#@end

--- divmod(other) -> [Integer, Float | Rational]

self �� other �ǳ�ä�������;���������֤��ޤ���

other �� [[c:Float]] ����ꤷ�����ϡ�;��� [[c:Float]] ���֤��ޤ���

@param other ���Ȥ����

��:

  Rational(3,4).divmod(Rational(2,3))  # => [1, Rational(1, 12)]
  Rational(-3,4).divmod(Rational(2,3)) # => [-2, Rational(7, 12)]
  Rational(3,4).divmod(Rational(-2,3)) # => [-2, Rational(-7, 12)]

  Rational(9,4).divmod(2)              # => [1, Rational(1, 4)]
  Rational(9,4).divmod(Rational(2, 1)) # => [1, Rational(1, 4)]
  Rational(9,4).divmod(2.0)            # => [1, 0.25]

@see [[m:Numeric#divmod]]

--- abs -> Rational

���Ȥ������ͤ��֤��ޤ���

��:

  Rational(1, 2).abs.to_s  # => 1/2
  Rational(-1, 2).abs.to_s # => 1/2

--- ==(other) -> bool

���ͤȤ�����������Ƚ�ꤷ�ޤ���

@param other ����оݤο���

@return      self �� other ����������� true ���֤��ޤ���
             �����Ǥʤ���� false ���֤��ޤ���

��:

  Rational(2, 3)  == Rational(2, 3)   # => true
  Rational(5)     == 5                # => true
  Rational(0)     == 0.0              # => true
  Rational(1, 3)  == 0.33             # => false
  Rational(1, 2)  == '1/2'            # => false

--- <=>(other) -> -1 | 0 | 1 | nil

self �� other ����Ӥ��ơ�self ���礭������ 1������������ 0������������
-1 ���֤��ޤ�����ӤǤ��ʤ�����nil���֤��ޤ���

@param other ����оݤο���

@return -1 �� 0 �� 1 �� nil ���֤��ޤ���

��:

  Rational(2, 3)  <=> Rational(2, 3)  # => 0
  Rational(5)     <=> 5               # => 0
  Rational(2, 3)  <=> Rational(1,3)   # => 1
  Rational(1, 3)  <=> 1               # => -1
  Rational(1, 3)  <=> 0.3             # => 1
  Rational(1, 3)  <=> nil             # => nil

--- coerce(other) -> Array

���Ȥ� other ��Ʊ�����饹�ˤʤ�褦�����Ȥ� other ���Ѵ��� [other, self] �Ȥ���
����ˤ����֤��ޤ���

��:

  Rational(1).coerce(2)   # => [Rational(2, 1), Rational(1, 1)]
  Rational(1).coerce(2.2) # => [2.2, 1.0]

#@since 1.8.7
--- floor -> Integer

���Ȥ�����������꾮���������Τ�������Τ�Τ��֤��ޤ���

��:

  Rational(3).floor     # => 3
  Rational(2, 3).floor  # => 0
  Rational(-3, 2).floor # => -2

���Ȥˤ�äȤ�ᤤ�������֤� [[m:Rational#to_i]] �Ȥϰ㤦��̤��֤�����
��դ��Ƥ���������

��:

  Rational(+7, 4).to_i  # => 1
  Rational(+7, 4).floor # => 1
  Rational(-7, 4).to_i  # => -1
  Rational(-7, 4).floor # => -2

@see [[m:Rational#ceil]], [[m:Rational#round]], [[m:Rational#truncate]]

--- ceil                -> Integer

���Ȥ�������������礭�������Τ����Ǿ��Τ�Τ��֤��ޤ���

��:

  Rational(3).ceil      # => 3
  Rational(2, 3).ceil   # => 1
  Rational(-3, 2).ceil  # => -1

@see [[m:Rational#floor]], [[m:Rational#round]], [[m:Rational#truncate]]

--- round -> Integer

���ȤȤ�äȤ�ᤤ�������֤��ޤ���

����� 0.5, -0.5 �Ϥ��줾�� 1,-1 ���ڤ�夲����ޤ���

��:

  Rational(3).round     # => 3
  Rational(2, 3).round  # => 1
  Rational(-3, 2).round # => -2

@see [[m:Rational#ceil]], [[m:Rational#floor]], [[m:Rational#truncate]]

--- truncate -> Integer
#@end
--- to_i -> Integer

0 ���� ���ȤޤǤ������ǡ����Ȥˤ�äȤ�ᤤ�������֤��ޤ���

��:

  Rational(2, 3).to_i   # => 0
  Rational(3).to_i      # => 3
  Rational(98, 71).to_i # => 1
  Rational(-30, 2).to_i # => -15

#@since 1.8.7
@see [[m:Rational#ceil]], [[m:Rational#floor]]
#@end

--- to_f -> Float

���Ȥ� [[c:Float]] ���Ѵ����ޤ���

@return �¿����֤��ޤ���

��:

  Rational(9, 4).to_f   # => 2.25
  Rational(-3, 4).to_f  # => -0.75
  Rational(20, 3).to_f  # => 6.666666666666667

--- to_s -> String

���Ȥ�ʹ֤��ɤߤ䤹������ʸ����ɽ���ˤ����֤��ޤ���

"3/5", "-17/7" �Τ褦��10�ʿ���ɽ�����֤��ޤ���

@return ͭ������ɽ���ˤ���ʸ������֤��ޤ���

��:

  Rational(-3, 4).to_s # => "-3/4"
  Rational(8).to_s     # => "8"
  Rational(-8, 6).to_s # => "-4/3"

@see [[m:Rational#inspect]]

--- to_r -> Rational

���Ȥ��֤��ޤ���

@return ���Ȥ��֤��ޤ���

--- hash -> Integer

���ȤΥϥå����ͤ��֤��ޤ���

@return �ϥå����ͤ��֤��ޤ���

--- inspect -> String

���Ȥ�"Rational(ʬ��, ʬ��)" ������ʸ����ˤ����֤��ޤ���

@return ʸ������֤��ޤ���

��:

  Rational(5, 8).inspect  # => "Rational(5, 8)"
  Rational(2).inspect     # => "Rational(2, 1)"
  Rational(-8, 6).inspect # => "Rational(-4, 3)"

1.9�ϤȤϷ�̤��ۤʤ������դ��Ƥ���������

  # 1.9.1�ξ��
  Rational(5, 8).inspect  # => "(5/8)"
  Rational(2).inspect     # => "(2/1)"
  Rational(-8, 6).inspect # => "(-4/3)"

@see [[m:Rational#to_s]]

#@since 1.8.8
--- -@ -> Rational

���Ȥ�����ȿž��������Τ��֤��ޤ���

--- zero? -> bool

���ͤȤ��� 0 �����������˿����֤��ޤ���

��:

  Rational(0, 3).zero?  # => true

@see [[m:Rational#nonzero?]]

--- nonzero? -> bool

���ͤȤ��� 0 ���������ʤ����˿����֤��ޤ���

@see [[m:Rational#zero?]]

#@end
#@end
