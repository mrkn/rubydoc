require rubygems/command
require rubygems/remote_fetcher
require rubygems/source_info_cache
require rubygems/spec_fetcher

Gem �ѥå������μ������ξ����������뤿��Υ饤�֥��Ǥ���

  Usage: gem sources [options]
    Options:
      -a, --add SOURCE_URI             ���������ɲä��ޤ�
      -l, --list                       ������������ɽ�����ޤ�
      -r, --remove SOURCE_URI          �������������ޤ�
      -u, --update                     �������Υ���å���򹹿����ޤ�
      -c, --clear-all                  ���Ƥμ�����������������å���⥯�ꥢ���ޤ�
#@include(common_options)
    Summary:
      Gem �ѥå������μ������ξ����������ޤ�
    Defaults:
      --list



= class Gem::Commands::SourcesCommand < Gem::Command

Gem �ѥå������μ������ξ����������뤿��Υ��饹�Ǥ���


