require rubygems/command
require rubygems/doc_manager
require rubygems/install_update_options
require rubygems/dependency_installer
require rubygems/local_remote_options
require rubygems/validator
require rubygems/version_option

Gem �ѥå�������������ݥ��ȥ�˥��󥹥ȡ��뤹�뤿��Υ饤�֥��Ǥ���

  Usage: gem install GEMNAME [GEMNAME ...] [options] -- --build-flags [options]
    Options:
          --platform PLATFORM          ���ꤵ�줿�ץ�åȥե������ Gem �ѥå������򥤥󥹥ȡ��뤷�ޤ�
      -v, --version VERSION            ���ꤵ�줿�С������� Gem �ѥå������򥤥󥹥ȡ��뤷�ޤ�
    Install/Update Options:
      -i, --install-dir DIR            Gem �ѥå������Υ��󥹥ȡ������ꤷ�ޤ�
      -n, --bindir DIR                 Gem �ѥå������˴ޤޤ��Х��ʥ�ե���������������ꤷ�ޤ�
      -d, --[no-]rdoc                  ���󥹥ȡ������ RDoc ���������ޤ�
          --[no-]ri                    ���󥹥ȡ������ RI �ɥ�����Ȥ��������ޤ�
      -E, --[no-]env-shebang           ���󥹥ȡ��뤹�륹����ץȤ� shebang line ��񤭴����ޤ�(/usr/bin/env)
      -f, --[no-]force                 ��¸�ط��Υ����å���Х��ѥ����ƶ���Ū�˥��󥹥ȡ��뤷�ޤ�
      -t, --[no-]test                  ���󥹥ȡ�����˥�˥åȥƥ��Ȥ�¹Ԥ��ޤ�
      -w, --[no-]wrappers              Use bin wrappers for executables
                                       DOSHISH �ʥץ�åȥե������Ǥ�̵���Ǥ�
      -P, --trust-policy POLICY        Specify gem trust policy
          --ignore-dependencies        ��¸���Ƥ��� Gem �ѥå������򥤥󥹥ȡ��뤷�ޤ���
      -y, --include-dependencies       ��¸���Ƥ��� Gem �ѥå������򥤥󥹥ȡ��뤷�ޤ�
          --[no-]format-executable     Make installed executable names match ruby.
                                       If ruby is ruby18, foo_exec will be
                                       foo_exec18
#@include(local_remote_options)
#@include(common_options)
    Arguments:
      GEMNAME       ���󥹥ȡ��뤹�� Gem �ѥå�����̾����ꤷ�ޤ�
    Summary:
      Gem �ѥå������������˥��󥹥ȡ��뤷�ޤ�
    Defaults:
      --both --version '>= 0' --rdoc --ri --no-force
      --no-test --install-dir /usr/lib/ruby/gems/1.8


= class Gem::Commands::InstallCommand < Gem::Command
include Gem::VersionOption
include Gem::LocalRemoteOptions
include Gem::InstallUpdateOptions

Gem �ѥå�������������ݥ��ȥ�˥��󥹥ȡ��뤹�뤿��Υ��饹�Ǥ���
