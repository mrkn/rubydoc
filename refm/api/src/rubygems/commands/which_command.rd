require rubygems/command
require rubygems/gem_path_searcher

���ꤵ�줿 Gem �ѥå������˴ޤޤ��饤�֥��Υѥ��򸫤Ĥ��뤿��Υ饤�֥��Ǥ���

= class Gem::Commands::WhichCommand < Gem::Command

���ꤵ�줿 Gem �ѥå������˴ޤޤ��饤�֥��Υѥ��򸫤Ĥ��뤿��Υ��饹�Ǥ���

  Usage: gem which FILE [...] [options]
    Options:
      -a, --[no-]all                   show all matching files
      -g, --[no-]gems-first            search gems before non-gems
#@include(common_options)
    Arguments:
      FILE          Gem �ѥå�����̾����ꤷ�ޤ�
    Summary:
      ���ꤵ�줿 Gem �ѥå������Υ饤�֥��Τ������ɽ�����ޤ�
    Defaults:
      --no-gems-first --no-all


== Public Instance Methods
--- find_paths(package_name, dirs) -> Array
#@todo


@param package_name Gem �ѥå�������̾������ꤷ�ޤ���

@param dirs õ������ǥ��쥯�ȥ����ꤷ�ޤ���

--- gem_paths(spec) -> Array
#@todo


@param spec

== Constants

--- EXT -> Array
#@todo

��ĥ�Ҥ�ɽ������Ǥ���
