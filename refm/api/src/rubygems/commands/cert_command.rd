require rubygems/command
require rubygems/security

Gem �ѥå������ξ�������̾�������������뤿��Υ饤�֥��Ǥ���

  Usage: gem cert [options]
    Options:
      -a, --add CERT                   ���ꤵ�줿��������ɲä��ޤ�
      -l, --list                       ���ꤵ��Ƥ��������ΰ�����ɽ�����ޤ�
      -r, --remove STRING              STRING ��ޤ������������ޤ�
      -b, --build EMAIL_ADDR           EMAIL_ADDR ���Ф��뼫�ʽ�̾���������̩��
                                       ��������ޤ�
      -C, --certificate CERT           --sign �ǻ��Ѥ�����������ꤷ�ޤ�
      -K, --private-key KEY            --sign �ǻ��Ѥ�����̩������ꤷ�ޤ�
      -s, --sign NEWCERT               ���������̩���ǽ�̾���ޤ�
#@include(common_options)
    Summary:
      Manage RubyGems certificates and signing settings


= class Gem::Commands::CertCommand < Gem::Command

Gem �ѥå������ξ�������̾�������������뤿��Υ��饹�Ǥ���



