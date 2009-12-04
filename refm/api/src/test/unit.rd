require test/unit/testcase
#@until 1.9.1
require test/unit/autorunner
#@end

��˥åȥƥ��Ȥ�Ԥ�����Υ饤�֥��Ǥ���

#@#[[url:http://www.ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html]]

#@since 1.9.1
test/unit �� [[lib:minitest/unit]] ��ȤäƺƼ�������ޤ������������ʸ�
�������������ǤϤ���ޤ���
#@end

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

���˥�˥åȥƥ���(test_foo.rb)��񤭤ޤ����ƥ��Ȥ�¹Ԥ���᥽�å�(�ƥ��ȥ᥽�å�)��̾����
���� test_ �ǻϤޤ�ɬ�פ�����ޤ����ƥ��ȥ᥽�åɤ��¹Ԥ�������ˤ� setup �᥽�åɤ�ɬ��
�ƤФ�ޤ����¹Ԥ��줿���Ȥˤϡ�teardown �᥽�åɤ�ɬ���ƤФ�ޤ���

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

#@since 1.9.1

        $ ruby test_foo.rb

        Loaded suite test_foo
        Started
        F.
        Finished in 0.022223 seconds.

          1) Failure:
        test_bar(TC_Foo) [test_foo.rb:16]:
        <"bar"> expected but was
        <"foo">.

        2 tests, 2 assertions, 1 failures, 0 errors, 0 skips

test_bar �����ƥ��Ȥ��������ϰʲ��Τ褦�ʥ��ץ�����Ϳ���ޤ���

        $ ruby test_foo.rb --name test_bar

        Loaded suite test_foo
        Started
        F
        Finished in 0.019573 seconds.

          1) Failure:
        test_bar(TC_Foo) [test_foo.rb:16]:
        <"bar"> expected but was
        <"foo">.

        1 tests, 1 assertions, 1 failures, 0 errors, 0 skips

--name=test_bar�Τ褦�ʻ���ϹԤ��ޤ��󡣤���¾�λ��Ѳ�ǽ�ʥ��ץ����ˤ�
���Ƥϡ�[[lib:minitest/unit]]��Ʊ�ͤǤ���

#@else

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

#@end

ʣ���Υƥ��Ȥ���٤˹Ԥ���硢�ʲ��Τ褦�˽񤤤������Υե������¹Ԥ��ޤ���

 require 'test/unit'
 require 'test_foo.rb'
 require 'test_bar.rb'

#@until 1.9.1
�⤦�������٤ʥƥ��Ȥμ¹���ˡ�˴ؤ��Ƥ� [[c:Test::Unit::AutoRunner]] ��
���Ȥ��Ʋ�������
#@end

=== ���ĥƥ��Ȥϼ¹Ԥ���뤫

�����Ǥϡ��ƥ��ȥ��饹���������������פǡ��ƥ��Ȥ��¹Ԥ���Ƥ��ޤ���
#@since 1.9.1
����ϡ�require 'test/unit'��������[[m:MiniTest::Unit.autorun]]��¹Ԥ�
�Ƥ��뤿��Ǥ������η�̡���λ���θ�����Ȥ��Ƽ¹Ԥ����褦�ˤʤäƤ�
�ޤ���
#@else
����ϡ�[[m:Kernel.#at_exit]] �� [[m:ObjectSpace.#each_object]] ��Ȥä�
��������Ƥ��ޤ����Ĥޤꡢ�����Ǥϥƥ��ȤϽ�λ���θ�����Ȥ��Ƽ¹Ԥ���ޤ���

����ξ��ϡ���������ꤢ��ޤ��󡣤��������Ǥʤ����ϡ�
testrb ���ޥ�ɤ� [[c:Test::Unit::AutoRunner]] ���Ƽ� TestRunner ���饹��Ȥ����Ȥˤ�ꡢ
����Ū�˥ƥ��Ȥ�¹Ԥ��뤳�Ȥ��Ǥ��ޤ���
#@end

=== Error �� Failure �ΰ㤤

: Error
  �ƥ��ȥ᥽�åɼ¹�����㳰��ȯ��������

: Failure
  �����������˼��Ԥ�����

#@until 1.9.1
=== RubyUnit ����ΰܹ�

assertion �᥽�åɤΰ㤤�� [[unknown:"ruby-src:lib/runit/assert.rb"]] �򻲾ȡ�
[[c:RUNIT::Assert]] �⻲�ȡ�
#@end

= module Test::Unit

��˥åȥƥ��Ȥ�Ԥ�����Υ⥸�塼��Ǥ���

== Singleton Methods

#@since 1.8.1
#@until 1.9.1
--- run?        -> bool

��˥åȥƥ��Ȥ�¹Ԥ������ɤ������֤��ޤ���
����ͤ� false ���ä����ϡ��ޤ���˥åȥƥ��Ȥ�¹Ԥ��Ƥ��ʤ����ˤʤ�ޤ���

@return ��˥åȥƥ��Ȥ�¹Ԥ������ɤ���

--- run=(flag)  

��˥åȥƥ��Ȥ�ư�¹Ԥ������ɤ�������ꤷ�ޤ���

@param flag ��˥åȥƥ��Ȥ�ư�¹Ԥ������ɤ���

true�򥻥åȤ����[[c:Test::Unit]]�ϥ�˥åȥƥ��Ȥ�ư�¹�``���ʤ��ʤ�ޤ�''��
run�ϲ��ʬ���run�Ǥ���true�ˤ���ȥƥ��Ȥ�¹Ԥ��������Ȥ�����̣�ˤʤ�ޤ���

#@end
#@end

#@since 1.9.1
--- setup_argv(original_argv = ARGV) { |files| ... } -> [String]

original_argv�ǻ��ꤵ�줿���ץ�������Ϥ��ơ��ƥ����оݤˤʤ�ե�����
��require���ޤ���

@param original_argv ���ץ�������ꤷ�ޤ�����ά���줿���ϡ�
                     [[m:Kernel::ARGV]]�����Ѥ���ޤ���

@raise ArgumentError ���ꤵ�줿�ե����뤬¸�ߤ��ʤ�����ȯ�����ޤ���

�֥�å������ꤵ�줿���ˤϥ֥�å���ɾ�����ơ����η�̤�require���о�
�ˤ��ޤ���

�֥�å��ѥ�᡼���ˤϾ嵭��original_argv����-x�ǻ��ꤵ�줿��ΰʳ��Υ�
�ץ����������Ϥ���ޤ����ե�����̾������˥ǥ��쥯�ȥ����ꤹ��
�ȡ��ǥ��쥯�ȥ����ˤ���test_*.rb������require���ޤ���

���Υ᥽�åɼ��Τϡ����ץ�������Ϥ���require��Ԥ��ʳ��ν����ϹԤ���
���󤬡�test/unit.rb��require���ƸƤӽФ��᥽�åɤΤ��ᡢ���Ū�˥�˥�
�ȥƥ��Ȥ��¹Ԥ���ޤ���testrb���ޥ�ɤΤ褦�ˡ���˥åȥƥ��Ȥ�¹Ԥ�
��ץ��������������˻��Ѥ��ޤ���

===== ���Ѳ�ǽ�ʥ��ץ����

: -v
  �ܺ٤�ɽ�����ޤ���

: -n, --name
  ���ꤵ�줿�ƥ��ȥ᥽�åɤ�¹Ԥ��ޤ����ƥ��ȥ᥽�åɤλ��������ɽ��
  ��Ȥ��ޤ���--name=test_foo�Τ褦�ʻ���ϹԤ��ޤ���--name test_foo
  �Τ褦�˻��ꤷ�Ƥ���������

: -x
  ���ꤵ�줿�ե������������ޤ����ե�����λ��������ɽ����Ȥ��ޤ���

===== ���

Test::Unit.setup_argv��original_argv�λ���˴ؤ�餺��ARGV��files���֤�
�����ޤ����֤�������줿ARGV��[[lib:minitest/unit]]�ˤ�äƤ⤦1�ٲ��Ϥ���ޤ���

#@end
