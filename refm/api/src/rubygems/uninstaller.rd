require rubygems
require rubygems/dependency_list
require rubygems/doc_manager
require rubygems/user_interaction

Gem �Υ��󥤥󥹥ȡ����Ԥ�����Υ饤�֥��Ǥ���

= class Gem::Uninstaller
include Gem::UserInteraction

Gem �Υ��󥤥󥹥ȡ����Ԥ�����Υ��饹�Ǥ���

== Public Instance Methods

--- ask_if_ok(spec) -> bool
#@todo

���󥤥󥹥ȡ�����ꤵ�줿 Gem ��������Ȱ�¸�ط����������ʤ��ʤ���˸ƤӽФ���ޤ���

@param spec ���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �� [[c:Gem::Specification]] ����ꤷ�ޤ���

--- bin_dir -> String
#@todo

Gem �ǥ��󥹥ȡ��뤵�줿���ޥ�ɤΤ���ǥ��쥯�ȥ���֤��ޤ���

--- dependencies_ok?(spec) -> bool
#@todo

���󥤥󥹥ȡ�����ꤵ�줿 Gem �������Ƥ��¸�ط������������Ȥ��Ǥ��뤫
�ɤ��������å����ޤ���

@param spec ���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �� [[c:Gem::Specification]] ����ꤷ�ޤ���

--- gem_home -> String
#@todo

Gem �����󥹥ȡ��뤵��Ƥ���ǥ��쥯�ȥ���֤��ޤ���

--- path_ok?(spec) -> bool
#@todo

���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �����󥹥ȡ��뤵��Ƥ���ѥ�������å����ޤ���

@param spec [[c:Gem::Specification]] ����ꤷ�ޤ���


--- remove(spec, list)
#@todo

���ꤵ�줿 Gem �������ޤ���

@param spec ���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �� [[c:Gem::Specification]] ����ꤷ�ޤ���

@param list ���󥤥󥹥ȡ��뤹�� Gem �Υꥹ�Ȥ���ꤷ�ޤ���
            ���Υѥ�᡼�����˲�Ū���ѹ�����ޤ���

@raise Gem::DependencyRemovalException ���󥤥󥹥ȡ�����ꤵ�줿 Gem ���������
                                       ��¸�ط�����������ȯ�����ޤ���

@raise Gem::GemNotInHomeException ���󥤥󥹥ȡ�����ꤵ�줿 Gem �������
                                  �ǥ��쥯�ȥ�ˤ���ʤ����ʤ�����ȯ�����ޤ���

--- remove_all(list)
#@todo

list ��Ϳ����줿 Gem �����ƥ��󥤥󥹥ȡ��뤷�ޤ���

@param list ���󥤥󥹥ȡ��뤹�� Gem �Υꥹ�Ȥ���ꤷ�ޤ���

--- remove_executables(gemspec)
#@todo

Ϳ����줿 [[c:Gem::Specification]] ���б�����¹ԥե�����������ޤ���

@param gemspec ���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �� [[c:Gem::Specification]] ����ꤷ�ޤ���

--- spec -> Gem::Specification
#@todo

[[m:Gem::Uninstaller#uninstall_gem]] �μ¹���Τߥ��åȤ���ޤ���

--- uninstall
#@todo

Gem �򥢥󥤥󥹥ȡ��뤷�ޤ���

���ڥå��ե�����䥭��å���������ޤ���

--- uninstall_gem(spec, specs)
#@todo

Ϳ����줿 spec ���б����� Gem �򥢥󥤥󥹥ȡ��뤷�ޤ���

@param spec ���󥤥󥹥ȡ�����ꤵ��Ƥ��� Gem �� [[c:Gem::Specification]] ����ꤷ�ޤ���

@param specs ���󥤥󥹥ȡ��뤹�� Gem �Υꥹ�Ȥ���ꤷ�ޤ���
             ���Υѥ�᡼�����˲�Ū���ѹ�����ޤ���


== Singleton Methods

--- new(gem, options = {})

���Ȥ��������ޤ���

@param gem ���󥤥󥹥ȡ��뤹�� Gem ����ꤷ�ޤ���

@param options ���ץ�������ꤷ�ޤ���
