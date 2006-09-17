((<��ɮ���罸>))

* ((<URL:http://www.druby.org/ilikeruby/rinda.html>))
* ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/d208.html>))



= class Rinda::Tuple

Tuple �Τ���Υ��饹�Ǥ���

== Class Methods

--- new(ah)

Tuple ���֥������Ȥ��������ޤ���
ah �ˤ� [[c:Array]] ���֥������Ȥ� [[c:Hash]] ���֥������Ȥ�Ϳ���ޤ���
[[c:Hash]] ���֥������Ȥ�Ϳ�����硢
�����Ϥ��٤�ʸ����Ǥʤ���Ф����ޤ���

== Methods

--- [](key)

�ϥå��奭�� key ���б��������Ǥ��֤��ޤ���
self �� [[c:Array]] ���֥������Ȥ����������줿���ϡ�
���� key ��Ϳ����Ȥ��Υ���ǥå������б��������Ǥ��֤��ޤ���

--- each{|key, value| ... }

�ƥϥå��奭�� key ���� value �Υڥ�������Ȥ��ƥ֥�å���ɾ�����ޤ���
self �� [[c:Array]] ���֥������Ȥ����������줿���ϡ�
����ǥå������ͤΥڥ�������Ȥ��ƥ֥�å���ɾ�����ޤ���

--- fetch(key)

�ϥå��奭�� key ���б��������Ǥ��֤��ޤ���

--- size

���������������֤��ޤ���

--- value

���Ȥ��ݻ����Ƥ���ϥå��夫������֤��ޤ���



= class Rinda::Template < Rinda::Tuple

���ץ�Υޥå��󥰤Τ���Υ��饹�Ǥ���
�桼�������Υ��饹��ľ�ܻȤ����ȤϤ���ޤ���

=== ��

 require 'rinda/rinda'
 
 template = Rinda::Template.new(['abc', nil, nil])
 template.match(['abc', 2, 5])   # => true
 template.match(['hoge', 2, 5])  # => false

 template = Rinda::Template.new([String, Integer, nil])
 template.match(['abc', 2, 5])   # => true
 template.match(['abcd', 2, 5])  # => true
 
 template = Rinda::Template.new([/^abc/, Integer, nil])
 template.match([/^abc/, Integer, nil])  # => true
 template.match(['abc', 2, 5])           # => true
 template.match(['def', 2, 5])           # => false
 
 template = Rinda::Template.new({'name' => String, 'age' => Integer})
 template.match({'name' => 'seki', 'age' => 0x20})   # => true
 template.match({'name' => :seki,  'age' => 0x20})   # => false

== Methods

--- ===(tuple)
--- match(tuple)

self �� tuple �Υ�������Ʊ���ǡ�
self �γ����Ǥ� tuple �˥ޥå�������Ͽ����֤��ޤ���
�ޥå��󥰤θ����ˤ� == �� === ���Ѥ��ޤ���
nil �ϥ磻��ɥ����ɤǤ���



= class Rinda::TupleSpaceProxy

((<��ɮ���罸>))
