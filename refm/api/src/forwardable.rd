���饹���Ф��ƥ᥽�åɤΰѾ���ǽ��������ޤ���

#@#�ʲ��Υ⥸�塼�뤬�������ޤ���

#@#  * [[c:Forwardable]]
#@#  * [[c:SingleForwardable]]

#@#�ܺ٤� [[unknown:"ruby-src:doc/forwardable.rd.ja"]] �򻲾Ȥ��Ƥ���������

=== ����

  * Rubyist Magazine 0012 �� ɸ��ź�ե饤�֥��Ҳ���� 6 ��۰Ѿ� ([[url:http://jp.rubyist.net/magazine/?0012-BundledLibraries]])

= module Forwardable

���饹���Ф��᥽�åɤΰѾ���ǽ���������⥸�塼��Ǥ���

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

--- debug
--- debug=
#@todo

�Ѿ������᥽�åɤ�Хå��ȥ졼���˴ޤ�뤫�ɤ��������ꤷ�ޤ���
(�ǥե���Ȥ�ɽ�����ޤ���)

== Instance Methods

--- def_instance_delegators(accessor, *methods)
--- def_delegators(accessor, *methods)
#@todo

methods ���Ϥ��줿�᥽�åɤΥꥹ�Ȥ� accessor �˰Ѿ�����
�褦�ˤ��ޤ���

--- def_instance_delegator(accessor, method, ali = method)
--- def_delegator(accessor, method, ali = method)
#@todo

method ���Ϥ��줿�᥽�åɤ� accessor �˰Ѿ�����褦�ˤ�
�ޤ���ali�������Ȥ����Ϥ��줿�Ȥ��ϡ��᥽�å�ali���Ƥ�
�줿�Ȥ��ˤϡ�accessor ���Ф� method ��ƤӽФ��ޤ���

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

--- def_singleton_delegators(accessor, *methods)
--- def_delegators(accessor, *methods)
#@todo

methods ���Ϥ��줿�᥽�åɤΥꥹ�Ȥ� accessor �˰Ѿ�����
�褦�ˤ��ޤ���

--- def_singleton_delegator(accessor, method, ali = method)
--- def_delegator(accessor, method, ali = method)
#@todo

method ���Ϥ��줿�᥽�åɤ� accessor �˰Ѿ�����褦�ˤ���
����ali �������Ȥ����Ϥ��줿�Ȥ���, �᥽�å� ali ���ƤФ�
���Ȥ��ˤϡ�accessor ���Ф� method ��ƤӽФ��ޤ���

