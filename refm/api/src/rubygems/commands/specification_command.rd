require rubygems/command
require rubygems/local_remote_options
require rubygems/version_option
require rubygems/source_info_cache
require rubygems/format

���ꤵ�줿 Gem �ѥå������� gemspec �ξ���� YAML ������ɽ�����뤿��Υ饤�֥��Ǥ���

  Usage: gem specification [GEMFILE] [options]
    Options:
      -v, --version VERSION            Specify version of gem to examine
          --platform PLATFORM          Specify the platform of gem to specification
          --all                        Output specifications for all versions of
                                       the gem
#@include(local_remote_options)
#@include(common_options)
    Arguments:
      GEMFILE       gemspec ��ɽ������ Gem �ѥå�����̾����ꤷ�ޤ�
    Summary:
      Gem �ѥå������λ��ͤ� YAML ������ɽ�����ޤ�
    Defaults:
      --local --version '>= 0'


= class Gem::Commands::SpecificationCommand < Gem::Command
include Gem::LocalRemoteOptions
include Gem::VersionOption

���ꤵ�줿 Gem �ѥå������� gemspec �ξ���� YAML ������ɽ�����뤿��Υ��饹�Ǥ���
