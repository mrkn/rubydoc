require rubygems
require rubygems/requirement

Gem �ѥå������ΥС������򰷤�����Υ饤�֥��Ǥ���

= class Gem::Version
include Comparable

Gem �ѥå������ΥС������򰷤�����Υ��饹�Ǥ���

== Public Instance Methods

--- <=>(other) -> -1 | 0 | 1 | nil
#@todo

@param other ����оݤ� [[c:Gem::Version]] ����ꤷ�ޤ���

--- bump -> Gem::Version
#@todo

���Ȥμ��ΥС�������ɽ�����֥������Ȥ��֤��ޤ���

��:
  # 5.3.1 => 5.4
  a = Gem::Version.create('5.3.1') # => #<Gem::Version "5.3.1">
  a.bump                           # => #<Gem::Version "5.4">
  
--- eql?(other) -> bool
#@todo

������Ϳ����줿����оݤ����Ȥ�Ʊ���С�������ɽ�����֥������ȤǤ�����˿����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

��:
  a = Gem::Version.create('1.0') # => #<Gem::Version "1.0">
  b = Gem::Version.create('1.0') # => #<Gem::Version "1.0">
  c = Gem::Version.create('1')   # => #<Gem::Version "1">
  a.eql?(b) # => true
  a.eql?(c) # => false

@param other ����оݤ� [[c:Gem::Version]] ����ꤷ�ޤ���

--- ints -> [Integer]
#@todo

���ȤΥС�������ɽ�����ͤ�������֤��ޤ���

��:
  # 5.3.1 => 5.4
  a = Gem::Version.create('5.3.1') # => #<Gem::Version "5.3.1">
  a.ints                           # => [5, 3, 1]

--- marshal_dump -> [String]
#@todo

�����ʥ��֥������ȤǤϤʤ����ȤΥС�������ɽ��ʸ��������פ��ޤ���

--- marshal_load(array) -> self
#@todo

@param array


--- normalize
#@todo

�����Υ���������ޤ���

--- to_ints -> [Integer]
#@todo

���Ȥ�ɽ���С���������ͤ�����Ȥ����֤��ޤ���

--- to_s -> String
#@todo

���Ȥ�ɽ���С�������ʸ����Ȥ����֤��ޤ���


--- to_yaml_properties -> [String]
#@todo

--- version -> String
#@todo

���Ȥ�ʸ����Ȥ����֤��ޤ���

--- version=(version)
#@todo

@param version �С�������ɽ��ʸ�������ꤷ�ޤ���

--- yaml_initialize
#@todo

== Singleton Methods

--- correct?(version) -> bool
#@todo

Ϳ����줿�������С�������ɽ��ʸ����Ȥ���ͭ���Ǥ���п����֤��ޤ��������Ǥʤ���е����֤��ޤ���

@param version �С�������ɽ��ʸ�������ꤷ�ޤ���

--- create(input) -> Gem::Version | nil
#@todo

���Υ��饹�򥤥󥹥��󥹲����뤿��Υե����ȥ�᥽�åɤǤ���

@param input [[c:Gem::Version]] �Υ��󥹥��󥹤����С�������ɽ��ʸ�������ꤷ�ޤ���

