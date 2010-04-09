require shell/error
require shell/filter
require shell/system-command
require shell/builtin-command

[[c:Shell]] �ǻ��Ѳ�ǽ�ʥ��ޥ�ɤ���Ⱦ���������饤�֥��Ǥ���

= class Shell::CommandProcessor < Object

== Singleton Methods

--- new(shell)
#@todo

--- add_delegate_command_to_shell(id)
#@todo

[[c:Shell]] ���Τ�����������˸ƤӽФ����᥽�åɤǤ���
�桼�������Ѥ��뤳�ȤϤ���ޤ���

@param id �᥽�å�̾����ꤷ�ޤ���

--- alias_command(alias, command, *opts) -> self
--- alias_command(alias, command, *opts){ ... } -> self
#@todo

@param alias �����ꥢ����̾������ꤷ�ޤ���

@param command ���ޥ��̾����ꤷ�ޤ���

@params opts ���ޥ�ɤ�Ϳ���륪�ץ�������ꤷ�ޤ���

@raise SyntaxError ���ޥ�ɤΥ����ꥢ�������˼��Ԥ�������ȯ�����ޤ���

--- alias_map -> Hash

[[m:Shell::CommandProcessor#alias_command]] ��������������ꥢ���ΰ������֤��ޤ���

--- def_builtin_commands(delegation_class, commands_specs) -> ()
#@todo

@param delegation_class ������Ѿ����������饹���⥸�塼�����ꤷ�ޤ���

@param commands_specs ���ޥ�ɤλ��ͤ�ʸ���������ǻ��ꤷ�ޤ���
                      [[���ޥ��̾, [����1, ����2, ...]], ...]



--- def_system_command(command, path = command) -> ()
#@todo

Ϳ����줿���ޥ�ɤ�᥽�åɤȤ���������ޤ���

@param command ������������ޥ�ɤ���ꤷ�ޤ���

@param path command �Υѥ�����ꤷ�ޤ�����ά����ȴĶ��ѿ� PATH ���� command ��õ���ޤ���

--- initialize -> ()
#@todo

���Υ��饹���������ޤ���

--- install_builtin_commands -> ()

�ӥ�ȥ��󥳥ޥ�ɤ�������ޤ���

--- install_system_commands -> (prefix = "sys_")

���ƤΥ����ƥॳ�ޥ�ɤ�᥽�åɤȤ���������ޤ���

�����������Ƥ��륳�ޥ�ɤ��������뤳�ȤϤ���ޤ���
�ǥե���ȤǤ����ƤΥ��ޥ�ɤ� "sys_" �Ȥ����ץ�ե��������դ��ޤ���
�ޤ����᥽�å�̾�Ȥ��ƻ��ѤǤ��ʤ�ʸ�������� "_" ���ִ����ƥ᥽�åɤ�������ޤ���
���Υ᥽�åɤμ¹����ȯ�������㳰��ñ��̵�뤵��ޤ���

@param prefix �ץ�ե���������ꤷ�ޤ���

--- method_added(id)
#@todo
���Υ��饹��������줿�᥽�åɤ� [[c:Shell]] �ˤ�������뤿��Υեå��Ǥ���

@param id �᥽�å�̾����ꤷ�ޤ���

--- run_config -> ()

�桼���Υۡ���ǥ��쥯�ȥ�� "~/.rb_shell" �Ȥ����ե����뤬¸�ߤ���С������ [[m:Kernel.#load]] ���ޤ���

¸�ߤ��ʤ����ϲ��⤷�ޤ���

--- unalias_command(alias) -> self

�����ꥢ���������ޤ���

@param alias ��������������ꥢ������ꤷ�ޤ���

--- undef_system_command(command) -> self

Ϳ����줿���ޥ�ɤ������ޤ���

@param command ������������ޥ��̾����ꤷ�ޤ���


== Instance Methods

--- expand_path(path) -> String

File���饹�ˤ���Ʊ̾�Υ��饹�᥽�åɤ�Ʊ���Ǥ�.

@param path �ե�����̾��ɽ��ʸ�������ꤷ�ޤ���

@see [[m:File.expand_path]]


#@include(builtincommands)


== Constants

--- NoDelegateMethods -> [String]

�����ǻ��Ѥ�������Ǥ���

