require rubygems/command
require rubygems/commands/query_command

���ꤵ�줿ʸ�����ޤ� Gem �ѥå�����������ɽ�����뤿��Υ饤�֥��Ǥ���

  Usage: gem search [STRING] [options]
    Options:
      -i, --[no-]installed             Check for installed gem
      -v, --version VERSION            Specify version of gem to search
      -d, --[no-]details               Display detailed information of gem(s)
          --[no-]versions              Display only gem names
      -a, --all                        Display all gem versions
#@include(local_remote_options)
#@include(common_options)
    Arguments:
      STRING        ���������� Gem �ѥå�����̾�ΰ�������ꤷ�ޤ�
    Summary:
      STRING ��ޤ����Ƥ� Gem �ѥå�����̾��ɽ�����ޤ�
    Defaults:
      --local --no-details


= class Gem::Commands::SearchCommand < Gem::Commands::QueryCommand

���ꤵ�줿ʸ�����ޤ� Gem �ѥå�����������ɽ�����뤿��Υ��饹�Ǥ���

