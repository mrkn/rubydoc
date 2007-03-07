require test/unit/testcase
require test/unit/autorunner

��˥åȥƥ��Ȥ�Ԥ�����Υ饤�֥��Ǥ���

[[url:http://www.ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html]]

=== �Ȥ���

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
#@since 1.8.6
         -b, --basedir=DIR                Base directory of test suites.
         -w, --workdir=DIR                Working directory to run tests.
#@end
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

=== RubyUnit ����ΰܹ�

assertion �᥽�åɤΰ㤤�� [[unknown:"ruby-src:lib/runit/assert.rb"]] �򻲾ȡ�
[[c:RUNIT::Assert]] �⻲�ȡ�

= module Test::Unit

== Singleton Methods

#@since 1.8.1
--- run?
--- run=(flag)
#@todo

#@#ñ�ʤ�Х������Τ�ʤ���
true�򥻥åȤ����[[c:Test::Unit]]�ϥ�˥åȥƥ��Ȥ�ư�¹�``���ʤ��ʤ�ޤ�''��
run�ϲ��ʬ���run�Ǥ���true�ˤ���ȥƥ��Ȥ�¹Ԥ��������Ȥ�����̣�ˤʤ�ޤ���

#@end

