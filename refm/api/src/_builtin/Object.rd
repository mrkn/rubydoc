= Object

���ƤΥ��饹�Υ����ѡ����饹��
���֥������Ȥΰ���Ū�ʿ��񤤤�������ޤ���

== ���󥯥롼�ɤ��Ƥ���⥸�塼��:

* ((<Kernel>))

== �᥽�åɰ���:

=== ���󥹥��󥹥᥽�å�:

((<Object/__id__>))
((<Object/__send__>))
((<Object/class>))
((<Object/clone>))
((<Object/display>))
((<Object/dup>))
((<Object/eql?>))
((<Object/equal?>))
((<Object/extend>))
((<Object/freeze>))
((<Object/frozen?>))
((<Object/hash>))
((<Object/id>))
((<Object/inspect>))
((<Object/instance_eval>))
((<Object/instance_of?>))
((<Object/instance_variable_get>))
((<Object/instance_variable_set>))
((<Object/instance_variables>))
((<Object/is_a?>))
((<Object/kind_of?>))
((<Object/method>))
((<Object/method_missing>))
((<Object/methods>))
((<Object/methods>))
((<Object/nil?>))
((<Object/object_id>))
((<Object/private_methods>))
((<Object/private_methods>))
((<Object/protected_methods>))
((<Object/protected_methods>))
((<Object/public_methods>))
((<Object/public_methods>))
((<Object/respond_to?>))
((<Object/self===>))
((<Object/self==>))
((<Object/self=~>))
((<Object/send>))
((<Object/singleton_methods>))
((<Object/taint>))
((<Object/tainted?>))
((<Object/to_a>))
((<Object/to_ary>))
((<Object/to_hash>))
((<Object/to_int>))
((<Object/to_s>))
((<Object/to_str>))
((<Object/type>))
((<Object/untaint>))

=== �ץ饤�١��ȥ᥽�å�:

((<Object/initialize>))
((<Object/initialize_copy>))
((<Object/remove_instance_variable>))
((<Object/singleton_method_added>))
((<Object/singleton_method_removed>))
((<Object/singleton_method_undefined>))


== �᥽�å�:

--- self==(other)

    (({self})) �� ((|other|)) ����������п����֤��ޤ���
    �ǥե���ȤǤ� (({equal?})) ��Ʊ�����̤Ǥ���

    ���Υ᥽�åɤϳƥ��饹�������˹�碌�ƺ��������٤��Ǥ���

--- self=~(other)

    ���դ�����ɽ�����֥������Ȥ��֤�������ɽ���ޥå� (({obj =~ /RE/})) 
    �򥵥ݡ��Ȥ��뤿��Υ᥽�åɤǤ������ false ���֤��ޤ���

    ��������ˤ���㤨��

        nil =~ /re/

    ������� false ���֤��ޤ���

--- self===(other)

    ���Υ᥽�åɤ� ((<���湽¤/case>)) 
    ʸ�Ǥ���Ӥ��Ѥ����ޤ����ǥե���Ȥ�
    ((<Object#==|Object/==>)) ��Ʊ��Ư���򤷤ޤ�����
    ���ε�ư�ϥ��֥��饹�ǽ�°���Υ����å���¸����뤿��
    Ŭ�����������ޤ���

--- class
--- type        ((<obsolete>))

    �쥷���ФΥ��饹���֤��ޤ���

    ((<ruby 1.7 feature>)): type �ϡ�version 1.7 �Ǥϡ�((<obsolete>)) 
    �Ȥʤ�ޤ�����

--- clone
--- dup

    ���֥������Ȥ�ʣ������������֤��ޤ���

    (({clone})) �� (({freeze}))��(({taint}))���ðۥ᥽�åɤʤɤξ����
    �ޤ᤿������ʣ����(({dup})) �ϥ��֥������Ȥ����ƤΤߤ�ʣ����
    ���ޤ���

    (({clone})) �� (({dup})) �ϡ�����(shallow)�ץ��ԡ��Ǥ��뤳�Ȥ����
    ���Ƥ������������֥������ȼ��Ȥ�ʣ����������ǡ����֥������Ȥλؤ�
    �Ƥ�����(���Ȥ�����������Ǥʤ�)�ޤǤ�ʣ�����ޤ���
    ((-����(deep)���ԡ���ɬ�פʾ��ˤϡ�
    (({Marshal.load(Marshal.dump(obj)}))��
    �ȤäƤ���������������Marshal����ʤ����֥������Ȥ�
    �ޤޤ�Ƥ�����ˤϻȤ��ޤ���-))

    �ޤ�ʣ���������֥������Ȥ��Ф���

      obj.equal?(obj.clone)

    �ϰ��̤���Ω���ޤ���
    ((-version 1.6 �Ǥϡ�0.equal?(0.clone) ����Ω���Ƥ��ޤ��ޤ�-))��

      obj == obj.clone

    ��¿���ξ�����Ω���ޤ���

    (({true})), (({false})), (({nil})), ((<Symbol>)) ���֥������Ȥʤ�
    ��ʣ�����褦�Ȥ�����㳰 ((<TypeError>)) ��ȯ�����ޤ���

    ((<ruby 1.7 feature>)):
    version 1.7 �Ǥϡ�((<Numeric>)) ���֥������Ȥʤ� immutable(������
    ��)�Ǥ��륪�֥������Ȥ�ʣ�����褦�Ȥ�����㳰 ((<TypeError>)) ��ȯ
    �����ޤ���

--- display(out = $stdout)

    ���֥������Ȥ� ((|out|)) �˽��Ϥ��ޤ����ʲ��Τ褦���������Ƥ��ޤ���

      class Object
        def display(out=$stdout)
          out.print to_s
          nil
        end
      end

    (({nil})) ���֤��ޤ���

--- eql?(other)

    ��ĤΥ��֥������Ȥ���������п����֤��ޤ���((<Hash>)) ����ĤΥ���
    �����������ɤ�����Ƚ�ꤹ��Τ˻Ȥ��ޤ���

    ���Υ᥽�åɤ������������ˤ� ((<Object#hash|Object/hash>)) �᥽��
    �ɤ��������ʤ���Фʤ�ޤ���

    (({eql?})) �Υǥե���Ȥ������ (({equal?})) ��Ʊ�������֥�������
    ��Ʊ����Ƚ��ˤʤäƤ��ޤ���

--- equal?(other)

    (({other})) �� (({self})) ���Ȥλ��������֤��ޤ���

    ���Υ᥽�åɤ��������ƤϤ����ޤ���

--- extend(module ... )

    �����ǻ��ꤷ���⥸�塼��Υ��󥹥��󥹥᥽�åɤ� (({self})) ���ð�
    �᥽�åɤȤ����ɲä��ޤ���(({self})) ���֤��ޤ���

    ((<Module/include>)) �ϡ����饹(�Υ��󥹥���)�˵�ǽ���ɲä��ޤ�
    ����extend �ϡ���������Υ��֥������Ȥ����˥⥸�塼��ε�ǽ���ɲ�
    �������Ȥ��˻��Ѥ��ޤ���

        module Foo
          def a
            'ok'
          end
        end

        obj = Object.new
        obj.extend Foo
        p obj.a         #=> "ok"

    (({extend})) �ε�ǽ�ϡ����ðۥ��饹���Ф��� ((<Module/include>))��
    �ȸ����ؤ��뤳�Ȥ�Ǥ��ޤ���

    ((<ruby 1.7 feature>)): ������ʣ���Υ⥸�塼�����ꤷ����硢�Ǹ�
    �ΰ�������ս�� extend ��Ԥ��ޤ���

--- freeze

    ���֥������Ȥ����Ƥ��ѹ���ػߤ��ޤ���(({self})) ���֤��ޤ���

    �ե꡼�����줿���֥������Ȥ��ѹ����㳰 ((<TypeError>)) ��ȯ�������ޤ���

--- frozen?

    ���֥������Ȥ����Ƥ��ѹ����ػߤ���Ƥ���Ȥ��˿����֤��ޤ���

--- hash

    ���֥������ȤΥϥå����ͤ��֤��ޤ���((<Hash>)) ���饹�ǥ��֥�����
    �Ȥ��Ǽ����Τ��Ѥ����Ƥ��ޤ���

    (({A.eql?(B)})) ����Ω�������ɬ�� (({A.hash == B.hash})) ����Ω��
    �ʤ���Ф����ޤ���(({eql?}))�������������ˤ�ɬ����������碌
    �ƺ�������Ƥ���������

    �ǥե���ȤǤϡ�((<Object#__id__|Object/__id__>)) ��Ʊ���ͤ��֤��ޤ���
    ��������((<Fixnum>)), ((<Symbol>)), ((<String>)) �������ȹ��ߤΥϥ�
    ����ؿ������Ѥ���ޤ�(������Ѥ��뤳�ȤϤǤ��ޤ���)��

    hash ������������ϡ����ͤ�ʬ�ۤ���Ǥ�դ��������֤��褦�ˤ���
    ����

--- id                  ((<obsolete>))
--- __id__
--- object_id         ((<ruby 1.7 feature>))

    �ƥ��֥������Ȥ��Ф��ư�դ��������֤��ޤ������륪�֥������Ȥ��Ф�
    �ƤɤΤ褦��������������Ƥ��뤫������Ǥ���

    (({id})) �᥽�åɤκ��������������̾ (({__id__})) ���Ѱդ����
    ���ꡢ�饤�֥��Ǥϸ�Ԥ����Ѥ��侩����ޤ����ޤ� (({__id__})) ��
    ��������٤��ǤϤ���ޤ���

    ((<ruby 1.7 feature>)): id �ϡ�version 1.7 �Ǥϡ�((<obsolete>)) 
    �Ȥʤ�ޤ�����

--- inspect

    ���֥������Ȥ�ʹ֤��ɤ��������Ѵ�����ʸ������֤��ޤ���

    �Ȥ߹��ߴؿ� ((<�Ȥ߹��ߴؿ�/p>)) �ϡ����Υ᥽�åɤη�̤���Ѥ���
    ���֥������Ȥ�ɽ�����ޤ���

--- instance_eval(expr, [fname, [lineno=1]])
--- instance_eval {|obj| ... }

    ���֥������ȤΥ���ƥ����Ȥ�ʸ���� ((|expr|)) ��ɾ�����Ƥ��η�̤�
    �֤��ޤ���

    ((|fname|))��((|lineno|)) ��Ϳ����줿���ϡ��ե����� ((|fname|))��
    ���ֹ� ((|lineno|)) �ˤ���ʸ���󤬤��뤫�Τ褦�˥���ѥ��뤵�졢��
    ���å��ȥ졼��ɽ���ʤɤΥե�����̾�����ֹ�򺹤��ؤ��뤳�Ȥ��Ǥ���
    ����

    �֥�å���Ϳ����줿���ˤϤ��Υ֥�å��򥪥֥������ȤΥ���ƥ���
    �Ȥ�ɾ�����Ƥ��η�̤��֤��ޤ����֥�å��ΰ��� ((|obj|)) �ˤ� 
    (({self})) ���Ϥ���ޤ���

    ���֥������ȤΥ���ƥ����Ȥ�ɾ������Ȥ� (({self})) �򤽤Υ��֥���
    ���Ȥˤ��Ƽ¹Ԥ���Ȥ������ȤǤ����ޤ���ʸ���󡿥֥�å���ǥ᥽��
    �ɤ��������� (({self})) ���ðۥ᥽�åɤ��������ޤ���

    ���������������ѿ������� (({instance_eval})) �γ�¦�Υ������פ�
    ��ͭ���ޤ���

    ((*��*)): �᥽�å��������� instance_eval �Υ֥�å�����Ѥ��ƥ�
    ���å������Ԥ��ȡ�"nested method definition" �ȥ���ѥ��륨�顼
    �ˤʤ�ޤ�������ϡ����ߤ� ruby �ѡ��������¤Ǥ���

        def foo
           instance_eval {
             def bar            # <- �ͥ��Ȥ����᥽�å������Ƚ�Ǥ����
               "bar"
             end
           }
        end

        # => -:4: nested method definition

    ʸ������Ϥ�������Ȥ��С��������¤ϲ���Ǥ��ޤ���

        def foo
           instance_eval %Q{
             def bar
               "bar"
             end
           }
        end

        # foo ��¹Ԥ���ȴؿ�(��̩�ˤ� foo �Υ쥷���ФΥ᥽�å�) bar 
        # ���������
        foo
        p bar
        # => "bar"

    ((<ruby 1.7 feature>)): �᥽�å�����Υͥ��Ȥ˴ؤ��ơ��������¤Ϥ�
    ���ʤäƤ��ޤ�������ˡ�version 1.7 �ʹ� instance_eval ��Ȥ�ʤ�
    �Ƥ�ʲ���Ʊ�����Ȥ��Ǥ��ޤ�(��̩�ˤϰۤʤ�ޤ���
    ((<���饹���᥽�åɤ����/�᥽�å�����Υͥ���>)) �򻲾Ȥ��Ƥ�����
    ��)��

        def foo
           def bar
             "bar"
           end
        end

        foo
        p bar
        # => "bar"

    ((<Module#module_eval|Module/module_eval>)),
    ((<Module#class_eval|Module/class_eval>)) �⻲�Ȥ��Ƥ���������

--- instance_of?(klass)

    (({self})) �����饹 ((|klass|)) ��ľ�ܤΥ��󥹥��󥹤Ǥ������
    �����֤��ޤ���

    (({obj.instance_of?(c)})) ����Ω������ˤϡ����
    (({obj.kind_of?(c)})) ����Ω���ޤ���

    ((<Object/kind_of?>)) �⻲�Ȥ��Ƥ���������

--- instance_variable_get(var)

    ((<ruby 1.8 feature>))

    ���֥������ȤΥ��󥹥����ѿ����ͤ���������֤��ޤ���

    ((|var|)) �ˤϥ��󥹥����ѿ�̾��ʸ���� ((<Symbol>)) �ǻ��ꤷ��
    ����

    ���󥹥����ѿ����������Ƥ��ʤ���� (({nil})) ���֤��ޤ���

        class Foo
          def initialize
            @foo = 1
          end
        end

        obj = Foo.new
        p obj.instance_variable_get("@foo")     # => 1
        p obj.instance_variable_get(:@foo)      # => 1
        p obj.instance_variable_get(:@bar)      # => nil

--- instance_variable_set(var, val)

    ((<ruby 1.8 feature>))

    ���֥������ȤΥ��󥹥����ѿ����� ((|val|)) �����ꤷ�� ((|val|)) 
    ���֤��ޤ���


    ((|var|)) �ˤϥ��󥹥����ѿ�̾��ʸ���� ((<Symbol>)) �ǻ��ꤷ��
    ����

    ���󥹥����ѿ����������Ƥ��ʤ���п������������ޤ���

        obj = Object.new
        p obj.instance_variable_set("@foo", 1)  # => 1
        p obj.instance_variable_set(:@foo, 2)   # => 2
        p obj.instance_variable_get(:@foo)      # => 2

--- instance_variables

    ���֥������ȤΥ��󥹥����ѿ�̾��ʸ���������Ȥ����֤��ޤ���

        obj = Object.new
        obj.instance_eval { @foo, @bar = nil }
        p obj.instance_variables

        # => ["@foo", "@bar"]

    ((<�Ȥ߹��ߴؿ�/local_variables>)),
    ((<�Ȥ߹��ߴؿ�/global_variables>)),
    ((<Module/Module.constants>)),
    ((<Module#constants|Module/constants>)),
    ((<Module#class_variables|Module/class_variables>))
    �⻲�Ȥ��Ƥ���������

--- is_a?(mod)
--- kind_of?(mod)

    (({self})) �������饹 ((|mod|)) �Ȥ��Υ��֥��饹�������
    �⥸�塼�� ((|mod|)) �򥤥󥯥롼�ɤ������饹�Ȥ��Υ��֥��饹��
    �Τ����줫�Υ��󥹥��󥹤Ǥ���Ȥ������֤��ޤ���

        module M
        end
        class C < Object
          include M
        end
        class S < C
        end

        obj = S.new
        p obj.is_a? S       # true
        p obj.is_a? M       # true
        p obj.is_a? C       # true
        p obj.is_a? Object  # true
        p obj.is_a? Hash    # false

    ((<Object/instance_of?>)), ((<Module#===|Module/===>)) �⻲�Ȥ��Ƥ���������

--- method(name)

    (({self})) �Υ᥽�å� ((|name|)) �򥪥֥������Ȳ����� 
    ((<Method>)) ���֥������Ȥ��֤��ޤ���((|name|)) �� 
    ((<Symbol>)) �ޤ���ʸ����ǻ��ꤷ�ޤ���

    ((<Module#instance_method|Module/instance_method>)) �⻲�Ȥ��Ƥ���������

--- method_missing(name, args, ... )

    �ƤӤ����줿�᥽�åɤ��������Ƥ��ʤ��ä�����Ruby �����Υ᥽�å�
    ��ƤӽФ��ޤ���

    �ƤӽФ��˼��Ԥ����᥽�åɤ�̾�� (((<Symbol>))) �� ((|name|)) ��
    ���λ��ΰ����� ((|arg ...|)) ���Ϥ���ޤ���

    �ǥե���ȤǤϤ��Υ᥽�åɤ��㳰 ((<NameError>)) ��ȯ�������ޤ���

--- methods
--- public_methods
--- private_methods
--- protected_methods
--- methods([inherited_too])            ((<ruby 1.8 feature>))
--- public_methods([inherited_too])     ((<ruby 1.8 feature>))
--- private_methods([inherited_too])    ((<ruby 1.8 feature>))
--- protected_methods([inherited_too])  ((<ruby 1.8 feature>))

    ���Υ��֥������Ȥ�����Ǥ��� public/private/protected �᥽�å�̾��
    ������ʸ�����������֤��ޤ���

    methods �ϡ�instance_methods ��Ʊ���Ǥ���
    ((<ruby 1.7 feature>)): methods �ϡ�public ����� protected �᥽��
    ��̾�ΰ�����������֤��ޤ���

    ((<ruby 1.8 feature>)): ����������Ǥ���褦�ˤʤ�ޤ�����
    ((|inherited_too|)) �����Ǥ���С������ѡ����饹��������줿�᥽��
    �ɤ�õ�����ޤ����ǥե���ȤϿ��Ǥ���

    methods(false) �ϡ�((<Object/singleton_methods>))(false) ��Ʊ����
    ����

    ��:

        class Foo
          private;   def private_foo()   end
          protected; def protected_foo() end
          public;    def public_foo()    end
        end

        class Bar < Foo
        end

        p Bar.new.methods           - Object.new.methods
        p Bar.new.public_methods    - Object.new.public_methods
        p Bar.new.private_methods   - Object.new.private_methods
        p Bar.new.protected_methods - Object.new.protected_methods
        => ["public_foo"]   # version 1.7 �ʹߡ�["protected_foo", "public_foo"]
           ["public_foo"]
           ["private_foo"]
           ["protected_foo"]

    ((<Module#instance_methods|Module/instance_methods>)),
    ((<Module#public_instance_methods|Module/public_instance_methods>)),
    ((<Module#private_instance_methods|Module/private_instance_methods>)),
    ((<Module#protected_instance_methods|Module/protected_instance_methods>))
    �⻲�Ȥ��Ƥ���������

    ((<Object#singleton_methods|Object/singleton_methods>))
    �⻲�Ȥ��Ƥ���������

--- nil?

    �쥷���Ф� (({nil})) �Ǥ���п����֤��ޤ���

--- respond_to?(name[, priv=false])

    ���֥������Ȥ� public �᥽�å� ((|name|)) ����ĤȤ������֤��ޤ���

    ((|name|)) �� ((<Symbol>)) �ޤ���ʸ����Ǥ���((|priv|)) �����ΤȤ�
    �� private �᥽�åɤ��Ф��Ƥ⿿���֤��ޤ���

--- send(name[, args ... ])
--- send(name[, args ... ]) { .... }
--- __send__(name[, args ... ])
--- __send__(name[, args ... ]) { ... }

    ���֥������ȤΥ᥽�å� ((|name|)) �򡢰����� ((|args|)) ��
    �Ϥ��ƸƤӽФ����᥽�åɤμ¹Է�̤��֤��ޤ���

    �֥�å��դ��ǸƤФ줿�Ȥ��ϥ֥�å��⤽�Τޤް����Ϥ��ޤ����᥽��
    ��̾ ((|name|)) ��ʸ����((<Symbol>)) �Ǥ���

    (({send})) ����������줿������������̾ (({__send__})) ��
    �Ѱդ���Ƥ��ꡢ�饤�֥��ǤϤ������Ȥ��٤��Ǥ����ޤ�
    (({__send__})) �Ϻ�������٤��ǤϤ���ޤ���

    (({send})), (({__send__})) �ϡ�((<���饹���᥽�åɤ����/�ƤӽФ�����>))
    �ˤ�����餺Ǥ�դΥ᥽�åɤ�ƤӽФ��ޤ���

    ((<ruby 1.9 feature>)):
    ((<���饹���᥽�åɤ����/�ƤӽФ�����>))��(({send})), (({__send__}))�ˤ�
    �ƶ�����褦�ˤʤꡢ�쥷���Ф���ꤷ���ƤӽФ��Ǥ�private�᥽�åɤ�
    �ƤӽФ��ʤ��ʤ�ޤ�����
    private�᥽�åɤ�ƤӽФ�ɬ�פ��������((<Object/instance_eval>))��
    ���Ѥ��Ƥ���������

--- singleton_methods
--- singleton_methods([inherited_too])  ((<ruby 1.7 feature>))

    ���Υ��֥������Ȥ��Ф����������Ƥ����ðۥ᥽�å�̾(public�᥽��
    �ɤΤ�)�ΰ�����ʸ�����������֤��ޤ���

    ((<ruby 1.7 feature>)): ����������Ǥ���褦�ˤʤ�ޤ�����
    ((|inherited_too|)) �����Ǥ����(1.8.0�ޤǤΥǥե���Ȥϵ���1.8.1 
    �ʹߤΥǥե�����ͤϿ�)�������ѡ����饹��������줿�᥽�åɤ��о�
    �ˤʤ�ޤ���

    ((<ruby 1.8 feature>)): public ���뤤�� protected °�����ðۥ᥽�å�
    ̾�ΰ������֤��褦�ˤʤ�ޤ������ä� singleton_methods(false) �ϡ�
    ((<Object/methods>))(false) ��Ʊ���Ǥ���

        obj = Object.new
        module Foo
          private;   def private_foo()   end
          protected; def protected_foo() end
          public;    def public_foo()    end
        end

        class <<obj
          include Foo
          private;   def private_bar()   end
          protected; def protected_bar() end
          public;    def public_bar()    end
        end
        p obj.singleton_methods
        p obj.singleton_methods(false)

        # => ["public_foo", "public_bar", "protected_foo", "protected_bar"]
             ["public_bar", "protected_bar"]

    ���뤤�ϡ�((<Object#extend|Object/extend>)) ���ðۥ��饹���Ф��륤
    �󥯥롼�ɤʤΤǰʲ���Ʊ�ͤˤʤ�ޤ���

        obj = Object.new

        module Foo
          private;   def private_foo()   end
          protected; def protected_foo() end
          public;    def public_foo()    end
        end

        obj.extend(Foo)
        p obj.singleton_methods
        p obj.singleton_methods(false)

        # => ["public_foo", "protected_foo"]
             []

    ���饹�᥽�å�(���饹���֥������Ȥ��ðۥ᥽�å�)�˴ؤ��Ƥϰ�������
    �ΤȤ��������ѡ����饹�Υ��饹�᥽�åɤ��оݤˤʤ�ޤ���

        class Foo
          def Foo.foo
          end
        end

        class Bar < Foo
          def Bar.bar
          end
        end

        p Bar.singleton_methods        #=> ["bar", "foo"]
        p Bar.singleton_methods(false) #=> ["bar"]

--- taint

    ���֥������ȤΡֱ����ޡ����פ򥻥åȤ��ޤ���(({self})) ���֤��ޤ���

    ���֥������Ȥα����˴ؤ��Ƥ�((<�������ƥ���ǥ�>))�򻲾Ȥ��Ƥ���������

--- tainted?

    ���֥������ȤΡֱ����ޡ����פ����åȤ���Ƥ���������֤��ޤ���

    ���֥������Ȥα����˴ؤ��Ƥ�((<�������ƥ���ǥ�>))�򻲾Ȥ��Ƥ���������

--- to_a        ((<obsolete>))

    ���֥������Ȥ�������Ѵ����Ƥ���������֤��ޤ���

    ���̤�������Ѵ��Ǥ��ʤ����֥������Ȥϡ����ȤΤߤ�ޤ�Ĺ�� 1 ����
    ����Ѵ�����ޤ�

    (((<ruby 1.7 feature>)): Object �Τ��Υ᥽�åɤϾ���ʤ��ʤ뤫�⤷
    ��ޤ���1.7 �ǤϷٹ𤬽Фޤ�)��

    ��
        p( {'a'=>1}.to_a )  # [["a", 1]]
        p ['array'].to_a    # ["array"]
        p 1.to_a            # [1]       (warning: default `to_a' will be obsolete)
        p 'str'.to_a        # ["str"]

    ((<ruby 1.8 feature>)):
    ¿�������α��դ� (({*})) ��ȼ�ä����֥������Ȥ����줿��硢
    ���Υ��֥������Ȥ� to_a ��������Ƥ���Ф��η�̤����Ѥ���ޤ���
    to_a ���������Ƥ��ʤ����ϡ����դ����Ȥ�ޤ�Ĺ�� 1 �������
    �Ѵ����줿����������Ԥ��ޤ���
    ((-���餤 2003-10-07: �н�: ��ñ�˸����С�(({Array(����)})) ��Ʊ��
    ��§�Ǳ��դ��Ѵ�����롣�����դ�ε��Ҥ��������ʤ�������-))

        class Foo
          def to_a
            [1, 2, 3]
          end
        end

        a, b, c = *Foo.new
        p [a, b, c]

        # => [1, 2, 3]

--- to_ary

    ���֥������Ȥ�������Ѵ����Ƥ���������֤��ޤ���

    ���֥������Ȥ�����ؤΰ��ۤ��Ѵ���ɬ�פʤȤ��������ǸƤФ�ޤ���
    ((-to_ary, to_hash, to_int, to_str �ϡ��������ص��夳�Υڡ����˽�
    ���Ƥޤ������ǥե���ȤǤ� (({Object})) �Υ᥽�åɤȤ��Ƥ��������
    �Ƥ��ޤ���-))

    ���Υ᥽�åɤ�������줿���֥������Ȥ�ñ�Ȥ�¿�������α��դ�
    ���줿���ˤ�ƤФ�ޤ���

        class Foo
          def to_ary
            [1, 2, 3]
          end
        end

        a, b, c = Foo.new
        p [a, b, c]

        => [1, 2, 3]

--- to_hash

    ���֥������ȤΥϥå���ؤΰ��ۤ��Ѵ���ɬ�פʤȤ��������ǸƤФ�ޤ���

--- to_int

    ���֥������Ȥ������ؤΰ��ۤ��Ѵ���ɬ�פʤȤ��������ǸƤФ�ޤ���

--- to_s

    ���֥������Ȥ�ʸ����ɽ�����֤��ޤ���

    ((<�Ȥ߹��ߴؿ�/print>)) �� ((<�Ȥ߹��ߴؿ�/sprintf>)) ��ʸ����ʳ���
    ���֥������Ȥ��������Ϥ��줿��礳�Υ᥽�åɤ�Ȥä�ʸ������Ѵ���
    �ޤ���

--- to_str

    ���֥������Ȥ�ʸ����ؤΰ��ۤ��Ѵ���ɬ�פʤȤ��˸ƤФ�ޤ���

--- untaint

    ���֥������ȤΡֱ����ޡ����פ�������ޤ���(({self})) ���֤��ޤ���

    �����ޡ�������������Ȥˤ������ϥץ���ޤ���Ǥ���餦ɬ�פ�
    ����ޤ���

    �������ƥ���٥뤬3�ʾ�ξ����㳰 ((<SecurityError>)) ��
    ȯ�����ޤ���

    ���֥������Ȥα����˴ؤ��Ƥ�((<�������ƥ���ǥ�>))�򻲾Ȥ��Ƥ���������

== �ץ饤�١��ȥ᥽�å�:

--- initialize

    �桼��������饹�Υ��֥������Ƚ�����᥽�åɡ�

    ���Υ᥽�åɤ� ((<Class#new|Class/new>)) ���鿷�����������줿����
    �������Ȥν�����Τ���˸ƤӽФ���ޤ����ǥե���Ȥ�ư��ǤϤʤˤ�
    ���ޤ��󡣥��֥��饹�ǤϤ��Υ᥽�åɤ�ɬ�פ˱����ƺ��������뤳��
    �����Ԥ���Ƥ��ޤ���(({initialize})) �ˤ� 
    ((<Class#new|Class/new>)) ��Ϳ����줿���������Τޤ��Ϥ���ޤ���

    (({initialize})) �Ȥ���̾���Υ᥽�åɤϼ�ưŪ�� private �����ꤵ��
    �ޤ���

--- initialize_copy(obj)

    ((<ruby 1.8 feature>))

    (��ĥ�饤�֥��ˤ��)�桼��������饹�Υ��֥������ȥ��ԡ�(clone,
    dup)�ν�����᥽�åɡ�

    ���Υ᥽�åɤ� (({self})) �� ((|obj|)) �����Ƥ��֤������ޤ�������
    ����self �Υ��󥹥����ѿ����ðۥ᥽�åɤ��Ѳ����ޤ���

    �쥷���Ф� (({freeze})) ����Ƥ��뤫��((|obj|)) �Υ��饹���쥷����
    �Υ��饹�Ȱۤʤ�����㳰 ((<TypeError>)) ��ȯ�����ޤ���

    �ǥե���ȤǤ�(Object#initialize_copy ��)���嵭�� freeze �����å�����
    �ӷ��Υ����å���Ԥ� (({self})) ���֤������Υ᥽�åɤǤ���

    obj.((<Object/dup>)) �ϡ������������������֥������Ȥ��Ф��� 
    initialize_copy ��Ƥ�

        obj2 = obj.class.allocate
        obj2.initialize_copy(obj)

    obj2 ���Ф��Ƥ���� obj �α������֡����󥹥����ѿ����ե����ʥ饤
    ���򥳥ԡ����뤳�Ȥ�ʣ������ޤ���((<Object/clone>)) �ϡ������
    �ðۥ᥽�åɤΥ��ԡ���Ԥ��ޤ���

        obj = Object.new
        class <<obj
          attr_accessor :foo
          def bar
            :bar
          end
        end

        def check(obj)
          puts "instance variables: #{obj.inspect}"
          puts "tainted?: #{obj.tainted?}"
          print "singleton methods: "
          begin
            p obj.bar
          rescue NameError
            p $!
          end
        end

        obj.foo = 1
        obj.taint

        check Object.new.send(:initialize_copy, obj)
                # => instance variables: #<Object:0x4019c9d4>
                #    tainted?: false
                #    singleton methods: #<NoMethodError: ...>
        check obj.dup
                # => instance variables: #<Object:0x4019c9c0 @foo=1>
                #    tainted?: true
                #    singleton methods: #<NoMethodError: ...>
        check obj.clone
                # => instance variables: #<Object:0x4019c880 @foo=1>
                #    tainted?: true
                #    singleton methods: :bar

    initialize_copy �ϡ�Ruby ���󥿥ץ�󥿤��Τ����ʤ�����򥳥ԡ����뤿
    ��˻���(���)����ޤ����㤨�� C ����ǥ��饹����������硢����
    �򥤥󥹥����ѿ����ݻ������ʤ���礬����ޤ������������ä�������
    ��� initialize_copy �ǥ��ԡ�����褦������Ƥ������Ȥǡ�dup �� clone 
    ����������ɬ�פ��ʤ��ʤ�ޤ���

    (({initialize_copy})) �Ȥ���̾���Υ᥽�åɤϼ�ưŪ�� private ����
    �ꤵ��ޤ���

--- remove_instance_variable(name)

    ���֥������Ȥ��饤�󥹥����ѿ� ((|name|)) ������������Υ���
    �����ѿ������ꤵ��Ƥ����ͤ��֤��ޤ���((|name|)) �� ((<Symbol>)) 
    ��ʸ����Ǥ���

    ���֥������Ȥ����󥹥����ѿ� ((|name|)) ������ʤ������㳰 
    ((<NameError>)) ��ȯ�����ޤ���

        class Foo
          def foo
            @foo = 1
            p remove_instance_variable :@foo # => 1
            p remove_instance_variable :@foo # => instance variable @foo not defined (NameError)
          end
        end
        Foo.new.foo

    ((<Module#remove_class_variable|Module/remove_class_variable>)),
    ((<Module#remove_const|Module/remove_const>)) 
    �⻲�Ȥ��Ƥ���������

--- singleton_method_added(name)

    �ðۥ᥽�åɤ��ɲä��줿���˥��󥿥ץ꥿����ƤӽФ���ޤ���
    ((|name|)) �ˤ��ɲä��줿�᥽�å�̾�� ((<Symbol>)) ���Ϥ���ޤ���

        class Foo
          def singleton_method_added(name)
            puts "singleton method \"#{name}\" was added"
          end
        end

        obj = Foo.new
        def obj.foo
        end

        => singleton method "foo" was added

    �̾�Υ᥽�åɤ��ɲä��Ф���եå��ˤ�
    ((<Module#method_added|Module/method_added>))��Ȥ��ޤ���

--- singleton_method_removed(name)

    ((<ruby 1.7 feature>))

    �ðۥ᥽�åɤ� ((<Module#remove_method|Module/remove_method>)) ��
    ��������줿���˥��󥿥ץ꥿����ƤӽФ���ޤ���
    ((|name|)) �ˤϺ�����줿�᥽�å�̾�� ((<Symbol>)) ���Ϥ���ޤ���

        class Foo
          def singleton_method_removed(name)
            puts "singleton method \"#{name}\" was removed"
          end
        end

        obj = Foo.new
        def obj.foo
        end

        class << obj
          remove_method :foo
        end

        => singleton method "foo" was removed

    �̾�Υ᥽�åɤκ�����Ф���եå��ˤ�
    ((<Module#method_removed|Module/method_removed>))��Ȥ��ޤ���

--- singleton_method_undefined(name)

    ((<ruby 1.7 feature>))

    �ðۥ᥽�åɤ� ((<Module#undef_method|Module/undef_method>)) �ޤ��� 
    ((<���饹���᥽�åɤ����/undef>)) �ˤ��̤����ˤ��줿���˥��󥿥ץ꥿
    ����ƤӽФ���ޤ���
    ((|name|)) �ˤ�̤����ˤ��줿�᥽�å�̾�� ((<Symbol>)) ���Ϥ���ޤ���

        class Foo
          def singleton_method_undefined(name)
            puts "singleton method \"#{name}\" was undefined"
          end
        end

        obj = Foo.new
        def obj.foo
        end
        def obj.bar
        end

        class << obj
          undef_method :foo
        end
        obj.instance_eval {undef bar}

        => singleton method "foo" was undefined
           singleton method "bar" was undefined

    �̾�Υ᥽�åɤ�̤������Ф���եå��ˤ� 
    ((<Module#method_undefined|Module/method_undefined>)) ��Ȥ��ޤ���
