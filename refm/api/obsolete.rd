= ���ΰ�ʪ

�ʲ��˵󤲤��ѿ�̾���᥽�å�̾�����֥�������̾�ϸŤ�̾���Ǥ���
���Ѥ���ȡ��ٹ𤬽Ф��ꡢ�����������ʤ��ʤä��ꤹ�뤫�⤷��ޤ���

== ���Υ᥽�å�

: String#~
: String#=~

  ~str �ϡ�1.8 �ʹߺ������ޤ������ޤ���str =~ str ���㳰���Ф�褦��
  �ʤ�ޤ�����

: Object#id

  1.8 �ǤϷٹ𤵤�ޤ�������� Object#object_id ��ȤäƤ���������

    $ ruby-1.8.0 -we 'p Object.new.id'
    -e:1: warning: Object#id will be deprecated; use Object#object_id
    537752050

: Object#type

  1.8 �ǤϷٹ𤵤�ޤ�������� Object#class ��ȤäƤ���������

    $ ruby-1.8.0 -we 'p Object.new.type'
    -e:1: warning: Object#type is deprecated; use Object#class
    Object

: Object#to_a

  Object#to_a �Ͼ����ѻߤ���ޤ���Kernel#Array ��ȤäƤ���������

    $ ruby-1.8.0 -e 'p Object.new.to_a'
    -e:1: warning: default `to_a' will be obsolete
    [#<Object:0x401ae3e4>]

    $ ruby-1.8.0 -we 'p Array(Object.new)'
    [#<Object:0x401ae3d0>]

: FileTest.exists?

  ��ñ���� S ���դ��ʤ��Ȥ���̿̾��§��ȿ����Τ��򤱤�٤��Ǥ���
  ((<FileTest/FileTest.exist?>)) ��ȤäƤ���������
  �� ((<rubyist:1194>))

: indexes, indicies (((<Array>)), ((<Hash>)), ((<ENV>)))
  ((<version 1.7|ruby 1.7 feature>)) �Ǥϡ����Ѥ����

    warning: Array#indexes is deprecated; use Array#select

  �ȷٹ𤬽Фޤ���

  * index��ʣ������indexes��indices��ξ��������Τ�����Τ�
    ��(ξ���󶡤��Ƥ뤱��)

  * index(�ͤ���ꤷ�Ƥ��Υ���ǥå���������)�᥽�å�
    ��indexes(����ǥå�����ʣ�����ꤷ���б������ͤ��������
    ��)��Ʊ��ñ��ʤΤ˰�̣���դȤ����Τ���̿Ū

  �Ȥ������Ȥ���������Ǥ�((<ruby-dev:16084>))��

  ((<ruby-talk:10830>)), ((<ruby-talk:11066>)), ((<ruby-dev:16082>)) 
  �ʤɤǵ����������äƤ��ޤ�����

  �ٹ��å������ˤ���褦�� select �����θ���ˤʤäƤ��ޤ���

  ((<ruby 1.8 feature>)): ���θ塢((<Array/values_at>)) �����Ѥ���ޤ�
  ��((<ruby-dev:20153>))��

: Array#filter
  Array#collect! ���֤��������ޤ�����

  ���Υ᥽�åɤ���Ѥ���ȷٹ��å��������Фޤ���
  (1.8 �ǤϤ��Υ᥽�åɤϤʤ��ʤ�ޤ�����)

: Time.times
  ((<Process.times|Process>)) �˰�ư���ޤ�����
  1.8 �� (({Time.times})) ��Ȥ��ȷٹ𤵤�ޤ���

    $ ruby-1.8.0 -e 'p Time.times'
    -e:1: warning: obsolete method Time::times; use Process::times
    #<struct Struct::Tms utime=0.0, stime=0.0, cutime=0.0, cstime=0.0>

: iterator?
  �᥽�åɤ��դ����֥�å���ɬ�����ⷫ���֤��ʤ��Τǡ�
  �֥�å��դ��᥽�åɤ򥤥ƥ졼���ȸƤ֤Τ���Ŭ�ڤǤ���
  ����� block_given? ��ȤäƤ���������

  �������ƥ졼���Ȥ����Ѹ켫�Τϰ����Ȥ��³���Ƥ��ޤ�����
  ���δؿ���ȤäƤ�ٹ�Ϥ���ޤ���

: ((<ObjectSpace>)).add_finalizer
: ((<ObjectSpace>)).remove_finalizer
: ((<ObjectSpace>)).call_finalizer
: ((<ObjectSpace>)).finalizers

  Ruby 1.8 �ǤϤ����Υ᥽�åɤ�Ȥ��ȷٹ𤵤�ޤ���
  �����Υ᥽�åɤϰ��� final �饤�֥����󶡤���Ƥ����᥽�å�

    * ObjectSpace.define_finalizer
    * ObjectSpace.undefine_finalizer

  ���Ȥ߹��ߤˤʤä��Τ����פǤ���
  ���äơ������ final �饤�֥��� obsolete �Ǥ���

== ���Υ��饹

: NotImplementError
  ((<NotImplementedError>))�ε�Ρ�
  ((<version 1.8|ruby 1.8 feature>)) �Ǥϴ��˺������Ƥ��ޤ���

: MatchingData
  ((<MatchData>))�ε��

== �����Ȥ߹����ѿ������

: (({$~})), (({$!})) ��������
  �ʤ��ʤ뤳�ȤϤʤ��Ȼפ��ޤ���������Ū�˻Ȥ�ʤ��Τ�
  �Ƕ�Υ�������Ǥ������ʤ��Ȥ⺣�������뤳�ȤϤ���ޤ���
  ̵���˻Ȥ��Τ����ɬ�פϤ���ޤ��󤬡����ؤˤʤ뵭ˡ��
  ������Ϥ������Ȥ��ۤ������줤�ˤʤ뤳�Ȥ�¿������ޤ���
  �㤨�� (((<Regexp>)).last_match �� ((<Process>)).waitpid2��
  rescue => var �ʤɤǤ���

  ������ (({$=})) (ʸ�������Ӥ���ʸ����ʸ����̵�뤹�뤫����)
  ������ obsolete �Ǥ������������ޤ��� (((<ruby-dev:12978>)))��
  Ruby 1.8 �ǤϷٹ𤬽Фޤ���

    $ ruby-1.8.0 -e '$= = false'
    -e:1: warning: modifying $= is deperecated

  Ruby 1.8 �Ǥϴ���ʸ����Υϥå����ͤ� $= ���ͤ˰�¸���ʤ�
  �ʤäƤ��ޤ���((<ruby-bugs-ja:PR#61>))

    p "foobar".hash
    $= = true
    p "foobar".hash

    # Ruby 1.6.8 �η��
    594908901
    -24977883

    # Ruby 1.8.0 �η��
    594908901
    594908901

: $defout, $deferr

  version 1.8 �ʹߡ�$stdout, $stderr ����������Ѥ����褦�ˤʤ��
  ������version 1.8 �Ǥϡ�$stdout, $stderr, $stdin �˥�����쥯�Ȥθ�
  �̤Ϥʤ��ʤäƤ��ޤ���($deferr �� version 1.8.0 preview ��������줿
  �ѿ��Ǥ�)��

  $defout, $deferr �˥��֥������Ȥ���������ȷٹ𤬽��Ϥ���ޤ���

: TRUE, FALSE, NIL

  �Ϥ뤫�ΤΥС������� Ruby �Ǥ� true false nil ���ʤ��ä��Τ�
  �����������Ȥ��Ƥ����ΤǤ��������ȤʤäƤ����פǤ���
  ®�䤫�˰ܹԤ��Ƥ���������

: VERSION, RELEASE_DATE, PLATFORM

  Ruby 1.9 �Ǥ��ѻߤ���ޤ��������줾���RUBY_�פ����֤���
  RUBY_VERSION, RUBY_RELEASE_DATE, RUBY_PLATFORM ��ȤäƤ���������

== ����¾���Τ��

: ����ɽ���� //p ���ץ����

  1.6 �ǤϷٹ𤵤�ޤ���
  1.8 �Ǥ��ѻߤ���ޤ�����

  ��������� m ���ץ����Ƴ������ޤ�����
  ����� p ���ץ����Ȥϰ�̣���ޤä����㤤�ޤ���
  p �ϥ᥿ʸ����.�ס�^�ס�$�פΰ�̣���Ѥ��륪�ץ����Ǥ�����
  m �ϡ�.�פ���Ԥ˥ޥå�����褦���Ѥ�������Ǥ���

  p ���ץ�����ѻߤ��줿�Τϰʲ�����ͳ����Ǥ���

    * �����ʣ���Ǥ���
    * //m �� ����ɽ�� \A \Z ��Ȥä�ɽ����ǽ�Ǥ���
    * p �� m ��ξ���󶡤���ˤϥե饰�Υӥåȿ���­��ʤ�

  �ܺ٤� ((<ruby-list:22483>)) �򻲾Ȥ��Ƥ���������
