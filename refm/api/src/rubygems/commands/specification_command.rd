require rubygems/command
require rubygems/local_remote_options
require rubygems/version_option
require rubygems/source_info_cache
require rubygems/format

���ꤵ�줿 Gem �ѥå������� gemspec �ξ���� YAML ������ɽ�����뤿��Υ饤�֥��Ǥ���

= class Gem::Commands::SpecificationCommand < Gem::Command
include Gem::LocalRemoteOptions
include Gem::VersionOption

���ꤵ�줿 Gem �ѥå������� gemspec �ξ���� YAML ������ɽ�����뤿��Υ��饹�Ǥ���
