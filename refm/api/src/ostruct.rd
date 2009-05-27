���Ǥ�ưŪ���ɲá�����Ǥ����ڤʹ�¤�Τ��󶡤���饤�֥��Ǥ���

= class OpenStruct < Object

���Ǥ�ưŪ���ɲá�����Ǥ����ڤʹ�¤�Τ��󶡤��륯�饹�Ǥ���

OpenStruct �Υ��󥹥��󥹤��Ф���̤����ʥ᥽�å� x= ��Ƥ֤ȡ�
OpenStruct ���饹�� [[m:Object#method_missing]] ����ª���졢���Υ��󥹥��󥹤�
���󥹥��󥹥᥽�å� x, x= ���������ޤ���
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

������˥ϥå������Ѥ��뤳�Ȥ�Ǥ��ޤ���

  son = OpenStruct.new({ :name => "Thomas", :age => 3 })
  p son.name        # => "Thomas"
  p son.age         # => 3
  son.age += 1
  p son.age         # => 4
  son.items = ["candy","toy"]
  p son.items       # => ["candy","toy"]
  p son             # => #<OpenStruct name="Thomas", age=4, items=["candy", "toy"]>

=== �ե꡼������Ƥ��� OpenStruct �ˤĤ���

Ruby �ΥС�����󤴤Ȥ˵�ư���ۤʤ�Τ���դ��Ƥ���������
�ʲ��Υ����ɤ�¹Ԥ������ϡ�ɽ�Τ褦�ˤʤ�ޤ���

  require 'ostruct'
  a = OpenStruct.new
  a.x = :a
  a.freeze
  a.x = :b # ������ʬ�ε�ư���ۤʤ�

  1.8.0 ��������ǽ
  1.8.1 TypeError
  1.8.2 ��������ǽ
  1.8.3 ��������ǽ
  1.8.4 ��������ǽ
  1.8.5 ��������ǽ
  1.8.6 ��������ǽ
  1.8.7 ��������ǽ
  1.8.8 TypeError
  1.9.1 ��������ǽ
  1.9.2 TypeError

Ʊ�ͤ˰ʲ��Υ����ɤ�¹Ԥ����������ƤΥС��������㳰��ȯ�����ޤ���

  require 'ostruct'
  a = OpenStruct.new
  a.x = :a
  a.freeze
  a.y = :b # TypeError

== Class Methods
--- new(hash = nil) -> OpenStruct

OpenStruct ���֥������Ȥ��������ޤ���

�ϥå��夬Ϳ����줿�Ȥ������줾��Υ����������������֥������Ȥ����Ǥˤ����ͤ򥻥åȤ��ޤ���

@param hash ���ꤹ�����ǤȤ����ͤ���ꤷ�ޤ���
       hash �ˤ� [[c:Hash]] ���饹�Υ��󥹥��󥹡��ޤ��������������Ѥ��뤳�Ȥ��Ǥ��ޤ���
@raise NoMethodError hash �Υ����� to_sym �᥽�åɤ�����ʤ��Ȥ���ȯ�����ޤ���

  require 'ostruct'
  some1 = OpenStruct.new({:a =>"a",:b =>"b"}) # => #<OpenStruct b="b", a="a">
  some2 = OpenStruct.new([[:a,"a"],[:b,"b"]]) # => #<OpenStruct b="b", a="a">

== Instance Methods

#@since 1.8.1
--- ==(other) -> bool

���Ȥ�����оݤΥ��֥������Ȥ����������˿����֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

@param other ����оݤΥ��֥������Ȥ���ꤷ�ޤ���

#@end

#@since 1.8.2
--- new_ostruct_member(name) -> Symbol

Ϳ����줿̾���Υ��������᥽�åɤ򼫿Ȥ�������ޤ���

@param name ʸ���󤫥���ܥ��������륢��������̾������ꤷ�ޤ���

#@end

--- inspect -> String
#@since 1.8.3
--- to_s -> String
#@end

���֥������Ȥ�ʹ֤��ɤ��������Ѵ�����ʸ������֤��ޤ���

@see [[m:Object#inspect]]

--- delete_field(name) -> object

name�ǻ��ꤵ�줿���Ǥ������ޤ���

���θ夽�����Ǥ򻲾Ȥ����� nil ���֤�ޤ���

@param name ����������Ǥ�ʸ���󤫥���ܥ�ǻ��ꤷ�ޤ���
@return ����������Ǥ��ͤ��֤��ޤ���

== Protected Instance Methods

#@since 1.8.8
#@if (version != "1.9.1")
--- modifiable -> Hash

���Υ᥽�åɤ�����Ū�˻��Ѥ���ޤ���

���Ȥ� [[m:Object#freeze]] ����Ƥ�����ˤ��Υ᥽�åɤ�ƤӽФ����㳰��ȯ�����ޤ���

@raise TypeError ���Ȥ� [[m:Object#freeze]] ����Ƥ������ȯ�����ޤ���

#@end
#@end


== Constants

#@since 1.8.3
--- InspectKey

����Ū�˻��Ѥ�������Ǥ���
#@end
