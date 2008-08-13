require rubygems/command

���ꤵ�줿����ΥС������� Gem �ѥå������˰�¸���� Gem ����Ѥ��뤿���
ɬ�פ� [[Kernel.#gem]] �᥽�åɤθƤӽФ���ˡ��ʸ����ǽ��Ϥ��ޤ���

  Usage: gem lock GEMNAME-VERSION [GEMNAME-VERSION ...] [options]
    Options:
      -s, --[no-]strict                ��¸�ط����������ʤ����˼��Ԥ��ޤ�
#@include(common_options)
    Arguments:
      GEMNAME       ��å����� Gem �ѥå�������̾������ꤷ�ޤ�
      VERSION       ��å����� Gem �ѥå������ΥС���������ꤷ�ޤ�
    Summary:
      ����С������� Gem �ѥå���������Ѥ��뤿���ɬ�פʵ��Ҥ�ɽ�����ޤ�
    Description:
      The lock command will generate a list of +gem+ statements that will lock
      down
      the versions for the gem given in the command line.  It will specify exact
      versions in the requirements list to ensure that the gems loaded will always
      be consistent.  A full recursive search of all effected gems will be
      generated.
      
      Example:
      
        gemlock rails-1.0.0 > lockdown.rb
      
      will produce in lockdown.rb:
      
        require "rubygems"
        gem 'rails', '= 1.0.0'
        gem 'rake', '= 0.7.0.1'
        gem 'activesupport', '= 1.2.5'
        gem 'activerecord', '= 1.13.2'
        gem 'actionpack', '= 1.11.2'
        gem 'actionmailer', '= 1.1.5'
        gem 'actionwebservice', '= 1.0.0'
      
      Just load lockdown.rb from your application to ensure that the current
      versions are loaded.  Make sure that lockdown.rb is loaded *before* any
      other require statements.
      
      Notice that rails 1.0.0 only requires that rake 0.6.2 or better be used.
      Rake-0.7.0.1 is the most recent version installed that satisfies that, so we
      lock it down to the exact version.
    Defaults:
      --no-strict


= class Gem::Commands::LockCommand < Gem::Command

���ꤵ�줿����ΥС������� Gem �ѥå������˰�¸���� Gem ����Ѥ��뤿���
ɬ�פ� [[Kernel.#gem]] �᥽�åɤθƤӽФ���ˡ��ʸ����ǽ��Ϥ��ޤ���

== Public Instance Methods

--- complain(message) -> ()
#@todo

���ꤵ�줿��å�������ɽ�����ޤ���--strict ��ͭ���ʾ����㳰��ȯ�����ޤ���

@param message ɽ�������å���������ꤷ�ޤ���

@raise StandardError ���ޥ�ɥ饤�󥪥ץ����� --strict �����ꤵ��Ƥ������ȯ�����ޤ���

--- spec_path(gem_full_name) -> String
#@todo

���ꤵ�줿Gem �ѥå������� gemspec �ե�����Υե�ѥ����֤��ޤ���

@param gem_full_name Gem �ѥå�������̾������ꤷ�ޤ���


