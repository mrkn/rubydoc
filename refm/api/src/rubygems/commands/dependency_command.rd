require rubygems/command
require rubygems/local_remote_options
require rubygems/version_option
require rubygems/source_info_cache

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������ΰ�¸�ط���ɽ�����뤿��Υ饤�֥��Ǥ���

  Usage: gem dependency GEMNAME [options]
    Options:
      -v, --version VERSION            ���ꤷ���С������ΰ�¸�ط���ɽ�����ޤ�
          --platform PLATFORM          ���ꤷ���ץ�åȥե�����ΰ�¸�ط���ɽ�����ޤ�
      -R, --[no-]reverse-dependencies  ���� Gem ����Ѥ��Ƥ��� Gem ��ɽ�����ޤ�
      -p, --pipe                       Pipe Format (name --version ver)
#@include(local_remote_options)
#@include(common_options)
    Arguments:
      GEMNAME       ��¸�ط���ɽ������ Gem ��̾������ꤷ�ޤ�
    Summary:
      ���󥹥ȡ��뤵��Ƥ��� Gem �ΰ�¸�ط���ɽ�����ޤ�
    Defaults:
      --local --version '>= 0' --no-reverse-dependencies


= class Gem::Commands::DependencyCommand < Gem::Command
include Gem::LocalRemoteOptions
include Gem::VersionOption

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������ΰ�¸�ط���ɽ�����뤿��Υ��饹�Ǥ���


== Public Instance Methods

--- find_gems(name, source_index) -> Hash
#@todo

@param name

@param source_index

--- find_reverse_dependencies(spec) -> Array
#@todo

@param spec

--- print_dependencies(spec, level = 0) -> String
#@todo

@param spec

@param level
