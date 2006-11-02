ʣ�ǿ��򰷤�����Υ饤�֥��Ǥ���

=== ChangeLog

#@# *[2002-04-03] ���� by [[unknown:����|URL:mailto:sugawah@attglobal.net]]
#@# *[2003-04-29] Complex#polar�ε��Ҥ������������ƥ���ɽ���˽��� by [[unknown:pastor|URL:mailto:pastor@fmc.rikkyo.ne.jp]]

#@#@# imported by aamine
= class Complex < Numeric

#@# [2002-04-03]  by [[unknown:����|URL:mailto:sugawah@attglobal.net]]

ʣ�ǿ��򰷤����饹

�Ȥ��� Usage

Complex ��Ȥ�����ˤ� require 'complex' ����ɬ�פ�����ޤ���
���Υ饤�֥��� require ����ȡ������ Math �⥸�塼�뤬ʣ�ǿ��б��˳�ĥ����ޤ���

  require 'complex'

�ޤ���ź�ե饤�֥��Υ٥��ȥ륯�饹 [[c:Vector]]������ӡ�
���󥯥饹 [[c:Matrix]] ���ɤ߹���Ǥ���Ȥ���
Vector �� Matrix �����ǤȤ��ơ�ʣ�ǿ���Ȥ����Ȥ��Ǥ��ޤ���
Vector ����� Matrix �Τ��줾��ι��ܤ򻲾Ȥ��Ƥ���������

  require 'matrix'
  require 'complex'

=== ��

 require 'complex'
 
 z1 = Complex.new(4, 3)
 z2 = Complex.new(2, 1)
 
 p z1 + z2 #=> Complex(6, 4)
 p z1 * z2 #=> Complex(5, 10)
 
 i = Complex::I
 
 p z1 == 4 + 3 * i #=> true
 
== Class Methods

--- new(r,i)
--- new!(r,i=0)

������ r������ i ��ʣ�ǿ����������ޤ���

--- polar(r, theta)

== Instance Methods

--- +(c)
ʣ�ǿ� c ��ä�����̤��֤��ޤ���

--- -(c)
ʣ�ǿ� c �򸺤�����̤��֤��ޤ���

--- *(c)
ʣ�ǿ� c ��褸����̤��֤��ޤ���

--- /(c)
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
  

--- %(c)
ʣ�ǿ� c �ǽ�����;��(����Ʊ�Τα黻��� m1������Ʊ�Τα黻��� m2 )��ʣ�ǿ���
Complex.new(m1, m2)�ˤ����֤��ޤ���

  z1 = a + b * i
  z2 = c + d * i

�Ȥ����Ȥ����׻���̤�

  z1 % z2 = (a % c) + (b % d) * i

�Ǥ���

--- **(c)
ʣ�ǿ� c �Ǥ٤��褷�����
  exp(c * log(self)) 
���֤��ޤ���

#@if (version < "1.8.0")
--- divmod 
���Υ᥽�åɤ��ѻߤ���ޤ�����
#@end

--- abs
ʣ�ǿ��������ͤ��֤��ޤ���

--- abs2
ʣ�ǿ��������ͤ� 2 ����֤��ޤ���

--- angle
--- arg
ʣ�ǿ����гѤ�[-��,��]���ϰϤ��֤��ޤ���
�ʲ�����Τ褦�˵����� 0.0 �� -0.0 �Ǥ��ͤ��Ѥ��ޤ���

  p Complex.new(0, 1).arg == Math::PI/2 #=> true
  p Complex.new(0, -1).arg              #=> -1.5707963267949

�����μ¼��ն�Ǥε�ư����դ��Ƥ���������

  p Complex.new(-1, 0).arg              #=>  3.14159265358979
  p Complex.new(-1, -0).arg             #=>  3.14159265358979
  p Complex.new(-1, -0.0).arg           #=> -3.14159265358979
   
  p Complex.new(0, 0.0).arg             #=>  0.0
  p Complex.new(0, -0.0).arg            #=> -0.0
  p Complex.new(-0.0, 0).arg            #=>  3.14159265358979
  p Complex.new(-0.0, -0.0).arg         #=> -3.14159265358979

--- polar 
ʣ�ǿ��ζ˺�ɸɽ�������ʤ�������� [self.abs, self.arg] ���֤��ޤ���

--- conj
--- conjugate
����ʣ�ǿ����֤��ޤ���

--- real
--- real=
�������֤��ޤ���

--- imag
--- image
--- imag=
--- image=
�������֤��ޤ���

#@if (version < "1.9.0")
--- <=>(c)
c��self��������abs����Ӥ�����̤��֤��ޤ���
#@end

--- ==(c)
c ����������С������֤��ޤ���

#@if (version < "1.8.0")
--- to_i
���� [[c:Integer]] ���Ѵ����ޤ���

--- to_f
��ư�������� [[c:Float]] ���Ѵ����ޤ���

--- to_r
ͭ���� [[c:Rational]] ���Ѵ����ޤ���
#@end

#@since 1.9.0
--- scalar?
#@end

== Constants

--- I
����ñ�̤Ǥ���

= reopen Numeric
== Instance Methods
--- im
Returns a Complex number Complex(0, self).

--- real
The real part of a complex number, i.e. self

--- image
--- imag
The imaginary part of a complex number, i.e. 0.

--- arg
�гѤ�[-��,��]���ϰϤ��֤��ޤ����¿��ξ�硢
����ʤ�0����ʤ�[[c:Math::PI]]���֤��ޤ���

--- conj
--- conjugate
����򤫤����ޤ����¿��ξ���self���֤��ޤ���


= reopen Math

ʣ�ǿ��б��˳�ĥ����ޤ���

ɬ�פǤ���ʤ顢�оݤȤʤ�ʣ�ǿ���˺�ɸɽ����������
  z = a + b * i = r * exp(i * t)
�г� t ��[-��,��]���ϰϤǤ���ȹͤ��ƴؿ����������ޤ���
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
