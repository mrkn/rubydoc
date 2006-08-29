= optparse::���塼�ȥꥢ��

((<OptionParser>))

optparse ��Ȥ���硢����Ū�ˤ�

(1) OptionParser ���֥������� opt ���������롣
(2) ���ץ������갷���֥�å��� opt ����Ͽ���롣
(3) opt.parse(ARGV) �ǥ��ޥ�ɥ饤���ºݤ� parse ���롣

�Ȥ����褦��ή��ˤʤ�ޤ���

* ((<optparse::���塼�ȥꥢ��/���ץ��������>))
* ((<optparse::���塼�ȥꥢ��/�̤ν���>))
* ((<optparse::���塼�ȥꥢ��/ARGV �ε�ǽ>))
* ((<optparse::���塼�ȥꥢ��/���ץ����ΰ���>))
* ((<optparse::���塼�ȥꥢ��/��󥰥��ץ����>))
* ((<optparse::���塼�ȥꥢ��/�إ��>))
* ((<optparse::���塼�ȥꥢ��/���֥��ޥ��>))
* ((<optparse::���塼�ȥꥢ��/'-'�ǻϤޤ�ե�����̾>))

== ���ץ��������

* �ʲ��ϥ��ץ���� -a, -b ������դ��륳�ޥ�ɤ����������Ǥ���

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a') {|v| p v }
        opt.on('-b') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb -a foo bar -b baz
        # => true
             true
             ["foo", "bar", "baz"]

  on() �᥽�åɤΰ����ǥ��ץ���������������������ꤵ�줿���ν�����
  �֥�å��ǵ��Ҥ��ޤ����֥�å��ΰ����ˤϥ��ץ���󤬻��ꤵ�줿���Ȥ�
  ���� true ���Ϥ���ޤ�(((<optparse::���塼�ȥꥢ��/���ץ����ΰ���>))�⻲��)��

  Enumerable#each �ʤɤȰ㤤��on() �᥽�åɤ��ƤФ줿�����Ǥϥ֥�å��ϼ¹Ԥ���ޤ���
  �����ޤ���Ͽ���������Ǥ���
  parse ���ƤФ줿���ˡ����ޥ�ɥ饤��˥��ץ���󤬻��ꤵ��Ƥ���м¹Ԥ���ޤ���

* ���ץ����λ���ϥ��ޥ�ɤ�ľ��Ǥ���ɬ�פϤ���ޤ���(�����ǡ�-b �ϥ��ץ�����
  ����ǧ������Ƥ���)�����������Ķ��ѿ� POSIXLY_CORRECT ��������Ƥ����
  ���ε�ư���ѹ�����ޤ���

        env POSIXLY_CORRECT=1 ruby ./sample.rb -a foo bar -b baz
        # => true                               # -a �ϥ��ץ����Ȳ��
             ["foo", "bar", "-b", "baz"]        # -b ���󥪥ץ����Ȳ��

* parse!() �ˤ�ꡢ���ޥ�ɥ饤��(ARGV)�β��Ϥ�Ԥ��ޤ���
  parse!() �Ǥϡ�ARGV ���饪�ץ���󤬼�������ޤ���
  ������򤱤�ˤ� parse() ��Ȥ��ޤ���

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a') {|v| p v }
        opt.on('-b') {|v| p v }

        # parse() �ξ�硢ARGV���ѹ�����ʤ���
        # ���ץ��������������̤� argv �����ꤵ��롣
        argv = opt.parse(ARGV)

        p argv

* ������Ƥ��ʤ����ץ�������ꤹ����㳰 OptionParser::InvalidOption ��
  ȯ�����롣

        ruby ./sample.rb -c
        /usr/local/lib/ruby/1.9/optparse.rb:1428:in `complete': invalid option: -c (OptionParser::InvalidOption)
                from /usr/local/lib/ruby/1.9/optparse.rb:1426:in `catch'
                from /usr/local/lib/ruby/1.9/optparse.rb:1426:in `complete'
                from /usr/local/lib/ruby/1.9/optparse.rb:1287:in `order!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1256:in `catch'
                from /usr/local/lib/ruby/1.9/optparse.rb:1256:in `order!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1336:in `permute!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1363:in `parse!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1356:in `parse'
                from ./sample.rb:9

* OptionParser ���Τϡ��ɤΥ��ץ���󤬻��ꤵ�줿���򵭲����ʤ���
  ��ν��������ǡ����ץ����ˤ����Ƚ�Ǥ�ä���ˤϡ�
  ¾�Υ���ƥʤ˳�Ǽ���롣

        require 'optparse'
        opt = OptionParser.new

        OPTS = {}

        opt.on('-a') {|v| OPTS[:a] = v }
        opt.on('-b') {|v| OPTS[:b] = v }

        opt.parse!(ARGV)
        p ARGV
        p OPTS

        ruby sample.rb -a foo bar -b baz
        # => ["foo", "bar", "baz"]
             {:a=>true, :b=>true}


== �̤ν���

OprionParser.new �ϥ֥�å�������դ��롣�֥�å��ΰ�������������
���󥹥��󥹤ʤΤǡ��ʲ��ν������Ǥ��롣

        require 'optparse'
        OptionParser.new {|opt|

          opt.on('-a') {|v| p v }
          opt.on('-b') {|v| p v }

          opt.parse!(ARGV)
        }
        p ARGV

���ν����������ϡ�
* OptionParser �˴ؤ��뵭�Ҥ�֥�å����ϰϤ���������(���䤹���ʤ�?)��
* �ѿ� opt ��֥�å�������ˤ��롣
���餤����

== ARGV �ε�ǽ

optparse.rb �� require ����ȡ�ARGV �� OptionParser::Arguable �ε�ǽ
���ä�롣���Τ��Ȥˤ�ꡢ�ʲ��ν������Ǥ���褦�ˤʤ롣

        require 'optparse'
        ARGV.options {|opt|

            opt.on('-a') {|v| p v }
            opt.on('-b') {|v| p v }

            opt.parse!
        }
        p ARGV

        ruby sample.rb -a foo bar -b baz
        # => true
             true
             ["foo", "bar", "baz"]

((<optparse::���塼�ȥꥢ��/�̤ν���>))�Ǽ����������٤ơ�
* ARGV.options �᥽�åɤΥ֥�å��ǥ��ץ��������򵭽Ҥ���
* opt.parse! �ΰ����� ARGV ����ˤʤ롣
�Ȥ��ä��㤤�����롣

�ä�����������櫓�ǤϤʤ�����optparse ź�դΥ���ץ�Ϥ��ν�
�����ˤʤäƤ��롣

== ���ץ����ΰ���

* on() �᥽�åɤΥ��ץ��������������˲�����񤯤ȡ����Υ��ץ����
  �ϰ���������դ��뤳�Ȥλ���Ȥʤ롣

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a VAL') {|v| p v }         # <- " VAL" ���ɲ�
        opt.on('-b') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb -a foo bar -b baz

        # => "foo"
             true
             ["bar", "baz"]

  ���ץ����������ν����δ��ϡ���((<optparse::���塼�ȥꥢ��/�إ��>))
  �θ��ɤ����ɤ��ʤ�褦�˽񤯡פǤ��롣

* ���ץ����ΰ������ά������㳰 OptionParser::MissingArgument ��ȯ�����롣

        ruby ./sample.rb -a
        /usr/local/lib/ruby/1.9/optparse.rb:455:in `parse': missing argument: -a (OptionParser::MissingArgument)
                from /usr/local/lib/ruby/1.9/optparse.rb:1295:in `order!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1256:in `catch'
                from /usr/local/lib/ruby/1.9/optparse.rb:1256:in `order!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1336:in `permute!'
                from /usr/local/lib/ruby/1.9/optparse.rb:1363:in `parse!'
                from ./sample.rb:7

* ���ץ����ΰ�����ɬ�ܤǤʤ����Ȥ򼨤��ˤϡ�" [" ���դ���

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a [VAL]') {|v| p v }          # <- [VAL] ���ɲ�
        opt.on('-b') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb -a

        # => nil
             []

  Ʊ�ͤˡ��إ�פθ��ɤ����ɤ��褦�� "VAL]" ���ղä��Ƥ��롣

* ���硼�ȥ��ץ����ΰ�������ϻȤ��ˤ����Τǡ����Τ褦�ʾ��ϥ��
  ���ץ����������Ȥ�����狼��䤹�����㤨�С��嵭�ξ�硢-ab ��
  ���ꤹ��� -a b �Ȳ�ᤵ��롣-a ������������ʤ��ǽ����ʤ� -a -b ��
  ��ᤵ��롣

== ��󥰥��ץ����

* ��󥰥��ץ����ϡ�on() �ΰ����� '--'�ǻϤޤ륪�ץ�������ꤹ�롣

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a', '--foo') {|v| p v }
        opt.on('--bar') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb -a foo bar --bar baz
        # => true
             true
             ["foo", "bar", "baz"]

* --[no-]...�ʤɤȤ��뤳�Ȥǡ����귿�Υ��ץ�������ꤹ�뤳�Ȥ��Ǥ��롣

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a', '--foo') {|v| p v }
        opt.on('--[no-]bar') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb -a foo bar --bar baz --no-bar
        # => true
             true
             false                              # <- --no-bar �λ���ˤ�롣
             ["foo", "bar", "baz"]

* ���ץ������Ф�����������Ǥ��롣���硼�ȥ��ץ�����Ʊ��������
  GNU�δ����ˤ��碌��

        opt.on('-a', '--foo=VAL') {|v| p v }
        opt.on('--[no-]bar[=VAL]') {|v| p v }

  �� "=" ��Ȥ��Τ��ɤ��Ȼפ��롣

* ���ץ�������ꤹ����ϡ��ɤΥ��ץ���󤫰�դ˷�ޤ�Ĺ���ޤǻ��ꤹ
  ����ɤ���

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a', '--foo') {|v| p v }
        opt.on('--[no-]bar') {|v| p v }

        opt.parse!(ARGV)
        p ARGV

        ruby sample.rb --fo

  ������Ǥϡ�--fo �ϡ�--foo ����ꤷ���Τ�Ʊ���ˤʤ롣������ʤ� --f 
  �ޤǾ�ά�Ǥ��롣

== �إ��

* �ǥե���Ȥǡ�--help �� --version ���ץ�����ǧ�����롣

        ruby ./sample.rb --help
        # => Usage: sample [options]

        ruby ./sample.rb --version
        # => *���Ϥʤ�*

* --version �ϡ��ȥåץ�٥�� Version ������������Ƥ���Ƚ��Ϥ���롣
  (ͥ���٤��㤤�� VERSION ����⻲�Ȥ��롣Ruby �ΥС������򼨤� VERSION
  ����� ruby 1.8 �ޤǤ��������Ƥ���Τ����)

        require 'optparse'
        opt = OptionParser.new
        Version = "1.2.3"       # opt.version = "1.2.3"
        opt.parse!(ARGV)

        ruby ./sample.rb --version
        # => sample 1.2.3

* on �ΰ����ˤ��Υ��ץ�����������ä���� --help �ν��Ϥ�ȿ�Ǥ���롣

        require 'optparse'
        opt = OptionParser.new

        opt.on('-a', 'description of -a') {|v| p v }
        opt.on('-b', 'description of -b') {|v| p v }

        opt.parse!(ARGV)
        p ARGV
        
        ruby ./sample.rb --help
        # => Usage: sample [options]        
                -a                               description of -a
                -b                               description of -b

  ����1.8.2������ΥС������ǤϤ���������ȥ���餷����  
        ruby ./sample.rb --help
        # => Usage: sample [options]
  �ˤʤ롣
        opt.on('--help', 'show this message') { puts opt; exit }
  �򥪥ץ����������ɲä��뤫��((<ARGV��Ȥä�����|optparse::���塼�ȥꥢ��/ARGV �ε�ǽ>))
  �ˤ���(�ʲ�)��

        require 'optparse'
        ARGV.options {|opt|

          opt.on('-a', 'description of -a') {|v| p v }
          opt.on('-b', 'description of -b') {|v| p v }

          opt.parse!
        }
        p ARGV

        ruby ./sample.rb --help
        # => Usage: sample [options]
               -a                               description of -a
               -b                               description of -b

== ���֥��ޥ��
�ʲ��� cvs �� svn �Τ褦�˥��֥��ޥ�ɤ��᤹����Ǥ��롣
  
    #! /usr/bin/ruby
    # contributed by Minero Aoki.
    
    require 'optparse'
    
    parser = OptionParser.new
    parser.on('-i') { puts "-i" }
    parser.on('-o') { puts '-o' }
    
    subparsers = Hash.new {|h,k|
      $stderr.puts "no such subcommand: #{k}"
      exit 1
    }
    subparsers['add'] = OptionParser.new.on('-i') { puts "add -i" }
    subparsers['del'] = OptionParser.new.on('-i') { puts "del -i" }
    subparsers['list'] = OptionParser.new.on('-i') { puts "list -i" }
    
    parser.order!(ARGV)
    subparsers[ARGV.shift].parse!(ARGV) unless ARGV.empty?

�¹Ԥ���Ȱʲ��Τ褦�ˤʤ롣

    $ ruby subcom.rb -i add -i
    -i
    add -i
    
    $ ruby subcom.rb list -i
    list -i

((<OptionParser#order!|OptionParser/order>)) �����ץ����ǤϤʤ�
���ޥ�ɤΰ����˽в񤦤Ȥ����ǥѡ��������Ǥ��뤳�Ȥ����Ѥ��Ƥ��롣

== '-'�ǻϤޤ�ե�����̾

'-'�ǻϤޤ�ե�����̾�򥳥ޥ�ɤ��Ϥ��������ϰʲ��Τ褦�˴֤�"--"�򶴤ࡣ

      $ ruby sample.rb -- -a 

"-a" �����ץ����ǤϤʤ������Ȥ��Ʋ�ᤵ��롣
����� POSIX.2 �� getopt(3) ��ͳ�褹�롣"--" �ʹߤϤ��٤ƥ��ץ����ǤϤʤ������Ȥ��Ʋ�ᤵ��롣
