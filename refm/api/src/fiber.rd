#@since 1.9.0
���̥���å� Fiber �򥳥롼����Ū�˰�������Υ饤�֥��Ǥ���

@see [[c:Fiber]]

= reopen Fiber

== Singleton Methods

--- current -> Fiber

���Υ᥽�åɤ�ɾ�����줿����ƥ����Ȥˤ����� [[c:Fiber]] �Υ��󥹥��󥹤��֤��ޤ���

��:

   fr = Fiber.new do
     Fiber.current
   end
   
   fb = fr.resume
   p fb.equal?(fr) # => true
   
   p Fiber.current # => #<Fiber:0x91345e4>
   p Fiber.current # => #<Fiber:0x91345e4>
  

== Public Instance Methods

--- transfer(*args) -> object

���Ȥ�ɽ���ե����С��إ���ƥ����Ȥ��ڤ��ؤ��ޤ���

���Ȥ� [[m:Fiber#resume]] ��Ƥ���ե����С��λҤȤʤ�ޤ���
[[m:Fiber#resume]] �Ȥΰ㤤�ϡ��ե����С�����λ�����Ȥ��� [[m:Fiber.yield]] ���ƤФ줿�Ȥ��ϡ�
�ե����С��οƤ���餺�˥ᥤ��ե����С������ޤ���

@param args �ᥤ��ե����С�����ƤӽФ��� [[m:Fiber#resume]] �᥽�åɤ��֤��ͤȤ����Ϥ��������֥������Ȥ���ꤷ�ޤ���

@return ����ƥ������ڤ��ؤ��κݤˡ�[[m:Fiber#resume]] �᥽�åɤ�Ϳ����줿�������֤��ޤ���

@raise FiberError ���Ȥ����˽�λ���Ƥ����硢����ƥ����Ȥ��ڤ��ؤ��� [[c:Thread]] ���饹��ɽ������åɴ֤�ޤ������硢
                  [[m:Fiber#resume]] ��Ƥ���ե����С������οƤ����ĤǤ������ȯ�����ޤ���

��:

  require 'fiber'
  
  fr1 = Fiber.new do |v|
    :fugafuga
  end
  
  fr2 = Fiber.new do |v|
    fr1.transfer
    :fuga
  end
  
  fr3 = Fiber.new do |v|
    fr2.resume
    :hoge
  end
  
  p fr3.resume # => :fugafuga


--- alive? -> bool

�ե����С����������Ƥ���׻��������֤��ޤ���

���Υ᥽�åɤ������֤��Τϰʲ��ξ��Ǥ���

 * �ޤ� [[m:Fiber#resume]] ����Ƥ��ʤ�
 * �֥�å����ɾ������λ���Ƥ��ʤ� ([[m:Fiber.yield]] ���ƤФ�Ƥ��ʤ�)

��:

  fr = Fiber.new{
    Fiber.yield
    "a"
  }
  
  p fr.alive? # => true
  fr.resume   # Fiber.yield����äƤ���
  p fr.alive? # => true
  fr.resume   # �֥�å����ɾ���򽪤�����äƤ���
  p fr.alive? # => false


#@end
