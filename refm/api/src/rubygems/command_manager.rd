require rubygems/command
require rubygems/user_interaction
#@# --
require rubygems/commands/build_command
require rubygems/commands/cert_command
require rubygems/commands/check_command
require rubygems/commands/cleanup_command
require rubygems/commands/contents_command
require rubygems/commands/dependency_command
require rubygems/commands/environment_command
require rubygems/commands/fetch_command
require rubygems/commands/generate_index_command
require rubygems/commands/help_command
require rubygems/commands/install_command
require rubygems/commands/list_command
require rubygems/commands/lock_command
require rubygems/commands/mirror_command
require rubygems/commands/outdated_command
require rubygems/commands/pristine_command
require rubygems/commands/query_command
require rubygems/commands/rdoc_command
require rubygems/commands/search_command
require rubygems/commands/server_command
require rubygems/commands/sources_command
require rubygems/commands/specification_command
require rubygems/commands/stale_command
require rubygems/commands/uninstall_command
require rubygems/commands/unpack_command
require rubygems/commands/update_command
require rubygems/commands/which_command


gem ���ޥ�ɤˤ�äƥ��ݡ��Ȥ���Ƥ��륵�֥��ޥ�ɤ��������饤�֥��Ǥ���

= class Gem::CommandManager
include Gem::UserInteraction

== Singleton Methods

--- instance -> Gem::CommandManager

���Ȥ򥤥󥹥��󥹲����ޤ���


== Public Instance Methods

--- [](command_name) -> Gem::Command | nil
#@todo

�����ǻ��ꤵ�줿���ޥ��̾���б����륯�饹�Υ��󥹥��󥹤��֤��ޤ���

@param command_name ���ޥ��̾��ʸ����ǻ��ꤷ�ޤ���

@return [[c:Gem::Command]] �Υ��֥��饹�Υ��󥹥��󥹤��֤��ޤ���

@raise NameError ��Ͽ����Ƥ��ʤ����ޥ�ɤ���ꤷ������ȯ�����ޤ���

--- command_names -> Array
#@todo
��Ͽ����Ƥ��륳�ޥ��̾��������֤��ޤ���

--- find_command(command_name) -> Gem::Command | nil
#@todo

��Ͽ����Ƥ��륳�ޥ�ɤ���ޥå�������Τ��֤��ޤ���

@param command_name ���ޥ��̾��ʸ����ǻ��ꤷ�ޤ���

@return [[c:Gem::Command]] �Υ��֥��饹�Υ��󥹥��󥹤��֤��ޤ���

@raise StandardError �ޥå������ǽ���Τ��륳�ޥ�ɤ�ʣ���������ȯ�����ޤ���
                     �ޤ����ޥå����륳�ޥ�ɤ�̵���ä����ˤ�ȯ�����ޤ���

--- find_command_possibilities(command_name) -> Array
#@todo

��Ͽ����Ƥ��륳�ޥ�ɤǥޥå������ǽ���Τ����Τ��֤��ޤ���

@param command_name ���ޥ��̾��ʸ����ǻ��ꤷ�ޤ���

--- process_args(args) -> ()
#@todo

���� args ��������� gem ���ޥ�ɤ�¹Ԥ��뤿���ɬ�פʽ�����Ԥ��ޤ���

@param args ���ޥ�ɥ饤�󤫤������ä���������ꤷ�ޤ���

--- register_command(command_name) -> false
#@todo

���ޥ�ɤ򼫿Ȥ���Ͽ���ޤ���

@param command_name ���ޥ��̾����ꤷ�ޤ���

--- run(args) -> ()
#@todo

���� args ��������� gem ���ޥ�ɤ�¹���Υ��顼����ª���ޤ���

@param args ���ޥ�ɥ饤�󤫤������ä���������ꤷ�ޤ���

