require rubygems/command
require rubygems/source_index
require rubygems/dependency_list

������˥��󥹥ȡ��뤵��Ƥ���Ť� Gem ��������饤�֥��Ǥ���

  Usage: gem cleanup [GEMNAME ...] [options]
    Options:
      -d, --dryrun
#@include(common_options)
    Arguments:
      GEMNAME       ������� Gem �ѥå�������̾������ꤷ�ޤ�
    Summary:
      �������ݥ��ȥ�˥��󥹥ȡ��뤵��Ƥ���Ť��С�������
      Gem �ѥå������������ޤ�
    Defaults:
      --no-dryrun


= class Gem::Commands::CleanupCommand < Gem::Command

������˥��󥹥ȡ��뤵��Ƥ���Ť� Gem �������륯�饹�Ǥ���

