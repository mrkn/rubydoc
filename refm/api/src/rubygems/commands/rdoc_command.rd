require rubygems/command
require rubygems/version_option
require rubygems/doc_manager

RDoc �� ri �Υ饤�֥����������뤿��Υ饤�֥��Ǥ���

  Usage: gem rdoc [args] [options]
    Options:
          --all                        ���󥹥ȡ��뤵��Ƥ������Ƥ� Gem �ѥå�������
                                       RDoc/RI �ɥ�����Ȥ��������ޤ���
          --[no-]rdoc                  RDoc ��ޤ�ޤ�
          --[no-]ri                    RI ��ޤ�ޤ�
      -v, --version VERSION            ���ꤷ���С������Υɥ�����Ȥ��������ޤ�
#@include(common_options)
    Arguments:
      GEMNAME       �ɥ�����Ȥ��������� Gem �ѥå���������ꤷ�ޤ�����ά��������Ƥ�
                    Gem �ѥå������Υɥ�����Ȥ��������ޤ���
    Summary:
      RDoc/RI �ɥ�����Ȥ��������ޤ�
    Defaults:
      --version '>= 0' --rdoc --ri

= class Gem::Commands::RdocCommand < Gem::Command

RDoc �� ri �Υ饤�֥����������뤿��Υ��饹�Ǥ���

