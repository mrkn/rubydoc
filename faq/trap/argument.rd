= ����

* �᥽�åɸƤӽФ��� �����Ÿ�������ѿ�����Ϥ�

    def sum(a,b,c)
      print a+b+c,"\n"
    end

    a = [1,2,3]
    sum(*a) # -> sum(1,2,3) -> 6

* Ʊ�ͤ�Proc��֥�å��Ȥ����Ϥ��롣

    def foo
      yield(2)
    end

    pr = proc {|i| i*i}
    foo(&pr) #=> 4


* �դ˲������ǤޤȤ�Ƽ�����ä���Proc�Ȥ��Ƽ�����ä���Ǥ��롣

    def foo(*arg, &block)
      block.call arg[1]
    end

    foo(0,1,2) do |i|
      puts i #=> 1
    end

    def test(*a)
      @b = [a]  #�������ϡ�@b = a
    end

    def a = (b)  #�������ϡ�a=(b)
      @a = b
    end

* super��super(...)�ΰ㤤��
    class Foo
      def initialize
      end
    end

    class Bar < Foo
      def initialize(a)
        super
      end
    end

    obj = Bar.new(1)

    => -:8:in `initialize': wrong # of arguments(1 for 0) (ArgumentError)

  ��ΤϥХ���ޤ��������ʤ��� super �Ͼ����Ǥ� super(a) �ȸ��ʤ���
  �뤫��Ǥ����ƤӽФ����᥽�åɤȰۤʤ�����ǸƤӽФ��ˤϰ�����������
  �ޤ���

    class Foo
      def initialize
      end
    end

    class Bar < Foo
      def initialize(a)
        super()    # <- 0�� �ΰ����Ǥ��뤳�Ȥ��������Ƥ���
      end
    end

    obj = Bar.new(1)

* ���ޤ���Ʊ�� signature �Υ᥽�åɤ��äƤ�ȡ����֥������ȤΥ��饹�㤤�˵����Ĥ�����
  �塹�Ȥ�Ǥ�ʤ��Ȥ�����㳰���������礬����ޤ���
  (��:PStore#abort��abort)

* ARGV�ǰ����������ä��塢gets�ʤɤ�ɸ�����Ϥ�Ȥ���硢ARGV.shift�ʤɤ�
  ARGV����ˤ��Ƥ����ʤ���ARGV�˻ĤäƤ���ե�����̾�Υե����뤫���ɤ߹��⤦��
  ���Ƥ��ޤ��ޤ���
