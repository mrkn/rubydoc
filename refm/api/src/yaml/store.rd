#@since 1.8.0
Ruby�Υ��֥������Ȥ�YAML�����γ����ե�����˳�Ǽ���뤿��Υ��饹�Ǥ���

  require "yaml/store"

  db = YAML::Store.new("sample.yml")
  db.transaction do
    db["hoge"] = {1 => 100, "bar" => 101}
  end

= class YAML::Store < PStore

[[c:PStore]] �� [[c:YAML]] �ǤǤ���
[[m:Marshal.#dump]] �����Х��ʥ������
����� YAML �����ǥե��������¸���ޤ���

�Ȥ����� [[c:PStore]] �ȤۤȤ��Ʊ���Ǥ���

== class methods
--- new(*options)

YAML�����Υե�������ɤ߹��ޤ��������ϡ��ǽ�ΰ����˥ե�����̾��ʸ����ǻ��ꤷ�ޤ���
�Ǹ�ΰ������ϥå���Ǥ��ä����ϡ�YAML�Υǥե���Ȥ�������ѹ����ޤ���

@param �ɤ߹��ޤ������ե�����䡢���ץ�����Ϳ���ޤ���

@see [[m:YAML::DEFAULTS]]

== instance methods
--- [](name)
--- fetch
--- []=(name, value)
--- delete(name)
--- roots
--- root?(name)
--- path
--- commit
--- abort
--- transaction
#@todo

�Ȥ����� [[c:PStore]] �ȤۤȤ��Ʊ���Ǥ���

��

  require "yaml/store"

  db = YAML::Store.new("sample.yml")
  db.transaction do
    db["hoge"] = {1 => 100, "bar" => 101}
  end

  # sample.yml
  hoge:
    1: 100
    bar: 101

[[c:PStore]] Ʊ�͡��桼��������������饹�Υ��֥������Ȥ���¸���뤳�Ȥ�Ǥ��ޤ���

  require "yaml/store"
  
  class Foo
    attr_accessor :foo
  end
  
  db = YAML::Store.new("sample.yml")
  db.transaction do
    f = Foo.new
    f.foo = 777
    db["bar"] = f
  end
  
  # sample.yml
  bar: !ruby/object:Foo
    foo: 777
#@end
