require rubygems
require rubygems/user_interaction
require rubygems/specification
require rubygems/spec_fetcher
require rubygems/digest/sha2
require rubygems/remote_fetcher
require rubygems/source_info_cache

�ġ��Υ�������������������Ƥ�ͭ���� Gem �ѥå������򥤥�ǥå��������뤿��Υ饤�֥��Ǥ���

= class Gem::SourceIndex
alias Gem::Cache
extend Gem::UserInteraction
include Enumerable
include Gem::UserInteraction

�ġ��Υ�������������������Ƥ�ͭ���� Gem �ѥå������򥤥�ǥå��������뤿��Υ��饹�Ǥ���

Gem �ѥå������Υե�͡���� ���줾��� [[c:Gem::Specification]] ���֥������Ȥ��б��դ��ޤ���

== Instance Methods

--- add_spec(gem_spec) -> Gem::Specification
#@todo

���Ȥ˰�����Ϳ����줿 [[c:Gem::Specification]] �Υ��󥹥��󥹤��ɲä��ޤ���

@param gem_spec [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- add_specs(*gem_specs) -> Hash
#@todo

���Ȥ˰�����Ϳ����줿 [[c:Gem::Specification]] �Υ��󥹥��󥹤������ɲä��ޤ���

@param gem_specs ʣ���� [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- dump -> ()
#@todo

���Ȥ� [[m:Marshal.#dump]] ���ޤ���

--- each{|full_name, gem| ... } -> Hash
#@since 1.8.7
#@since 1.8.8
--- each -> Enumerator
#@else
--- each -> Enumerable::Enumerator
#@end
#@todo

���Ȥ���Ͽ����Ƥ��뤽�줾��� Gem �ˤĤ��ƥ֥�å���ɾ�����ޤ���


--- find_name(gem_name, version_requirement = Gem::Requirement.default) -> Gem::Specification
#@todo

û��̾�������Τ˥ޥå����� Gem ���֤��ޤ���

@param gem_name Gem ��̾������ꤷ�ޤ���

@param version_requirement

@see [[c:Gem::Requirement]]

--- gem_signature(gem_full_name) -> String
#@todo

Ϳ����줿̾������� Gem �� SHA256 �����������Ȥ��֤��ޤ���

--- index_signature -> String
#@todo

����������ǥå����� SHA256 �����������Ȥ��֤��ޤ���

�����ͤϥ���ǥå������ѹ��������Ѳ����ޤ���

--- latest_specs -> Array
#@todo

���Ȥ˴ޤޤ��ǿ��� [[c:Gem::Specification]] �Υꥹ�Ȥ��֤��ޤ���

--- size   -> Integer
--- length -> Integer
#@todo

���Ȥ˴ޤޤ�� Gem �θĿ����֤��ޤ���

--- load_gems_in(*spec_dirs) -> self
#@todo

������Ϳ����줿�ǥ��쥯�ȥ�˴ޤޤ�� gemspec ���鼫�Ȥ�ƹ��ۤ����֤��ޤ���

@param spec_dirs gemspec �δޤޤ�Ƥ���ǥ��쥯�ȥ��ʣ�����ꤷ�ޤ���

--- outdated -> Array
#@todo

��������Ƥ��ʤ� [[c:Gem::Specification]] �Υꥹ�Ȥ��֤��ޤ���

--- refresh! -> self
#@todo

���Ȥ�ƺ������ޤ���

@raise StandardError ���Ȥ��ǥ����������ɤ߹���Ǻ�������Ƥ��ʤ�����ȯ�����ޤ���

--- remove_spec(full_name) -> Gem::Specification
#@todo

�����ǻ��ꤵ�줿̾������� Gem �򥤥�ǥå������������ޤ���

--- search(gem_pattern, platform_only = false) -> [Gem::Specification]
#@todo

�����ǻ��ꤵ�줿���������� Gem �Υꥹ�Ȥ��֤��ޤ���

@param gem_pattern ���������� Gem ��ɽ�� [[c:Gem::Dependency]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param platform_only ������ꤹ��ȥץ�åȥե����ब���פ����ΤΤߤ��֤��ޤ����ǥե���Ȥϵ��Ǥ���

--- size -> Integer
#@todo

���ȤΥ��������֤��ޤ���

--- spec_dirs -> [String]
#@todo

[[m:Gem::SourceIndex#reflesh!]] �Ǽ��Ȥ򹹿�������˻��Ѥ���ǥ��쥯�ȥ��������ޤ���

--- spec_dirs=(dirs)
#@todo

[[m:Gem::SourceIndex#reflesh!]] �Ǽ��Ȥ򹹿�������˻��Ѥ���ǥ��쥯�ȥ�����ꤷ�ޤ���

--- specification(full_name) -> Gem::Specification | nil
#@todo

���ꤵ�줿̾���� [[c:Gem::Specification]] ���֥������Ȥ��֤��ޤ���

@param full_name Gem �Υե�͡������ꤷ�ޤ���

--- update(source_uri, all) -> boolean
#@todo

�������ǻ��ꤵ�줿 URI ����Ѥ��Ƽ��Ȥ򹹿����ޤ���

@param source_uri �����˻��Ѥ��� URI ����ꤷ�ޤ���ʸ���� [[c:URI::Generic]] �Υ��֥��饹����ꤷ�ޤ���

@param all ������ꤹ��Ⱥǿ��С������� Gem �Τ߼������ޤ���������ꤹ������ƤΥС������� Gem ��������ޤ���

== Singleton Methods

--- new(specifications = {}) -> Gem::SourceIndex
#@todo

Ϳ����줿�ϥå���򸵤˼��Ȥ��������ޤ���

@param specifications ������ Gem ��̾�����ͤ� [[c:Gem::Specification]] �Υ��󥹥��󥹤Ȥ���ϥå������ꤷ�ޤ���

--- from_gems_in(*spec_dirs) -> Gem::SourceIndex
#@todo

������Ϳ����줿�ǥ��쥯�ȥ���֤���Ƥ��� Ruby ������ץȷ����� gemspec �ե��������Ѥ���
���������󥹥��󥹤�������ޤ���

@param spec_dirs gemspec �ե����뤬�֤���Ƥ���ǥ��쥯�ȥ���İʾ���ꤷ�ޤ���

--- from_installed_gems(*deprecated) -> Gem::SourceIndex
#@todo

Ϳ����줿�ѥ����Ȥˡ����󥹥��󥹤��������ե����ȥ�᥽�åɤǤ���

@param deprecated ���ΰ�������侩�Ǥ��������ߴ����Τ���ˤΤ��󶡤���Ƥ���Τǻ��Ѥ��٤��ǤϤ���ޤ���

@see [[m:Gem::SourceIndex.from_gems_in]]

--- installed_spec_directories -> [String]
#@todo

gemspec �ե����뤬���󥹥ȡ��뤵��Ƥ���ǥ��쥯�ȥ�Υꥹ�Ȥ��֤��ޤ���

@see [[m:Gem.#path]]

--- load_specification(file_name) -> Gem::Specification | nil
#@todo

Ϳ����줿�ե�����̾���� Ruby ������ץȷ����� gemspec ����ɤ���
[[c:Gem::Specification]] �Υ��󥹥��󥹤��֤��ޤ���

@param file_name �ե�����̾����ꤷ�ޤ���

@raise SignalException gemspec ����ɤ��Ƥ���Ȥ���ȯ�����ޤ���

@raise SystemExit gemspec ����ɤ��Ƥ���Ȥ���ȯ�����ޤ���
