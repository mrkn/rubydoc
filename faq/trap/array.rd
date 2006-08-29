= trap::Array

* Array.new([size[, val]])

  ����� ((|val|)) �ϡ����Υ��ԡ��ǽ��������櫓�ǤϤʤ����Ȥ���
  �դ��Ƥ����������ʲ��Τ褦�ˤ��٤Ƥ����Ǥ�Ʊ�����֥������Ȥ�ؤ�
  �ޤ���

    ary = Array.new(3, "foo")
    p ary   # => ["foo", "foo", "foo"]
    ary.each {|v| p v.object_id}
    # => 537713734
         537713734
         537713734

  �������äơ����Τ褦����������ǤΤ���1�Ĥ��˲�Ū���ѹ�����С�
  ���٤Ƥ����Ǥ��ѹ�����ޤ���

    ary = Array.new(3, "foo")
    ary[0].replace "bar"
    p ary
    # => ["bar", "bar", "bar"]

  ������򤱤�ˤ��㤨�аʲ��Τ褦�ˤ��ޤ���

    ary = Array.new(3).collect { "foo" }
    ary[0].replace "bar"
    p ary
    # => ["bar", "foo", "foo"]

  ((<ruby 1.7 feature>)): version 1.7 �Ǥϡ��֥�å�����ꤹ�뤳�ȤǤ�
  ����򤱤뤳�Ȥ��Ǥ��ޤ���

    ary = Array.new(3) { "foo" }
    p ary   # => ["foo", "foo", "foo"]
    ary.each {|v| p v.object_id}
    # => 537770556
         537770436
         537770424

* self * times

  Array.new ��Ʊ�ͤǤ���

    ary = ["foo"] * 3
    ary[0].replace "bar"
    p ary
    # => ["bar", "bar", "bar"]

* Array#fill(val)

  Array.new ��Ʊ�ͤǤ���

    ary = Array.new(3).fill("foo")
    ary[0].replace "bar"
    p ary
    # => ["bar", "bar", "bar"]

  ((<ruby 1.7 feature>)): Array.new ��Ʊ�͡��֥�å��Ǥ�����򤱤뤳��
  ���Ǥ��ޤ���

    ary = Array.new(3).fill { "foo" }
    ary[0].replace "bar"
    p ary
    # => ["bar", "foo", "foo"]

* Array#<=>

  Array��(({<=>}))�᥽�åɤ���äƤ��ޤ�����Comparable�ǤϤ���ޤ���
  (((<ruby-list:18470>)),((<ruby-dev:8261>)),((<ruby-dev:2173>)))

* Array#uniq

  ((<Object/hash>))�᥽�åɤ�((<Object/eql?>))���������Ƥ��ʤ����饹��
  ���֥������Ȥ����ǤȤ��ƻ��ľ�硢�פä��ۤ����Ǥ�����ʤ����Ȥ�����ޤ���

    [Hash.new, Hash.new].uniq #=> [{}, {}]
