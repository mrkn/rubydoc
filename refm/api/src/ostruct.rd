���Ǥ�ưŪ���ɲá�����Ǥ����ڤʹ�¤�Τ��󶡤���饤�֥��Ǥ�

= class OpenStruct < Object

OpenStruct�Υ��󥹥��󥹤��Ф���̤����ʥ��å����᥽�å� x= ��Ƥ֤ȡ�
OpenStruct���饹��[[m:Object#method_missing]]����ª���졢���󥹥��󥹤�°�� x ���������ޤ���
���ε�ư�ˤ�ä����Ǥ�ưŪ���ѹ��Ǥ��빽¤�ΤȤ���Ư���ޤ���

  require 'ostruct'
  ab = OpenStruct.new
  ab.foo = 25
  p ab.foo          # => 25
  ab.bar = 2
  p ab.bar          # => 2
  p ab              # => <OpenStruct foo=25, bar=2>
  ab.delete_field("foo")
  p ab.foo          # => nil
  p ab              # => <OpenStruct bar=2>

  son = OpenStruct.new({:name=>"Thomas", :age => 3})
  p son.name        # => "Thomas"
  p son.age         # => 3
  son.age += 1
  p son.age         # => 4
  son.items = ["candy","toy"]
  p son.items       # => ["candy","toy"]
  p son             # => #<OpenStruct name="Thomas", age=4, items=["candy", "toy"]>
  
== Class Methods
--- new(hash = nil) -> OpenStruct

OpenStruct���֥������Ȥ�������
hash��Ϳ����줿�Ȥ������줾��Υ�����
�����������֥������Ȥ����Ǥˤ����ͤ򥻥åȤ��ޤ���

@param hash ���ꤹ�����ǤȤ����ͤ���ꤷ�ޤ���
    hash�ˤ�[[c:Hash]]���饹�Υ��󥹥��󥹡��ޤ��������������Ѥ��뤳�Ȥ��Ǥ��ޤ���
@raise NoMethodError hash�Υ����� to_sym �᥽�åɤ�����ʤ��Ȥ���ȯ�����ޤ���

  require 'ostruct'
  some1 = OpenStruct.new({:a =>"a",:b =>"b"}) # => #<OpenStruct b="b", a="a">
  some2 = OpenStruct.new([[:a,"a"],[:b,"b"]]) # => #<OpenStruct b="b", a="a">

== Instance Methods
--- delete_field(name) -> object

name�ǻ��ꤵ�줿���Ǥ�����
���θ夽�����Ǥ򻲾Ȥ�����nil���֤�ޤ���

@return ����������Ǥ��ͤ��֤��ޤ���
@param name ����������Ǥ���ꡣʸ����䥷��ܥ���Ѥ��ޤ���
