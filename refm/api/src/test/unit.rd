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

#@#ñ�ʤ�Х������Τ�ʤ���
true�򥻥åȤ����[[c:Test::Unit]]�ϥ�˥åȥƥ��Ȥ�ư�¹�``���ʤ��ʤ�ޤ�''��
run�ϲ��ʬ���run�Ǥ���true�ˤ���ȥƥ��Ȥ�¹Ԥ��������Ȥ�����̣�ˤʤ�ޤ���

#@end

= class AssertionFailedError < StandardError
Thrown by Test::Unit::Assertions when an assertion fails.

= module Test::Unit::Assertions

Test::Unit::TestCase �� include ����ƻȤ���⥸�塼��Ǥ���assert �᥽�åɤ��������
���ޤ���

�� assert �᥽�åɤκǸ�ΰ��� message �ϥƥ��Ȥ����Ԥ����Ȥ���ɽ�������
��å������Ǥ���

== Singleton Methods

--- use_pp=(value)

Select whether or not to use the pretty-printer. If this option
is set to false before any assertions are made, pp.rb will not
be required.


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

#@since 1.8.1
--- assert_raise(expected_exception_klass, message="") { ... }

�֥�å���¹Ԥ����㳰��ȯ�����������㳰��
expected_exception_klass ���饹�ʤ�� pass
#@end

#@# bc-rdoc: detected missing name: assert_raises
--- assert_raises(*args, &block)

Alias of assert_raise.

Will be deprecated in 1.9, and removed in 2.0.

#@# bc-rdoc: detected missing name: build_message
--- build_message(head, template=nil, *arguments)

Builds a failure message. head is added before the template and
arguments replaces the '?'s positionally in the template.

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

#@since 1.8.1
= class Test::Unit::AutoRunner

#@todo

�ƥ��Ȥμ¹Ԥ��������Ȥ��ˤ��� AutoRunner ���饹��Ȥ��ޤ���
���̤Υƥ��Ȥ��椫������Υƥ��ȥ�����ץȤΤߤ�¹Ԥ�������硢
����Υƥ��ȥ��饹�Τߤ�¹Ԥ��������ʤɤ˻Ȥ��ޤ���
AutoRunner �� Collector::Dir ���֥������Ȥʤɤ� Collector ��
�ƥ��Ȥ򽸤ᤵ���ơ�UI::Console::TestRunner ���֥������Ȥʤɤ�
Runner �˥ƥ��Ȥ�¹Ԥ����Ƥ��륯�饹�Ǥ���

=== ��

�ǥ��쥯�ȥ� ./somedir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��������ϼ��Τ褦�ʥե�����(runner.rb)���Ѱդ��Ƽ¹Ԥ��ޤ����ƥ��Ȥ� test_*.rb �Ȥ����ե�����̾�Ǥ���ɬ�פ�����ޤ���

#@# ruby 1.8.3 �ʹߤǤ� AutoRunner.run ���������ΰ�̣���Ѥ�ꡢ���ޤǤȿ������դˤʤ�ޤ�����

#@if (version <= "1.8.2")
�������� false ��Ϳ����ȡ�./somedir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��ޤ���
  require 'test/unit'
  Test::Unit::AutoRunner.run(false, './somedir')
#@end

#@if (version >= "1.8.3")
�������� true ��Ϳ����ȡ�./somedir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��ޤ���
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
#@#ruby 1.8.3 �ʹߤǤ� force_standalone �ΰ�̣���Ѥ�ꡢ���ޤǤȿ������դˤʤ�ޤ�����        
force_standalone �� true ��Ϳ����ȡ�dir �ʲ��ˤ������ƤΥƥ��Ȥ�¹Ԥ��ޤ���
false ��Ϳ�������ϴ����ɤ߹��ޤ줿�ե�������椫��ƥ��Ȥ�õ���Ƽ¹Ԥ��ޤ���
�ǥե���Ȥ� false �Ǥ���
#@end

#@if (version <= "1.8.2")
#@#ruby 1.8.2 �ޤ�: 
force_standalone �ˤ� $0 �� false ��Ϳ���ޤ���
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
#@if (version <= "1.8.2")
force_standalone �� false ��Ϳ�������ˤϼ��Υ��ץ�����ɲä���ޤ���
#@else
force_standalone �� true ��Ϳ�������ˤϼ��Υ��ץ�����ɲä���ޤ���
#@end
      -a, --add=TORUN                  Add TORUN to the list of things to run;
                                       can be a file or a directory.
      -p, --pattern=PATTERN            Match files to collect against PATTERN.
#@since 1.8.2
      -x, --exclude=PATTERN            Ignore files to collect against PATTERN.
#@end

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

--- standalone?

#@end


= module Test::Unit::UI

== Constants

#@since 1.8.1
--- SILENT
--- PROGRESS_ONLY
--- NORMAL
--- VERBOSE
#@end

= module Test::Unit::UI::Console

= class Test::Unit::UI::Console::TestRunner < Object

Runs a Test::Unit::TestSuite on the console.

== Class Methods

#@# bc-rdoc: detected missing name: new
--- new(suite, output_level=NORMAL, io=STDOUT)

Creates a new TestRunner for running the passed suite. If quiet_mode
is true, the output while running is limited to progress dots,
errors and failures, and the final result. io specifies where
runner output should go to; defaults to STDOUT.

== Instance Methods
#@# bc-rdoc: detected missing name: start
--- start

Begins the test run.


= class Test::Unit::TestCase < Object
include Test::Unit::Assertions
include Test::Unit::Util::BacktraceFilter

�ƥ��ȤϤ��Υ��饹�Υ��֥��饹�Ȥ���������ޤ���

Ties everything together. If you subclass and add your own test methods, it takes care of making them into tests and wrapping those tests into a suite. It also does the nitty-gritty of actually running an individual test and collecting its results into a [[c:Test::Unit::TestResult]] object.

== Class Methods

#@# bc-rdoc: detected missing name: new
--- new(test_method_name)

Creates a new instance of the fixture for running the test represented
by test_method_name.

#@# bc-rdoc: detected missing name: suite
--- suite

Rolls up all of the test* methods in the fixture into one suite,
creating a new instance of the fixture for each method.

== Instance Methods

--- setup
�ƥƥ��ȥ᥽�åɤ��ƤФ������ɬ���ƤФ�ޤ���

--- teardown
�ƥƥ��ȥ᥽�åɤ��ƤФ줿���ɬ���ƤФ�ޤ���

#@# bc-rdoc: detected missing name: name
--- name

Returns a human-readable name for the specific test that this
instance of TestCase represents.

#@# bc-rdoc: detected missing name: run
--- run(result) {|STARTED, name| ...}

Runs the individual test method represented by this instance
of the fixture, collecting statistics, failures and errors in
result.

#@# bc-rdoc: detected missing name: size
--- size

#@# bc-rdoc: detected missing name: default_test
--- default_test

= class Test::Unit::Failure < Object
Encapsulates a test failure. Created by [[c:Test::Unit::TestCase]] when an assertion fails.

== Class Methods
--- new(test_name, location, message)

Creates a new Failure with the given location and message.

== Instance Methods
#@# bc-rdoc: detected missing name: long_display
--- long_display

Returns a verbose version of the error description.

#@# bc-rdoc: detected missing name: short_display
--- short_display

Returns a brief version of the error description.

#@# bc-rdoc: detected missing name: single_character_display
--- single_character_display

Returns a single character representation of a failure.

#@# bc-rdoc: detected missing name: to_s
--- to_s

Overridden to return long_display.

= class Test::Unit::Error < Object

== Class Methods
#@# bc-rdoc: detected missing name: new
--- new(test_name, exception)

Creates a new Error with the given test_name and exception.

== Instance Methods
#@# bc-rdoc: detected missing name: long_display
--- long_display

Returns a verbose version of the error description.

#@# bc-rdoc: detected missing name: message
--- message

Returns the message associated with the error.

#@# bc-rdoc: detected missing name: short_display
--- short_display

Returns a brief version of the error description.

#@# bc-rdoc: detected missing name: single_character_display
--- single_character_display

Returns a single character representation of an error.

#@# bc-rdoc: detected missing name: to_s
--- to_s

Overridden to return long_display.

= class Test::Unit::TestResult < Object
include Test::Unit::Util::Observable

Collects [[c:Test::Unit::Failure]] and [[c:Test::Unit::Error]] so that they can be displayed to the user. To this end, observers can be added to it, allowing the dynamic updating of, say, a UI.

== Class Methods
#@# bc-rdoc: detected missing name: new
--- new

Constructs a new, empty TestResult.

== Instance Methods
#@# bc-rdoc: detected missing name: add_assertion
--- add_assertion

Records an individual assertion.

#@# bc-rdoc: detected missing name: add_error
--- add_error(error)

Records a Test::Unit::Error.

#@# bc-rdoc: detected missing name: add_failure
--- add_failure(failure)

Records a Test::Unit::Failure.

#@# bc-rdoc: detected missing name: add_run
--- add_run

Records a test run.

#@# bc-rdoc: detected missing name: error_count
--- error_count

Returns the number of errors this TestResult has recorded.
#@# bc-rdoc: detected missing name: failure_count
--- failure_count

Returns the number of failures this TestResult has recorded.

#@# bc-rdoc: detected missing name: passed?
--- passed?

Returns whether or not this TestResult represents successful
completion.

#@# bc-rdoc: detected missing name: to_s
--- to_s

Returns a string contain the recorded runs, assertions, failures
and errors in this TestResult.

= class Test::Unit::TestSuite < Object

A collection of tests which can be run.

Note: It is easy to confuse a TestSuite instance with something that has a static suite method; I know because I have trouble keeping them straight. Think of something that has a suite method as simply providing a way to get a meaningful TestSuite instance.


== Class Methods

#@# bc-rdoc: detected missing name: new
--- new(name="Unnamed TestSuite")

Creates a new TestSuite with the given name.

== Instance Methods

#@# bc-rdoc: detected missing name: <<
--- <<(test)

Adds the test to the suite.

#@# bc-rdoc: detected missing name: ==
--- ==(other)

It's handy to be able to compare TestSuite instances.

#@# bc-rdoc: detected missing name: delete
--- delete(test)



#@# bc-rdoc: detected missing name: empty?
--- empty?



#@# bc-rdoc: detected missing name: run
--- run(result, &progress_block) {|STARTED, name| ...}

Runs the tests and/or suites contained in this TestSuite.

#@# bc-rdoc: detected missing name: size
--- size

Retuns the rolled up number of tests in this suite; i.e. if the
suite contains other suites, it counts the tests within those
suites, not the suites themselves.

#@# bc-rdoc: detected missing name: to_s
--- to_s

Overridden to return the name given the suite at creation.

