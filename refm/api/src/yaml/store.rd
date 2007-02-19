#@since 1.8.0
= class YAML::Store < PStore

[[c:PStore]] �� [[c:YAML]] �ǤǤ���
[[m:Marshal.dump]] �����Х��ʥ������
����� YAML �����ǥե��������¸���ޤ���

�Ȥ����� [[c:PStore]] �ȤۤȤ��Ʊ���Ǥ���

== class methods
--- new(*options)
#@todo
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

=== ��

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
