= ()�ǲ�褹����

* ��綯�٤���

  Range ���֥������ȤΥ�ƥ��(���뤤���ϰϼ�)��ɽ�� (({..})),
  (({...})) �Ϸ�綯��(((<�黻�Ҽ�>))����)���㤤�Τǡ��ʲ��ϥ��顼�ˤ�
  ��ޤ�

      1..3.to_a

      => -:1: bad value for range (ArgumentError)

  �嵭�ϡ��ʲ��Τ褦�˲�ᤵ��Ƥ��ޤ���

      1..(3.to_a)

  �ϰϼ��ϳ�̤ǰϤ�Τ�̵��Ǥ���

      (1..3).to_a  # => [1, 2, 3]

* �᥽�åɸƽФΤ��ä���ά�ˤ�����

  ������³���ǡ��ʲ��ϰտ��̤�ˤϤʤ�ޤ���

    p (1..3).to_a
    => 1..3

  ����ϰʲ��Τ褦�˲�ᤵ��ޤ���

    (p (1..3)).to_a

  ������ϰϼ��˸¤餺���᥽�åɤθ�˳�̤�����г�̤���Ȥ���������
  �Ǥ���Ȳ�ᤵ��뤿��Ǥ����ʲ���Ʊ�ͤǤ���

    Time.gm (19+1)*100,2,11,12,34,56
    => -:1: parse error
           Time.gm (19+1)*100,2,11,12,34,56
                              ^

  ���Τ褦�ʾ��ϡ��������Τ��̤ǰϤ�ɬ�פ�����ޤ���
  ((-((<ruby 1.7 feature>)): version 1.7 �Ǥϡ��᥽�å�̾��
  ��̤δ֤˶��򤬤����(�����餯)�����̤��ư��򤹤�褦
  ���ѹ�����Ƥ��ޤ�-))

    p ((1..3).to_a)
    => [1, 2, 3]

    Time.gm((19+1)*100,2,11,12,34,56)
    => Fri Feb 11 12:34:56 UTC 2000

* �᥽�åɸƽФΤ��ä���ά�ˤ�����(2)

  �ʲ��Τ褦�ʥ᥽�åɸƤӽФ���������ޤ༰�� parse error �ˤʤ�ޤ���

    p obj = String.new "foo"
    => -:1: parse error

  �ʲ��Τ褦�ˤ���ɬ�פ�����ޤ���

    p obj = String.new("foo")
    p ((obj = String.new "foo"))

* and/or ��ͥ����
    p :a if true || false &&  false
    p :b if true or false and false
      #=> :a

  && �� || ����ͥ���̤��⤤�Τ��Ф���
  and �� or ��ͥ���̤�Ʊ���Ǥ��뤳�Ȥ���ա��嵭�ϰʲ��Τ褦�˲�ᤵ
  ��Ƥ��ޤ���

    p :a if true || (false &&  false)
    p :b if (true or false) and false

* ����ʸ
    p (true && true)    #=> true
    p (true and true)   #=> parse error
    p ((true and true)) #=> true

  true and false��ʸ�Ȳ�ᤵ���ΤǼ��Ȥ��Ʋ�ᤵ��뤿��γ�̤�p��
  �����򤯤����̤�ɬ�פˤʤ�ޤ���

  ((<ruby-list:24664>))�����׵᤹�륳��ƥ����ȤǤϡ��ʲ��Τ�Τ�ľ��
  �Ͻ񤱤ޤ���

  * and/or/not ��ޤ�ʸ
  * do .. end�Υ֥�å��ΤĤ����᥽�åɸƤӽФ�((-version 1.6�ʹߤǤϲ�������ޤ���-))
  * ���ä����ά�����᥽�åɸƤӽФ�(�¤ϥ饹�Ȥ�1�Ĥ������֤���)((-version 1.7�ʹߤǤϺǸ�ΰ����ˤ��̤��ά�����᥽�åɸƤӽФ��Ͻ񤱤ʤ��ʤäƤޤ�-))
  * alias
  * undef
  * if/unless/while/until/rescue������
  * ¿������

* do..end �� parse error
    (1..5).sort   do |a,b| b <=> a end.reverse # parse error
    (1..5).sort() do |a,b| b <=> a end.reverse # [1,2,3,4,5]

  ((-version 1.6 �ʹߡ����ԤǤ�parse error�ˤʤ�ʤ��褦��������ޤ���-))

* �ϥå������

    p {1=>2}    #=> parse error (�֥졼�����֥�å��Ȳ�ᤵ���)
    p ({1=>2})  #=> {1=>2}
    p (1=>2)    #=> {1=>2} (�������ϥå���Ȳ�ᤵ���)
    p (1=>2, 3) #=> parse error    (�֥졼�����ά�����ϥå��夬�����ˤ�����ΤϺǸ����)
    p (0,1=>2)  #=> 0
                    1=>2

* ��ʸ���ǻϤޤ�᥽�åɤθƤӽФ�

  ��ʸ���ǻϤޤ�᥽�åɤ� :: ��ˡ�ˤ��ƤӽФ�����쥷���Ф��ά��
  �ƸƤӽФ���硢���ΤޤޤǤ������Ƚ�Ǥ����Τ���դ�ɬ�ס�()�ˤ��
  �᥽�åɥ�����Ǥ��뤳�Ȥ��������뤳�Ȥǲ���Ǥ��롣

    obj = Object
    def obj.Foo
      p "ok"
    end
    def Bar
      p "ok"
    end

    obj.Foo     # => "ok"
    obj::Foo    # => uninitialized constant Foo::Bar (NameError)
    obj::Foo()  # => "ok"
    Bar         # => uninitialized constant Foo::Bar (NameError)
    Bar()       # => "ok"

* defined?

  defined? �ϥ᥽�åɤǤϤʤ���ʸ���ǡ��ʤΤǡ�

    defined? obj.doit && obj.doit

  �ϡ�

    defined? (obj.doit && obj.doit)

  ���������ʤ롣
