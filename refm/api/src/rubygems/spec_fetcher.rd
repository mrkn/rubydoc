require rubygems
require rubygems/remote_fetcher
require rubygems/user_interaction

��⡼�ȥ�ݥ��ȥ꤫�� Gem �Υ᥿�ǡ�����������ƹ������뤿��Υ饤�֥��Ǥ���

= class Gem::SpecFetcher
include Gem::UserInteraction

��⡼�ȥ�ݥ��ȥ꤫�� Gem �Υ᥿�ǡ�����������ƹ������뤿��Υ��饹�Ǥ���

== Singleton Methods

--- fetcher -> Gem::SpecFetcher
#@todo

���Υ��饹��ͣ��Υ��󥹥��󥹤��֤��ޤ���

#@# singleton ?

--- fetcher=(fetcher)
#@todo

== Instance Methods

--- cache_dir(uri) -> String
#@todo

uri �����Ƥ�񤭹��������Υǥ��쥯�ȥ�̾���֤��ޤ���

@param uri 

--- dir -> String
#@todo

���Υ��饹�����Ѥ��륭��å����ѥǥ��쥯�ȥ��̾�����֤��ޤ���

--- fetch(dependency, all = false, matching_platform = true) -> Array
#@todo

��¸�ط��������� gemspec ��������֤��ޤ���

@param dependency ��¸�ط�����ꤷ�ޤ���
@param all ������ꤹ��ȥޥå��������ƤΥС������ξ�����֤��ޤ���
@param matching_platform ������ꤹ������ƤΥץ�åȥե�����ξ�����֤��ޤ���

@see [[c:Gem::Dependency]]

--- fetch_spec(spec, source_uri) -> object
#@todo

@param spec 
@param source_uri

--- find_matching(dependency, all = false, matching_platform = true) -> Array
#@todo

��¸�ط��������� gemspec ��̾����������֤��ޤ���

@param dependency ��¸�ط�����ꤷ�ޤ���
@param all ������ꤹ��ȥޥå��������ƤΥС������ξ�����֤��ޤ���
@param matching_platform ������ꤹ������ƤΥץ�åȥե�����ξ�����֤��ޤ���

@see [[c:Gem::Dependency]]

--- latest_specs -> Hash
#@todo

����å��夵��Ƥ���ǿ��� gemspec ���֤��ޤ���

--- legacy_repos -> Array
#@todo

RubyGems 1.2 ̤���Ǻ������줿��ݥ��ȥ��������֤��ޤ���

--- list(all = false) -> Array
#@todo

[[m:Gem::sources]] �˳�Ǽ����Ƥ���ƥ������������Ѳ�ǽ�� Gem �Υꥹ�Ȥ���������֤��ޤ���

@param list ������ꤹ������ƤΥС������ξ�����֤��ޤ���

--- load_specs(source_uri, file) -> object
#@todo

���ꤵ�줿 source_uri, file ���� gemspec ����ɤ��ޤ���

�ޤ��������Ǥϥ���å���ι�����ԤäƤ��ޤ���

@param source_uri gemspec ���֤��Ƥ��� URI ����ꤷ�ޤ���

@param file gemspec �Υե�����̾����ꤷ�ޤ���

--- specs -> Hash
#@todo

����å��夵��Ƥ������Ƥ� gemspec ���֤��ޤ���


--- warn_legacy(exception){ ... } -> bool
#@todo

[[m:Gem::SpecFetcher#fetch]] ���㳰��ȯ���������˸ƤӽФ���ޤ���

RubyGems 1.2 ̤���Ǻ���������ݥ��ȥ�˥����������������������㳰��ȯ���������ˤ�
�ٹ�ɽ������ޤ����ޤ����ξ�硢�֥�å���Ϳ���Ƥ���Х֥�å���ɾ������ޤ���

����ʳ��θ������㳰��ȯ���������ϵ����֤��ޤ���

@param exception �㳰���֥������Ȥ���ꤷ�ޤ���

@see [[m:Gem::SpecFetcher#fetch]]
