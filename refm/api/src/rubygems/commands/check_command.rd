require rubygems/command
require rubygems/version_option
require rubygems/validator

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������򸡾ڤ��뤿��Υ饤�֥��Ǥ���

  Usage: gem check [options]
    Options:
          --verify FILE                �����Υ����å�����ˤ�� Gem �ѥå������򸡾ڤ��ޤ�
      -a, --alien                      ��������Ƥ��ʤ��ѥå���������𤷤ޤ�
      -t, --test                       Gem �ѥå������Υ�˥åȥƥ��Ȥ�¹Ԥ��ޤ�
      -v, --version VERSION            ����ΥС������Υƥ��Ȥ�¹Ԥ��ޤ�
#@include(common_options)
    Summary:
      ���󥹥ȡ��뤵��Ƥ��� Gem �ѥå�����������å����ޤ�


= class Gem::Commands::CheckCommand < Gem::Command

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������򸡾ڤ��뤿��Υ��饹�Ǥ���

