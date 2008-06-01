ʣ�ǿ��򰷤�����Υ饤�֥��Ǥ���

#@#=== ChangeLog
#@# *[2002-04-03] ���� by [[unknown:����|URL:mailto:sugawah@attglobal.net]]
#@# *[2003-04-29] Complex#polar�ε��Ҥ������������ƥ���ɽ���˽��� by [[unknown:pastor|URL:mailto:pastor@fmc.rikkyo.ne.jp]]

#@#@# imported by aamine
= class Complex < Numeric

#@# [2002-04-03]  by [[unknown:����|URL:mailto:sugawah@attglobal.net]]

ʣ�ǿ��򰷤�����Υ��饹�Ǥ���

���Υ饤�֥��� require ����ȡ�[[c:Math]] �⥸�塼�뤬ʣ�ǿ��б��˳�ĥ����ޤ���
�оݤȤʤ�ʣ�ǿ���ʲ��Τ褦�˶˺�ɸɽ����������
  z = a + b * i = r * exp(i * t)
�г� t ��[-��,��]���ϰϤǤ���ȹͤ��ơ��ؿ����������ޤ���
[[m:Complex#arg]]�򻲾Ȥ��Ʋ�������

�ʲ���ʣ�Ǵؿ�������Ǥ���

  abs(z)  = r
  sqrt(z) = sqrt(r) * exp(i * t/2)
  exp(z)  = exp(a) * exp(i * b)
  log(z)  = log(r) + i * t
  
  sin(z)  = (exp(i * z) - exp(-i * z)) / 2i
  cos(z)  = (exp(i * z) + exp(-i * z)) / 2
  tan(z)  = sin(z) / cos(z)
  sinh(z) = (exp(z) - exp(-z)) / 2
  cosh(z) = (exp(z) + exp(-z)) / 2
  tanh(z) = sinh(z) / cosh(z)
  
  asin(z) = -i * log(i*z + sqrt(1-z*z))
  acos(z) = -i * log(z + i*sqrt(1-z*z))
  atan(z) = i/2 * log((i+z) / (i-z))
  atan2(y, x) = -i * log( (x + i * y) / sqrt( x*x + y*y ) )
  asinh(z) = log(z + sqrt(z*z+1))
  acosh(z) = log(z + sqrt(z*z-1))
  atanh(z) = 1/2 * log((1+z) / (1-z))

�ޤ���ź�ե饤�֥��Υ٥��ȥ륯�饹 [[c:Vector]]������ӡ�
���󥯥饹 [[c:Matrix]] ���ɤ߹���Ǥ���Ȥ���
Vector �� Matrix �����ǤȤ��ơ�ʣ�ǿ���Ȥ����Ȥ��Ǥ��ޤ���
Vector ����� Matrix �Τ��줾��ι��ܤ򻲾Ȥ��Ƥ���������

=== ��

  require 'complex'
 
  z1 = Complex.new(4, 3)
  z2 = Complex.new(2, 1)
 
  p z1 + z2 #=> Complex(6, 4)
  p z1 * z2 #=> Complex(5, 10)
 
  i = Complex::I
 
  p z1 == 4 + 3 * i #=> true
 
== Class Methods

--- new(r,i) -> Complex
--- new!(r,i=0) -> Complex
[[c:Complex]]���饹�Υ��֥������Ȥ��������ޤ���

������ r�������� i �Ǥ���ʣ�ǿ����������ޤ���

@param r ��������ʣ�ǿ��μ���
@param i ��������ʣ�ǿ��ε���

��:

  p Complex(1, 1)       #=> Complex(1, 1)
  p Complex(3.5)        #=> Complex(3.5, 0)

--- polar(r, theta) -> Complex
[[c:Complex]]���饹�Υ��֥������Ȥ��������ޤ���

�����ͤ� r���гѤ� theta �Ǥ���ʣ�ǿ����������ޤ���

@param r ��������ʣ�ǿ��������͡�
@param theta ��������ʣ�ǿ����гѡ�ñ�̤ϥ饸����ѤǤ���

--- generic?(other) -> bool
other �� [[c:Integer]] [[c:Float]] [[c:Rational]] ���饹�Υ��֥������Ȥ��ɤ���Ƚ�ꤷ�ޤ���

@param other Ƚ���оݤΥ��֥�������
@return [[c:Integer]] [[c:Float]] [[c:Rational]] ���饹�Υ��֥������Ȥλ� ture
        ����ʳ��ξ��ˤ� false ���֤��ޤ���

== Instance Methods

--- +(c) -> Complex
ʣ�ǿ� c ��ä�����̤��֤��ޤ���

@param c �û������
@return �û���̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

��:

  c =  Complex(1, 1)    #=> Complex(1, 1)
  p c + Complex(3, 3)   #=> Complex(4, 4)
  p c + 3               #=> Complex(4, 1)

--- -(c) -> Complex
ʣ�ǿ� c �򸺤�����̤��֤��ޤ���

@param c ���������
@return ������̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

��:

  c =  Complex(3, 3)    #=> Complex(3, 3)
  p c - Complex(2, 2)   #=> Complex(1, 1)
  p c - 3               #=> Complex(0, 3)

--- *(c) -> Complex
ʣ�ǿ� c ��褸����̤��֤��ޤ���

@param c �軻�����
@return �軻��̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

��:

  c =  Complex(1, 1)    #=> Complex(1, 1)
  p c * Complex(2, 2)   #=> Complex(0, 4)
  p c * 3               #=> Complex(3, 3)

--- /(c) -> Complex
ʣ�ǿ� c �ǽ�������̤��֤��ޤ���

  z1 = a + b * i
  z2 = c + d * i

�Ȥ����Ȥ��������������

  z1 / z2 = ((a*c + b*d)/(c*c + d*d)) + ((b*c - a*d)/(c*c + d*d)) * i

�Ǥ������Τ�������ȵ����������������ä���硢����Ʊ�Τν����Ȥ��� / ��
�׻�����뤳�Ȥ���դ��Ƥ���������

  z1 = Complex.new(4, 3)
  z2 = Complex.new(2, 1)
  
  p z1 / z2       #=> Complex(2, 0)
  p 1.0 * z1 / z2 #=> Complex(2.2, 0.4)
  
@param c ���������
@return ������̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

��:

  z1 = Complex.new(4, 3)
  z2 = Complex.new(2, 1)
  
  p z1 / z2       #=> Complex(2, 0)
  p 1.0 * z1 / z2 #=> Complex(2.2, 0.4)

#@if (version < "1.9.0")
--- %(c) -> Complex
����Ʊ�Τα黻��� m1 �ȵ���Ʊ�Τα黻��� m2 ��ʣ�ǿ�
Complex.new(m1, m2)�ˤ����֤��ޤ����Ĥޤꡢ

  z1 = a + b * i
  z2 = c + d * i

�Ȥ����Ȥ����׻���̤�

  z1 % z2 = (a % c) + (b % d) * i

�Ǥ���

@param c �黻�����
@return �黻��̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

[���] ���Υ᥽�åɤ� Ruby 1.9.0 ���ѻߤ���ޤ�����

#@else
���Υ᥽�åɤ��ѻߤ���ޤ�����
#@end

--- **(c) -> Complex
ʣ�ǿ� c �Ǥ٤��褷�����
  exp(c * log(self)) 
���֤��ޤ�

@param c �߾褹���
@return �黻��̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

��:

  z1 = Complex.new(1, 1)
  z2 = Complex.new(2, 2)

  p z1 ** 2     #=> Complex(0, 2)
  p z1 ** z2    #=> Complex(-0.265653998849241, 0.319818113856136)

#@if (version < "1.8.0")
--- divmod 
���Υ᥽�åɤ��ѻߤ���ޤ�����
#@end

--- abs -> Float
��ʬ���Ȥ������ͤ��֤��ޤ���

  z = a + b * i

�Ȥ����Ȥ��������ͤ������

  sqrt(a*a + b*b)

�Ǥ���
�׻���̤Ȥ���[[c:Folat]]���饹�Υ��֥������Ȥ��֤���뤳�Ȥ���դ��Ƥ���������

--- abs2 -> Fixnum
--- abs2 -> Float
��ʬ���Ȥ������ͤ�2����֤��ޤ���

  z = a + b * i

�Ȥ����Ȥ���[[m:Complex#abs2]] �������

  a*a + b*b

�Ǥ���

--- angle -> Float
--- arg -> Float
ʣ�ǿ����гѤ�[-��,��]���ϰϤ��֤��ޤ���

��:

  p Complex.new(0, 1).arg == Math::PI/2 #=> true
  p Complex.new(0, -1).arg              #=> -1.5707963267949

�����μ¼��ն�Ǥε�ư����դ��Ƥ���������
�ʲ�����Τ褦�˵����� 0.0 �� -0.0 �Ǥ��ͤ��Ѥ��ޤ���

  p Complex.new(-1, 0).arg              #=>  3.14159265358979
  p Complex.new(-1, -0).arg             #=>  3.14159265358979
  p Complex.new(-1, -0.0).arg           #=> -3.14159265358979
   
  p Complex.new(0, 0.0).arg             #=>  0.0
  p Complex.new(0, -0.0).arg            #=> -0.0
  p Complex.new(-0.0, 0).arg            #=>  3.14159265358979
  p Complex.new(-0.0, -0.0).arg         #=> -3.14159265358979

--- polar -> Array
ʣ�ǿ��ζ˺�ɸɽ�������ʤ�������� [self.abs, self.arg] ���֤��ޤ���

��:

  z = Complex.new(3.0, 4.0)

  p z        #=> Complex(3.0, 4.0)
  p z.polar  #=> [5.0, 0.927295218001612]

--- conj -> Complex
--- conjugate -> Complex
��ʬ�ζ���ʣ�ǿ����֤��ޤ���

��:

  z = Complex.new(1, 1)
  p z.conjugate   #=> Complex(1, -1)

--- real -> Fixnum
--- real -> Float
#@# Complex#real= ����
#@#--- real=
�������֤��ޤ���

--- imag -> Fixnum
--- imag -> Float
--- image -> Fixnum
--- image -> Float
#@# Complex#imag=, Complex#image= ����
#@#--- imag=
#@#--- image=
�������֤��ޤ���

#@if (version < "1.9.0")
--- <=>(c) -> Fixnum
c��self��������abs����Ӥ�����̤��֤��ޤ���

self �� c ��[[m:Complex#abs]]�᥽�åɤη�̤���Ӥ���
 * self ���礭���������ο�
 * c ���礭��������ο�
 * Ʊ�����ˤ� 0
���֤��ޤ���

@param c ��Ӥ���[[c:Complex]]���饹�Υ��֥�������

��:

  z1 = Complex.new(1, 1)
  z2 = Complex.new(2, -2)
  p z1 <=> z2   #=> -1

[���] ���Υ᥽�åɤ� Ruby 1.9.0 ���ѻߤ���ޤ�����

#@else
���Υ᥽�åɤ��ѻߤ���ޤ�����

#@end

--- ==(c) -> bool
c ����������С�true ���֤��ޤ���

��:

  z1 = Complex.new(1, 2)
  z2 = Complex.new(1, 0)
  z3 = Complex.new(0, 1)

  p z1 == Complex.new(1, 2)  #=> true
  p z1 == z2                 #=> false
  p z2 == 1.0                #=> true
  p z3 == Complex::I         #=> true

#@if (version < "1.8.0")
--- to_i -> Integer
���� [[c:Integer]] ���Ѵ����ޤ���

[���] ���Υ᥽�åɤ��ѻߤ���ޤ�����
--- to_f
��ư�������� [[c:Float]] ���Ѵ����ޤ���

[���] ���Υ᥽�åɤ��ѻߤ���ޤ�����
--- to_r
ͭ���� [[c:Rational]] ���Ѵ����ޤ���

[���] ���Υ᥽�åɤ��ѻߤ���ޤ�����
#@end

#@since 1.9.0
--- scalar? -> bool

[���] ���Υ᥽�åɤϾ�� false ���֤��ޤ���

#@end

--- coerce(other) -> Array
��ʬ���Ȥ�other�Υڥ������������������������������֤��ޤ���

other�� [[c:Complex]] �Υ��֥������ȤǤϤʤ��Ȥ��� [[c:Complex]] ���֥������Ȳ�������Τ���������ǤȤʤ�ޤ���

@param other ��������ǤȤʤ륪�֥�������

��:

  z1 = Complex.new(1, 2)
  z2 = Complex.new(3, 4)

  p z1.coerce(5)  #=>  [Complex(5, 0), Complex(1, 2)]
  p z1.coerce(z2) #=>  [Complex(3, 4), Complex(1, 2)]

--- denominator -> Fixnum
��ʬ���Ȥμ�����������ʬ���LCM(�Ǿ����ܿ�)���֤��ޤ���

��:

  z1 = Complex.new(1, 2)
  z2 = Complex.new(Rational.new!(1, 3), Rational.new!(3, 5))

  p z1.denominator  #=> 1
  p z2.denominator  #=> 15

--- numerator -> Complex
[[m:Complex#denomirator]] ���ͤǼ�������������ʬ������Τ�ʬ�ҤΤߤ� [[c:Complex]] ���֤��ޤ���

����Ū�ʷ׻�����

 * ���� = ������ʬ�� * (������������ʬ��κ������� / ������ʬ��)
 * ���� = ������ʬ�� * (������������ʬ��κ������� / ������ʬ��)

��:

  z1 = Complex.new(1, 2)
  z2 = Complex.new(Rational.new!(1, 3), Rational.new!(3, 5))

  p z1.numerator
  p z2.numerator

--- hash -> Fixnum
ʣ�ǿ��Υϥå����ͤ��֤��ޤ���

��:

  z1 = Complex.new(3.5, 1.20)
  z2 = Complex.new(3.5, 1.21)

  p z1.hash    #=> 1889428376
  p z2.hash    #=> 425788526

--- inspect -> String
��ʬ���ȤˤĤ��� "Complex(����, ����)" ������ʸ������֤��ޤ���

--- to_s -> String
��ʬ���ȤˤĤ��� "���� + ����i" ������ʸ������֤��ޤ���

== Constants

--- I
����ñ�̤Ǥ���

[���] Complex::I �� Complex.new(0, 1) ����������륪�֥������Ȥ�Ʊ����ΤǤ���

= reopen Numeric
== Instance Methods
--- im -> Complex
�¿����Ф�������������� [[c:Complex]] ���饹�Υ��֥������Ȥ��֤��ޤ���

��:

  n = 100
  p n.im   #=> Complex(0, 100)

--- real -> self
ʣ�ǿ��Ȥ��Ƹ������μ������֤��ޤ���
�Ĥޤꡢself ���¿��ξ��Ϥ��Τޤޡ�self���֤��ޤ���

--- image -> Fixnum
--- imag -> Fixnum
ʣ�ǿ��Ȥ��Ƹ������ε������֤��ޤ���
�Ĥޤꡢself ���¿��ξ��� 0 ���֤��ޤ���

--- arg -> Fixnum | Float
ʣ�ǿ��Ȥ��Ƹ��������гѤ�[-��,��]���ϰϤ��֤��ޤ���
����ʤ�0����ʤ�[[c:Math::PI]]���֤��ޤ���

��:

  n = 1000
  f = -12.345

  p n.arg    #=> 0
  p f.arg    #=> 3.14159265358979

--- conj -> self
--- conjugate -> self
ʣ�ǿ��Ȥ��Ƹ������ζ�����֤��ޤ���
�Ĥޤꡢself ���¿��ξ���self���֤��ޤ���

= redefine Math
== Module Functions

--- sqrt(z) -> Complex
z ��ʿ�������֤��ޤ���

ʣ�Ǵؿ��Ȥ��Ƥ�sqrt()������ϰʲ��Ǥ���

  sqrt(z) = sqrt(r) * exp(i * t/2)

@param z ʿ���������ʣ�ǿ�

[���]
  ������ 0 �Ǥ� [[c:Complex]] ���饹�Υ��֥������ȤǤ���� [[c:Complex]] ���饹�Υ��֥������Ȥ��֤����Ȥ���դ��Ƥ���������

  n = 2
  z = Complex.new(2, 0)

  p Math.sqrt(n) #=> 1.4142135623731
  p Math.sqrt(z) #=> Complex(1.4142135623731, 0.0)

--- exp(z) -> Complex
�ؿ��ؿ�(�����п� e �� z ��)���֤��ޤ���

ʣ�ǿ� z = a + b *i ���Ф��� exp(z) ������ϰʲ��Ǥ���

  exp(z)  = exp(a) * exp(i * b)

@param z ʣ�ǿ�

[���]
  ������ 0 �Ǥ� [[c:Complex]] ���饹�Υ��֥������ȤǤ���� [[c:Complex]] ���饹�Υ��֥������Ȥ��֤����Ȥ���դ��Ƥ���������

  n = 2
  z = Complex.new(2, 0)

  p Math.exp(n) #=> 7.38905609893065
  p Math.exp(z) #=> Complex(7.38905609893065, 0.0)

--- log(z) -> Complex
ʣ�ǿ� z �μ����п����֤��ޤ���

������ r �г� theta ��ʣ�ǿ� z ���Ф��� log(z) �ϰʲ����������ޤ���

  log(z)  = log(r) + i * theta

@param z ʣ�ǿ�

[���]
  ������ 0 �Ǥ� [[c:Complex]] ���饹�Υ��֥������ȤǤ���� [[c:Complex]] ���饹�Υ��֥������Ȥ��֤����Ȥ���դ��Ƥ���������

  n = 2
  z = Complex.new(2, 0)

  p Math.log(n) #=> 0.693147180559945
  p Math.log(z) #=> Complex(0.693147180559945, 0.0)

--- log10(z) -> Complex
ʣ�ǿ� z �ξ����п����֤��ޤ���

ʣ�ǿ� z ���Ф��� log10(z) �ϰʲ����������ޤ���

  log10(z)  = log(z) / log(10)

@param z ʣ�ǿ�

[���]
  ������ 0 �Ǥ� [[c:Complex]] ���饹�Υ��֥������ȤǤ���� [[c:Complex]] ���饹�Υ��֥������Ȥ��֤����Ȥ���դ��Ƥ���������

  n = 2
  z = Complex.new(2, 0)

  p Math.log10(n) #=> 0.301029995663981
  p Math.log10(z) #=> Complex(0.301029995663981, 0.0)

--- cos(z)
#@todo

--- sin(z)
#@todo

--- tan(z)
#@todo

--- cosh(z)
#@todo

--- sinh(z)
#@todo

--- tanh(z)
#@todo

--- acos(z)
#@todo

--- asin(z)
#@todo

--- atan(z)
#@todo

--- atan2(z)
#@todo

--- acosh(z)
#@todo

--- asinh(z)
#@todo

--- atanh(z)
#@todo
