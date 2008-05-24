ʣ�ǿ��򰷤�����Υ饤�֥��Ǥ���

#@#=== ChangeLog
#@# *[2002-04-03] ���� by [[unknown:����|URL:mailto:sugawah@attglobal.net]]
#@# *[2003-04-29] Complex#polar�ε��Ҥ������������ƥ���ɽ���˽��� by [[unknown:pastor|URL:mailto:pastor@fmc.rikkyo.ne.jp]]

#@#@# imported by aamine
= class Complex < Numeric

#@# [2002-04-03]  by [[unknown:����|URL:mailto:sugawah@attglobal.net]]

ʣ�ǿ��򰷤�����Υ��饹�Ǥ���

���Υ饤�֥��� require ����ȡ�Math �⥸�塼�뤬ʣ�ǿ��б��˳�ĥ����ޤ���
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

=== ��

  p Complex(1, 1)       #=> Complex(1, 1)
  p Complex(3.5)        #=> Complex(3.5, 0)

--- polar(r, theta) -> Complex
[[c:Complex]]���饹�Υ��֥������Ȥ��������ޤ���

�����ͤ� r���гѤ� theta �Ǥ���ʣ�ǿ����������ޤ���

@param r ��������ʣ�ǿ��������͡�
@param theta ��������ʣ�ǿ����гѡ�ñ�̤ϥ饸����ѤǤ���

== Instance Methods

--- +(c) -> Complex
ʣ�ǿ� c ��ä�����̤��֤��ޤ���

@param c �û������
@return �û���̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

=== ��

  c =  Complex(1, 1)    #=> Complex(1, 1)
  p c + Complex(3, 3)   #=> Complex(4, 4)
  p c + 3               #=> Complex(4, 1)

--- -(c) -> Complex
ʣ�ǿ� c �򸺤�����̤��֤��ޤ���

@param c ���������
@return ������̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

=== ��

  c =  Complex(3, 3)    #=> Complex(3, 3)
  p c - Complex(2, 2)   #=> Complex(1, 1)
  p c - 3               #=> Complex(0, 3)

--- *(c) -> Complex
ʣ�ǿ� c ��褸����̤��֤��ޤ���

@param c �軻�����
@return �軻��̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

=== ��

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

=== ��

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
���֤��ޤ���

@param c �߾褹���
@return �黻��̤�[[c:Complex]]���饹�Υ��֥������ȤȤ����֤��ޤ���

=== ��

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

=== ��

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

=== ��

z = Complex.new(3.0, 4.0)

p z        #=> Complex(3.0, 4.0)
p z.polar  #=> [5.0, 0.927295218001612]

--- conj -> Complex
--- conjugate -> Complex
��ʬ�ζ���ʣ�ǿ����֤��ޤ���

=== ��

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

=== ��

z1 = Complex.new(1, 1)
z2 = Complex.new(2, -2)
p z1 <=> z2   #=> -1

[���] ���Υ᥽�åɤ� Ruby 1.9.0 ���ѻߤ���ޤ�����

#@else
���Υ᥽�åɤ��ѻߤ���ޤ�����

#@end

--- ==(c)
#@todo
c ����������С������֤��ޤ���

#@if (version < "1.8.0")
--- to_i
#@todo
���� [[c:Integer]] ���Ѵ����ޤ���

--- to_f
#@todo
��ư�������� [[c:Float]] ���Ѵ����ޤ���

--- to_r
#@todo
ͭ���� [[c:Rational]] ���Ѵ����ޤ���
#@end

#@since 1.9.0
--- scalar?
#@todo
#@end

== Constants

--- I
#@todo
����ñ�̤Ǥ���

= reopen Numeric
== Instance Methods
--- im
#@todo
Returns a Complex number Complex(0, self).

--- real
#@todo
The real part of a complex number, i.e. self

--- image
--- imag
#@todo
The imaginary part of a complex number, i.e. 0.

--- arg
#@todo
�гѤ�[-��,��]���ϰϤ��֤��ޤ����¿��ξ�硢
����ʤ�0����ʤ�[[c:Math::PI]]���֤��ޤ���

--- conj
--- conjugate
#@todo
����򤫤����ޤ����¿��ξ���self���֤��ޤ���

= redefine Math
== Module Functions

--- sqrt(z)
#@todo

--- exp(z)
#@todo

--- log(z)
#@todo

--- log10(z)
#@todo

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
