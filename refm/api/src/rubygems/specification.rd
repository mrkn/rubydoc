require rubygems
require rubygems/version
require rubygems/requirement
require rubygems/platform

Gem �ѥå������Υ᥿�ǡ����򰷤�����Υ饤�֥��Ǥ���

�̾� gemspec �ե������ Rakefile �ǥ᥿�ǡ�����������ޤ���

��:

   spec = Gem::Specification.new do |s|
     s.name = 'rfoo'
     s.version = '1.0'
     s.summary = 'Example gem specification'
     ...
   end

#@# @see 

= class Gem::Specification

Gem �ѥå������Υ᥿�ǡ����򰷤�����Υ��饹�Ǥ���


== Instance Methods

--- <=>
#@todo

--- ==
#@todo

--- _dump
#@todo

--- add_bindir
#@todo

--- add_dependency
#@todo

--- add_development_dependency
#@todo

--- add_runtime_dependency
#@todo

--- assign_defaults
#@todo

--- author
#@todo

--- author=
#@todo

--- authors
#@todo

--- authors=
#@todo

--- autorequire
#@todo

--- autorequire=
#@todo

--- bindir
#@todo

--- bindir=
#@todo

--- cert_chain
#@todo

--- cert_chain=
#@todo

--- date
#@todo

--- date=
#@todo

--- default_executable
#@todo

--- default_executable=
#@todo

--- dependencies
#@todo

--- dependent_gems
#@todo

--- description
#@todo

--- description=
#@todo

--- development_dependencies
#@todo

--- email
#@todo

--- email=
#@todo

--- eql?
#@todo

--- executable
#@todo

--- executable=
#@todo

--- executables
#@todo

--- executables=
#@todo

--- extensions
#@todo

--- extensions=
#@todo

--- extra_rdoc_files
#@todo

--- extra_rdoc_files=
#@todo

--- file_name
#@todo

--- files
#@todo

--- files=
#@todo

--- full_gem_path
#@todo

--- full_name
#@todo

--- has_rdoc
#@todo

--- has_rdoc=
#@todo

--- has_rdoc?
#@todo

--- has_test_suite?
#@todo

--- has_unit_tests?
#@todo

--- hash
#@todo

--- homepage
#@todo

--- homepage=
#@todo

--- installation_path
#@todo

--- lib_files
#@todo

--- loaded=
#@todo

--- loaded?
#@todo

--- loaded_from
#@todo

--- loaded_from=
#@todo

--- mark_version
#@todo

--- method_missing
#@todo

--- name
#@todo

--- name=
#@todo

--- normalize
#@todo

--- original_name
#@todo

--- original_platform
#@todo

--- original_platform=
#@todo

--- platform
#@todo

--- platform=
#@todo

--- post_install_message
#@todo

--- post_install_message=
#@todo

--- rdoc_options
#@todo

--- rdoc_options=
#@todo

--- require_path
#@todo

--- require_path=
#@todo

--- require_paths
#@todo

--- require_paths=
#@todo

--- required_ruby_version
#@todo

--- required_ruby_version=
#@todo

--- required_rubygems_version
#@todo

--- required_rubygems_version=
#@todo

--- requirements
#@todo

--- requirements=
#@todo

--- rubyforge_project
#@todo

--- rubyforge_project=
#@todo

--- rubygems_version
#@todo

--- rubygems_version=
#@todo

--- runtime_dependencies
#@todo

--- satisfies_requirement?
#@todo

--- signing_key
#@todo

--- signing_key=
#@todo

--- sort_obj
#@todo

--- specification_version
#@todo

--- specification_version=
#@todo

--- summary
#@todo

--- summary=
#@todo

--- test_file
#@todo

--- test_file=
#@todo

--- test_files
#@todo

--- test_files=
#@todo

--- test_suite_file
#@todo

--- test_suite_file=
#@todo

--- to_ruby
#@todo

--- to_s
#@todo

--- to_yaml
#@todo

--- validate
#@todo

--- version
#@todo

--- version=
#@todo

--- yaml_initialize
#@todo

== Singleton Methods

--- _load(str) -> Gem::Specification
#@todo

�ޡ�����뤵�줿�ǡ�������ɤ��뤿��Υ᥽�åɤǤ���

@param str �ޡ�����뤵�줿�ǡ�������ꤷ�ޤ���

--- array_attribute(name) -> ()
#@todo

[[m:Gem::Specification.attribute]] ��Ʊ���Ǥ������ͤ�����˳�Ǽ���륢����������ޤ���

@param name °����̾������ꤷ�ޤ���

@see [[m:Gem::Specification.attribute]]

--- array_attributes -> Array
#@todo

@@array_attributes ��ʣ�����֤��ޤ���

@see [[m:Object#dup]]

--- attribute(name) -> ()
#@todo

�ǥե�����ͤ���ꤷ������������������뤿��˻��Ѥ��ޤ���

�ʲ��������Ѥ�����ޤ���

 * ���饹�ѿ� @@attributes, @@default_value ���ѹ����ޤ���
 * �̾��°���񤭹��ߥ᥽�åɤ�������ޤ���
 * �ǥե�����ͤ����°���ɤ߼��᥽�åɤΤ褦�˿����񤦥᥽�åɤ�������ޤ���

--- attribute_alias_singular(singular, plural) -> ()
#@todo

����¸�ߤ���ʣ������°����ñ�����С�������������ޤ���

�����ñ�˰�Ĥΰ����������ꤽ���������ɲä���褦�ʥإ�ѡ��᥽�åɤ��������Ȥ������ȤǤ���

��:

  # ���Τ褦����������
  attribute_alias_singular :require_path, :require_paths
  # �����񤯤�����
  s.require_paths = ['mylib']
  # �����񤯤��Ȥ��Ǥ��ޤ���
  s.require_path = 'mylib'

@param singular °��̾��ñ��������ꤷ�ޤ���

@param plural °��̾��ʣ��������ꤷ�ޤ���


--- attribute_defaults -> Array
#@todo

@@attributes ��ʣ�����֤��ޤ���

--- attribute_names -> Array
#@todo

°��̾��������֤��ޤ���

--- attributes(*args) -> ()
#@todo

ʣ����°������٤˺������뤿��˻��Ѥ��ޤ���

��°���Υǥե�����ͤ� nil �ˤʤ�ޤ���

@param args °��̾���İʾ���ꤷ�ޤ���

--- default_value(name) -> object
#@todo

Ϳ����줿̾����°���Υǥե�����ͤ��֤��ޤ���

@param name °��̾����ꤷ�ޤ���

--- from_yaml(input) -> Gem::Specification
#@todo

YAML �ե����뤫�� gemspec ����ɤ��ޤ���

YAML �ե����뤫�� [Gem::Specification]] ����ɤ���ȡ��̾�� Ruby ���֥������Ȥ�
������롼���� (#initialize) ���̤�ޤ��󡣤��Υ᥽�åɤϽ�����롼����ΰ�����¹Ԥ���
gemspec �ΥС����������å���Ԥ��ޤ���

@param input ʸ���� [[c:IO]] ���֥������Ȥ���ꤷ�ޤ���

--- list -> Array
#@todo

�¹���� Ruby �Υ��󥹥��󥹤Ǻ������줿 [[c:Gem::Specification]] �Υ��󥹥��󥹤��֤��ޤ���

--- load(filename) -> Gem::Specification
#@todo

gemspec �ե��������ɤ��ޤ���

@param filename gemspec �Υե�����̾����ꤷ�ޤ���

@raise StandardError gemspec �ե�������Ǥ��Υ᥽�åɤ�Ƥ�Ǥ������ȯ�����ޤ���

--- normalize_yaml_input(input) -> String
#@todo

YAML ������ gemspec ���������ե����ޥåȤ��ޤ���

@param input ʸ���� [[c:IO]] ���֥������Ȥ���ꤷ�ޤ���

--- overwrite_accessor(name){ ... } -> ()
#@todo

�ƤӽФ��������̤�ư��򤹤�ɬ�פΤ���°��������ޤ���
���Υ᥽�åɤϤ����������Ȥ��ǽ�ˤ��ޤ���

�֥�å��ѥ�᡼����Ǥ�դΤ�Τ���Ѥ��뤳�Ȥ��Ǥ��ޤ���

@param name °��̾����ꤷ�ޤ���

--- read_only(*names) -> ()
#@todo

Ϳ����줿°��̾���ɤ߼�����Ѥˤ��ޤ���

@param names °��̾���İʾ���ꤷ�ޤ���

--- required_attribute(name, default = nil) -> ()
#@todo

ɬ�ܤ�°����������ޤ���

@param name °��̾����ꤷ�ޤ���

@param default �ǥե�����ͤ���ꤷ�ޤ���

@see [[m:Gem::Specification.attribute]]

--- required_attribute?(name) -> bool
#@todo

ɬ��°���Ǥ���п����֤��ޤ���

@param name °��̾����ꤷ�ޤ���

--- required_attributes -> Array
#@todo

ɬ��°���Υꥹ�Ȥ��֤��ޤ���


== Constants

--- CURRENT_SPECIFICATION_VERSION -> 2
#@todo

���ߤ� gemspec �ΥС�������ɽ������Ǥ���


--- MARSHAL_FIELDS -> Hash
#@todo


--- NONEXISTENT_SPECIFICATION_VERSION -> -1
#@todo

���Τ˻��ꤵ��Ƥ��ʤ����� gemspec �ΥС�������ɽ���ޤ���

--- SPECIFICATION_VERSION_HISTORY -> Hash
#@todo

gemspec �ե�����ΥС���������ˤ�ɽ������Ǥ���

--- TODAY -> Time
#@todo

���������դ��֤��ޤ���


