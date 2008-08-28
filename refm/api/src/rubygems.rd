#@since 1.9.0
require rubygems/rubygems_version
require rubygems/defaults
require rubygems/exceptions
require rubygems/version
require rubygems/requirement
require rubygems/dependency
require rubygems/gem_path_searcher
require rubygems/source_index
require rubygems/platform
require rubygems/builder
require rubygems/defaults/operating_system

sublibrary rubygems/gem_runner

RubyGems �򰷤�����Υ��饹��⥸�塼�뤬�������Ƥ���饤�֥��Ǥ���

#@# _builtin/ �ʲ��˰�ư����ͽ����ä����������㤤�����뤿����α

=== gem ���ޥ�ɤλȤ���

  $ gem help
  
    RubyGems �� Ruby �Τ���ιⵡǽ�ʥѥå����������ġ���Ǥ���
    ����Ϥ��¿���ξ���ؤΥݥ��󥿤�ޤ�Ǥ������Ū�ʥإ�ץ�å������Ǥ���
  
      ������ˡ:
        gem -h/--help
        gem -v/--version
        gem command [arguments...] [options...]
  
      ��:
        gem install rake
        gem list --local
        gem build package.gemspec
        gem help install
  
      ����˥إ��:
        gem help commands            ���Ƥ� 'gem' ���ޥ�ɤ�ꥹ�ȥ��åפ��ޤ�
        gem help examples            �����Ĥ��λ�����ˡ�����ɽ�����ޤ�
        gem help platforms           �ץ�åȥե�����˴ؤ�������ɽ�����ޤ�
        gem help <COMMAND>           COMMAND �˴ؤ���إ�פ�ɽ�����ޤ�
                                       (e.g. 'gem help install')
      ���ܤ�������:
        http://rubygems.rubyforge.org

==== Gem �ѥå������򥤥󥹥ȡ��뤹��

�㤨�� rak ( [[url:http://rak.rubyforge.org/]] ) �򥤥󥹥ȡ��뤹��ˤϡ��ʲ��Τ����줫��¹Ԥ��ޤ���

  $ gem install rak
  $ sudo gem install rak

����ΥС������� Gem �ѥå������򥤥󥹥ȡ��뤹��ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem install rak --version 0.8.1    # �С������ 0.8.1 �򥤥󥹥ȡ��뤹��
  $ gem install rak --version '>= 0.5' # �С������ 0.5 �ʾ�Τ�Τ򥤥󥹥ȡ��뤹��

Proxy �����з�ͳ�� Gem �ѥå������򥤥󥹥ȡ��뤹��ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem install rak -p http://user:pasword@proxy.example.com/

==== Gem �ѥå������򥢥󥤥󥹥ȡ��뤹��

�㤨�� rak �򥢥󥤥󥹥ȡ��뤹��ˤϡ��ʲ��Τ����줫��¹Ԥ��ޤ���

  $ gem uninstall rak
  $ sudo gem uninstall rak

����ΥС������� Gem �ѥå������򥢥󥤥󥹥ȡ��뤹��ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem uninstall rak --version 0.8.1

==== Gem �ѥå������򹹿�����

���󥹥ȡ��뤵��Ƥ��� Gem �ѥå������򹹿�����ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem update
  $ sudo gem update

����� Gem �ѥå������򹹿�����ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem update rak

==== Gem �ѥå�������õ��

�ѥå�����̾���� Gem �ѥå�������õ�����Ȥ��Ǥ��ޤ���
'active' �Ȥ���ʸ�����ѥå�����̾�˴ޤ�ѥå�������õ���ˤϰʲ��Τ褦�ˤ��ޤ���

  $ gem search active       # �ǥե���ȤǤϥ�����˥��󥹥ȡ��뤵��Ƥ����Τ��鸡�����ޤ�
  $ gem search active -r    # -r ���ץ�����Ĥ�����ݥ��ȥ꤫�鸡�����ޤ�
  $ gem search active -r -a # -a ���ץ�����Ĥ�������ƤΥС�������ɽ�����ޤ�

�ѥå������ξܺ٤��饭����ɸ������뤳�ȤϤǤ��ޤ���

==== Gem �ѥå��������������

��ɮ��

=== gem ���ޥ�ɤ�����
  * GEM_HOME Gem �Υۡ���ǥ��쥯�ȥ�
  * GEM_PATH Gem �Υ������ѥ�
  * $HOME/.gemrc

�Ķ��ѿ� GEM_HOME, GEM_PATH �����ꤹ����ˤ�ä� Gem ���ޥ�ɤ�ư����ѹ����뤳�Ȥ��Ǥ��ޤ���
�ޤ����ۡ���ǥ��쥯�ȥ�� .gemrc �Ȥ��� YAML �ե����ޥåȤǽ񤫤줿�ե�������֤����ȤǤ�
ư����ѹ����뤳�Ȥ��Ǥ��ޤ���

��:

  --- 
  :backtrace: false
  :benchmark: false
  :bulk_threshold: 1000
  :sources: 
  - http://gems.rubyforge.org
  :update_sources: true
  :verbose: true
  gemhome: /home/hoge/.gems
  gempath: 
  - /usr/local/lib/ruby/gems/1.9


=== ����
: Rubyist Magazine - ���꡼�� �ѥå������ޥͥ����� ���� 1 ��� RubyGems (1)
  [[url:http://jp.rubyist.net/magazine/?0006-PackageManagement]]
: Rubyist Magazine - ���꡼�� �ѥå������ޥͥ����� ���� 2 ��� RubyGems (2)
  [[url:http://jp.rubyist.net/magazine/?0010-PackageManagement]]


= reopen Kernel

== Private Instance Methods

--- gem(gem_name, *version_requirements) -> bool
#@todo
[[m:$LOAD_PATH]] �� Ruby Gem ���ɲä��ޤ���

���ꤵ�줿 Gem ����ɤ������ˤ��� Gem ��ɬ�פȤ��� Gem ����ɤ��ޤ���
�С�����������ά�������ϡ��Ǥ�⤤�С������� Gem ����ɤ��ޤ���
���ꤵ�줿 Gem �䤽�� Gem ��ɬ�פȤ��� Gem �����Ĥ���ʤ��ä�����
[[c:Gem::LoadError]] ��ȯ�����ޤ���

�С������λ�����ˡ�˴ؤ��Ƥ� [[c:Gem::Version]] �򻲾Ȥ��Ƥ���������

rubygems �饤�֥�꤬�饤�֥��С������ξ��ͤ򸡽Ф��ʤ��¤ꡢ
gem �᥽�åɤ����Ƥ� require �᥽�åɤ������˼¹Ԥ���ޤ���

==== �Ķ��ѿ� GEM_SKIP

����� Gem ����ɤ��ʤ��褦�ˤ��뤿��˴Ķ��ѿ� GEM_SKIP ��������뤳�Ȥ��Ǥ��ޤ���
����� Gem ���ޤ����󥹥ȡ��뤵��Ƥ��ʤ��Ȥ�������������˻��ѤǤ��ޤ���

��:

  GEM_SKIP=libA:libB ruby-I../libA -I../libB ./mycode.rb

@param gem Gem ��̾����ʸ���󤫡�Gem �ΰ�¸�ط��� [[c:Gem::Dependency]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���

@param version_requirement ɬ�פȤ��� gem �ΥС���������ꤷ�ޤ���

@return Gem �����ɤǤ������� true ���֤��ޤ������ɤǤ��ʤ��ä����� false ���֤��ޤ���

@raise Gem::LoadError ���ꤵ�줿 Gem �䤽�� Gem ��ɬ�פȤ��� Gem �����Ĥ���ʤ��ä�����ȯ�����ޤ���
                      ���������Ķ��ѿ� GEM_SKIP �˻��ꤵ��Ƥ��� Gem �˴ؤ��ƤϤ����㳰��ȯ�����ޤ���

@see [[c:Gem::Version]]

#@# #@include 'rubygems/Gem'

#@end
