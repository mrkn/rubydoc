require rubygems/indexer

Gem �Υ���ǥå������ۤ��뤿�����ݥ��饹�򰷤��饤�֥��Ǥ���

�ƥ�ץ졼�ȥѥ��������Ѥ��Ƥ��ޤ���

= class Gem::Indexer::AbstractIndexBuilder

Gem �Υ���ǥå������ۤ��뤿�����ݥ��饹�Ǥ���

�ƥ�ץ졼�ȥѥ��������Ѥ��Ƥ��ޤ���

== Public Instance Methods

--- build{ ... }
#@todo

Gem �Υ���ǥå�����������ޤ���

�ºݤΥ���ǥå����������������ξܺ٤�Ϳ����줿�֥�å��˵��Ҥ���Ƥ��ޤ���
����Ū�ʽ����򥫥����ޥ������뤿��ˡ�Ŭ�ڤʥ����ߥ󥰤�
begin_index, end_index, cleanup ���ƤӽФ����褦�ˤʤäƤ��ޤ���

--- cleanup
#@todo

����ǥå����ե�������Ĥ������Ȥ˸ƤӽФ���ޤ���

--- compress(filename, ext = 'rz')
#@todo

Ϳ����줿�ե�����򰵽̤��ޤ���

@param filename ���̤���ե������̾������ꤷ�ޤ���

@param ext ���̸�Υե�����γ�ĥ�Ҥ���ꤷ�ޤ���

--- directory -> String
#@todo

����ǥå����ե�����������ե���������֤��Ƥ���ǥ��쥯�ȥ�̾���֤��ޤ���

--- end_index
#@todo

[[m:Gem::Indexer::AbstractIndexBuilder#build]] ��ǥ֥�å����¹Ԥ��줿��˸ƤӽФ���ޤ���
����ǥå����ե������ͭ���ǡ�@file �⻲�Ȳ�ǽ�Ǥ���

--- filename -> String
#@todo

�������륤��ǥå����ե������̾�����֤��ޤ���

--- files -> [String]
#@todo

�������륤��ǥå����ե�����˴ޤޤ��ե�����Υꥹ�Ȥ��֤��ޤ���

--- start_index
#@todo

[[m:Gem::Indexer::AbstractIndexBuilder#build]] ��ǥ֥�å����¹Ԥ�������˸ƤӽФ���ޤ���
����ǥå����ե������ͭ���ǡ�@file �⻲�Ȳ�ǽ�Ǥ���

--- unzip(string) -> String
#@todo

Ϳ����줿���̺Ѥ�ʸ�����Ÿ�������֤��ޤ���

@param string ���̤���Ƥ���ǡ�������ꤷ�ޤ���

@see [[m:Zlib::Inflate.inflate]]

--- zip(string) -> String
#@todo

Ϳ����줿ʸ����򰵽̤����֤��ޤ���

@param string ���̤���ǡ�������ꤷ�ޤ���


@see [[m:Zlib::Deflate.deflate]]

== Singleton Methods

--- new(filename, directory)

���Ȥ��������ޤ���

@param filename �������륤��ǥå�������¸����ե�����̾�Ǥ���

@param directory ����ǥå����ե��������¸�����ȥǥ��쥯�ȥ�Ǥ���
