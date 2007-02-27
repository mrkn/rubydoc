#@since 1.8.1
= class Test::Unit::AutoRunner


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
#@todo
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
#@todo

#@end
