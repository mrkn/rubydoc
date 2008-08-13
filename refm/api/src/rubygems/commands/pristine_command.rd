require rubygems/command
require rubygems/format
require rubygems/installer
require rubygems/version_option

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������������֤ˤ��뤿��Υ饤�֥��Ǥ���

  Usage: gem pristine [args] [options]
    Options:
          --all                        ���󥹥ȡ��뤵��Ƥ������Ƥ� Gem �ѥå�������
                                       ������֤��ᤷ�ޤ�
      -v, --version VERSION            ���ꤷ���С������� Gem �ѥå�������
                                       ������֤��ᤷ�ޤ�
#@include(common_options)
    Arguments:
      GEMNAME       gem to restore to pristine condition (unless --all)
    Summary:
      Restores installed gems to pristine condition from files located in the gem
      cache
    Description:
      The pristine command compares the installed gems with the contents of the
      cached gem and restores any files that don't match the cached gem's copy.
      
      If you have made modifications to your installed gems, the pristine command
      will revert them.  After all the gem's files have been checked all bin stubs
      for the gem are regenerated.
      
      If the cached gem cannot be found, you will need to use `gem install` to
      revert the gem.
    Defaults:
      --all


= class Gem::Commands::PristineCommand < Gem::Command
include Gem::VersionOption

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������������֤ˤ��뤿��Υ��饹�Ǥ���

