require rubygems/command
require rubygems/local_remote_options
require rubygems/spec_fetcher
require rubygems/version_option

������ɬ�פ� Gem �ѥå������ΰ�������Ϥ��뤿��Υ饤�֥��Ǥ���

  Usage: gem outdated [options]
    Options:
          --platform PLATFORM          ���ꤵ�줿�ץ�åȥե�����˴ؤ�������ɽ�����ޤ�
#@include(local_remote_options)
#@include(common_options)
    Summary:
      ������ɬ�פ� Gem �ѥå�����������ɽ�����ޤ���


= class Gem::Commands::OutdatedCommand < Gem::Command

������ɬ�פ� Gem �ѥå������ΰ�������Ϥ��뤿��Υ��饹�Ǥ���


