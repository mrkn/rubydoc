require rubygems/command
require rubygems/command_manager
require rubygems/install_update_options
require rubygems/local_remote_options
require rubygems/spec_fetcher
require rubygems/version_option
require rubygems/commands/install_command

�������ݥ��ȥ�˥��󥹥ȡ��뤵��Ƥ��� Gem �ѥå������򹹿����뤿��Υ饤�֥��Ǥ���

= class Gem::Commands::UpdateCommand < Gem::Command
include Gem::InstallUpdateOptions
include Gem::LocalRemoteOptions
include Gem::VersionOption

�������ݥ��ȥ�˥��󥹥ȡ��뤵��Ƥ��� Gem �ѥå������򹹿����뤿��Υ��饹�Ǥ���

== Public Instance Methods
--- do_rubygems_update(version)
#@todo


--- which_to_update(highest_installed_gems, gem_names)
#@todo

