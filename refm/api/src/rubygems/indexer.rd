require rubygems
require rubygems/format

Gem ��ݥ��ȥ�Υ���ǥå�����������뤿��Υ��饹�򰷤�����Υ饤�֥��Ǥ���

= class Gem::Indexer
include Gem::UserInteraction

Gem ��ݥ��ȥ�Υ���ǥå�����������뤿��Υ��饹�Ǥ���

== Public Instance Methods

--- abbreviate(spec) -> Gem::Specification
#@todo

��������ɤ�®�����뤿���Ϳ����줿 [[c:GemSpecification]] �λ��ĥǡ�����
���������ޤ���

@param spec

--- build_indicies
#@todo

����ǥå������ۤ��ޤ���

--- collect_specs -> Gem::SourceIndex
#@todo

Gem �Υ���å���ǥ��쥯�ȥ���� *.gem �ե����뤫�� [[c:Gem::Specification]] �򽸤�ޤ���

--- compact_specs(specs) -> Array
#@todo

Ϳ����줿���ڥå��򸵤˥��ڥå����դ�����Ǥ�������ξ������ä�������������
�֤��ޤ���

@param specs [[c:Gem::Specification]] ���������ꤷ�ޤ���

--- compress(filename, extension)
#@todo

Ϳ����줿�ե�����򰵽̤�����¸���ޤ���

@param filename �����оݤΥե�����̾����ꤷ�ޤ���

@param extension ��¸����ե�����̾�γ�ĥ�Ҥ���ꤷ�ޤ���

--- dest_directory -> String
#@todo

����ǥå�������¸����ǥ��쥯�ȥ���֤��ޤ���

--- directory -> String
#@todo

����ǥå�����ӥ�ɤ��뤿��ΰ��Ū�ʥǥ��쥯�ȥ���֤��ޤ���

--- gem_file_list -> Array
#@todo

����ǥå�����������뤿��˻��Ѥ��� Gem �ե�����Υꥹ�Ȥ��֤��ޤ���

--- generate_index
#@todo

����ǥå������ۤ�����¸���ޤ���

--- gzip(filename)
#@todo

[[m:Zlib::GzipWriter.open]] �ؤΥ�åѡ��Ǥ���
Ϳ����줿�ե�����̾�򰵽̤�����¸���ޤ���

--- install_indicies
#@todo

�����ѤߤΥ���ǥå��������Υǥ��쥯�ȥ����¸���ޤ���

--- make_temp_directories
#@todo

���Ū�˻��Ѥ���ǥ��쥯�ȥ��������ޤ���

--- paranoid(path, extension)
#@todo

���̤��줿�ǡ����Ȱ��̤���Ƥ��ʤ��ǡ�������Ӥ��ư��פ��ʤ�����㳰��ȯ�������ޤ���

@param path ���̤���Ƥ��ʤ��ե�����Υѥ�����ꤷ�ޤ���

@param extension ���̤��줿�ե�����γ�ĥ�Ҥ���ꤷ�ޤ���

@raise RuntimeError ���̤��줿�ǡ����Ȱ��̤���Ƥ��ʤ��ǡ��������פ��ʤ�����ȯ�����ޤ���

--- sanitize(spec) -> Gem::Specification
#@todo

Ϳ����줿���ڥå��ξܺ٤�ɽ��°���򥵥˥��������ޤ���

non-ASCII ��ʸ����ϡ������ȥ���ǥå�����ʸ�����������뤳�Ȥ�����ޤ���
non-ASCII ��ʸ����� XML ����ƥ��ƥ����ִ����ޤ���

--- sanitize_string(string) -> String
#@todo

Ϳ����줿ʸ����򥵥˥��������ޤ���

@param string ���˥������оݤ�ʸ�������ꤷ�ޤ���

@see [[Gem::Indexer#sanitize]]

== Singleton Methods

--- new(directory)

Ϳ����줿�ǥ��쥯�ȥ�� Gem ��ݥ��ȥ�Υ���ǥå�����������뤿���
���Ȥ��������ޤ���
