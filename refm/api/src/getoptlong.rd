getoptlong �ϡ�GNU �� getopt_long() �Ȥޤä���Ʊ�������ǥ��ޥ��
�ԥ��ץ����β��Ϥ�Ԥ� Ruby �Υ饤�֥��Ǥ���

Author: �޸� ��Ƿ (m-kasahr@sra.co.jp)

Copyright 1998, 1999  Motoyuki Kasahara

You may redistribute it and/or modify it under the same license
terms as Ruby.

#@#�Ϥ����
#@#========
#@#Ruby ��Ʊ��ξ��˽��ä��ܥץ���������ۤޤ����ѹ����뤳�Ȥ��Ǥ��ޤ���
#@#
#@#���Υץ�����ͭ�ѤȤϻפ��ޤ��������ۤˤ����äƤϡ��Ծ����ڤ�������
#@#ŪŬ�����ˤĤ��Ƥΰ��ۤ��ݾڤ�ޤ�ơ������ʤ��ݾڤ�Ԥʤ��ޤ��󡣾ܺ�
#@#�ˤĤ��Ƥ� GNU General Public License ���ɤߤ���������


=== GNU getopt_long() �Ȥ�?

GNU geopt_long() �ϡ����ޥ�ɹԥ��ץ����β��Ϥ�Ԥ� C �δؿ��Ǥ���¿
���� GNU ���եȥ����������δؿ�����Ѥ��Ƥ��ޤ���GNU geopt_long() ����
�� getoptlong �ˤϡ��ʲ��Τ褦����ħ������ޤ���

 * ����Ū�ʰ�ʸ�����ץ����˲ä��ơ�Ĺ�����ץ������б����Ƥ��ޤ���Ĺ
   �����ץ����� `-' ������� `--' �ǻϤޤ�ޤ� (��: `--version')��
 * Ĺ�����ץ����ϡ���դ���ޤ�¤�������ά���뤳�Ȥ��Ǥ��ޤ�
   (��: `--version' �ϡ�`--ver' ��ά�����Ȥ��Ǥ��ޤ�����������¾�Υ���
   �����̾�� `--ver' �ǻϤޤ�ʤ����˸¤�ޤ�)��
 * �ü�ʰ��� `--' �ˤ�äơ����ץ����β��Ϥ���Ū�˽�λ���ޤ���


=== ������� (Ordering)

GNU getopt_long() ����� geoptlong.rb �ˤϡ�`REQUIRE_ORDER',
`PERMUTE', `RETURN_IN_ORDER' �Ȥ�����3 �ĤΡֽ������ (ORDERING)�פ���
�դ���Ƥ��ޤ������줾��ν��������ϡ��󥪥ץ��������ˤĤ��Ƥΰ�����
���ۤʤ�ޤ���

 * REQUIRE_ORDER: 
  �󥪥ץ��������θ���褿���ץ����ϡ����ץ����Ȥ���ǧ�����ޤ���
  �ǽ���󥪥ץ������������줿�����ǡ����ץ����β��Ͻ�������ߤ��ޤ���

 * PERMUTE: 
   ���ޥ�ɹ԰��������Ƥ�����������������ؤ����ǽ�Ū�ˤϤ��٤Ƥ��󥪥�
   �����������˴󤻤ޤ������������Ǥϡ����ץ����Ϥɤν���ǽ񤤤Ƥ���
   �����Ȥˤʤ�ޤ�������ϡ����Ȥ��ץ����¦�Ǥ����ʤ뤳�Ȥ���Ԥ��ʤ�
   �Ƥ⡢�����ʤ�ޤ��������������ǥե���ȤǤ���

 * RETURN_IN_ORDER: 
   ���ץ�����¾���󥪥ץ��������Ϥɤ�ʽ�����¤�Ǥ��ɤ��������ߤ���
   ������ݻ������ޤޤˤ������Ȥ����ץ����Τ���η����Ǥ���


=== POSIXLY_CORRECT

�Ķ��ѿ� POSIXLY_CORRECT ���������Ƥ���ȡ����������� `PERMUTE' ��
���򤷤Ƥ��Ƥ⡢REQUIRE_ORDER �����ǽ�������ޤ���


=== �Ȥ���

���ʤ��κ�ä��ץ����Υإ�ץ�å������������Τ褦�ˤʤäƤ�����
�Ȥ��ޤ���

    Usage: command [option...]
    Options:
      -m SIZE  --max-size SIZE    Set maximum size
      -q  --quiet  --silence      Suppress all warnings
      --help                      Output this help, then exit
      --version                   Output version number, then exit

�ޤ���`getoptlong.rb' �� Ruby �ǽ񤫤줿���ʤ��Υץ����˼����ߤ�
����

    require 'getoptlong.rb'

[[lib:getopts]] �� [[lib:parsearg]] �Ȥϰۤʤꡢgetoptlong �ϥ⥸�塼��
�ǤϤʤ����饹���󶡤��ޤ������饹��̾���� GetoptLong �Ǥ���
[[c:GetoptLong]] ���饹�Υ��֥������Ȥ��������ޤ���

    parser = GetoptLong.new

�����ơ�set_optins �᥽�åɤ�ƤӽФ������� parser �˥��ץ�����
���åȤ��ޤ���

    parser.set_options(
        ['--max-size',           '-m', GetoptLong::REQUIRED_ARGUMENT],
        ['--quiet', '--silence', '-q', GetoptLong::NO_ARGUMENT],
        ['--help',                     GetoptLong::NO_ARGUMENT],
        ['--version',                  GetoptLong::NO_ARGUMENT])

getopts �⥸�塼�뤬�ԤäƤ���褦�ˡ�Ϳ����줿���ץ����� 
`$OPT_...' �Ȥ�����������줿���Ȥ��ϡ����Υ����ɤ򤢤ʤ��Υץ����
��­���Ʋ�������

    begin
       parser.each_option do |name, arg|
          eval "$OPT_#{name.sub(/^--/, '').gsub(/-/, '_').upcase} = '#{arg}'"
       end
    rescue
       exit(1)
    end

each_option �᥽�åɤϡ���˥��ץ����̾�������̾ (CANONICAL NAME)��
�η����֤��Ƥ��ޤ���������̾�פȤϡ�`set_options' ���Ϥ����ġ��ΰ�����
�����ơ����ֺ��ˤ��륪�ץ����̾�Τ��ȤǤ������Ȥ��С�`--quiet' �ϡ�
`-q' �� `--silence' ������̾�ˤʤ�ޤ����������äơ����������������
����ǽ��������Τϡ�`$OPT_MAX_SIZE', `$OPT_QUIET', `$OPT_HELP',
`$OPT_VERSION' �Ǥ�����������ά���줿���ץ����Ϳ����줿�Ȥ��⡢��
����������̾���Ѵ�����ޤ���


=== �������������

��˵������褦�ˡ�������� (ORDEING) �Υǥե���Ȥ� `PERMUTE' �Ǥ���
����������Ѥ���ˤ� `ordering=' �᥽�åɤ��Ѥ��ޤ���

    parser.ordering = GetoptLong::REQUIRE_ORDER


=== ���顼

���ץ����ν�����ϡ����Τ褦����ͳ�ǥ��顼��ȯ�����ޤ���

 * Ϳ���줿���ץ�����̾���θ�������ά����Ƥ���Ȼפ��뤬����դ˷�
   �ޤ�ʤ���
 * �Τ�ʤ����ץ����Ϳ����줿��
 * Ϳ����줿���ץ����ˤϰ������礱�Ƥ��롣
 * Ϳ����줿���ץ����ˤϰ�����ȼ�äƤ��뤬�����Υ��ץ����ϰ������
   ��ʤ���

���顼��ȯ��������硢���Ž� (quiet)�ץե饰�����ꤵ��Ƥ��ʤ���С�ɸ
�२�顼���Ϥ˥��顼��å����������Ϥ��졢�㳰��ȯ�����ޤ����㳰�ˤϡ�
���顼��å��������Ϥ���ޤ���

��ö���顼�������Ƥ��ޤ��ȡ�³���Υ��ץ��������褦�Ȥ����ߤϤ��٤�
���Ԥ��ޤ���`GetoptLong' �ˤϡ����顼����������ˡ�Ϥ���ޤ��󡣸���
������ȡ����顼���������顢���ץ����ν���������ʤ���Фʤ�ޤ���


=== �Žͥե饰

���顼��ȯ������ȡ��ǥե���ȤǤϥ��顼��å�������ɸ�२�顼���Ϥ˽�
�Ϥ���ޤ������Ž� (quiet)�ץե饰�����ꤹ��ȡ����顼��å������ν���
����������ޤ���

    parser.quiet = TRUE


= class GetoptLong < Object

== Class Methods
--- new
--- new(option...)

GetoptLong �Υ��֥������Ȥ��������ޤ���option ��Ϳ������
���Ȥ��ϡ������ set_options �᥽�åɤ��Ϥ��ޤ���

== Instance Methods

--- each {|optname, optarg|...}
--- each_option {|optname, optarg|...}
get �᥽�åɤΥ��ƥ졼���ǤǤ������ץ����Ȥ��ΰ����μ�����
�����֤��Ԥ��ޤ����ܤ����� get �������򻲾Ȥ��Ʋ�������

--- get
--- get_option
ARGV ���顢���Υ��ץ�����̾���ȡ��⤷����Ф��ΰ������Ȥ��
�����ޤ����᥽�åɤ� 2 �Ĥ��ͤ��֤���1 ���ܤ��ͤ����ץ����̾
(��: --max-size) �ǡ�2 ���ܤ����ץ����ΰ��� (��: 20K) ��
����get ���̾�θƤӽФ����ϼ����̤�Ǥ���

    optname, optarg = option_parser.get

get �� get_option �Ͼ�˥��ץ����̾������̾ (canonical
name) ���֤��ޤ���Ϳ����줿���ץ���󤬰�������ʤ��Ȥ��ϡ�
����ʸ���� ('') �� optarg �˥��åȤ���ޤ������ץ����
ARGV �˻ĤäƤ��ʤ��Ȥ��ϡ�optname, optarg �Ȥ�� nil ��
���åȤ���ޤ����᥽�åɤ������ݤˡ������������ץ����Ȱ���
�ϼ�ưŪ�� ARGV �����������ޤ���

Ϳ����줿���ޥ�ɹ԰��������ʤ��Υץ����Υ��ץ���������
�˹��ʤ����ϡ����顼�Ȥʤäơ��ʲ��Τ����줫���㳰��ȯ����
�ޤ���

: GetoptLong::AmbigousOption
    Ϳ����줿���ץ�����̾���θ�������ά����Ƥ���Ȼפ���
    ������դ˷�ޤ�ʤ���

: GetoptLong::InvalidOption
    �Τ�ʤ����ץ����Ϳ����줿��

: GetoptLong::MissingArgument
    Ϳ����줿���ץ����ˤϰ������礱�Ƥ��롣

: GetoptLong::NeedlessArgument
    Ϳ����줿���ץ����ϰ�����ȼ�äƤ��뤬�����Υ��ץ�����
    ������Ȥ�ʤ���

�ä��ơ��Ž� (quiet) �ե饰��ͭ���ˤʤäƤ��ʤ��¤ꡢ���顼���
��������ɸ�२�顼���Ϥ˽��Ϥ��ޤ���

--- error
--- error?
���ߤΥ��顼�η����֤��ޤ������顼��ȯ�����Ƥ��ʤ���С�nil
���֤��ޤ���

--- error_message
���ߤΥ��顼�Υ��顼��å��������֤��ޤ������顼��ȯ�����Ƥ���
����С�nil ���֤��ޤ���

--- ordering=(ordering)
������� (ordering) �����ꤷ�ޤ������� ordering �ϡ�
PERMUTE, REQUIRE_ORDER, RETURN_IN_ORDER �Τ����줫�Ǥʤ�
�ƤϤʤ�ޤ��󡣤���ʳ����ͤ��������褦�Ȥ���ȡ��㳰
ArgumentError ��ȯ�����ޤ���

�������������Ǥ���Τϡ�get, get_option, each,
each_option �᥽�åɤ�ƤӽФ��������Ǥ��������Υ᥽�åɤ�
�ƤӽФ�����ǽ�����������ꤷ�褦�Ȥ���ȡ�RuntimeError ��
����ȯ�����ޤ���

�Ķ��ѿ� POSIXLY_CORRECT ���������Ƥ���ȡ������� 
PERMUTE ��Ϳ���Ƥ��Υ᥽�åɤ�ƤӽФ��Ƥ⡢�ºݤΤȤ���ν�
�������� REQUIRE_ORDER �����ꤵ��ޤ���

�Ķ��ѿ� POSIXLY_CORRECT ���������Ƥ��ʤ��¤ꡢPERMUTE 
������ͤǤ����������Ƥ���С�REQUIRE_ORDER ������ͤˤʤ�
�ޤ���

ordering ���֤��ޤ���

--- ordering
���ߤν���������֤��ޤ���

--- quiet=(flag)
flag �� TRUE �ʤ顢�Ž� (quiet) �⡼�ɤ�ͭ���ˤʤ�ޤ���
�Žͥ⡼�ɤ�ͭ���ˤʤäƤ���ȡ��쥷���ФΥ��֥������Ȥϡ�
get, get_option, each, each_option �᥽�åɤǥ��顼��
ȯ�����Ƥ⡢���顼��å���������Ϥ��ޤ��󡣽���ͤϡ�FALSE
�ˤʤäƤ��ޤ���

flag ���֤��ޤ���

--- quiet
--- quiet?
�Žͥ⡼�ɤ�ͭ���Ǥ���С�TRUE ���֤�ޤ��������Ǥʤ���С�
FALSE ���֤�ޤ���

--- set_options(option...)
���ʤ��Υץ����ǡ�ǧ�������������ץ����򥻥åȤ��ޤ���
�ġ��� option �ϡ����ץ����̾�Ȱ����Υե饰����ʤ�����Ǥ�
����Ф����ޤ���

    parser.set_options(['-d', '--debug', GetoptLong::NO_ARGUMENT],
                       ['--version',     GetoptLong::NO_ARGUMENT],
                       ['--help',        GetoptLong::NO_ARGUMENT])

������Υ��ץ����̾�ϡ���ʸ�����ץ���� (��: -d) ��Ĺ������
����� (��: --debug) ��ɽ����ʸ����Τ����줫�Ǥʤ���Фʤ�
�ޤ����������ΰ��ֺ�ü�Υ��ץ����̾�������ץ���������̾
�ˤʤ�ޤ���������ΰ����Υե饰�ϡ�NO_ARGUMENT, REQUIRE_ARGUMENT,
OPTIONAL_ARGUMENT �Τ����줫�Ǥʤ��ƤϤʤ�ޤ���

���ץ����̾�Ȱ����Υե饰�ν��֤˷�ޤ�Ϥʤ��Τǡ����Τ褦��
�����Ǥ⹽���ޤ���

    parser.set_options([GetoptLong::NO_ARGUMENT, '-d', '--debug'],
                       [GetoptLong::NO_ARGUMENT, '--version'],
                       [GetoptLong::NO_ARGUMENT, '--help'])

�����ʰ����� set_options �᥽�åɤ�Ϳ������ȡ��㳰
ArgumentError ��ȯ�����ޤ���

���ץ���������Ǥ���Τϡ�get, get_option, each,
each_option �᥽�åɤ�ƤӽФ��������Ǥ��������Υ᥽�åɤ�
�ƤӽФ�����ǥ��ץ��������ꤷ�褦�Ȥ���ȡ�RuntimeError
�㳰��ȯ�����ޤ���

�᥽�åɤΥ쥷���ФǤ��륪�֥������Ȥ��֤��ޤ���

--- terminate
���ץ����ν����򡢶���Ū�˽�λ�����ޤ��������������顼������
�Ƥ�����֤Ǥ��Υ᥽�åɤ�ư���Ƥ⡢��λ�����뤳�ȤϤǤ��ޤ�
�󡣥��顼�������Ƥ�����֤Ǥ��Υ᥽�åɤ�ư����ȡ�
RuntimeError �㳰��ȯ�����ޤ������Ǥ˥��ץ����ν�������λ
���Ƥ���Ȥ��ϡ����Υ᥽�åɤϲ���Ԥ��ޤ���

�᥽�åɤΥ쥷���ФǤ��륪�֥������Ȥ��֤��ޤ���

--- terminated?
���顼���������˥��ץ����ν�������λ���Ƥ���Ȥ��� TRUE ��
�֤�ޤ�������ʳ��ΤȤ��ϡ�FALSE ���֤�ޤ���

== Constants
--- PERMUTE
--- REQUIRE_ORDER
--- RETURN_IN_ORDER
���������ɽ���Ƥ��ޤ���

--- NO_ARGUMENT
--- REQUIRED_ARGUMENT
--- OPTIONAL_ARGUMENT
���ץ����ؤΰ����Υե饰�Ǥ���

= class GetoptLong::Error < StandardError

#@if (version < '1.9.0')
= class GetoptLong::AmbigousOption < GetoptLong::Error
#@else
= class GetoptLong::AmbiguousOption < GetoptLong::Error
#@end
Ϳ����줿���ץ�����̾���θ�������ά����Ƥ���Ȼפ���
������դ˷�ޤ�ʤ���

= class GetoptLong::InvalidOption < GetoptLong::Error
�Τ�ʤ����ץ����Ϳ����줿��

= class GetoptLong::MissingArgument < GetoptLong::Error
Ϳ����줿���ץ����ˤϰ������礱�Ƥ��롣

= class GetoptLong::NeedlessArgument < GetoptLong::Error
Ϳ����줿���ץ����ϰ�����ȼ�äƤ��뤬�����Υ��ץ�����
������Ȥ�ʤ���
