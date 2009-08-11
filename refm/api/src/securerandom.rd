���������ȯ����Τ���Υ��󥿡��ե��������󶡤���饤�֥��Ǥ���
HTTP �Υ��å���󥭡��ʤɤ�Ŭ���Ƥ��ޤ���

= module SecureRandom

���������ȯ����Τ���Υ��󥿡��ե��������󶡤���⥸�塼��Ǥ���
HTTP �Υ��å���󥭡��ʤɤ�Ŭ���Ƥ��ޤ���

�ʲ������ȯ����򥵥ݡ��Ȥ��Ƥ��ޤ���

  * openssl
  * /dev/urandom

��ΰ��������ȯ���郎���ѤǤ��ʤ���硢�ƥ᥽�åɤ� NotImplementedError ��ȯ�����ޤ���
  
  # random hexadecimal string. 
  p SecureRandom.hex(10) #=> "52750b30ffbc7de3b362" 
  p SecureRandom.hex(10) #=> "92b15d6c8dc4beb5f559" 
  p SecureRandom.hex(11) #=> "6aca1b5c58e4863e6b81b8" 
  p SecureRandom.hex(12) #=> "94b2fff3e7fd9b9c391a2306" 
  p SecureRandom.hex(13) #=> "39b290146bea6ce975c37cfc23" 
  
  # random base64 string. 
  p SecureRandom.base64(10) #=> "EcmTPZwWRAozdA==" 
  p SecureRandom.base64(10) #=> "9b0nsevdwNuM/w==" 
  p SecureRandom.base64(10) #=> "KO1nIU+p9DKxGg==" 
  p SecureRandom.base64(11) #=> "l7XEiFja+8EKEtY=" 
  p SecureRandom.base64(12) #=> "7kJSM/MzBJI+75j8" 
  p SecureRandom.base64(13) #=> "vKLJ0tXBHqQOuIcSIg==" 
  
  # random binary string. 
  p SecureRandom.random_bytes(10) #=> "\016\t{\370g\310pbr\301" 
  p SecureRandom.random_bytes(10) #=> "\323U\030TO\234\357\020\a\337" 

== Singleton Methods

--- base64(n = nil)    -> String

������� base64 ʸ��������������֤��ޤ���

@param n ʸ����������˻Ȥ��������ͥ��Υ������������ǻ��ꤷ�ޤ���
         ���������ʸ����Υ������ǤϤʤ����Ȥ���դ��Ʋ����������������ʸ����Υ�������
         n ���� 4/3 �ܤˤʤ�ޤ���nil ����ꤷ����� n �Ȥ��� 16 ���Ȥ��ޤ���

@raise NotImplementedError ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

  p SecureRandom.base64(3)    #=> "4pYO"  (ʸ����Υ������� 3 �Ǥʤ�)

@see [[rfc:3548]]

#@since 1.9.1
#@since 1.9.2
--- urlsafe_base64(n = nil, padding = false)  -> String

������� URL-safe �� base64 ʸ��������������֤��ޤ���

@param n ʸ����������˻Ȥ��������ͥ��Υ������������ǻ��ꤷ�ޤ���
         ���������ʸ����Υ�������n ���� 4/3 �ܤˤʤ�ޤ���
         nil ����ꤷ����� n �Ȥ��� 16 ���Ȥ��ޤ���

@param padding ������ꤹ��� '=' �ǥѥǥ��󥰤�Ԥ��ޤ���
               ������ꤹ��ȥѥǥ��󥰤�Ԥ��ޤ��󡣥ǥե���Ȥϵ��Ǥ���

@raise NotImplementedError  ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

   p SecureRandom.urlsafe_base64 #=> "b4GOKm4pOYU_-BOXcrUGDg"
   p SecureRandom.urlsafe_base64 #=> "UZLdOkzop70Ddx-IJR0ABg"
   p SecureRandom.urlsafe_base64(nil, true) #=> "i0XQ-7gglIsHGV2_BNPrdQ=="
   p SecureRandom.urlsafe_base64(nil, true) #=> "-M8rLhr7JEpJlqFGUMmOxg=="

@see [[rfc:3548]]

#@else
--- urlsafe_base64(n = nil)  -> String

������� URL-safe �� base64 ʸ��������������֤��ޤ���

@param n ʸ����������˻Ȥ��������ͥ��Υ������������ǻ��ꤷ�ޤ���
         ���������ʸ����Υ�������n ���� 4/3 �ܤˤʤ�ޤ���
         nil ����ꤷ����� n �Ȥ��� 16 ���Ȥ��ޤ���

@raise NotImplementedError  ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

   p SecureRandom.urlsafe_base64 #=> "b4GOKm4pOYU_-BOXcrUGDg"
   p SecureRandom.urlsafe_base64 #=> "UZLdOkzop70Ddx-IJR0ABg"

#@end
@see [[m:SecureRandom.base64]],  [[rfc:3548]]
#@end
--- hex(n = nil)    -> String

������� hex ʸ��������������֤��ޤ���

@param n ʸ����������˻Ȥ��������ͥ��Υ������������ǻ��ꤷ�ޤ���
         ���������ʸ����Υ������ǤϤʤ����Ȥ���դ��Ʋ����������������ʸ����Υ�������
         n ���� 2 �ܤˤʤ�ޤ���nil ����ꤷ����� n �Ȥ��� 16 ���Ȥ��ޤ���

@raise NotImplementedError ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

  p SecureRandom.hex(3)    #=> "f72233"   (ʸ����Υ������� 3 �Ǥʤ�)


--- random_bytes(n = nil)    -> String

������ʥХ���������������֤��ޤ���

@param n ���������ʸ����Υ������������ǻ��ꤷ�ޤ���
         nil ����ꤷ����� n �Ȥ��� 16 ���Ȥ��ޤ���

@raise NotImplementedError ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

  p SecureRandom.random_bytes(3)    #=> "\321\020\203"

--- random_number(n = 0)     -> Integer | Float

������ʿ��ͤ����������֤��ޤ���
n �� 1 �ʾ�������ξ�硢0 �ʾ� n ̤�����������֤��ޤ���
n �� 0 �ξ�硢0.0 �ʾ� 1.0 ̤���μ¿����֤��ޤ���

@param n ������ʿ��ͤξ�¤���ͤǻ��ꤷ�ޤ���

@raise NotImplementedError ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

  p SecureRandom.random_number(1 << 64)    #=> 4078466195356651249

#@since 1.8.8
#@if (version != "1.9.1")
--- uuid   -> String

�С������ 4 �� UUID (Universally Unique IDentifier) �����������֤��ޤ���

version 4 �� UUID ������������Ǥ� (�С������������)��
���� UUID �� MAC ���ɥ쥹�����ʤɤΤ褦�ʰ�̣�Τ�������ޤߤޤ���

@raise NotImplementedError ���������ȯ���郎�Ȥ��ʤ�����ȯ�����ޤ���

   p SecureRandom.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
   p SecureRandom.uuid #=> "62936e70-1815-439b-bf89-8492855a7e6b"

@see [[rfc:4122]]
#@end
#@end
