#@# Author: <jammy@shljapan.co.jp>

require getopts

���ץ�������Ϥ���$OPT_xxx ���ͤ����ꤷ�ޤ���
���˻��ꤷ�����ץ���󤬾��ˤ��äƤ��ʤ���硤USAGE ��ɽ�����ޤ���

Note: This library is obsolete after Ruby 1.8.1.

=== ���ץ�������

[[lib:getopts]] �Υ��ץ������Ϥ�Ʊ���Ǥ���

=== USAGE������

$USAGE �� "usage" (̾���ϲ��Ǥ�褤) �򥻥åȤ��ޤ���

  def usage
    puts "Usage: #{File.basename($0)} <file>..."
    puts "Options:"
          :
          :
  end

  $USAGE = 'usage'

=== ����

  * ruby-src:sample/getopts.test
  * ruby-src:sample/biorhythm.rb



= reopen Object

== Instance Methods

--- parseArgs(min_argc��check_opts��single_opts��*opts)

: ������
    `-'��`--'��ȼ�äƻ��ꤹ�륪�ץ����ʳ��Υ��ץ�����
    ����ɬ�׿�����ꤷ�ޤ���¸�ߤ��ʤ����� 0 ����ꤷ�ޤ���
: �������
    �ɤΥ��ץ����ɬ�׾�狼����ꤷ�ޤ����軰����Ͱ����ǻ��ꤹ��
    ���ץ����Τ���ɬ�פʤ�Τ�'('��')'��'|'��'&' ��Ȥä��¤١���
    �Τ���֥륯���ơ������ǳ��ޤ��� Ruby������ץȼ¹Ի�������
    �Υ��ץ���󤬾�ά��ǽ�ʤ�� `nil'����ꤷ�Ʋ�������
: �軰����Ͱ���:
    [[m:Kernel#getopts]] ����졤���������Ʊ���Ǥ���

�ʲ�����Ǥϡ�"-d" �Ⱥ���Ǥ� "-x"��"-y"��"--geometry" ��
�ɤ줫��Ĥ��¹Ի���ɬ�פʥ��ץ����Ȥʤ�ޤ���

  parseArgs(0��"d&(x|y|geometry)"��"fd"��"x:"��"y:"��"geometry:"��"version")

