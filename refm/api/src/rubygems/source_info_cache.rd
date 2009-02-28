require rubygems
require rubygems/source_info_cache_entry
require rubygems/user_interaction

�ġ��� Gem �ѥå������Υ���ǥå�������Υ��ԡ�����¸���뤿��Υ饤�֥��Ǥ���

= class Gem::SourceInfoCache
include Gem::UserInteraction

�ġ��� Gem �ѥå������Υ���ǥå�������Υ��ԡ�����¸���뤿��Υ��饹�Ǥ���

����å������¸���Ȥ��ưʲ�����Ĥ�¸�ߤ��ޤ���

: �����ƥ७��å���
  �ե�������Ф���񤭹��߸��¤�������¤�������Ϥ��������Ѥ��ޤ���
: �桼��������å���
  �����ƥ७��å��夬���ѤǤ��ʤ����˻��Ѥ��ޤ���

���Ѥ��륭��å�������򤹤�ȡ����Ƥ��������򤵤줿����å������Ѥ��ޤ���
�ޤ������Υ��饹��ưŪ�˥���å���μ�����ڤ��ؤ��ޤ���

����å���ǡ����ϥ������������� URI ���ͤ� [[c:Gem::SourceInfoCacheEntry]] �Υ��󥹥��󥹤Ǥ���ϥå���Ǥ���

== Public Instance Methods

--- cache_data -> Hash
#@todo

�ǿ��Υ���å���ǡ������֤��ޤ���

--- cache_file -> String
#@todo

���Ѳ�ǽ�ʥ���å���ե�����̾���֤��ޤ���

�����ƥ७��å��夬���Ѳ�ǽ�ʾ��ϥ����ƥ७��å���Υե�����̾���֤��ޤ���
�����Ǥʤ����ϥ桼��������å���Υե�����̾���֤��ޤ���

--- flush -> false
#@todo

����å���������ե�����˽񤭹��ߤޤ���

--- latest_cache_data -> Hash
#@todo

�ǿ��Υ���å���ǡ������֤��ޤ���

--- latest_cache_file -> String
#@todo

���Ѳ�ǽ�ʺǿ��Υ���å���ե�����̾���֤��ޤ���

�����ƥ७��å��夬���Ѳ�ǽ�ʾ��ϥ����ƥ७��å���Υե�����̾���֤��ޤ���
�����Ǥʤ����ϥ桼��������å���Υե�����̾���֤��ޤ���

@see [[m:Gem::SourceInfoCache#cache_file]]

--- latest_system_cache_file -> String
#@todo

�ǿ��Υ����ƥ७��å���Υե�����̾���֤��ޤ���

--- latest_user_cache_file -> String
#@todo

�ǿ��Υ桼��������å���Υե�����̾���֤��ޤ���

--- read_all_cache_data -> ()
#@todo

���Ȥ˴����ʥ���å���ե���������Ƥ�ޡ������ޤ���

--- read_cache_data(file) -> Hash
#@todo

Ϳ����줿�ե�����̾����ǡ������ɤ߹���ǥ���å���ǡ������֤��ޤ���

@param file ����å���Υե�����̾����ꤷ�ޤ���

@return �������㳰��ȯ���������ϡ����Υϥå�����֤��ޤ���

--- refresh(all) -> false
#@todo

���������Ȥ˥���å���ǡ����򹹿����ޤ���

@param all ������ꤹ������ƤΥ���å���򹹿����ޤ��������Ǥʤ����ϡ�
           �ǿ��� Gem �ѥå������ξ���Τ߹������ޤ���

--- reset_cache_data -> true
#@todo

����å���ǡ�����ꥻ�åȤ��ޤ���

--- reset_cache_file -> nil
#@todo

����Ū�˥���å���ե�����̾��ꥻ�åȤ��ޤ���

RubyGems �饤�֥��η��ƥ��Ȥ򤹤�Τ������Ǥ���

--- reset_cache_for(url, cache_data) -> Hash
#@todo

���ꤵ�줿 URL ���б����륭��å���ǡ����򹹿����ޤ���

@param url ������ URL ����ꤷ�ޤ���

@param cache_data ����å���ǡ�������ꤷ�ޤ�����

--- search(pattern, platform_only = false, all = false) -> [Gem::Specification]
#@todo

Ϳ����줿���������� [[c:Gem::Specification]] �Υꥹ�Ȥ��֤��ޤ���

@param pattern ���������� Gem ��ɽ�� [[c:Gem::Dependency]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param platform_only ������ꤹ��ȥץ�åȥե����ब���פ����ΤΤߤ��֤��ޤ����ǥե���Ȥϵ��Ǥ���

@param all ������ꤹ��ȥ���å���򹹿����Ƥ��鸡����¹Ԥ��ޤ���

@see [[m:Gem::SourceIndex#search]]

--- search_with_source(pattern, only_platform = false, all = false) -> Array
#@todo

Ϳ����줿���������� [[c:Gem::Specification]] �� URL �Υꥹ�Ȥ��֤��ޤ���

@param pattern ���������� Gem ��ɽ�� [[c:Gem::Dependency]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param only_platform ������ꤹ��ȥץ�åȥե����ब���פ����ΤΤߤ��֤��ޤ����ǥե���Ȥϵ��Ǥ���

@param all ������ꤹ��ȥ���å���򹹿����Ƥ��鸡����¹Ԥ��ޤ���

@return ������Ǥ� [[c:Gem::Specification]]���������Ǥ�������� URL �Ȥ�����������ǤȤ���������֤��ޤ���


--- set_cache_data(hash) -> true
#@todo

ľ�ܥ���å���ǡ����򥻥åȤ��ޤ���

���Υ᥽�åɤϼ�˥�˥åȥƥ��Ȥǻ��Ѥ��ޤ���

@param hash ����å���ǡ����Ȥ��ƻ��Ѥ���ϥå������ꤷ�ޤ���

--- system_cache_file -> String
#@todo

�����ƥ७��å���ե������̾�����֤��ޤ���

--- try_file(path) -> String | nil
#@todo

Ϳ����줿�ѥ�������å���ե�����Ȥ������Ѳ�ǽ�ʾ�硢���Υѥ����֤��ޤ���
�����Ǥʤ����� nil ���֤��ޤ���

@param path ����å���ե�����θ���Ȥʤ�ѥ�����ꤷ�ޤ���

--- update -> true
#@todo

����å��夬�������줿���Ȥ�ޡ������ޤ����������ΤϤϹԤ��ޤ���

--- user_cache_file -> String
#@todo

�桼��������å���Υե�����̾���֤��ޤ���

--- write_cache -> nil
#@todo

Ŭ�ڤʥ���å���ե�����˥���å���ǡ�����񤭹��ߤޤ���

== Singleton Methods

--- cache(all = false) -> Gem::SourceInfoCache
#@todo

���ȤΥ��󥹥��󥹤��������뤿��Υ᥽�åɤǤ���

@param all ������ꤹ��ȡ����󥹥��������������ƤΥ���å����ƺ������ޤ���

--- cache_data -> Hash
#@todo

����å��夷�Ƥ���ǡ������֤��ޤ���

--- latest_system_cache_file -> String
#@todo

�ǿ��Υ����ƥ७��å���Υե�����̾���֤��ޤ���

--- latest_user_cache_file -> String
#@todo

�ǿ��Υ桼��������å���Υե�����̾���֤��ޤ���

--- reset -> nil
#@todo

���Ȥ����Ƥ򥯥ꥢ���ޤ���

--- search(*args) -> [Gem::Specification]
#@todo

Ϳ����줿���������� [[c:Gem::Specification]] �Υꥹ�Ȥ��֤��ޤ���

@param args ����������ꤷ�ޤ���[[m:Gem::SourceInfoCache#search]] �Ȱ������碌�Ƥ���������

@see [[m:Gem::SourceInfoCache#search]]

--- search_with_source(*args) -> Array
#@todo

Ϳ����줿���������� [[c:Gem::Specification]] �� URL �Υꥹ�Ȥ��֤��ޤ���

@param args ����������ꤷ�ޤ���[[m:Gem::SourceInfoCache#search_with_source]] �Ȱ������碌�Ƥ���������

@see [[m:Gem::SourceInfoCache#search_with_source]]

--- system_cache_file -> String
#@todo

�����ƥ७��å���Υե�����̾���֤��ޤ���

--- user_cache_file -> String
#@todo

�桼��������å���Υե�����̾���֤��ޤ���
