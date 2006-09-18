��˥åȥƥ��Ȥ�Ԥ�����Υ饤�֥��Ǥ���

[[m:URL:http:#/www.ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html]]

== �Ȥ���

Test::Unit �ϰʲ��Τ褦�˻Ȥ��ޤ���

�ޤ��ƥ����оݤΥ�����(foo.rb)��ɬ�פǤ���

    class Foo
       def foo
         "foo"
       end
       def bar
         "foo"
       end
    end

���˥�˥åȥƥ���(test_foo.rb)��񤭤ޤ����ƥ��Ȥ�¹Ԥ���᥽�åɤ�̾����
���� test_ �ǻϤޤ�ɬ�פ�����ޤ���

    require 'test/unit'
    require 'foo'

    class TC_Foo < Test::Unit::TestCase
      def setup
        @obj = Foo.new
      end

      # def teardown
      # end

      def test_foo
        assert_equal("foo", @obj.foo)
      end
      def test_bar
        assert_equal("bar", @obj.bar)
      end
    end

�ƥ��Ȥ�¹Ԥ���ˤϾ���Ѱդ��� test_foo.rb ��¹Ԥ��ޤ���
�ǥե���ȤǤϤ��٤ƤΥƥ��Ȥ��¹Ԥ���ޤ���

        $ ruby test_foo.rb

        Loaded suite test_foo
        Started
        F.
        Finished in 0.022223 seconds.

          1) Failure!!!
        test_bar(TC_Foo) [test_foo.rb:16]:
        <bar> expected but was
        <foo>

        2 tests, 2 assertions, 1 failures, 0 errors

test_bar �����ƥ��Ȥ��������ϰʲ��Τ褦�ʥ��ץ�����Ϳ���ޤ���

        $ ruby test_foo.rb --name=test_bar

        Loaded suite test_foo
        Started
        F
        Finished in 0.019573 seconds.

          1) Failure!!!
        test_bar(TC_Foo) [test_foo.rb:16]:
        <bar> expected but was
        <foo>

        1 tests, 1 assertions, 1 failures, 0 errors

gtk ��Ȥä� testrunner

        $ ruby test_foo.rb --runner=gtk --name=test_bar

fox ��Ȥ�

        $ ruby test_foo.rb --runner=fox --name=test_bar

console ��Ȥ� (default)

        $ ruby test_foo.rb --runner=console --name=test_bar

�ʲ��Τ褦�ˤ���� help ��ɽ������ޤ���

  $ ruby test_foo.rb --help

     Usage: test_foo.rb [options] [-- untouched arguments]
     
         -r, --runner=RUNNER              Use the given RUNNER.
                                          (c[onsole], f[ox], g[tk], g[tk]2, t[k])
         -n, --name=NAME                  Runs tests matching NAME.
                                          (patterns may be used).
         -t, --testcase=TESTCASE          Runs tests in TestCases matching TESTCASE.
                                          (patterns may be used).
         -v, --verbose=[LEVEL]            Set the output level (default is verbose).
                                          (s[ilent], p[rogress], n[ormal], v[erbose])
             --                           Stop processing options so that the
                                          remaining options will be passed to the
                                          test.
         -h, --help                       Display this help.

ʣ���Υƥ��Ȥ���٤˹Ԥ���硢�ʲ��Τ褦�˽񤤤������Υե������¹Ԥ��ޤ���

 require 'test/unit'
 require 'test_foo.rb'
 require 'test_bar.rb'

�⤦�������٤ʥƥ��Ȥμ¹���ˡ�˴ؤ��Ƥ� [[c:Test::Unit::AutoRunner]] ��
���Ȥ��Ʋ�������

== RubyUnit ����ΰܹ�

assertion �᥽�åɤΰ㤤�� [[unknown:"ruby-src:lib/runit/assert.rb"]] �򻲾ȡ�
[[c:RUNIT::Assert]] �⻲�ȡ�

= class Test::Unit::TestCase
include Test::Unit::Assertions

�ƥ��ȤϤ��Υ��饹�Υ��֥��饹�Ȥ���������ޤ���

== Instance Methods

--- setup
�ƥƥ��ȥ᥽�åɤ��ƤФ������ɬ���ƤФ�ޤ���

--- teardown
�ƥƥ��ȥ᥽�åɤ��ƤФ줿���ɬ���ƤФ�ޤ���

= module Test::Unit::Assertions

Test::Unit::TestCase �� include ����ƻȤ���⥸�塼��Ǥ���assert �᥽�åɤ��������
���ޤ���

�� assert �᥽�åɤκǸ�ΰ��� message �ϥƥ��Ȥ����Ԥ����Ȥ���ɽ�������
��å������Ǥ���

== Instance Methods

--- assert(boolean, message=nil)

boolean �����ʤ� pass

--- assert_equal(expected, actual, message=nil)

expected == actual �ʤ�� pass

--- assert_not_equal(expected, actual, message="")

expected != actual �ʤ�� pass

--- assert_instance_of(klass, object, message="")

klass == object.class �����ʤ� pass

--- assert_nil(object, message="")

object.nil? �ʤ�� pass

--- assert_not_nil(object, message="")

!object.nil? �ʤ�� pass

--- assert_kind_of(klass, object, message="")

object.kind_of?(klass) �����ʤ� pass

--- assert_respond_to(object, method, message="")

object.respond_to?(method) �����ʤ� pass

--- assert_match(pattern, string, message="")

string =~ pattern �����ʤ�� pass

--- assert_no_match(regexp, string, message="")

regexp !~ string �����ʤ�� pass

--- assert_same(expected, actual, message="")

actual.equal?(expected) �����ʤ� pass

--- assert_not_same(expected, actual, message="")

!actual.equal?(expected) �����ʤ� pass

--- assert_operator(object1, operator, object2, message="")

object1.send(operator, object2) �����ʤ� pass

--- assert_raise(expected_exception_klass, message="") { ... }

�֥�å���¹Ԥ����㳰��ȯ�����������㳰��
expected_exception_klass ���饹�ʤ�� pass

--- assert_nothing_raised(*args) { ... }

�֥�å���¹Ԥ����㳰�������ʤ���� pass

--- flunk(message="Flunked")

��˼���

--- assert_throws(expected_symbol, message="") { ... }

�֥�å���¹Ԥ��� :expected_symbol �� throw ���줿�� pass

--- assert_nothing_thrown(message="") { ... }

�֥�å���¹Ԥ��� throw ��������ʤ���� pass

--- assert_in_delta(expected_float, actual_float, delta, message="")

(expected_float.to_f - actual_float.to_f).abs <= delta.to_f 
�����ʤ� pass

delta �����ο��Ǥʤ���Фʤ�ʤ���

--- assert_send(send_array, message="")

send_array[0].__send__(send_array[1], *send_array[2..-1])
�����ʤ� pass

--- assert_block(message="assert_block failed.") { ... }

block �η�̤����ʤ� pass

= class Test::Unit::AutoRunner

�ƥ��Ȥμ¹Ԥ��������Ȥ��ˤ��� AutoRunner ���饹��Ȥ��ޤ���
���̤Υƥ��Ȥ��椫������Υƥ��ȥ�����ץȤΤߤ�¹Ԥ�������硢
����Υƥ��ȥ��饹�Τߤ�¹Ԥ��������ʤɤ˻Ȥ��ޤ���
AutoRunner �� Collector::Dir ���֥������Ȥʤɤ� Collector ��
�ƥ��Ȥ򽸤ᤵ���ơ�UI::Console::TestRunner ���֥������Ȥʤɤ�
Runner �˥ƥ��Ȥ�¹Ԥ����Ƥ��륯�饹�Ǥ���

#@# === ��

�ǥ��쥯�ȥ� ./somedir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��������ϼ��Τ褦�ʥե�����(runner.rb)���Ѱդ��Ƽ¹Ԥ��ޤ����ƥ��Ȥ� test_*.rb �Ȥ����ե�����̾�Ǥ���ɬ�פ�����ޤ���

#@# ruby 1.8.3 �ʹߤǤ� AutoRunner.run ���������ΰ�̣���Ѥ�ꡢ���ޤǤȿ������դˤʤ�ޤ�����
#@# �������� true ��Ϳ����ȡ�./somedir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��ޤ���

#@#  # ruby 1.8.2 �ޤ�
#@if (version <= "1.8.2")
  require 'test/unit'
  Test::Unit::AutoRunner.run(false, './somedir')
#@end

#@#  # ruby 1.8.3 �ʹ�
#@if (version >= "1.8.3")
  require 'test/unit'
  Test::Unit::AutoRunner.run(true, './somedir')
#@end

ñ�˼¹Ԥ��ޤ���

  $ ruby runner.rb 

�ǥ��쥯�ȥ� ./somedir �ʲ��ˤ���ƥ��Ȥ�ե����� somefile ������Ƽ¹Ԥ��������ϼ��Τ褦�� runner.rb �˥��ץ�����Ϳ���ޤ���

  $ ruby runner.rb --exclude=somefile

Ʊ�����Ȥϡ�runner.rb ��ľ�ܥ��ץ�����񤤤Ƥ�¸��Ǥ��ޤ���

  require 'test/unit'
  Test::Unit::AutoRunner.run(true, './somedir', ['--exclude=somefile'])

��Τ�����Ǥϳ�ĥ�Ҥ� .rb �Υե����뤷������ޤ��󡣳�ĥ�Ҥ� .rbx �Υե������
�ƥ��ȤȤ��ƽ��᤿�����ϼ��Τ褦�ˤ��ޤ���

  require 'test/unit'
  Test::Unit::AutoRunner.run(true, './somedir', ['--pattern=/test_.*\.rbx\Z/'])

== Class Methods

--- run(force_standalone = false, dir = nil, argv = ARGV)
�ƥ��Ȥ�¹Ԥ��ޤ���
        
#@if (version >= "1.8.3")
ruby 1.8.3 �ʹߤǤ� force_standalone �ΰ�̣���Ѥ�ꡢ���ޤǤȿ������դˤʤ�ޤ�����        
force_standalone �� true ��Ϳ����ȡ�dir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��ޤ���
false ��Ϳ�������ϴ����ɤ߹��ޤ줿�ե�������椫��ƥ��Ȥ�õ���Ƽ¹Ԥ��ޤ���
�ǥե���Ȥ� false �Ǥ���
#@end

#@if (version <= "1.8.2")
ruby 1.8.2 �ޤ�: force_standalone �ˤ� $0 �� false ��Ϳ���ޤ���
$0 ��Ϳ�������ϴ����ɤ߹��ޤ줿�ե�������椫��ƥ��Ȥ�õ���Ƽ¹Ԥ��ޤ���
false ��Ϳ�������ϡ�dir ���椫��ƥ��ȥ�����ץȤ�Ƶ�Ū��õ������
�¹Ԥ��ޤ����ǥե���ȤǤϥե�����̾�� test_*.rb �Υƥ��ȥ�����ץȤ���õ��
���ޤ���
false ��Ϳ�������Ǥ⡢�����ɤ߹��ޤ줿�ե�����ϼ¹Ԥ���ƥ��Ȥ˴ޤޤ�ޤ���
#@end

dir �ˤ� force_standalone �� true ��Ϳ�������˺Ƶ�Ū��õ������ǥ��쥯�ȥ�̾��
Ϳ���ޤ����ǥե���ȤǤϥ����ȥǥ��쥯�ȥ��Ƶ�Ū��õ�����ޤ���

argv �ˤϥ��ץ���������Ȥ���Ϳ���ޤ�����᤹�륪�ץ��������
�ФƤ�����Τ�Ʊ���Ǥ���

      -r, --runner=RUNNER              Use the given RUNNER.
                                       (c[onsole], f[ox], g[tk], g[tk]2, t[k])
      -n, --name=NAME                  Runs tests matching NAME.
                                       (patterns may be used).
      -t, --testcase=TESTCASE          Runs tests in TestCases matching TESTCASE.
                                       (patterns may be used).
      -v, --verbose=[LEVEL]            Set the output level (default is verbose).
                                       (s[ilent], p[rogress], n[ormal], v[erbose])
          --                           Stop processing options so that the
                                       remaining options will be passed to the
                                       test.
      -h, --help                       Display this help.

force_standalone �� true ��Ϳ�������ˤϼ��Υ��ץ�����ɲä���ޤ���

      -a, --add=TORUN                  Add TORUN to the list of things to run;
                                       can be a file or a directory.
      -p, --pattern=PATTERN            Match files to collect against PATTERN.
      -x, --exclude=PATTERN            Ignore files to collect against PATTERN.

��

      require 'test/unit'
      Test::Unit::AutoRunner.run(true, './', ['--runner=tk', '-v',
                                               '--exclude=/test_hoge.*\.rb\Z/i'])
    
argv �˥ǥե���ȤΤޤ� ARGV ���Ϥ��Ƥ����Х��ޥ�ɥ饤�󤫤饪�ץ�����
����Ǥ��ޤ���

      require 'test/unit'
      Test::Unit::AutoRunner.run(true, './')

�ȡ�runner.rb �˽񤤤Ƥ����ơ����ޥ�ɥ饤�󤫤�ʲ��Τ褦�˼¹ԡ�
   
      $ ruby runner.rb --runner=tk -v --exclude=/test_hoge.\*\\.rb\\Z/i
