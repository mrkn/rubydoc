require rubygems/command
require rubygems/commands/query_command

Gem �ѥå�������̾�����������פǸ������뤿��Υ饤�֥��Ǥ���

  Usage: gem list [STRING] [options]
    Options:
      -i, --[no-]installed             Check for installed gem
      -v, --version VERSION            ���ꤵ�줿�С������ΰ�������Ϥ��ޤ�
      -d, --[no-]details               Gem �ѥå������ξܺ٤�ɽ�����ޤ�
          --[no-]versions              Gem �ѥå�������̾���Τ�ɽ�����ޤ�
      -a, --all                        ���Ƥ� Gem �ѥå�������ɽ�����ޤ�
#@include(local_remote_options)
#@include(common_options)
    Arguments:
      STRING        õ������ Gem ��̾�����������פǻ��ꤷ�ޤ�
    Summary:
      ���ꤵ�줿ʸ����ǻϤޤ� Gem �ѥå���������󤷤ޤ�
    Defaults:
      --local --no-details


= class Gem::Commands::ListCommand < Gem::Commands::QueryCommand

Gem �ѥå�������̾�����������פǸ������뤿��Υ��饹�Ǥ���
