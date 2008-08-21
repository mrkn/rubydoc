���饹�䥪�֥������Ȥˡ��᥽�åɤΰѾ���ǽ���ɲä��뤿��Υ饤�֥��Ǥ���

#@#�ʲ��Υ⥸�塼�뤬�������ޤ���

#@#  * [[c:Forwardable]]
#@#  * [[c:SingleForwardable]]

#@#�ܺ٤� [[unknown:"ruby-src:doc/forwardable.rd.ja"]] �򻲾Ȥ��Ƥ���������

=== ����

  * Rubyist Magazine 0012 �� ɸ��ź�ե饤�֥��Ҳ���� 6 ��۰Ѿ� ([[url:http://jp.rubyist.net/magazine/?0012-BundledLibraries]])

= module Forwardable

���饹���Ф����᥽�åɤΰѾ���ǽ���������⥸�塼��Ǥ���

=== �Ȥ���

���饹���Ф��� [[m:Object#extend]] ���ƻȤ��ޤ���[[m:Module#include]] �Ǥʤ��Ȥ������դ��Ʋ�������

��:

  class Foo
    extend Forwardable
    
    def_delegators("@out", "printf", "print")
    def_delegators(:@in, :gets)
    def_delegator(:@contents, :[], "content_at")
  end
  f = Foo.new
  f.printf ...
  f.gets
  f.content_at(1)

== Singleton Methods

--- debug -> bool

�Ѿ���ʬ��Хå��ȥ졼���˴ޤ�뤫�ɤ����ξ��֤��֤��ޤ���

�Хå��ȥ졼����ޤ������ȤʤäƤ�����������֤��ޤ���
�ǥե���Ȥϴޤ�ʤ�����ȤʤäƤ��ޤ���


--- debug= -> bool

�Ѿ���ʬ��Хå��ȥ졼���˴ޤ�뤫�ɤ����ξ��֤����ꤷ�ޤ���


== Instance Methods

--- def_instance_delegators(accessor, *methods) -> nil
--- def_delegators(accessor, *methods) -> nil

�᥽�åɤΰѾ����ޤȤ�����ꤷ�ޤ���

@param accessor �Ѿ���Υ��֥�������

@param methods �Ѿ�����᥽�åɤΥꥹ��

�Ѿ����Υ��֥������Ȥ� methods �Τ��줾��Υ᥽�åɤ��ƤӽФ��줿���ˡ�
�Ѿ���Υ��֥������Ȥ�Ʊ̾�Υ᥽�åɤؽ������Ѿ������褦�ˤʤ�ޤ���

def_delegators �� def_instance_delegators ����̾�ˤʤ�ޤ���


--- def_instance_delegator(accessor, method, ali = method) -> nil
--- def_delegator(accessor, method, ali = method) -> nil

�᥽�åɤΰѾ�������ꤷ�ޤ���

@param accessor �Ѿ���Υ��֥�������

@param method �Ѿ���Υ᥽�å�

@param ali �Ѿ����Υ᥽�å�

�Ѿ����Υ��֥������Ȥ� ali ���ƤӽФ��줿���ˡ�
�Ѿ���Υ��֥������Ȥ� method �ؽ������Ѿ������褦�ˤʤ�ޤ���

�Ѿ����ȰѾ���Υ᥽�å�̾��Ʊ������, ali ���ά���뤳�Ȥ���ǽ�Ǥ���

def_delegator �� def_instance_delegator ����̾�ˤʤ�ޤ���


= module SingleForwardable

���֥������Ȥ��Ф����᥽�åɤΰѾ���ǽ���������⥸�塼��Ǥ���

=== �Ȥ���

���֥������Ȥ��Ф��� extend ���ƻȤ��ޤ���

��:

  g = Goo.new
  g.extend SingleForwardable
  g.def_delegator("@out", :puts)
  g.puts ...

== Instance Methods


--- def_singleton_delegators(accessor, *methods) -> nil
--- def_delegators(accessor, *methods) -> nil

�᥽�åɤΰѾ����ޤȤ�����ꤷ�ޤ���

@param accessor �Ѿ���Υ��֥�������

@param methods �Ѿ�����᥽�åɤΥꥹ��

�Ѿ����Υ��֥������Ȥ� methods �Τ��줾��Υ᥽�åɤ��ƤӽФ��줿���ˡ�
�Ѿ���Υ��֥������Ȥ�Ʊ̾�Υ᥽�åɤؽ������Ѿ������褦�ˤʤ�ޤ���

def_delegators �� def_singleton_delegators ����̾�ˤʤ�ޤ���


--- def_singleton_delegator(accessor, method, ali = method) -> nil
--- def_delegator(accessor, method, ali = method) -> nil

�᥽�åɤΰѾ�������ꤷ�ޤ���

@param accessor �Ѿ���Υ��֥�������

@param method �Ѿ���Υ᥽�å�

@param ali �Ѿ����Υ᥽�å�

�Ѿ����Υ��֥������Ȥ� ali ���ƤӽФ��줿���ˡ�
�Ѿ���Υ��֥������Ȥ� method �ؽ������Ѿ������褦�ˤʤ�ޤ���

�Ѿ����ȰѾ���Υ᥽�å�̾��Ʊ������, ali ���ά���뤳�Ȥ���ǽ�Ǥ���

def_delegator �� def_singleton_delegator ����̾�ˤʤ�ޤ���

