require rubygems/command
require rubygems/builder

Gem �ѥå�������ӥ�ɤ��뤿��Υ饤�֥��Ǥ���


  Usage: gem build GEMSPEC_FILE [options]
    Common Options:
      -h, --help                       ���Υ��ޥ�ɤΥإ�פ�ɽ�����ޤ�
      -V, --[no-]verbose               ɽ����ܺ٤ˤ��ޤ�
      -q, --quiet                      �Ť��˼¹Ԥ��ޤ�
          --config-file FILE           ���ꤵ�줿����ե��������Ѥ��ޤ�
          --backtrace                  �Хå��ȥ졼����ɽ�����ޤ�
          --debug                      Ruby ���ΤΥǥХå����ץ�����ͭ���ˤ��ޤ�
    Arguments:
      GEMSPEC_FILE  Gem �ѥå�������ӥ�ɤ���Τ�ɬ�פ� gemspec �ե�����̾����ꤷ�ޤ�
    Summary:
      gemspec �ե����뤫�� Gem �ѥå�������ӥ�ɤ��ޤ�


= class Gem::Commands::BuildCommand < Gem::Command

Gem �ѥå�������ӥ�ɤ��뤿��Υ��饹�Ǥ���

== Public Instance Methods

--- load_gemspecs(filename) -> Array
#@todo

gemspec �ե��������ɤ��ޤ���

@param filename �ե�����̾����ꤷ�ޤ���

--- usage -> String
#@todo

������ˡ��ɽ��ʸ������֤��ޤ���

--- yaml?(filename) -> bool
#@todo

������ yaml �ե�����Ǥ�����˿����֤��ޤ���

@param filename �ե�����̾����ꤷ�ޤ���
