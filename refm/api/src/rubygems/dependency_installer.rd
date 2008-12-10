require rubygems
require rubygems/dependency_list
require rubygems/installer
require rubygems/spec_fetcher
require rubygems/user_interaction

���� Gem ����¸���Ƥ��� Gem ��Ʊ���˥��󥹥ȡ��뤹�뤿��Υ饤�֥��Ǥ���

= class Gem::DependencyInstaller
include Gem::UserInteraction

���� Gem ����¸���Ƥ��� Gem ��Ʊ���˥��󥹥ȡ��뤹�뤿��Υ��饹�Ǥ���

== Public Instance Methods

--- find_gems_with_sources(dep)
#@todo

Ϳ����줿���˥ޥå����� [[c:Gem::Specification]] �Υ��󥹥��󥹤� URI �Υڥ��Υꥹ�Ȥ�
�֤��ޤ���

Gem �ϥ����� (Dir.pwd) �ȥ�⡼�� (Gem.sources) ��ξ�����鸡�����ޤ���
��̤ϡ��С������ο������礬��ˤ��ޤ����ޤ���������� Gem ����ˤ��ޤ���

@param dep [[c:Gem::Dependency]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- find_spec_by_name_and_version(gem_name, version = Gem::Requirement.default) -> Array
#@todo

Ϳ����줿 Gem ��̾���ȥС������˴ؤ�����˥ޥå����� [[c:Gem::Specification]] ��
�����¸�ߤ��� URI ��ޤ�������֤��ޤ���

@param gem_name Gem ��̾������ꤷ�ޤ���

@param version Gem ���������С������˴ؤ��������ꤷ�ޤ���

--- gather_dependencies -> Array
#@todo

��¸�ط���̵�뤹��褦�˻��ꤵ��Ƥ��ʤ��¤ꡢ���󥹥ȡ��뤹��褦�˻��ꤵ�줿
Gem ����¸���Ƥ��� Gem �ξ���򽸤���֤��ޤ���

--- gems_to_install -> Array
#@todo

��¸�ط��ˤ�ꥤ�󥹥ȡ��뤵���ͽ��� Gem �Υꥹ�Ȥ��֤��ޤ���

--- install(dep_or_name, version = Gem::Requirement.default) -> Array
#@todo

���ꤵ�줿 Gem �Ȥ��ΰ�¸���� Gem �����ƥ��󥹥ȡ��뤷�ޤ���

@param dep_or_name Gem ��̾���� [[c:Gem::Dependency]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param version �С������˴ؤ��������ꤷ�ޤ���

@return ���Υ᥽�åɤǥ��󥹥ȡ��뤷�� Gem �Υꥹ�Ȥ��֤��ޤ���

--- installed_gems -> Array
#@todo

[[m:Gem::DependencyInstaller#install]] �ǥ��󥹥ȡ��뤵�줿 Gem �Υꥹ�Ȥ��֤��ޤ���


== Singleton Methods

--- new(options = {})

���Ȥ��������ޤ���

���ץ����Ȥ��ưʲ��Τ�Τ����ѤǤ��ޤ���

: :cache_dir
  *.gem �ե��������¸����ǥ��쥯�ȥ����ꤷ�ޤ���
: :domain
��:local (�����ȥǥ��쥯�ȥ�Τ߸������ޤ�), :remote ([[m:Gem.sources]] �򸡺����ޤ�),
  :both (:local, :remote ��ξ���򸡺����ޤ�) �Τ����줫������ǽ�Ǥ���
: :env_shebang
  [[m:Gem::Installer.new]] �򻲾Ȥ��Ƥ���������
: :force
  �С����������å��ȥ������ƥ��ݥꥷ���Υ����å���Ԥ鷺�˥��󥹥ȡ����¹Ԥ��ޤ���
  ����������̾�դ��� Gem �Τߤ򥤥󥹥ȡ��뤹��ݥꥷ�������ꤵ��Ƥ�����Ͼ嵭�Υ����å���
  �¹Ԥ��ޤ���
: :format_executable
  [[m:Gem::Installer#initialize]] �򻲾Ȥ��Ƥ���������
: :ignore_dependencies
  ��¸���Ƥ��� Gem �򥤥󥹥ȡ��뤷�ޤ���
: :install_dir
   Gem �򥤥󥹥ȡ��뤹��ǥ��쥯�ȥ�Ǥ���
: :security_policy
  �������ƥ��ݥꥷ������ꤷ�ޤ���
: :user_install
  false ����ꤹ��ȥ桼���Υۡ���ǥ��쥯�ȥ�˥��󥹥ȡ��뤷�ޤ���
  nil ����ꤹ��ȥ桼���Υۡ���ǥ��쥯�ȥ�˥��󥹥ȡ��뤷�褦�Ȥ��ޤ�����
  �ٹ��ɽ�����ޤ���
: :wrappers
  ������ꤹ��ȥ�åѡ��򥤥󥹥ȡ��뤷�ޤ���
  ������ꤹ��ȡ�����ܥ�å���󥯤򥤥󥹥ȡ��뤷�ޤ���

@see [[m:Gem::Installer.new]], [[m:Gem::Installer#install]], [[c:Gem::Security]]

== Constants

--- DEFAULT_OPTIONS -> Hash
#@todo

���Ȥ���������ݤ˻��Ѥ���ǥե���ȤΥ��ץ����Ǥ���

�ʲ������ƤǤ���

    :env_shebang         => false,
    :domain              => :both, # HACK dup
    :force               => false,
    :format_executable   => false, # HACK dup
    :ignore_dependencies => false,
    :security_policy     => nil, # HACK NoSecurity requires OpenSSL.  AlmostNo? Low?
    :wrappers            => true
