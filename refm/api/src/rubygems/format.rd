require rubygems/package

RubyGems �� Gem �ե������������¤�򰷤�����Υ饤�֥��Ǥ���

= class Gem::Format
extend Gem::UserInteraction

RubyGems �� Gem �ե������������¤��ɽ�����饹�Ǥ���

== Public Instance Methods

--- file_entries -> Array
#@todo

Gem �ѥå������˴ޤޤ��ե������������֤��ޤ���

--- file_entries=(file_entries)
#@todo

Gem �ѥå������˴ޤޤ��ե����������򥻥åȤ��ޤ���

@param file_entries

--- gem_path -> String
#@todo

Gem �Υѥ����֤��ޤ���

--- gem_path=(path)
#@todo

Gem �Υѥ��򥻥åȤ��ޤ���

@param path Gem �Υѥ��򥻥åȤ��ޤ���

--- spec -> Gem::Specification
#@todo

Gem �� [[c:Gem::Specification]] ���֤��ޤ���

--- spec=(spec)
#@todo

Gem �� [[c:Gem::Specification]] �򥻥åȤ��ޤ���

@param spec Gem �� [[c:Gem::Specification]] �򥻥åȤ��ޤ���

== Singleton Methods

--- from_file_by_path(file_path, security_policy = nil) -> Gem::Format
#@todo

Gem �ե�����Υѥ�����ǡ������ɤ߹���ǡ����Ȥ����������֤��ޤ���

@param file_path Gem �ե�����ؤΥѥ�����ꤷ�ޤ���

@param security_policy ???

--- from_io(io, gem_path = '(io)', security_policy = nil) -> Gem::Format
#@todo

Gem �ե����뤫��ǡ������ɤ߹���� IO �������ꡢ���Ȥ����������֤��ޤ���

@param io Gem �ѥå����������Ƥ��ɤ߹���� IO ���֥������Ȥ���ꤷ�ޤ���

@param gem_path Gem �ե�����Υѥ�����ꤷ�ޤ���

@param security_policy ???

--- new(gem_path)

���Ȥ��������ޤ���

@param gem_path Gem �ե�����Υѥ�����ꤷ�ޤ���
