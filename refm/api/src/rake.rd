
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
  
  ���ץ���� ...
  
    --classic-namespace  (-C)
        Put Task and FileTask in the top level namespace
    --describe=PATTERN   (-D)
        PATTERN �˥ޥå������������ξܺ٤�ɽ�����ޤ���PATTERN ���ά���������������ɽ�����ޤ���
    --dry-run            (-n)
        Do a dry run without executing actions.
        ���򤹤뤫ɽ�����ޤ������ºݤˤϲ��⤷�ޤ���
    --help               (-h)
        ���Υ�å�������ɽ�����ޤ���
    --libdir=LIBDIR      (-I)
        $LOAD_PATH ����ꤷ�ޤ���
    --nosearch           (-N)
        �ƥǥ��쥯�ȥ�� Rakefile ��õ�����ޤ���
    --prereqs            (-P)
        �������Ȱ�¸�ط���ɽ�����ޤ���
    --quiet              (-q)
        ����å�������ɸ����Ϥ˽��Ϥ��ޤ���
    --rakefile=FILE      (-f)
        FILE �� Rakefile �Ȥ��ƻ��Ѥ��ޤ���
    --rakelibdir=RAKELIBDIR (-R)
        RAKELIBDIR �ˤ��� *.rake �Ȥ����ե������ưŪ���ɤ߹��ߤޤ���(�ǥե���Ȥ� 'rakelib' �Ǥ�)
    --require=MODULE     (-r)
        Rakefile ��¹Ԥ������� MODULE ���ɤ߹��ߤޤ���
    --silent             (-s)
        --quiet �Τ褦��ư��ޤ��������ߤΥǥ��쥯�ȥ��ɽ�����ޤ���
    --tasks=PATTERN      (-T)
        PATTERN �˥ޥå�������������������ɽ�����ޤ���PATTERN ���ά���������������ɽ�����ޤ���
    --trace              (-t)
        Turn on invoke/execute tracing, enable full backtrace.
        ��ư/�¹Ԥ����������Υȥ졼������Ϥ��ޤ����Хå��ȥ졼��������ɽ�����ޤ���
    --verbose            (-v)
        ɸ����Ϥ˥���å���������Ϥ��ޤ��� (�ǥե����).
    --version            (-V)
        ���Υץ����ΥС�������ɽ�����ޤ���


=== Rake �ե�����ν���

��ñ����:
  


=== �Ѹ콸

#@include(rake/glossary.rd)


#@include(rake/core_ext)

#@include(rake/Rake)
#@include(rake/Rake__Application)
#@include(rake/Rake__Cloneable)
#@include(rake/Rake__DefaultLoader)
#@include(rake/Rake__EarlyTime)
#@include(rake/Rake__FileList)



