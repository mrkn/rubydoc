
String��Float��Rational ���֥������� �� BigDecimal ���֥������Ȥ��Ѵ����뵡ǽ����
���ޤ���

 * [[m:String#to_d]]
 * [[m:Float#to_d]]
 * [[m:Rational#to_d]]

#@until 1.9.1
�ޤ���BigDecimal ���֥������Ȥ� Rational ���֥������Ȥ��Ѵ����뵡ǽ���󶡤��ޤ���

 * [[m:BigDecimal#to_r]]
#@end

�����Υ᥽�åɤ�Ȥ��ˤ� 'bigdecimal' �� 'bigdecimal/util'�� require
����ɬ�פ�����ޤ���

= reopen Float

== Instance Methods

--- to_d -> BigDecimal

���Ȥ� [[c:BigDecimal]] ���Ѵ����ޤ���

@return [[c:BigDecimal]] ���Ѵ��������֥�������

���Ȥ���� [[m:Float#to_s]] ��ʸ������Ѵ����Ƥ���
[[m:Kernel.#BigDecimal]] ����������Τǡ����٤���դ��Ƥ���������

  1.0.to_d.to_s # => "0.1E1"
  (1.0/0).to_d.to_s # => "Infinity"

  ((1.0/3).to_d/(2.0/3).to_d).to_s # => "0.499999999999999250000000000000375E0"
  ((1.0/3)/(2.0/3)).to_d.to_s # => "0.5E0"

= reopen String

== Instance Methods

--- to_d -> BigDecimal

���Ȥ� [[c:BigDecimal]] ���Ѵ����ޤ���BigDecimal(self) ��Ʊ���Ǥ���

@return [[c:BigDecimal]] ���Ѵ��������֥�������

= reopen BigDecimal

== Instance Methods

--- to_digits -> String

���Ȥ� "1234.567" �Τ褦�ʽ��ʿ��η����˥ե����ޥåȤ���ʸ������Ѵ���
�ޤ���

@return ���ʿ��η����˥ե����ޥåȤ���ʸ����

���:

���Υ᥽�åɤ���侩�Ǥ���[[m:BigDecimal#to_s]]("F") ����Ѥ��Ƥ���������

#@until 1.9.1
--- to_r -> Rational

���Ȥ� [[c:Rational]] ���Ѵ����ޤ���

@return [[c:Rational]] ���Ѵ��������֥�������
#@end

= reopen Rational

== Instance Methods

--- to_d(nFig = 0) -> BigDecimal

���Ȥ� [[c:BigDecimal]] ���Ѵ����ޤ���

nFig �����ꤵ�줿��硢nFig ��ޤǷ׻���Ԥ��ޤ�����ά������ 0 �ʲ����
�ꤷ������ [[m:BigDecimal.double_fig]] * 2 + 1 ��ޤǷ׻���Ԥ��ޤ���

@param nFig �׻���Ԥ����

@return [[c:BigDecimal]] ���Ѵ��������֥�������

��:

  require "rational"
  require "bigdecimal"
  require "bigdecimal/util"
  Rational(1, 3).to_d(3).to_s  # => "0.333E0"
  Rational(1, 3).to_d(10).to_s # => "0.3333333333E0"
