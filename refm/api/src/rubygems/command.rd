require rubygems/user_interaction

gem ���ޥ�ɤ򰷤�����Υ饤�֥��Ǥ���

= class Gem::Command
include Gem::UserInteraction

���Ƥ� gem ���ޥ�ɤΥ����ѡ����饹�Ǥ���

== Public Instance Methods

--- add_extra_args(args) -> Array
#@todo

???

@param args �ɲä������������ǻ��ꤷ�ޤ���

--- add_option(*opts){|value, options| ... }
#@todo ???

���ޥ�ɤ��Ф��륳�ޥ�ɥ饤�󥪥ץ����ȥϥ�ɥ���ɲä��ޤ���

@param opts ���ץ�������ꤷ�ޤ���

@see [[m:OptionParser#make_switch]]

--- arguments -> String
#@todo

���Υ᥽�åɤϥ��֥��饹�Ǻ��������ޤ���
���ޥ�ɤ���������������ɽ�����뤿��˻��Ѥ��ޤ���

���֥��饹�Ǽ���������ϡ���Ĥΰ����ˤĤ���Ԥǡ���·����ʸ������֤��褦�ˤ��Ƥ���������

--- begins?(long, short) -> bool
#@todo

long �� short �ǻϤޤ�ʸ����Ǥ����翿���֤��ޤ��������Ǥʤ����ϵ����֤��ޤ���

@param long Ĺ�����ޥ�ɥ饤�󥪥ץ�������ꤷ�ޤ���

@param short û�����ޥ�ɥ饤�󥪥ץ�������ꤷ�ޤ���

--- command -> String
#@todo

���ޥ�ɤ�̾�����֤��ޤ���

--- defaults -> Hash
#@todo

�ǥե���ȤΥ��ץ������֤��ޤ���

--- defaults=(hash)
#@todo

���ޥ�ɤǻ��Ѥ���ǥե���ȤΥ��ץ����򥻥åȤ��ޤ���

@param hash ���ץ�����ϥå���ǻ��ꤷ�ޤ���

--- defaults_str -> String
#@todo

���Υ᥽�åɤϥ��֥��饹�Ǻ��������ޤ���
���ޥ�ɤΥ��ץ����ǻ��Ѥ���ǥե�����ͤ�ɽ�����뤿��˻��Ѥ���ʸ������֤��ޤ���

@see [[m:Gem::Command#arguments]]

--- description -> String
#@todo

���Υ᥽�åɤϥ��֥��饹�Ǻ��������ޤ���
���ޥ�ɤ��¹Ԥ��뤳�Ȥ���������ʸ������֤��ޤ���

--- execute -> ()
#@todo

���Υ᥽�åɤϥ��֥��饹�Ǻ��������ޤ���
���ޥ�ɤ�¹Ԥ��ޤ���

@raise RuntimeError ���Υ᥽�åɤ����֥��饹�Ǻ��������Ƥ��ʤ�����ȯ�����ޤ���

--- get_all_gem_names -> Array
#@todo

���ޥ�ɥ饤���Ϳ����줿 Gem ��̾�������Ƽ��������֤��ޤ���

@raise Gem::CommandLineError ���ޥ�ɥ饤��������� Gem ��̾��������Ǥ��ʤ�����ȯ�����ޤ���

--- get_one_gem_name -> String
#@todo

���ޥ�ɥ饤���Ϳ����줿 Gem ��̾�����ļ��������֤��ޤ���

@raise Gem::CommandLineError ���ޥ�ɥ饤��������� Gem ��̾�����Ĥ��������Ǥ��ʤ�����ȯ�����ޤ���

--- get_one_optional_argument -> String
#@todo

���ޥ�ɥ饤�󤫤饪�ץ���ʥ�ʰ�������������֤��ޤ���

@return ��İʾ塢���ꤷ�����Ϻǽ���ͤ��֤��ޤ�����Ĥ���ꤷ�Ƥ��ʤ����� nil ���֤��ޤ���

--- handle_options(args)
#@todo

@param args �����Υꥹ�Ȥ���ꤷ�ޤ���

--- handles?(args) -> bool
#@todo

Ϳ����줿�����Υꥹ�Ȥ�������뤳�Ȥ������п����֤��ޤ��������Ǥ��ʤ����ϵ����֤��ޤ���

@param args

--- invoke(*args)
#@todo

Ϳ����줿��������Ѥ��ƥ��ޥ�ɤ�ƤӽФ��ޤ���

@param args

--- merge_options(new_options)
#@todo

Ϳ����줿���ץ����ȥǥե���ȤΥ��ץ�����ޡ������ޤ���
�����������������ץ�����Ʊ��Υ��������äƤ�ǥե���ȤΥ��ץ������ѹ�����ޤ���

--- options -> Hash
#@todo

���ޥ�ɤǻ��Ѥ��륪�ץ������֤��ޤ���

--- program_name -> String
#@todo

���ޥ�ɥ饤��Ǽ¹Ԥ���Ȥ��˻��Ѥ���ץ����̾���֤��ޤ���


--- program_name=(name)
#@todo

���ޥ�ɥ饤��Ǽ¹Ԥ���Ȥ��˻��Ѥ���ץ����̾�򥻥åȤ��ޤ���

@param name �ץ����̾����ꤷ�ޤ���

--- remove_option(name)
#@todo

Ϳ����줿̾���˰��פ��륳�ޥ�ɥ饤�󥪥ץ����������ޤ���

--- show_help
#@todo

���ޥ�ɤλ�����ˡ��ɽ�����ޤ���

--- summary -> String
#@todo

���ޥ�ɤ�û���������֤��ޤ���

--- summary=(description)
#@todo

���ޥ�ɤ�û�������򥻥åȤ��ޤ���

@param description ���ޥ�ɤ�û����������ꤷ�ޤ���

--- usage -> String
#@todo

���Υ᥽�åɤϥ��֥��饹�Ǻ��������ޤ���
�ġ��� gem ���ޥ�ɤλ�����ˡ���֤��ޤ���

--- when_invoked
#@todo

���ޥ�ɤ��¹Ԥ��줿�Ȥ���ɾ������֥�å�����Ͽ���ޤ���

�̾�Υ��ޥ�ɸƤӽФ��ϡ����Υ��ޥ�ɥ��饹�� execute �᥽�åɤ�¹Ԥ�������Ǥ���
���Υ᥽�åɤǥ֥�å�����Ͽ����ȡ��̾�θƤӽФ����񤭤��뤳�Ȥ��Ǥ��ޤ���
����ϥƥ��ȥ᥽�åɤ����������ޥ�ɤθƤӽФ����¹Ԥ��줿���Ȥ��ǧ����Τ˻��Ѥ��뤳�Ȥ�����ޤ���

== Singleton Methods

--- add_common_option(*args){|value, options| ... }
#@todo

���ƤΥ��ޥ�ɤ˶��̤��륪�ץ�������Ͽ���뤿��Υ᥽�åɤǤ���

@param args

--- add_specific_extra_args(cmd, args)
#@todo

Ϳ����줿���ޥ�ɤ��б������ɲäΰ������ɲä��ޤ���

@param cmd ���ޥ��̾����ꤷ�ޤ���

@param args �ɲäΰ��������󤫡�����Ƕ��ڤä�ʸ����ǻ��ꤷ�ޤ���

--- common_options -> Array
#@todo

���̤ΰ������֤��ޤ���

--- extra_args -> Array
#@todo

�ɲäΰ������֤��ޤ���

--- extra_args=(value)
#@todo

�ɲäΰ����򥻥åȤ��ޤ���

@param value �������ꤷ�ޤ���

--- specific_extra_args(cmd) -> Array
#@todo

Ϳ����줿���ޥ�ɤ��б������ɲäΰ������֤��ޤ���

���̤��ɲð����ϥץ����γ��ϻ��� Gem ������ե����뤫���ɤ߹��ޤ�ޤ���

@param cmd ���ޥ��̾����ꤷ�ޤ���

--- specific_extra_args_hash -> Hash
#@todo

���̤��ɲð����ؤΥ����������󶡤��ޤ���

== Constants

--- HELP -> String
#@todo
�إ�ץ�å�������ɽ��ʸ����Ǥ���

