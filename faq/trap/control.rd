= �������ס����湽¤

* �������ѿ��������դ��᥽�å�

  �쥷���Ф��ά����ȥ᥽�åɤǤϤʤ��������ѿ��Ȥ��ư����ޤ���
  ���̤Υ᥽�åɤ�self�Υ쥷���Ф��ά�Ǥ��ޤ��������ξ����Բġ�

    class Foo
       def bar=(v)
       end
       def baz
          bar = 0           # �������ѿ� bar �ؤ�����
          self.bar = 0      # �᥽�å� bar= �θƤӽФ�
       end
    end

* ���湽¤(if��while�ʤ�)�ϥ������פ���ʤ���

  while �� for ���������פ���ʤ��Τ��Ф���loop �� each �ʤɤΥ��ƥ졼
  ���ϥ������פ���ޤ���

    while true
      var = true
      break
    end
    p var
    # => true

    loop {
      var = true        # ���Υ֥�å�����ǥ�����
      break
    }
    p var
    # => -:5: undefined local variable or method `var' for #<Object:0x401a7b28> (NameError)

    for i in 1..3
      var = true
    end
    p var
    # => true

    (1..3).each {
      var = true        # ���Υ֥�å�����ǥ�����
    }
    p var
    # => -:4: undefined local variable or method `var' for #<Object:0x401a7b28> (NameError)

* ¿�ť롼�פ�ȴ����

  ��ʣ�����롼�פ�ȴ����ˤϡ�(({break})) �ǤϤʤ� (({catch}))/(({throw}))
  ����Ѥ��ޤ���

    catch(:last) {
      while true
        (1..5).each{|x|
          throw :last if x == 3
          print "#{x}\n"
        }
      end
    }

* �������ѿ��������˥����롣Perl �� my �Ȥ��Ȥϰ㤦

    # Ruby
    local = "hoge"
    def hoge
      print local, "\n" # ̤��������顼
    end
    hoge

    # Perl
    my $local = "hoge";
    sub hoge {
        print $local, "\n"; #=> hoge
    }
    hoge;

* �Ȥ߹��ߴؿ�

  load�Τ褦���Ȥ߹��ߴؿ���Ʊ��̾���Υ᥽�åɤ�������Ƥ��륯�饹�ǡ�
  �Ȥ߹��ߴؿ���load��ƤӽФ��ˤ�Kernel.��Ĥ��ޤ���

    class Hoge
      def call_load
        load "nosuchfile.rb"
        self.load "nosuchfile.rb"
        Kernel.load "nosuchfile.rb"
      end

      def load(arg)
        puts "Hoge#load #{arg}"
      end
    end

    Hoge.new.call_load
    # => Hoge#load nosuchfile.rb
    #    Hoge#load nosuchfile.rb
    #    LoadError: No such file to load -- nosuchfile.rb

* �֥�å��ΰ����Υ�������
    a = [1,2,3]
    a.sort{|a,b| b<=>a}         # a �����������
    p a.class #=> Fixnum         # �Ǹ���������줿 a
