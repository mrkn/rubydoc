require rubygems/digest/md5
require rubygems/format
require rubygems/installer

�͡��� Gem �ե������ Gem �ǡ����١�������ޤ��뤿��Υ饤�֥��Ǥ���

= class Gem::Validator < Object

�͡��� Gem �ե������ Gem �ǡ����١�������ޤ��뤿��Υ��饹�Ǥ���

== Public Instance Methods

--- alien -> [Gem::Validator.ErrorData]
#@todo

Gem �ǥ��쥯�ȥ����¸�ߤ��뤫�⤷��ʤ��ʲ��Τ褦������򸡾ڤ��ޤ���

 * Gem �ѥå������Υ����å����ब����������
 * ���줾��� Gem �˴ޤޤ�뤽�줾��Υե����뤬���󥹥ȡ��뤵�줿�С������Ǥ��뤳�Ȥΰ����
 * Gem �ǥ��쥯�ȥ�˴ط���̵���ե����뤬¸�ߤ��ʤ�����
 * ����å��塢���ڥå����ǥ��쥯�ȥ꤬���줾���Ĥ���¸�ߤ��뤳��

���Υ᥽�åɤϸ��ڤ˼��Ԥ��Ƥ��㳰��ȯ�������ޤ���


--- remove_leading_dot_dir(path) -> String
#@todo
#@# should be private ?

Ϳ����줿�ѥ�����Ƭ�ΥɥåȤ��������ʸ������֤��ޤ���

--- unit_test(gem_spec)
#@todo

Ϳ����줿 Gem ���ڥå��ˤ������äƥ�˥åȥƥ��Ȥ�¹Ԥ��ޤ���

@param gem_spec [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- verify_gem(gem_data) -> ()
#@todo

Ϳ����줿 Gem �ե���������Ƥ� MD5 �����å�����򸡾ڤ��ޤ���

@param gem_data Gem �ե���������Ƥ�ʸ����ǻ��ꤷ�ޤ���

@raise Gem::VerificationError ���� Gem �ե��������ꤷ������ȯ�����ޤ���

@raise Gem::VerificationError MD5 �����å����ब�����Ǥ������ȯ�����ޤ���


--- verify_gem_file(gem_path) -> ()
#@todo

Ϳ����줿 Gem �ե�����Υѥ�����Ѥ��� MD5 �����å�����򸡾ڤ��ޤ���

@param gem_path Gem �ե�����Υѥ�����ꤷ�ޤ���

@raise Gem::VerificationError Gem �ե����뤬���Ĥ���ʤ��ä�����ȯ�����ޤ���


== Constants

--- ErrorData
#@todo

���顼�����Ͽ���뤿��ι�¤�ΤǤ���
�ʲ���°������äƤ��ޤ���

 * path
 * problem
