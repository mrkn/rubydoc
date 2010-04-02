getoptlong �ϡ�GNU �� getopt_long() �Ȥޤä���Ʊ�������ǥ��ޥ��
�ԥ��ץ����β��Ϥ�Ԥ� Ruby �Υ饤�֥��Ǥ���

#@# Author: �޸� ��Ƿ (m-kasahr@sra.co.jp)
#@# 
#@# Copyright 1998, 1999  Motoyuki Kasahara

=== GNU getopt_long() �Ȥ�?

GNU getopt_long() �ϡ����ޥ�ɹԥ��ץ����β��Ϥ�Ԥ� C �δؿ��Ǥ���¿
���� GNU ���եȥ����������δؿ�����Ѥ��Ƥ��ޤ���GNU getopt_long() ����
�� getoptlong �ˤϡ��ʲ��Τ褦����ħ������ޤ���

 * ����Ū�ʰ�ʸ�����ץ����˲ä��ơ�Ĺ�����ץ������б����Ƥ��ޤ���Ĺ
   �����ץ����� `-' ������� `--' �ǻϤޤ�ޤ� (��: `--version')��
 * Ĺ�����ץ����ϡ���դ���ޤ�¤�������ά���뤳�Ȥ��Ǥ��ޤ�
   (��: `--version' �ϡ�`--ver' ��ά�����Ȥ��Ǥ��ޤ�����������¾�Υ���
   �����̾�� `--ver' �ǻϤޤ�ʤ����˸¤�ޤ�)��
 * �ü�ʰ��� `--' �ˤ�äơ����ץ����β��Ϥ���Ū�˽�λ���ޤ���


=== ������� (ordering)

GNU getopt_long() ����� getoptlong.rb �ˤϡ�`REQUIRE_ORDER',
`PERMUTE', `RETURN_IN_ORDER' �Ȥ�����3 �ĤΡֽ�������פ���
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

#@since 1.9.1
getoptlong �ϥ��饹���󶡤��ޤ���
#@else
[[lib:getopts]] �� [[lib:parsearg]] �Ȥϰۤʤꡢgetoptlong �ϥ⥸�塼��
�ǤϤʤ����饹���󶡤��ޤ���
#@end
���饹��̾���� GetoptLong �Ǥ���
[[c:GetoptLong]] ���饹�Υ��֥������Ȥ��������ޤ���

    parser = GetoptLong.new

�����ơ�set_options �᥽�åɤ�ƤӽФ������� parser �˥��ץ�����
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

each_option �᥽�åɤϡ���˥��ץ����̾�������̾ (canonical name)��
�η����֤��Ƥ��ޤ���������̾�פȤϡ�`set_options' ���Ϥ����ġ��ΰ�����
�����ơ����ֺ��ˤ��륪�ץ����̾�Τ��ȤǤ������Ȥ��С�`--quiet' �ϡ�
`-q' �� `--silence' ������̾�ˤʤ�ޤ����������äơ����������������
����ǽ��������Τϡ�`$OPT_MAX_SIZE', `$OPT_QUIET', `$OPT_HELP',
`$OPT_VERSION' �Ǥ�����������ά���줿���ץ����Ϳ����줿�Ȥ��⡢��
����������̾���Ѵ�����ޤ���


=== �������������

��˵������褦�ˡ���������Υǥե���Ȥ� `PERMUTE' �Ǥ���
����������Ѥ���ˤ� `ordering=' �᥽�åɤ��Ѥ��ޤ���

    parser.ordering = GetoptLong::REQUIRE_ORDER


=== ���顼

���ץ����ν�����ϡ����Τ褦����ͳ�ǥ��顼��ȯ�����ޤ���

 * Ϳ���줿���ץ�����̾���θ�������ά����Ƥ���Ȼפ��뤬����դ˷�
   �ޤ�ʤ�
 * �Τ�ʤ����ץ����Ϳ����줿
 * Ϳ����줿���ץ����ˤϰ������礱�Ƥ���
 * Ϳ����줿���ץ����ˤϰ�����ȼ�äƤ��뤬�����Υ��ץ����ϰ������
   ��ʤ�

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

    parser.quiet = true


= class GetoptLong < Object

GNU getopt_long() �� Ruby ���Ϥ������饹�Ǥ���

== Class Methods
--- new(*arguments)

GetoptLong �Υ��֥������Ȥ��������ޤ���������Ϳ�����
���Ȥ��ϡ������ [[m:GetoptLong#set_options]] �᥽�åɤ��Ϥ��ޤ���

@params arguments ���ץ�����������뤿���������������ꤷ�ޤ���

@see [[m:GetoptLong#set_options]]

== Instance Methods

--- each {|optname, optarg|...}
--- each_option {|optname, optarg|...}
get �᥽�åɤΥ��ƥ졼���ǤǤ������ץ����Ȥ��ΰ����μ�����
�����֤��Ԥ��ޤ���

@see [[m:GetoptLong#get]]

--- get        -> [String, String]
--- get_option -> [String, String]
ARGV ���顢���Υ��ץ�����̾���ȡ��⤷����Ф��ΰ������Ȥ��
�����ޤ����᥽�åɤ� 2 �Ĥ��ͤ��֤���1 ���ܤ��ͤ����ץ����̾
(��: --max-size) �ǡ�2 ���ܤ����ץ����ΰ��� (��: 20K) �Ǥ���

get �� get_option �Ͼ�˥��ץ����̾������̾
���֤��ޤ���Ϳ����줿���ץ���󤬰�������ʤ��Ȥ��ϡ�
����ʸ���� ('') �� optarg �˥��åȤ���ޤ������ץ����
ARGV �˻ĤäƤ��ʤ��Ȥ��ϡ�optname, optarg �Ȥ�� nil ��
���åȤ���ޤ����᥽�åɤ������ݤˡ������������ץ����Ȱ���
�ϼ�ưŪ�� ARGV �����������ޤ���

Ϳ����줿���ޥ�ɹ԰��������ʤ��Υץ����Υ��ץ���������
�˹��ʤ����ϡ����顼�Ȥʤäơ��ʲ��Τ����줫���㳰��ȯ����
�ޤ���

 * [[c:GetoptLong::AmbiguousOption]]
 * [[c:GetoptLong::InvalidOption]]
 * [[c:GetoptLong::MissingArgument]]
 * [[c:GetoptLong::NeedlessArgument]]

�ä��ơ��Ž� (quiet) �ե饰��ͭ���ˤʤäƤ��ʤ��¤ꡢ���顼���
��������ɸ�२�顼���Ϥ˽��Ϥ��ޤ���

��:
    optname, optarg = option_parser.get

--- error  -> Class | nil
--- error? -> Class | nil

���ߤΥ��顼�η����֤��ޤ������顼��ȯ�����Ƥ��ʤ���С�nil
���֤��ޤ���

--- error_message -> String | nil

���ߤΥ��顼�Υ��顼��å��������֤��ޤ������顼��ȯ�����Ƥ���
����С�nil ���֤��ޤ���

--- ordering=(ordering)
������������ꤷ�ޤ���

�Ķ��ѿ� POSIXLY_CORRECT ���������Ƥ���ȡ������� 
[[m:GetoptLong::PERMUTE]] ��Ϳ���Ƥ��Υ᥽�åɤ�ƤӽФ��Ƥ⡢�ºݤΤȤ���ν�
�������� [[m:GetoptLong::REQUIRE_ORDER]] �����ꤵ��ޤ���

�Ķ��ѿ� POSIXLY_CORRECT ���������Ƥ��ʤ��¤ꡢ[[m:GetoptLong::PERMUTE]]
������ͤǤ����������Ƥ���С�[[m:GetoptLong::REQUIRE_ORDER]] ������ͤˤʤ�
�ޤ���

@params ordering [[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
                 [[m:GetoptLong::RETURN_IN_ORDER]] �Τ����줫����ꤷ�ޤ���

@raise ArgumentError [[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
                 [[m:GetoptLong::RETURN_IN_ORDER]] �ʳ����ͤ���ꤷ������ȯ�����ޤ���

@raise RuntimeError [[m:GetoptLong#get]], [[m:GetoptLong#get_option]],
                    [[m:Get_Option#each]], [[m:Get_Option#each_option]] �᥽�åɤ�
                    �ƤӽФ�����ˤ��Υ᥽�åɤ�ƤӽФ�������ȯ�����ޤ���

--- ordering -> Fixnum
���ߤν���������֤��ޤ���

--- quiet=(flag)
flag �����ʤ顢�Ž� (quiet) �⡼�ɤ�ͭ���ˤʤ�ޤ���

�Žͥ⡼�ɤ�ͭ���ˤʤäƤ���ȡ��쥷���ФΥ��֥������Ȥϡ�
[[m:GetoptLong#get]], [[m:GetoptLong#get_option]],
[[m:GetoptLong#each]], [[m:GetoptLong#each_option]] �᥽�åɤǥ��顼��
ȯ�����Ƥ⡢���顼��å���������Ϥ��ޤ��󡣽���ͤϡ����ˤʤäƤ��ޤ���

@params flag ���ޤ��ϵ�����ꤷ�ޤ���

--- quiet  -> true | false
--- quiet? -> true | false
�Žͥ⡼�ɤ�ͭ���Ǥ���С������֤��ޤ��������Ǥʤ���С������֤��ޤ���

--- set_options(*arguments) -> self
���ʤ��Υץ����ǡ�ǧ�������������ץ����򥻥åȤ��ޤ���
�ġ��Υ��ץ����ϡ����ץ����̾�Ȱ����Υե饰����ʤ�����Ǥ�
����Ф����ޤ���

������Υ��ץ����̾�ϡ���ʸ�����ץ���� (��: -d) ��Ĺ������
����� (��: --debug) ��ɽ����ʸ����Τ����줫�Ǥʤ���Фʤ�
�ޤ����������ΰ��ֺ�ü�Υ��ץ����̾�������ץ���������̾
�ˤʤ�ޤ���������ΰ����Υե饰�ϡ�[[m:GetoptLong::NO_ARGUMENT]],
[[m:GetoptLong::REQUIRE_ARGUMENT]], [[m:GetoptLong::OPTIONAL_ARGUMENT]]
�Τ����줫�Ǥʤ��ƤϤʤ�ޤ���

���ץ���������Ǥ���Τϡ�get, get_option, each,
each_option �᥽�åɤ�ƤӽФ��������Ǥ��������Υ᥽�åɤ�
�ƤӽФ�����ǥ��ץ��������ꤷ�褦�Ȥ���ȡ�RuntimeError
�㳰��ȯ�����ޤ���

@params arguments ���ץ�����ɽ���������ꤷ�ޤ���

@raise ArgumentError �����ʰ�����Ϳ�����뤿��硢ȯ�����ޤ���

    parser.set_options(['-d', '--debug', GetoptLong::NO_ARGUMENT],
                       ['--version',     GetoptLong::NO_ARGUMENT],
                       ['--help',        GetoptLong::NO_ARGUMENT])

���ץ����̾�Ȱ����Υե饰�ν��֤˷�ޤ�Ϥʤ��Τǡ����Τ褦��
�����Ǥ⹽���ޤ���

    parser.set_options([GetoptLong::NO_ARGUMENT, '-d', '--debug'],
                       [GetoptLong::NO_ARGUMENT, '--version'],
                       [GetoptLong::NO_ARGUMENT, '--help'])

--- terminate -> self
���ץ����ν����򡢶���Ū�˽�λ�����ޤ��������������顼������
�Ƥ�����֤Ǥ��Υ᥽�åɤ�ư���Ƥ⡢��λ�����뤳�ȤϤǤ��ޤ���

���Ǥ˥��ץ����ν�������λ���Ƥ���Ȥ��ϡ����Υ᥽�åɤϲ���Ԥ��ޤ���

@raise RuntimeError ���顼�������Ƥ�����֤Ǥ��Υ᥽�åɤ�ư����ȡ�ȯ�����ޤ�

--- terminated? -> true | false
���顼���������˥��ץ����ν�������λ���Ƥ���Ȥ��Ͽ���
�֤�ޤ�������ʳ��ΤȤ��ϡ������֤�ޤ���

== Protected Instance Methods

--- set_error(type, message) -> ()

������Ϳ����줿�㳰��ȯ�������ޤ���

���κݡ��Žͥ⡼�ɤǤʤ����ɸ�२�顼���Ϥ�Ϳ����줿��å���������Ϥ��ޤ���

@params type �㳰���饹����ꤷ�ޤ���

@params message �㳰�˥��åȤ����å���������ꤷ�ޤ���

== Constants

--- ORDERINGS -> Array

�����ǻ��Ѥ�������Ǥ���

[[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
[[m:GetoptLong::RETURN_IN_ORDER]] �����åȤ���Ƥ��ޤ���

--- REQUIRE_ORDER -> 0
�󥪥ץ��������θ���褿���ץ����ϡ����ץ����Ȥ���ǧ�����ޤ���
�ǽ���󥪥ץ������������줿�����ǡ����ץ����β��Ͻ�������ߤ��ޤ���

--- PERMUTE -> 1
���ޥ�ɹ԰��������Ƥ�����������������ؤ����ǽ�Ū�ˤϤ��٤Ƥ��󥪥�
�����������˴󤻤ޤ������������Ǥϡ����ץ����Ϥɤν���ǽ񤤤Ƥ���
�����Ȥˤʤ�ޤ�������ϡ����Ȥ��ץ����¦�Ǥ����ʤ뤳�Ȥ���Ԥ��ʤ�
�Ƥ⡢�����ʤ�ޤ��������������ǥե���ȤǤ���

--- RETURN_IN_ORDER -> 2
���ץ�����¾���󥪥ץ��������Ϥɤ�ʽ�����¤�Ǥ��ɤ��������ߤ���
������ݻ������ޤޤˤ������Ȥ����ץ����Τ���η����Ǥ���

--- ARGUMENT_FLAGS -> Array

�����ǻ��Ѥ�������Ǥ���

[[m:GetoptLong::NO_ARGUMENT]], [[m:GetoptLong::REQUIRE_ARGUMENT]],
[[m:GetoptLong::OPTIONAL_ARGUMENT]] �����åȤ���Ƥ��ޤ���

--- NO_ARGUMENT -> 0

���ץ����˰�����̵�����Ȥ�ɽ������Ǥ���

--- REQUIRED_ARGUMENT -> 1

���ץ�����ɬ�ܰ��������뤳�Ȥ�ɽ������Ǥ���

--- OPTIONAL_ARGUMENT -> 2

���ץ����ˤϥ��ץ���ʥ���������뤳�Ȥ�ɽ������Ǥ���

--- STATUS_YET        -> 0

�������֤�������뤿�������Ǥ����桼�������Ѥ��뤳�ȤϤ���ޤ���

--- STATUS_STARTED    -> 1

�������֤�������뤿�������Ǥ����桼�������Ѥ��뤳�ȤϤ���ޤ���

--- STATUS_TERMINATED -> 2

�������֤�������뤿�������Ǥ����桼�������Ѥ��뤳�ȤϤ���ޤ���


= class GetoptLong::Error < StandardError

���Υ饤�֥���ȯ�������㳰�δ��쥯�饹�Ǥ���

#@until 1.9.1
= class GetoptLong::AmbigousOption < GetoptLong::Error
#@else
= class GetoptLong::AmbiguousOption < GetoptLong::Error
#@end
Ϳ����줿���ץ�����̾���θ�������ά����Ƥ���Ȼפ��뤬����դ˷�ޤ�ʤ�
����ȯ�������㳰�Ǥ���

= class GetoptLong::InvalidOption < GetoptLong::Error
�Τ�ʤ����ץ����Ϳ����줿����ȯ�������㳰�Ǥ���

= class GetoptLong::MissingArgument < GetoptLong::Error
Ϳ����줿���ץ����˰������礱�Ƥ������ȯ�������㳰�Ǥ���

= class GetoptLong::NeedlessArgument < GetoptLong::Error
Ϳ����줿���ץ����ϰ�����ȼ�äƤ��뤬�����Υ��ץ����
������Ȥ�ʤ�����ȯ�������㳰�Ǥ���
