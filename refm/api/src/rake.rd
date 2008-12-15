
Rake �Ȥ������ޥ�ɥ饤��ġ���򰷤��饤�֥��Ǥ���

=== Rake �Ȥ�

Rake �� Make �ˤ褯������ǽ����� Ruby �ǽ񤫤줿����ץ�ʥӥ�ɥġ���Ǥ���

Rake �ϰʲ��Τ褦����ħ����äƤ��ޤ���

  * Rakefile (Rake �ˤ����� Makefile) ��ɸ��Ū�� Ruby ��ʸˡ�ǽ񤯤��Ȥ��Ǥ��ޤ���
    XML �ե�������Խ�����ɬ�פϤ���ޤ��󤷡�Makefile �����Ѥ���ʸˡ (���֤��ä������ڡ������ä���) ��Ƭ��Ǻ�ޤ���ɬ�פ⤢��ޤ���
  * �桼����ɬ�ܾ��򥿥����˻���Ǥ��ޤ���
  * Rake �ϰ��ۤΥ�������������뤳�Ȥ򥵥ݡ��Ȥ��Ƥ��ޤ���
  * ����Τ褦�˿����񤦥ե쥭���֥�� FileList �᥽�åɤ�����ޤ���
    FileList �ϥե�����̾��ѥ�̾�򰷤��Τ������Ǥ���
  * Rakefile �����ñ�˺������뤿��ˤ��Υ饤�֥��ˤϤ����Ĥ��Υ�������Ʊ������Ƥ��ޤ���

@see [[man:make(1)]]

=== Rake ���ޥ�ɤλȤ���

  $ rake --help
  rake [-f rakefile] {options} targets...
  Options are ...
      -C, --classic-namespace       �ȥåץ�٥�� Task, FileTask ��������ޤ���
                                    ���Ȥθߴ����Τ���Υ��ץ����Ǥ���
      -D, --describe [PATTERN]      �ѥ�����˥ޥå������������ξܺ٤�ɽ�����ƽ�λ���ޤ���
                                    �ѥ�����Ͼ�ά��ǽ�Ǥ���
      -n, --dry-run                 ����������¹Ԥ����˥�������¹Ԥ��ޤ���
      -e, --execute CODE            Ruby �Υ����ɤ�¹Ԥ��ƽ�λ���ޤ���
      -p, --execute-print CODE      Ruby �Υ����ɤ�¹Ԥ��Ʒ�̤�ɽ�����ƽ�λ���ޤ���
      -E, --execute-continue CODE   Ruby �Υ����ɤ�¹Ԥ��Ƥ��顢��������¹Ԥ��ޤ���
      -I, --libdir LIBDIR           ���ɥѥ��� LIBDIR ��ޤ�ޤ���
      -P, --prereqs                 �������ΰ�¸�ط���ɽ�����ƽ�λ���ޤ���
      -q, --quiet                   ɸ����Ϥ˥���å�������ɽ�����ޤ���
      -f, --rakefile [FILE]         FILE �� Rakefile �Ȥ��ƻ��Ѥ��ޤ���
      -R, --rakelibdir RAKELIBDIR   RAKELIBDIR �ˤ��� *.rake �ե������ưŪ�˥���ݡ��Ȥ��ޤ���
          --rakelib                 �ǥե���Ȥ� rakelib �Ǥ���
      -r, --require MODULE          Rakefile ��¹Ԥ������� MODULE �� require ���ޤ���
          --rules                   �롼��β������פ��ޤ���
      -N, --no-search, --nosearch   �ƥǥ��쥯�ȥ�� Rakefile �򸡺����ޤ���
      -s, --silent                  --quiet �˻��Ƥ��ޤ������ǥ��쥯�ȥ��ɽ�����ޤ���
      -g, --system                  �����ƥ����Τ� Rakefile ����Ѥ��ޤ���('~/.rake/*.rake')
      -G, --no-system, --nosystem   �����ƥ����Τ� Rakefile ����Ѥ��ޤ���
      -T, --tasks [PATTERN]         �ѥ�����˥ޥå�������������û��������ɽ�����ƽ�λ���ޤ���
                                    �ѥ�����Ͼ�ά��ǽ�Ǥ���
      -t, --trace                   ���ƤΥХå��ȥ졼����ɽ�����ޤ���
      -v, --verbose                 ɸ����Ϥ˥���å�������ɽ�����ޤ� (�ǥե����)��
      -V, --version                 ���Υץ����ΥС�������ɽ�����ޤ���
      -h, -H, --help                ���Υ�å�������ɽ�����ޤ���

=== Rake �ե�����ν���

�줫�����Ƽ�ʬ�ǽ񤯤��Ȥ����ޤ��������餫�����������Ƥ��륿������
���Ѥ�������Ūʣ���ʥ��������ñ��������뤳�Ȥ��Ǥ��ޤ���
�ޤ����롼���ե����륿�����򤦤ޤ��Ȥ��ȥ�������ʷ�˽񤯤��Ȥ�
������礬����ޤ���Rakefile �����̤� Ruby ������ץȤ�Ʊ��ʸˡ��
�񤯤��Ȥ��Ǥ���Τǹ��׼���� Ruby �ˤǤ��뤳�Ȥʤ鲿�Ǥ�Ǥ��ޤ���

��ñ����:
  # coding: utf-8
  task :hello do
    puts 'do task hello!'
  end

ưŪ�˥����������������:
  # cofing: utf-8
  require 'rake/testtask'
  require 'rake/clean'    # clean, clobber ����ĤΥ����������
  task :default => [:test]
  
  1.upto(8) do |n|
    Rake::TestTask.new("test_step#{n}") do |t|
      t.libs << "step#{n}"
      t.test_files = FileList["step#{n}/test_*.rb"]
      t.verbose = false
    end
  end
  
  desc 'execute all test'
  task 'test_all' => (1..8).to_a.map{|n| "test_step#{n}"}

=== �Ѹ콸

#@include(rake/glossary.rd)


#@include(rake/core_ext)

#@include(rake/Rake)
#@include(rake/Rake__Application)
#@include(rake/Rake__Cloneable)
#@include(rake/Rake__DefaultLoader)
#@include(rake/Rake__EarlyTime)
#@include(rake/Rake__FileCreationTask)
#@include(rake/Rake__FileList)
#@include(rake/Rake__FileTask)
#@include(rake/Rake__InvocationChain)
#@include(rake/Rake__MultiTask)
#@include(rake/Rake__NameSpace)
#@include(rake/Rake__Task)
#@include(rake/Rake__TaskArguments)
#@include(rake/Rake__TaskManager)

#@include(rake/RakeFileUtils)
