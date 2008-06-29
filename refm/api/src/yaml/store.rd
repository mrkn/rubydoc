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
���󥿡��ե������� [[c:Hash]] �˻��Ƥ��ޤ��� 

== class methods
--- new(*options)

YAML�����Υե�������ɤ߹��ޤ��������ϡ��ǽ�ΰ����˥ե�����̾��ʸ����ǻ��ꤷ�ޤ���
�Ǹ�ΰ������ϥå���Ǥ��ä����ϡ�YAML�Υǥե���Ȥ�������ѹ����ޤ���

@param options �ɤ߹��ޤ������ե�����䡢���ץ�����Ϳ���ޤ���

@see [[m:YAML::DEFAULTS]]

== instance methods
--- [](name) -> object
�롼��name���б������ͤ����ޤ���

@param name õ������롼�Ȥ�̾������ꤷ�ޤ���

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
  }

  db.transaction {
    p db["hoge"] #=> [1, 2, 3, 4]
  }

--- fetch(name, default = PStore::Error) -> object

�롼��name���б������ͤ����롣

��������롼�Ȥ���Ͽ����Ƥ��ʤ����ˤϡ�
���� default ��Ϳ�����Ƥ���Ф����ͤ��֤���
Ϳ�����Ƥ��ʤ�����㳰 [[c:PStore::Error]] ��ȯ�����ޤ��� 

@param name õ������롼�Ȥ�ʸ����ǻ��ꤷ�ޤ���
@param default name ���б�����롼�Ȥ���Ͽ����Ƥ��ʤ������֤��ͤ���ꤷ�ޤ���

@raise PStore::Error name ���б�����롼�Ȥ���Ͽ����Ƥ��ʤ����ġ�
                     default ��Ϳ�����Ƥ��ʤ�����ȯ�����ޤ���
                     �ޤ����ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
  }

  db.transaction {
    p db.fetch("hoge") #=> [1, 2, 3, 4]
    begin
      p db.fetch("fuga")
    rescue PStore::Error
      puts "name ���б�����롼�Ȥ���Ͽ����Ƥ��ʤ�������ˡ� default ��Ϳ�����Ƥ��ޤ���"
    end
    p db.fetch("fuga", "ugougo") #=> "ugougo"
  }

--- []=(name, value) -> object
�롼�� name ���б������� value ���������ޤ���

@param name õ������롼�Ȥ�̾������ꤷ�ޤ���
@param value �������륪�֥������Ȥ���ꤷ�ޤ���

  require 'yaml/store'

  class HogeHoge
    def initialize
      @ho = 'hoge'
      @ge = 'fuga'
    end
  end

  hoge = HogeHoge.new

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = hoge
  }

  db.transaction {
    p db["hoge"] #=> #<HogeHoge:0x3bcc5c @ho="hoge", @ge="fuga">
  }

--- delete(name) -> object | nil
�롼��name���б������ͤ������ޤ��� 

@param name õ������롼�Ȥ�̾������ꤷ�ޤ���

@return ��������ͤ��֤��ޤ����롼�Ȥ�¸�ߤ��ʤ�����nil���֤��ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
    db["fuga"] = [ 5, 6, 7]
  }

  rt = ''
  db.transaction {
    rt = db.delete("fuga") 
    p db.delete("ugougo") #=> nil
  }

  p rt #=> [5, 6, 7]
  begin
    db.delete("hoge")
  rescue PStore::Error
    puts "transaction ��Ϳ����֥�å��Τʤ���delete �ϸƤӽФ���"
  end

--- roots -> Array
�롼�Ȥν����������֤��ޤ��� 

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
    db["fuga"] = [ 5, 6, 7]
  }

  db.transaction {
    p db.roots #=> ["fuga", "hoge"]
  }

  begin
    p db.roots
  rescue PStore::Error
    puts "transaction ��Ϳ����֥�å��Τʤ���roots �ϸƤӽФ���"
  end

--- root?(name) -> bool
�롼�� name ���ǡ����١����˳�Ǽ����Ƥ�����˿����֤��ޤ���

@param name õ������롼�Ȥ�̾������ꤷ�ޤ���

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
    db["fuga"] = [ 5, 6, 7]
  }

  db.transaction {
    p db.root?('fuga')   #=> true
    p db.root?('ugougo') #=> false
  }

  begin
    p db.root?('hoge')
  rescue PStore::Error
    puts "transaction ��Ϳ����֥�å��Τʤ���root? �ϸƤӽФ���"
  end

--- path -> String
�ǡ����١����Υե�����̾�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    p db.path #=> /tmp/store.yaml
  }

--- commit -> ()
�ǡ����١������ɤ߽񤭤�λ���ޤ��� 

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new('/tmp/store.yaml')
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
    db["fuga"] = [ 5, 6, 7]
    db.commit
    db["ugougo"] = [ 8, 9, 10]
  }

  db.transaction {
    p db.root?("fuga")   #=> true
    p db.root?('ugougo') #=> false
  }

  begin
    p db.commit
  rescue PStore::Error
    puts "transaction ��Ϳ����֥�å��Τʤ���commit �ϸƤӽФ���"
  end

--- abort -> ()
�ǡ����١������ɤ߽񤭤�λ���롣
transaction �֥�å�����ȴ���ޤ������ǡ����١������ѹ���ȿ�Ǥ���ޤ��� 

@raise PStore::Error �ȥ�󥶥�����󳰤Ǥ��Υ᥽�åɤ��ƤӽФ��줿����ȯ�����ޤ��� 

  require 'yaml/store'
  require 'tmpdir'

  db = YAML::Store.new("/#{Dir.tmpdir}/#{$$}.yaml")
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
    db["fuga"] = [ 5, 6, 7]
    db.abort
    db["ugougo"] = [ 8, 9, 10]
  }

  db.transaction {
    p db.root?("hoge")   #=> false
    p db.root?('ugougo') #=> false
  }

  begin
    p db.abort
  rescue PStore::Error
    puts "transaction ��Ϳ����֥�å��Τʤ���abort �ϸƤӽФ���"
  end

--- transaction(read_only = false) -> ()
�ȥ�󥶥�����������ޤ������Υ֥�å�����ǤΤߥǡ����١������ɤ߽񤭤��Ǥ��ޤ���
�ɤ߹������ѤΥȥ�󥶥�����󤬻��Ѳ�ǽ�Ǥ��� 

@param read_only ������ꤹ��ȡ��ɤ߹������ѤΥȥ�󥶥������ˤʤ�ޤ��� 

@raise PStore::Error read_only �򿿤ˤ����Ȥ��ˡ��ǡ����١������ѹ����褦��������ȯ�����ޤ��� 

  require 'yaml/store'

  db = YAML::Store.new("/tmp/store.yaml")
  db.transaction {
    db["hoge"] = [ 1, 2, 3, 4]
  }

  begin
    db.transaction(true) {
      db["hoge"] = [ 1, 2, 3, 4]
    }
  rescue PStore::Error
    puts "�ɤ߹������ѤΥȥ�󥶥������˽񤭹��⤦�Ȥ��ޤ����� "
  end


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
