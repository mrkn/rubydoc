= class Module < Object

�⥸�塼��Υ��饹��

== Class Methods

--- constants

���Υ᥽�åɤ�ƤӽФ��������ǻ��Ȳ�ǽ�����̾��������֤��ޤ���

��:

  class Foo
    FOO = 1
  end

  p Module.constants

  # ������� FOO �ϸ����ʤ�
  => ["RUBY_PLATFORM", "STDIN", ..., "Foo", ... ]

[[m:Module#constants]] �䡢
[[m:Kernel#local_variables]],
[[m:Kernel#global_variables]],
[[m:Object#instance_variables]],
[[m:Module#class_variables]]
�⻲�Ȥ��Ƥ���������

--- nesting

���Υ᥽�åɤ�ƤӽФ��������ǤΥ��饹/�⥸�塼��Υͥ��Ⱦ�
��������������֤��ޤ���

��:

  module Foo
    module Bar
      module Baz
        p Module.nesting
      end
    end
  end
  # => [Foo::Bar::Baz, Foo::Bar, Foo]

--- new
#@if (version >= "1.7.0")
--- new {|mod| ... }
#@end

������̾�����դ��Ƥ��ʤ��⥸�塼������������֤��ޤ���

̾���Τʤ��⥸�塼��ϡ��ǽ��̾�������ݤ���������Ƥ������̾
�򸡺��������Ĥ��ä����̾��⥸�塼��̾�Ȥ��ޤ���

��:

  p foo = Module.new  # => #<Module 0lx40198a54>
  p foo.name          # => ""
  Foo = foo           # ������ p foo ����� "Foo" ����
  Bar = foo
  p foo.name          # => "Bar"  ("Foo" �ˤʤ뤫 "Bar" �ˤʤ뤫������)

#@if (version >= "1.7.0")
�֥�å���Ϳ����������������⥸�塼���֥�å��ΰ������Ϥ�����
���塼��Υ���ƥ����Ȥǥ֥�å���¹Ԥ��ޤ������ξ�������������
���塼����֤��ޤ���

��:

  mod = Module.new
  mod.module_eval {|m| ... }
  mod

��Ʊ���Ǥ����֥�å��μ¹Ԥ� Module#initialize ���Ԥ��ޤ���
#@end

== Instance Methods

--- <=>(other)

self �� other ����Ӥ��ơ�
self �� other �λ�¹�Ǥ���Ȥ� -1��
Ʊ��Υ��饹���⥸�塼��ΤȤ� 0��
self �� other �����ĤǤ���Ȥ� 1
���֤��ޤ���

�ƻҴط��ˤʤ����饹Ʊ�Τ���ӤǤ�
#@if (version >= "1.7.0")
nil ���֤��ޤ���
#@else
����ư�������Ǥ���
#@end

other �����饹��⥸�塼��Ǥʤ����
#@if (version >= "1.8.0")
nil ���֤��ޤ���
#@else
�㳰 [[c:TypeError]] ��ȯ�����ޤ���
#@end

��:

  module Foo
  end
  class Bar
    include Foo
  end
  class Baz < Bar
  end
  class Qux
  end
  p Bar <=> Foo     # => -1
  p Baz <=> Bar     # => -1
  p Baz <=> Foo     # => -1
#@if (version >= "1.8.0")
  p Baz <=> Qux     # => -1
  p Qux <=> Baz     # => -1
#@end
#@if (version >= "1.7.0")
  p Baz <=> Qux     # => nil
  p Qux <=> Baz     # => nil
#@else
  p Baz <=> Qux     # => 1
  p Qux <=> Baz     # => 1
#@end

#@if (version >= "1.8.0")
  p Baz <=> Object.new  # => nil
#@else
  p Baz <=> Object.new  # => :in `<=>': <=> requires Class or Module (Object given) (TypeError)
#@end

--- <(other)
--- <=(other)
--- >(other)
--- >=(other)

��ӱ黻�ҡ�self �� other �λ�¹�Ǥ������
self < other ����Ω���ޤ���

�ƻҴط��ˤʤ����饹Ʊ�Τ���ӤǤϤ�����δط���
#@if (version >= "1.8.0")
nil ���֤��ޤ���
#@else
false ���֤��ޤ���
#@end

other �����饹��⥸�塼��Ǥʤ�����㳰 [[c:TypeError]] ��
ȯ�����ޤ���

��:

  module Foo
  end
  class Bar
    include Foo
  end
  class Baz < Bar
  end
  class Qux
  end
  p Bar < Foo     # => true
  p Baz < Bar     # => true
  p Baz < Foo     # => true
#@if (version >= "1.8.0")
  p Baz < Qux     # => nil
  p Baz > Qux     # => nil
#@else
  p Baz < Qux     # => false
  p Baz > Qux     # => false
#@end

  p Foo < Object.new # => in `<': compared with non class/module (TypeError)

--- ===(obj)

���Υ᥽�åɤϼ�� [[unknown:���湽¤/case]] ʸ�Ǥ���Ӥ��Ѥ����ޤ���
obj �� self �� [[m:Object#kind_of?]]
�δط�������������ˤʤ�ޤ����Ĥޤꡢ[[unknown:���湽¤/case]] �Ǥϥ���
�����⥸�塼��ν�°�ط�������å����뤳�Ȥˤʤ�ޤ���

��:

  str = String.new
  case str
  when String     # String === str ��ɾ������
    p true        # => true
  end

--- ancestors

���饹���⥸�塼��Υ����ѡ����饹�ȥ��󥯥롼�ɤ��Ƥ���⥸�塼��
��ͥ���̽������˳�Ǽ�����֤��ޤ���

��:

  module Foo
  end
  class Bar
    include Foo
  end
  class Baz < Bar
    p ancestors
    p included_modules
    p superclass
  end
  # => [Baz, Bar, Foo, Object, Kernel]
  # => [Foo, Kernel]
  # => Bar

#@if (version >= "1.8.0")
--- autoload(const_name, feature)
--- autoload?(const_name)

[[m:Kernel#autoload]] �򻲾ȡ�
#@end

--- class_eval(src[,fname[,lineno]])
--- class_eval { ... }

[[m:Module#module_eval]] ����̾��

--- class_variables

���饹���⥸�塼����������Ƥ���[[unknown:�ѿ������/���饹�ѿ�]]̾����
����֤��ޤ��������ѡ����饹�䥤�󥯥롼�ɤ��Ƥ���⥸�塼��Υ���
���ѿ���ޤߤޤ���

[[m:Kernel#local_variables]],
[[m:Kernel#global_variables]],
[[m:Object#instance_variables]],
[[m:Module#Module.constants]],
[[m:Module#constants]]
�⻲�Ȥ��Ƥ���������

--- const_defined?(name)

�⥸�塼��� name �ǻ��ꤵ���̾����������������Ƥ������
���֤��ޤ���name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ���

�����ѡ����饹�䥤�󥯥롼�ɤ����⥸�塼���������줿������оݤˤ�
�ʤ�ޤ���(��������[[c:Object]] �������㳰
#@# ���餤 2002-04-10: �Х�?����?

��:

  module Kernel
    FOO = 1
  end

  # Object �� include �����⥸�塼���������Ф��Ƥ�
  # true ���֤�
  p Object.const_defined?(:FOO)   # => true

  module Bar
    BAR = 1
  end
  class Object
    include Bar
  end
  # �桼������Υ⥸�塼����Ф��Ƥ�Ʊ��
  p Object.const_defined?(:BAR)   # => true

  class Baz
    include Bar
  end
  # Object�ʳ��Ǥϼ��Ȥ���������������å��о�
  p Baz.const_defined?(:BAR)      # => false

--- const_get(name)

�⥸�塼����������Ƥ��� name �ǻ��ꤵ���̾����������ͤ�
���Ф��ޤ���������������Ƥ��ʤ����ˤ��㳰 [[c:NameError]] ��
ȯ�����ޤ���
name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ���

#@if (version >= "1.8.0")
--- const_missing(name)

�������Ƥ��ʤ�����򻲾Ȥ����Ȥ��� Ruby �����Υ᥽�åɤ�Ƥ�
�ޤ������Ȥ������̾�� [[c:Symbol]] ���������Ϥ���ޤ���

�ǥե���ȤǤϤ��Υ᥽�åɤ��㳰 [[c:NameError]] ��ȯ�������ޤ���

��:

  class Foo
    def Foo.const_missing(id)
      warn "undefined constant #{id.inspect}"
    end

    Bar
  end
  Foo::Bar

  # => undefined constant :Bar
       undefined constant :Bar
#@end

--- const_set(name, value)

�⥸�塼��� name �ǻ��ꤵ�줿̾��������� value �Ȥ�
���ͤȤ����������value ���֤��ޤ���
���Υ⥸�塼��ˤ����Ƥ��Ǥˤ���̾����������������Ƥ����硢��
���å����������Ϥ���ޤ���name �� [[c:Symbol]] ��ʸ�����
���ꤷ�ޤ���

--- constants

���Υ⥸�塼��(�ޤ��ϥ��饹)���������Ƥ������̾���������
���ޤ���
�����ѡ����饹�䥤�󥯥롼�ɤ��Ƥ���⥸�塼��������ޤߤޤ���

[[m:Module#Module.constants]] ��
[[m:Kernel#local_variables]],
[[m:Kernel#global_variables]],
[[m:Object#instance_variables]],
[[m:Module#class_variables]]
�⻲�Ȥ��Ƥ���������


��: Module.constants �� Module#constants �ΰ㤤

  # ���Ϥδ�ά���Τ��ᵯư�������������������Ƹ�Ǻ�������
  $clist = Module.constants

  class Foo
    FOO = 1
  end
  class Bar
    BAR = 1

    # Bar �� BAR ��ޤ�
    p constants - $clist                # => ["BAR"]
    # ���Ϥ� FOO �ϴޤޤ�ʤ�
    p Module.constants - $clist         # => ["BAR", "Bar", "Foo"]
    class Baz
      # Baz �������ޤޤʤ�
      p constants - $clist              # => []

      # �ͥ��Ȥ������饹�Ǥϡ���¦�Υ��饹��������������
      # ���Ȳ�ǽ�ʤΤǡ�BAR �ϡ�Module.constants �ˤϴޤޤ��
      # (���饹 Baz �� Bar ������ʤΤ�Ʊ��)
      p Module.constants - $clist       # => ["BAR", "Baz", "Bar", "Foo"]
    end
  end

#@if (version >= "1.7.0")
--- include?(mod)

self �� �⥸�塼�� mod �򥤥󥯥롼�ɤ��Ƥ����
�����֤��ޤ���

��:

  Foo = Module.new
  class Bar
    include Foo
  end
  class Baz < Bar
  end

  p Bar.include? Foo #=> true
  p Baz.include? Foo #=> true
#@end

--- included_modules

���󥯥롼�ɤ���Ƥ���⥸�塼���������֤��ޤ���
[[m:Module#ancestors]] ����⻲�Ȥ��Ƥ�������

--- instance_method(name)

self �Υ��󥹥��󥹥᥽�åɤ򥪥֥������Ȳ�����
[[c:UnboundMethod]] ���֤��ޤ���name �� [[c:Symbol]] ��ʸ��
��Ǥ���

[[m:Object#method]] �⻲�Ȥ��Ƥ���������

--- method_defined?(name)

�⥸�塼��˥��󥹥��󥹥᥽�å� name ���������Ƥ���Ȥ���
���֤��ޤ���name �� [[c:Symbol]] ��ʸ����Ǥ���

[[m:Module#public_method_defined?]],
[[m:Module#private_method_defined?]],
[[m:Module#protected_method_defined?]]
�⻲�Ȥ��Ƥ���������

--- module_eval(expr, [fname, [lineno=1]])
--- module_eval {|mod| .... }

�⥸�塼��Υ���ƥ����Ȥ�ʸ���� expr ��ɾ�����Ƥ��η�̤���
���ޤ���
fname��lineno ��Ϳ����줿���ϡ��ե����� fname��
���ֹ� lineno �ˤ���ʸ���󤬤��뤫�Τ褦�˥���ѥ��뤵�졢��
���å��ȥ졼��ɽ���ʤɤΥե�����̾�����ֹ�򺹤��ؤ��뤳�Ȥ��Ǥ���
����

�֥�å���Ϳ����줿���ˤϤ��Υ֥�å���⥸�塼��Υ���ƥ�����
��ɾ�����Ƥ��η�̤��֤��ޤ����֥�å��ΰ��� mod �ˤ�
self ���Ϥ���ޤ���

�⥸�塼��Υ���ƥ����Ȥ�ɾ������Ȥϡ��¹��椽�Υ⥸�塼�뤬
self �ˤʤ�Ȥ������ȤǤ����Ĥޤꡢ���Υ⥸�塼������ʸ��
��ˤ��뤫�Τ褦�˼¹Ԥ���ޤ���

���������������ѿ��� module_eval �γ�¦�Υ������פȶ�ͭ��
�ޤ���
#@if (version >= "1.6.8")
version 1.6.8 �ʹߤǥ֥�å���Ϳ����줿���ϡ�����ȥ��饹�ѿ�
�Υ������פ⳰¦�Υ������פˤʤ�ޤ���
#@end

��: module_eval �Υ֥�å���ǥ᥽�åɤ���������硢
[[m:Object#instance_eval]] ��Ʊ�ͤ����¤�����ޤ����ܺ٤Ϥ������
�����򻲾Ȥ��Ƥ���������

[[m:Object#instance_eval]],
[[m:Module#class_eval]]
[[m:Module#Module.new]] �⻲�Ȥ��Ƥ���������

--- name
--- to_s

���饹���⥸�塼���̾�����֤��ޤ���̾���Τʤ����饹���⥸�塼��
�ˤĤ��Ƥ϶�ʸ������֤��ޤ�([[m:Module#Module.new]] ����򻲾�)��

���饹���⥸�塼�뤬�ͥ��Ȥ��Ƥ�����ϡ��ƥ��饹���ƥ⥸�塼���
��碌��ɽ������ޤ���


��:

 module A
   module B
   end
   p B.name  #=> "A::B"

   class C
   end
 end
 p A.name    #=> "A"
 p A::B.name #=> "A::B"
 p A::C.name #=> "A::C"

--- instance_methods([inherited_too])
--- public_instance_methods([inherited_too])
--- private_instance_methods([inherited_too])
--- protected_instance_methods([inherited_too])

���Υ⥸�塼����������Ƥ��� public/private/protected �᥽�å�̾
�ΰ�����������֤��ޤ���

instance_methods �ϡ�public_instance_methods ��Ʊ���Ǥ���
#@if (version >= "1.7.0")
instance_methods �ϡ�public �����
protected �᥽�å�̾�ΰ�����������֤��ޤ���
#@end

inherited_too �����Ǥ���С������ѡ����饹�Υ᥽�åɤ�õ����
�ޤ����ǥե���Ȥϵ��Ǥ���
#@if (version >= "1.8.0")
�����Υǥե���ȤϿ����Ѥ��ͽ��Ǥ���
�������ά����ȷٹ𤬽Ф�Τǡ��ѹ��ޤǤϰ������������뤳�Ȥ�˾��
��ޤ�)
#@end

[[m:Object#methods]],
[[m:Object#public_methods]],
[[m:Object#private_methods]],
[[m:Object#protected_methods]]
�⻲�Ȥ��Ƥ���������

��:

  class Foo
    private;   def private_foo()   end
    protected; def protected_foo() end
    public;    def public_foo()    end
  end

  # ���륯�饹�Υ��󥹥��󥹥᥽�åɤΰ���������
  puts "��1:"
  p Foo.instance_methods(false)
  p Foo.public_instance_methods(false)
  p Foo.private_instance_methods(false)
  p Foo.protected_instance_methods(false)

  class Bar < Foo
  end

  # ���륯�饹�Υ��󥹥��󥹥᥽�åɤΰ��������롣
  # �ƤΥ��饹�Υ��󥹥��󥹥᥽�åɤ�ޤ�뤿�� true ����ꤷ��
  # ���뤬��Object �Υ��󥹥��󥹥᥽�åɤϰ��������ӽ����Ƥ��롣

  puts "��2:"
  p Bar.instance_methods(true)           - Object.instance_methods(true)
  p Bar.public_instance_methods(true)    - Object.public_instance_methods(true)
  p Bar.private_instance_methods(true)   - Object.private_instance_methods(true)
  p Bar.protected_instance_methods(true) - Object.protected_instance_methods(true)

  => ��1:
#@if (version >= "1.7.0")
     ["protected_foo", "public_foo"]
#@else
     ["public_foo"]
#@end
     ["public_foo"]
     ["private_foo"]
     ["protected_foo"]
     ��2:
#@if (version >= "1.7.0")
     ["protected_foo", "public_foo"]
#@else
     ["protected_foo"]
#@end
     ["public_foo"]
     ["private_foo"]
     ["protected_foo"]

--- private_class_method(name,  ... )
--- public_class_method(name,  ... )

name �ǻ��ꤷ�����饹�᥽�å�(���饹���ðۥ᥽�å�) �βĻ���
���ѹ����ޤ���

self ���֤��ޤ���

#@if (version >= "1.7.0")
--- private_method_defined?(name)
--- protected_method_defined?(name)
--- public_method_defined?(name)

���줾�졢[[m:Module#private]], [[m:Module#protected]],
[[m:Module#public]] �Ǥ��륤�󥹥��󥹥᥽�å� name ���⥸�塼
����������Ƥ���Ȥ������֤��ޤ���name �� [[c:Symbol]] ��
ʸ����Ǥ���

[[m:Module#method_defined?]]
�⻲�Ȥ��Ƥ���������
#@end

== Private Instance Methods

--- alias_method(new, old)

�᥽�åɤ���̾��������ޤ���
[[unknown:���饹���᥽�åɤ����/alias]] �Ȥΰ㤤�ϰʲ����̤�Ǥ���

  * �᥽�å�̾��ʸ����ޤ��� [[c:Symbol]] �ǻ��ꤹ��
  * �����Х��ѿ�����̾��Ĥ��뤳�ȤϤǤ��ʤ�
#@if (version < "1.7.3")
#@#see [ruby-dev:17894]
  * alias �Ϲ�ʸ�ʤΤǥ᥽�åɤ���ǤϻȤ��ʤ�
#@end

self ���֤��ޤ���

--- append_features(module_or_class)

�⥸�塼��(���뤤�ϥ��饹)�� self �ε�ǽ���ɲä��ޤ���
���Υ᥽�åɤ� Module#include �μ��ΤǤ��ꡢinclude ��
Ruby �ǽ񤯤Ȱʲ��Τ褦������Ǥ��ޤ���
#@# ���餤 2002-03-03: ((<ruby 1.7 feature>)) �Ǥϡ�include ��¹Ԥ���
#@# ������Ѥ�ä��Τ� each ������� reverse_each ��Ȥ�

  def include(*modules)
    modules.each {|mod|
      # append_features �ϥץ饤�١��ȥ᥽�åɤʤΤ�
      # ľ�� mod.append_features(self) �ȤϽ񤱤ʤ�
      mod.__send__ :append_features, self
#@if (version >= "1.7.0")
      # mod.__send__ :included, self
#@end
    }
  end

self ���֤��ޤ���

--- attr(name[, assignable])

°���ɤ߹��ߤΤ���Υ��󥹥��󥹥᥽�å� name ��������ޤ���
name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ�������ͤϾ��
nil �Ǥ���

���Υ᥽�åɤ��������륢�������᥽�åɤ�����ϼ����̤�Ǥ���

  def name
    @name
  end

��ά��ǽ���� 2 ���� assignable �����ꤵ�줽���ͤ����Ǥ���
���ˤϡ�°���ν񤭤����ѥ᥽�å� name= ��Ʊ�����������ޤ���
��������ϼ����̤�Ǥ���

  def name=(val)
    @name = val
  end

--- attr_accessor(name,  ... )

°�� name ���Ф����ɤ߹��ߥ᥽�åɤȽ񤭤��ߥ᥽�åɤ�ξ����
������ޤ���name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ��������
�Ͼ�� nil �Ǥ���

���Υ᥽�åɤ���������᥽�åɤ�����ϰʲ����̤�Ǥ���

  def name
    @name
  end
  def name=(val)
    @name = val
  end

--- attr_reader(name,  ... )

°�� name ���ɤ߽Ф��᥽�åɤ�������ޤ���
name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ���
����ͤϾ�� nil �Ǥ���

���Υ᥽�åɤ���������᥽�åɤ�����ϰʲ����̤�Ǥ���

  def name
    @name
  end

--- attr_writer(name,  ... )

°�� name �ؤν񤭹��ߥ᥽�å� (name=) ��������ޤ���
name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ�������ͤϾ��
nil �Ǥ���

���Υ᥽�åɤ���������᥽�åɤ�����ϰʲ����̤�Ǥ���

  def name=(val)
    @name = val
  end

#@if (version >= "1.8.3")
--- class_variable_get(name)

���饹���⥸�塼����������Ƥ��륯�饹�ѿ� name ���ͤ��֤��ޤ���

name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ���

���饹�ѿ� name ���������Ƥ��ʤ���硢�㳰 [[c:NameError]]
��ȯ�����ޤ���

��:

  class Fred
    @@foo = 99
  end

  def Fred.foo
    class_variable_get(:@@foo)
  end

  p Fred.foo #=> 99
#@end

#@if (version >= "1.8.3")
--- class_variable_set(name, val)

���饹���⥸�塼��˥��饹�ѿ� name ��������ơ������ͤȤ���
val �򥻥åȤ��ޤ���val ���֤��ޤ���

name �� [[c:Symbol]] ��ʸ����ǻ��ꤷ�ޤ���

��:

  class Fred
    @@foo = 99
    def foo
      @@foo
    end
  end

  def Fred.foo(val)
    class_variable_set(:@@foo, val)
  end

  p Fred.foo(101)   # => 101
  p Fred.new.foo    # => 101
#@end

--- define_method(name, method)
--- define_method(name) { ... }

���󥹥��󥹥᥽�å� name ��������ޤ���
method �ˤ� [[c:Proc]]��[[c:Method]] ���뤤��
[[c:UnboundMethod]] �Τ����줫�Υ��󥹥��󥹤���ꤷ�ޤ���
���� method ��Ϳ�����Ȥ��Ϥ���򡢥֥�å��դ���
�ƤӤ������Ȥ��ϥ֥�å��� [[c:Proc]] ���������֥������Ȥ�
���줾���֤��ޤ���

��:

  class Foo
    def foo() p :foo end
    define_method(:bar, instance_method(:foo))
  end
  Foo.new.bar    # => :foo

�֥�å���Ϳ������硢Ruby 1.7 �ʹߤǤϡ���������᥽�å�
�μ¹Ի��˥֥�å����쥷���Х��饹�Υ��󥹥��󥹤ξ��
instance_eval ����ޤ���
���� Ruby 1.6 �Ǥϥ֥�å��ȥ᥽�åɤδ�Ϣ�Ť���Ԥ������ǡ�
�᥽�åɤμ¹Ի��ˤϥ֥�å����������Υ���ƥ����ȤΤޤޤ�
�¹Ԥ���ޤ������Ȥ��аʲ�����򻲾Ȥ��Ƥ���������

  class C
    def print_self
      p get_self
    end
  end
  # ���󥹥��󥹥᥽�å� get_self �������
  # ������ define_method �ϥץ饤�١��ȥ᥽�å�
  # �ʤΤ�ľ�ܤϸƤ٤ʤ���__send__ ��𤷤ƸƤ֡�
  C.__send__(:define_method, :get_self) { self }

  # 1.6 �ξ��
  C.new.print_self    #=> main
  # 1.7 �ξ��
  C.new.print_self    #=> #<C:0x4015b490>

--- extend_object(object)

[[m:Object#extend]] �μ��ΤǤ������֥������Ȥ�
�⥸�塼��ε�ǽ���ɲä��ޤ���Object#extend �ϡ�Ruby ��
�񤯤Ȱʲ��Τ褦������Ǥ��ޤ���
#@# ���餤 2002-03-16: ((<ruby 1.7 feature>)) �Ǥϡ�extend ��¹Ԥ���
#@# ������Ѥ�ä��Τ� each ������� reverse_each ��Ȥ�

  def extend(*modules)
    modules.each {|mod| mod.__send__ :extend_object, self }
  end

extend_object �Υǥե���Ȥμ����Ǥϡ�self ����������
����᥽�åɤ� object ���ðۥ᥽�åɤȤ����ɲä��ޤ���

object ���֤��ޤ���

#@if (version >= "1.8.0")
--- extended(class_or_module)

self ��¾�Υ��֥������� �� [[m:Object#extend]] ���줿�Ȥ���
�ƤФ�ޤ��������ˤ� extend ��Ԥä����֥������Ȥ��Ϥ���ޤ���


��:

  module Foo
    def self.extended(mod)
      p "#{mod} extend #{self}"
    end
  end

  Object.new.extend Foo

  # => "#<Object:0x401cbc3c> extend Foo"
#@end

--- include(module ... )

���ꤵ�줿�⥸�塼�������(�᥽�åɤ���������饹�ѿ�)���ɲä��ޤ���
self ���֤��ޤ���
include ��¿�ŷѾ���������Ѥ����� Mix-in ��¸����뤿��
�˻Ȥ��ޤ���

��:

  class C
    include FileTest
    include Math
  end

  p C.ancestors

  # => [C, Math, FileTest, Object, Kernel]

�⥸�塼��ε�ǽ�ɲäϡ����饹�ηѾ��ط��δ֤ˤ��Υ⥸�塼�뤬����
����뤳�ȤǼ¸�����Ƥ��ޤ������äơ��᥽�åɤ�õ���ʤɤϥ����ѡ�
���饹��ͥ�褵����ɲä����⥸�塼�뤫��õ������ޤ�(������
[[m:Module#ancestors]] �η�̤��᥽�å�õ���ν���Ǥ�)��

Ʊ���⥸�塼������ʾ� include ���������ܰʹߤ�̵�뤵��ޤ���

��:

  module Foo;                    end
  class  Bar;       include Foo; end
  class  Baz < Bar; include Foo; end  # <- ���� include ��̵��

  p Baz.ancestors  # => [Baz, Bar, Foo, Object, Kernel]


�⥸�塼��ηѾ��ط����۴Ĥ��Ƥ��ޤ��褦�� include ��Ԥ��ȡ��㳰
[[c:ArgumentError]] ��ȯ�����ޤ���

��:

  module Foo; end
  module Bar; include Foo; end
  module Foo; include Bar; end

  => -:3:in `append_features': cyclic include detected (ArgumentError)
          from -:3:in `include'
          from -:3

#@if (version >= "1.7.0")
������ʣ���Υ⥸�塼�����ꤷ����硢�Ǹ�
�ΰ�������ս�� include ��Ԥ��ޤ���
#@end

#@if (version >= "1.7.0")
--- included(class_or_module)

self �� include ���줿�Ȥ����оݤΥ��饹�ޤ��ϥ⥸�塼
�������˥��󥿥ץ꥿����ƤӽФ���ޤ���

��:

  module Foo
    def self.included(mod)
      p "#{mod} include #{self}"
    end
  end
  class Bar
    include Foo
  end
  # => "Bar include Foo"
#@end

--- method_added(name)

�᥽�å� name ���ɲä��줿���˥��󥿥ץ꥿����ƤӽФ���ޤ���
name �ˤ��ɲä��줿�᥽�åɤ�̾���� [[c:Symbol]] ���Ϥ���ޤ���

��:

  class Foo
    def Foo.method_added(name)
      puts "method \"#{name}\" was added"
    end

    def foo
    end
    define_method :bar, instance_method(:foo)
  end

  => method "foo" was added
     method "bar" was added

�ðۥ᥽�åɤ��ɲä��Ф���եå��ˤ�
[[m:Object#singleton_method_added]]
��Ȥ��ޤ���

#@if (version >= "1.7.0")
--- method_removed(name)

�᥽�åɤ� [[m:Module#remove_method]] �ˤ���
�����줿���˥��󥿥ץ꥿����ƤӽФ���ޤ���
name �ˤϺ�����줿�᥽�å�̾�� [[c:Symbol]] ���Ϥ���ޤ���

��:

  class Foo
    def Foo.method_removed(name)
      puts "method \"#{name}\" was removed"
    end

    def foo
    end
    remove_method :foo
  end

  => method "foo" was removed

�ðۥ᥽�åɤκ�����Ф���եå��ˤ�
[[m:Object#singleton_method_removed]]
��Ȥ��ޤ���
#@end

#@if (version >= "1.7.0")
--- method_undefined(name)

�᥽�åɤ� [[m:Module#undef_method]] �ޤ���
[[unknown:���饹���᥽�åɤ����/undef]]�ˤ��̤����ˤ��줿���˥��󥿥ץ꥿
����ƤӽФ���ޤ���
name �ˤ�̤����ˤ��줿�᥽�å�̾�� [[c:Symbol]] ���Ϥ���ޤ���

��:

  class Foo
    def Foo.method_undefined(name)
      puts "method \"#{name}\" was undefined"
    end

    def foo
    end
    def bar
    end
    undef_method :foo
    undef bar
  end

  => method "foo" was undefined
     method "bar" was undefined

�ðۥ᥽�åɤ�̤������Ф���եå��ˤ�
[[m:Object#singleton_method_undefined]]
��Ȥ��ޤ���
#@end

--- module_function([name ... ])

�����ʤ��ΤȤ��Ϻ��夳�Υ⥸�塼�������ǿ�������������᥽�å�
��[[unknown:Ruby�Ѹ콸/�⥸�塼��ؿ�]]�ˤ��ޤ����⥸�塼��ؿ��Ȥϥץ�
���١��ȥ᥽�åɤǤ����Ʊ���˥⥸�塼����ðۥ᥽�åɤǤ⤢��褦
�ʥ᥽�åɤǤ����㤨�� [[c:Math]] �⥸�塼����������Ƥ���᥽��
�ɤ��⥸�塼��ؿ��Ǥ���

������Ϳ����줿���ˤϰ����ˤ�äƻ��ꤵ�줿�᥽�åɤ�⥸�塼���
���ˤ��ޤ���

module_function �ϥ᥽�åɤˡ֥⥸�塼��ؿ��פȤ���°����Ĥ����
���åɤǤϤʤ����ץ饤�١��ȥ᥽�åɤȥ⥸�塼����ðۥ᥽�åɤ� 2
�Ĥ�Ʊ�����������᥽�åɤǤ������Τ��ᡢ�⥸�塼��ؿ���
[[unknown:���饹���᥽�åɤ����/alias]] �������

  module Foo
    def foo
      p "foo"
    end
    module_function :foo
    alias :bar :foo
  end
  Foo.foo           # => "foo"
  Foo.bar           # => undefined method `bar' for Foo:Module (NoMethodError)

�Ȥ��Ƥ⡢�ץ饤�١��ȥ᥽�å� foo ����̾���Ǥ�������ǡ�Foo ����
�ۥ᥽�å� Foo.foo ����̾���������ޤ��󡣤��Τ褦�ʤ��Ȥ򤷤������
�ϡ������̾��������Ƥ��餽�줾���⥸�塼��ؿ��Ȥ�����������
����ñ�Ǥ���


��:

  module Foo
    def foo
      p "foo"
    end
    alias :bar :foo
    module_function :foo, :bar
  end
  Foo.foo           # => "foo"
  Foo.bar           # => "foo"

self ���֤��ޤ���

--- private([name ... ])

�����ʤ��ΤȤ��Ϻ��夳�Υ��饹�ޤ��ϥ⥸�塼�������ǿ����������
���᥽�åɤ�ؿ������Ǥ����ƤӽФ���褦��(private)���ꤷ�ޤ���

������Ϳ����줿���ˤϰ����ˤ�äƻ��ꤵ�줿�᥽�åɤ� private ��
���ꤷ�ޤ���

��:

  class Foo
    def foo1() 1 end      # �ǥե���ȤǤ� public
    private               # �Ļ����� private ���ѹ�
    def foo2() 2 end      # foo2 �� private �᥽�å�
  end

  foo = Foo.new
  p foo.foo1          # => 1
  p foo.foo2          # => private method `foo2' called for #<Foo:0x401b7628> (NoMethodError)

self ���֤��ޤ���

--- protected([name ... ])

�����ʤ��ΤȤ��Ϻ��夳�Υ��饹�ޤ��ϥ⥸�塼�������ǿ����������
���᥽�åɤ� protected �����ꤷ�ޤ���protected �ȤϤ��Υ᥽�å�
���������Ƥ��륯�饹�ޤ��Ϥ��Υ��֥��饹���餷���ƤӽФ����Ȥ���
���ʤ��Ȥ�����̣�Ǥ���

������Ϳ����줿���ˤϰ����ˤ�äƻ��ꤵ�줿�᥽�åɤ� protected
�����ꤷ�ޤ���

self ���֤��ޤ���

--- public([name ... ])

�ʤ��ΤȤ��Ϻ��夳�Υ��饹�ޤ��ϥ⥸�塼�������ǿ����������
���᥽�åɤ�ɤ�ʷ����Ǥ�ƤӽФ���褦��(public)���ꤷ�ޤ���

������Ϳ����줿���ˤϰ����ˤ�äƻ��ꤵ�줿�᥽�åɤ� public ����
�ꤷ�ޤ���

��:

  def foo() 1 end
  p foo             # => 1
  # the toplevel default is private
  p self.foo        # => private method `foo' called for #<Object:0x401c83b0> (NoMethodError)

  def bar() 2 end
  public :bar       # visibility changed (all access allowed)
  p bar             # => 2
  p self.bar        # => 2

self ���֤��ޤ���

--- remove_class_variable(name)

�ǻ��ꤷ�����饹�ѿ�������������Υ��饹�ѿ������ꤵ
��Ƥ����ͤ��֤��ޤ����⤷���ꤷ�����饹�ѿ������Υ⥸�塼��(�ޤ�
�ϥ��饹)���������Ƥ��ʤ������㳰 [[c:NameError]] ��ȯ�����ޤ���

��:

  class Foo
    @@foo = 1
    remove_class_variable(:@@foo)   # => 1
    p @@foo   # => uninitialized class variable @@foo in Foo (NameError)
  end

[[m:Module#remove_const]],
[[m:Object#remove_instance_variable]]
�⻲�Ȥ��Ƥ���������

--- remove_const(name)

name �ǻ��ꤷ��������������������������ꤵ��Ƥ����ͤ�
�֤��ޤ������ꤷ����������Υ⥸�塼��(�ޤ��ϥ��饹)���������Ƥ�
�ʤ������㳰 [[c:NameError]] ��ȯ�����ޤ���

��:

  class Foo
    FOO = 1
    p remove_const(:FOO)    # => 1
    p FOO     # => uninitialized constant FOO at Foo (NameError)
  end

���ߤΤȤ����Ȥ߹��ߥ��饹/�⥸�塼������ꤷ�Ƥ��������
[[m:Kernel#autoload]] ����ꤷ��(�ޤ����ɤ��Ƥʤ�)�������
�Ǥ��ʤ��Ȥ������󤬤���ޤ���

��:

  class Object
    remove_const :Array
  end
  => -:2:in `remove_const': cannot remove Object::Array (NameError)

[[m:Module#remove_class_variable]],
[[m:Object#remove_instance_variable]]
�⻲�Ȥ��Ƥ���������

--- remove_method(name)
#@if (version >= "1.8.0")
--- remove_method(name[, name2, ...])
#@end

name �ǻ��ꤷ�����󥹥��󥹥᥽�åɤ�⥸�塼�뤫�������
�ޤ����⤷���ꤷ���᥽�åɤ��������Ƥ��ʤ��Ȥ��ˤ��㳰
[[c:NameError]] ��ȯ�����ޤ���

��:

  class Foo
    def foo() end
    remove_method(:foo)
  end

#@if (version >= "1.8.0")
ʣ���Υ᥽�åɤ���٤˻��ꤹ�뤳�Ȥ��Ǥ��ޤ���
#@end

self ���֤��ޤ���

[[m:Module#undef_method]] ����⻲�Ȥ��Ƥ���������

--- undef_method(name)
#@if (version >= "1.8.0")
--- undef_method(name[, name2, ...])
#@end

���󥹥��󥹤��Ф��� name �Ȥ����᥽�åɤ�ƤӽФ����Ȥ�ػ�
���ޤ����⤷���ꤷ���᥽�åɤ��������Ƥ��ʤ��Ȥ��ˤ��㳰
[[c:NameError]] ��ȯ�����ޤ���

#@if (version >= "1.8.0")
ʣ���Υ᥽�åɤ���٤˻��ꤹ�뤳�Ȥ��Ǥ��ޤ���
#@end

[[unknown:���饹���᥽�åɤ����/undef]] �Ȥΰ㤤�ϡ��᥽�å�̾��ʸ����ޤ���
#@if (version >= "1.7.3")
#@#see [ruby-dev:17894]
[[c:Symbol]] ��Ϳ�������Ǥ���
#@else
[[c:Symbol]] ��Ϳ���롢�᥽�å���Ǥ���ѤǤ��롢�������Ǥ���
#@end

�ޤ� [[m:Module#remove_method]] �Ȥϥ����ѡ����饹��������Ѿ�����
�뤫�ɤ����Ƕ��̤���ޤ����ʲ��ε�ư�򻲾Ȥ��Ƥ���������

  class A
    def ok() puts 'A' end
  end
  class B < A
    def ok() puts 'B' end
  end

  B.new.ok   # => B

  # undef_method �ξ��ϥ����ѡ����饹��Ʊ̾�Υ᥽�åɤ����äƤ�
  # ���θƤӽФ��ϥ��顼�ˤʤ�
  class B
    undef_method :ok
  end
  B.new.ok   # => NameError

  # remove_method �ξ��ϥ����ѡ����饹��Ʊ̾�Υ᥽�åɤ������
  # ���줬�ƤФ��
  class B
    remove_method :ok
  end
  B.new.ok   # => A

self ���֤��ޤ���
