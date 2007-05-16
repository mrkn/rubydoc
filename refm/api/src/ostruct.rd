���Ǥ�ưŪ������Ǥ����ڤʹ�¤��

= class OpenStruct < Object

��ڤ˻Ȥ��빽¤�Υ��饹��
method_missing�λȤ�������Ǥ⤢�롣

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

  son = OpenStruct.new(:name=>"Thomas", :age => 3)
  p son.name        # => "Thomas"
  p son.age         # => 3
  son.age += 1
  p son.age         # => 4
  son.items = ["candy","toy"]
  p son.items       # => ["candy","toy"]
  p son             # => #<OpenStruct name="Thomas", age=4, items=["candy", "toy"]>
  
== Class Methods
--- new(hash = nil) -> [OpenStruct]
OpenStruct���֥������Ȥ�������
hash��Ϳ����줿�Ȥ������줾��Υ�����
�����������֥������Ȥ����Ǥˤ��ޤ���
@param hash ���ꤹ�����ǤȤ����ͤ���ꤷ�ޤ�
�����ˤ� to_sym �ǥ���ܥ벽�Ǥ����Ρ�
�Ĥޤ�ʸ����䥷��ܥ����Ѥ��뤳�Ȥ��Ǥ��ޤ���
== Instance Methods
--- delete_field(name) -> [object]
name�ǻ��ꤵ�줿���Ǥ�����
���θ夽�����Ǥ򻲾Ȥ�����nil���֤롣
@return ���������������Ǥ��ͤ��֤��ޤ���
@param name ����������Ǥ����
ʸ����䥷��ܥ���Ѥ��ޤ���
