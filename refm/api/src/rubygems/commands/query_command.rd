require rubygems/command
require rubygems/local_remote_options
require rubygems/spec_fetcher
require rubygems/version_option

Gem �ѥå������ξ���򸡺����뤿��Υ饤�֥��Ǥ���

Usage: gem query [options]
  Options:
    -i, --[no-]installed             Check for installed gem
    -v, --version VERSION            Specify version of gem to query
    -n, --name-matches REGEXP        Ϳ����줿����ɽ���˥ޥå����� Gem �ѥå�������
                                     �������ޤ�
    -d, --[no-]details               Gem �ѥå������ξܺ٤�ɽ�����ޤ�
        --[no-]versions              Gem �ѥå�����̾�Τ�ɽ�����ޤ�
    -a, --all                        ���Ĥ��ä� Gem �ѥå����������ƤΥС�������ɽ�����ޤ�
#@include(local_remote_options)
#@include(common_options)
  Summary:
    Gem �ѥå������ξ���򸡺����ޤ�
  Defaults:
    --local --name-matches // --no-details --versions --no-installed


= class Gem::Commands::QueryCommand < Gem::Command

Gem �ѥå������ξ���򸡺����뤿��Υ��饹�Ǥ���

