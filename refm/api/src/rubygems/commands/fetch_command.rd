require rubygems/command
require rubygems/local_remote_options
require rubygems/version_option
require rubygems/source_info_cache

Gem �ѥå��������������ɤ��ƥ����ȥǥ��쥯�ȥ����¸���뤿��Υ饤�֥��Ǥ���

  Usage: gem fetch GEMNAME [GEMNAME ...] [options]
    Options:
      -v, --version VERSION            ���ꤵ�줿�С������� Gem ��������ޤ�
          --platform PLATFORM          ���ꤵ�줿�ץ�åȥե������ Gem ��������ޤ�
    Local/Remote Options:
      -B, --bulk-threshold COUNT       Threshold for switching to bulk
                                       synchronization (default 1000)
      -p, --[no-]http-proxy [URL]      ��⡼�Ȥ����� HTTP �ץ�������Ѥ��ޤ�
          --source URL                 Gem �ѥå������Υ�⡼�ȥ�ݥ��ȥ�� URL ����ꤷ�ޤ�
#@include(common_options)
    Arguments:
      GEMNAME       ��������ɤ��� Gem �ѥå�������̾������ꤷ�ޤ�
    Summary:
      Gem �ѥå��������������ɤ��ƥ����ȥǥ��쥯�ȥ����¸���ޤ�
    Defaults:
      --version '>= 0'


= class Gem::Commands::FetchCommand < Gem::Command
include Gem::LocalRemoteOptions
include Gem::VersionOption

Gem �ѥå��������������ɤ��ƥ����ȥǥ��쥯�ȥ����¸���뤿��Υ��饹�Ǥ���

