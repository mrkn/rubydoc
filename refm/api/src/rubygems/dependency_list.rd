

= class Gem::DependencyList

include TSort

== Public Instance Methods

--- add(*gemspecs)
#@todo

Ϳ����줿 [[c:Gem::Specification]] �Υ��󥹥��󥹤򼫿Ȥ��ɲä��ޤ���

@param gemspecs [[c:Gem::Specification]] �Υ��󥹥��󥹤��İʾ���ꤷ�ޤ���

--- dependency_order -> [Gem::Specification]
#@todo

#@# �����ʤ�
��¸���� Gem �ο������ʤ���˥����Ȥ��줿 [[c:Gem::Specification]] �Υꥹ�Ȥ��֤��ޤ���

--- find_name(full_name) -> Gem::Specification | nil
#@todo

���Ȥ˴ޤޤ��Ϳ����줿̾������� [[c:Gem::Specification]] �Υ��󥹥��󥹤��֤��ޤ���

���Ĥ���ʤ��ä����� nil ���֤��ޤ���

@params full_name �С�������ޤ�ե�͡���� Gem ��̾������ꤷ�ޤ���

@see [[m:Gem::Specification#full_name]]

--- ok? -> bool
#@todo

���Ȥ˴ޤޤ�����Ƥ� [[c:Gem::Specification]] ����¸�ط����������Ƥ���п����֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

--- ok_to_remove?(full_name) -> bool
#@todo

Ϳ����줿̾������� [[c:Gem::Specification]] �򼫿Ȥ��������Ƥ� OK �ʾ��Ͽ����֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

Ϳ����줿̾������� [[c:Gem::Specification]] �򼫿Ȥ���������ȡ�
��¸�ط�������Ƥ��ޤ���礬������������ƤϤ����ʤ����Ǥ���

@params full_name �С�������ޤ�ե�͡���� Gem ��̾������ꤷ�ޤ���

@see [[m:Gem::Specification#full_name]]

--- remove_by_name(full_name) -> Gem::Specification
#@todo

Ϳ����줿̾������� [[c:Gem::Specification]] �򼫿Ȥ��������ޤ���

���Υ᥽�åɤǤϺ����ΰ�¸�ط�������å����ޤ���

@params full_name �С�������ޤ�ե�͡���� Gem ��̾������ꤷ�ޤ���

@see [[m:Gem::Specification#full_name]], [[m:Array#delete_if]]

--- spec_predecessors -> Hash
#@todo

#@# �褯�狼��ʤ���
#@# [[c:Gem::Specification]] => Array of [[c:Gem::Specification]]


== Singleton Methods

--- from_source_index(src_index) -> Gem::DependencyList
#@todo

Ϳ����줿 [[c:Gem::SourceIndex]] �Υ��󥹥��󥹤��鼫�Ȥ�������ޤ���

@param src_index [[c:Gem::SourceIndex]] ����ꤷ�ޤ���

@see [[c:Gem::SourceIndex]]
