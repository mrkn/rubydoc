= module Marshal

Ruby ���֥������Ȥ�ե�����(�ޤ���ʸ����)�˽񤭽Ф����ꡢ�ɤ��ᤷ����
���뵡ǽ���󶡤���⥸�塼�롣����ʬ�Υ��饹�Υ��󥹥��󥹤�񤭽Ф���
���Ǥ��ޤ������񤭽Ф����Բ�ǽ�ʥ��饹��¸�ߤ��ޤ�(���)��

�����ǡ֥ޡ������ǡ����פȸ����Ѹ�ϡ�Marshal.dump �����Ϥ���ʸ����
��ؤ���ΤȤ��ޤ���

== Module Functions

--- dump(obj[,port][,limit])

obj ��Ƶ�Ū�˥ե�����˽񤭽Ф��ޤ����ե�����˽񤭽Ф��ʤ�
���֥������Ȥ�ե�����˽񤭽Ф����Ȥ�����㳰 [[c:TypeError]] ��
ȯ�����ޤ����ե�����˽񤭽Ф��ʤ����֥������Ȥϰʲ����̤�Ǥ���

 * ̾���ΤĤ��Ƥʤ� [[c:Class]]/[[c:Module]] ���֥������ȡ�(���ξ�
   ��ϡ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���̵̾���饹�ˤĤ���
   �ϡ�[[m:Module.new]] �򻲾ȡ�)
 * �����ƥब���֥������Ȥξ��֤��ݻ������Ρ�����Ū�ˤϰʲ��Υ���
   �����󥹡�[[c:Dir]], [[c:File::Stat]], [[c:IO]] �Ȥ��Υ��֥��饹
   [[c:File]], [[c:Socket]] �ʤɡ�
 * [[c:MatchData]], [[c:Data]], [[c:Method]], [[c:UnboundMethod]],
   [[c:Proc]], [[c:Thread]], [[c:ThreadGroup]], [[c:Continuation]]
   �Υ��󥹥��󥹡�
 * �ðۥ᥽�åɤ�����������֥�������

�ޤ��������Υ��֥������Ȥ����Ū�˻ؤ����֥������Ȥʤɤ�񤭽Ф�
�ޤ����㤨�С��ǥե�����ͤ����֥�å�����ä� [[c:Hash]] ��
[[c:Proc]] �����Ū�˻ؤ��Ƥ��뤳�Ȥˤʤ�ޤ���

  p Marshal.dump(Hash.new {})
  => -:1:in `dump': cannot dump hash with default proc (TypeError)

port �ˤ� [[c:IO]](�ޤ��Ϥ��Υ��֥��饹)�Υ��󥹥��󥹤����
���ޤ������ξ�硢port ���֤��ޤ�����ά�������ˤ�
dump �Ϥ��Υ��֥������Ȥ����פ���ʸ������֤��ޤ���

limit ����ꤷ����硢limit �ʰʾ忼����󥯤������֥���
���Ȥ����פǤ��ޤ���(�ǥե���Ȥ� 100 ��٥�)����� limit
����ꤹ��ȿ��������å���Ԥ��ޤ���

�ޡ�������ư���Ǥ�դ�������뤳�Ȥ�Ǥ��ޤ����ܺ٤ϡ�
[[m:Marshal#�桼�������Marshal]] �򻲾Ȥ��Ƥ���������

--- load(port[,proc])
--- restore(port[,proc])

port ����ޡ������ǡ������ɤ߹���ǡ����Υ��֥������Ȥ�Ʊ
�����֤��ĥ��֥������Ȥ��������ޤ���port ��ʸ����
IO(�ޤ��Ϥ��Υ��֥��饹)�Υ��󥹥��󥹤���ꤷ�ޤ���

proc �Ȥ��Ƽ�³�����֥������Ȥ�Ϳ����줿���ˤ��ɤ߹����
���֥������Ȥ�����ˤ��μ�³����ƤӽФ��ޤ���
#@# ((-���� [[c:Fixnum]], [[c:Symbol]] ���Ϥ���ʤ��Զ�礬���ä�����
#@# 1.6.7 2002-03-15 ����˲����Ѥ�-))

  str = Marshal.dump(["a", 1, 10 ** 10, 1.0, :foo])
  p Marshal.load(str, proc {|obj| p obj})

  => "a"
     1
     10000000000
     1.0
     :foo
     ["a", 1, 10000000000, 1.0, :foo]
     ["a", 1, 10000000000, 1.0, :foo]

#@since 1.7.0
== Constants

--- MAJOR_VERSION
--- MINOR_VERSION

[[m:Marshal.dump]] �����Ϥ���ǡ����ե����ޥåȤΥС�������ֹ�Ǥ���

[[m:Marshal.load]] �ϡ��᥸�㡼�С�����󤬰ۤʤ뤫���С��������礭��
�ޡ������ǡ������ɤ߹�����Ȥ��㳰 [[c:TypeError]] ��ȯ�������ޤ���

�ޥ��ʡ��С�����󤬸Ť������Υե����ޥåȤ��ɤ߹��߲�ǽ�Ǥ�����
[[m:$VERBOSE]] = true �ΤȤ��ˤϷٹ��å����������Ϥ���ޤ�

�ޡ�����뤵�줿�ǡ����ΥС�������ֹ�ϰʲ��Τ褦�ˤ��Ƽ������뤳
�Ȥ��Ǥ��ޤ���

  obj = Object.new
  major, minor = Marshal.dump(obj).unpack("cc")
  p [major, minor]
#@end

= reopen Class
== Instance Methods
--- _load(str)
[[m:Object#_dump]]�򻲾ȡ�

= reopen Object
== Instance Methods

--- _dump(limit)

Marshal.dump �ˤ����ƽ��Ϥ��륪�֥������Ȥ��᥽�å� `_dump'
��������Ƥ�����ˤϡ����Υ᥽�åɤη�̤��񤭽Ф���ޤ����᥽��
�� `_dump' �ϰ����Ȥ��ƺƵ������¤����٥� limit ���
����ꡢ���֥������Ȥ�ʸ���󲽤�����Τ��֤��ޤ���

���󥹥��󥹤��᥽�å� `_dump' ����ĥ��饹��ɬ��Ʊ���ե���
�ޥåȤ��ɤ��᤹���饹�᥽�å� `_load' ���������ɬ�פ�����
�ޤ���`_load' �ϥ��֥������Ȥ�ɽ������ʸ����������ꡢ����
�򥪥֥������Ȥ��ᤷ����Τ��֤�ɬ�פ�����ޤ���

  class Foo
    def initialize(obj)
      p "initialize() called"
      @foo = obj
    end
    def _dump(limit)
      Marshal.dump(@foo, limit)
    end
    def self._load(obj)
      Foo.new(Marshal.load(obj))
    end
  end

  p Marshal.load(Marshal.dump(Foo.new(['foo', 'bar'])))

  => "initialize() called"
     "initialize() called"
     #<Foo:0x4019eb88 @foo=["foo", "bar"]>

���󥹥����ѿ��ξ�������̥ޡ������ǡ����˴ޤޤ��Τǡ�������
�Τ褦�� _dump ���������ɬ�פϤ���ޤ���(������ _dump ����������
���󥹥����ѿ��ξ���� dump ����ʤ��ʤ�ޤ�)��
_dump/_load �Ϥ����٤������Ԥ����������ĥ�饤�֥��������
�����饹�Υ��󥹥��󥹤����󥹥����ѿ��ʳ��˾�����ݻ��������
���Ѥ��ޤ���(�㤨�С����饹 [[c:Time]] �ϡ�_dump/_load ���������
���ޤ�)

#@since 1.8.0
--- marshal_dump
--- marshal_load(obj)

marshal_dump/marshal_load �λ��Ȥߤ�
ruby 1.8.0 ����Ƴ������ޤ�����_dump/_load ����Ȥ��䤹���Τǡ�
����������Ѥ��侩����ޤ���_dump/_load �Ϥޤ� obsolete �ˤϤʤä�
���ޤ��󤬡��󤤾��褽���ʤ뤫�⤷��ޤ���
[[ruby-dev:21088]]

[[m:Marshal.dump]] �ˤ����ơ����Ϥ��륪�֥������Ȥ��᥽�å�
`marshal_dump' ��������Ƥ�����ˤϡ���������ͤ� dump ����ޤ���
�᥽�å� marshal_dump ��Ǥ�դΥ��֥������Ȥ��֤��᥽�åɤȤ�
��������ޤ���

���Τ褦�ʥ��֥������Ȥ� load ����ˤϥ᥽�å� `marshal_load' ����
������Ƥ��ʤ��ƤϤʤ餺��load �������Ѥ���ޤ���
marshal_load �� marshal_dump ������ͤΥ��ԡ�������˼�����
��ޤ���marshal_load ���� self �ϡ��������줿�Ф���
([[m:Class#allocate]] ���줿�Ф���)�ξ��֤Ǥ���
�ʤ���marshal_load ������ͤ�̵�뤵��ޤ���

dump ���륪�֥������Ȥ� _dump �� marshal_dump ��ξ���Υ᥽�åɤ��
�ľ�� marshal_dump �����Ѥ���ޤ���

  class Foo
    def initialize
      p "initialize() called"
      @foo = ['foo', 'bar']
    end
    def marshal_dump
      @foo
    end
    def marshal_load(obj)
      @foo = obj
    end
  end
  
  p Marshal.load(Marshal.dump(Foo.new))
  
  "initialize() called"
  #<Foo:0x4019ed2c @foo=["foo", "bar"]>

���󥹥����ѿ��ξ�������̥ޡ������ǡ����˴ޤޤ��Τǡ�������
�Τ褦�� marshal_dump ���������ɬ�פϤ���ޤ���(������
marsahl_dump ���������ȥ��󥹥����ѿ��ξ���� dump ����ʤ���
��ޤ��Τǡ�marshal_dump/marshal_load �ǰ���ɬ�פ�����ޤ�)��
marshal_dump/marshal_load �Ϥ����٤������Ԥ���������
��ĥ�饤�֥�������������饹�Υ��󥹥��󥹤����󥹥����ѿ��ʳ�
�˾�����ݻ�����������Ѥ��ޤ���

�äˡ�marshal_dump/marshal_load ������������֥������Ȥ��ðۥ᥽�åɤ�
�������Ƥ��Ƥ�ޡ������Ǥ���褦�ˤʤ�ޤ���
(�ðۥ᥽�åɤξ��󤬼�ưŪ�� dump �����褦�ˤʤ�櫓�ǤϤʤ���
marshal_dump/marshal_load �ˤ�ꤽ���¸�����;�Ϥ�����Ȥ�������
�Ǥ�)
#@end
