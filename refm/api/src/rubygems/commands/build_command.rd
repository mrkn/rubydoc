require rubygems/command
require rubygems/builder

Gem �ѥå�������ӥ�ɤ��뤿��Υ饤�֥��Ǥ���


  Usage: gem build GEMSPEC_FILE [options]
#@include(common_options)
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
