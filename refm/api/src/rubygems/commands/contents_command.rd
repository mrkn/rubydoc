require rubygems/command
require rubygems/version_option

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������˴ޤޤ�Ƥ���ե�����ꥹ�Ȥ�ɽ�����뤿��Υ饤�֥��Ǥ���

  Usage: gem contents GEMNAME [options]
    Options:
      -v, --version VERSION            ���ꤵ�줿�С������� Gem �ѥå����������Ƥ�ɽ�����ޤ�
      -s, --spec-dir a,b,c             ���ꤵ�줿�ѥ��ʲ��ˤ��� Gem �ѥå������򸡺����ޤ�
      -l, --[no-]lib-only              Gem �ѥå������� lib �ǥ��쥯�ȥ�ʲ��ˤ���
                                       �ե�����Τߤ�ɽ�����ޤ�
#@include(common_options)
    Arguments:
      GEMNAME       Gem �ѥå�������̾������ꤷ�ޤ�
    Summary:
      ���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������˴ޤޤ��ե�����ΰ�����ɽ�����ޤ�
    Defaults:
      --no-lib-only

= class Gem::Commands::ContentsCommand < Gem::Command
include Gem::VersionOption

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������˴ޤޤ�Ƥ���ե�����ꥹ�Ȥ�ɽ�����뤿��Υ��饹�Ǥ���

