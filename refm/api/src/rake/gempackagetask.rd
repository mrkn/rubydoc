require rake
require rake/packagetask

Gem Spec �ե�����򸵤ˤ��� Gem �ѥå�������������륿������������뤿��Υ饤�֥��Ǥ���

Gem �ѥå����������Ǥʤ� zip, tgz, tar.gz, tar.bz2 �γƥե����������������Ǥ��ޤ���

�ʲ��Υ�������������ޤ���

: PACKAGE_DIR/NAME-VERSION.gem
  Gem �ѥå�������������ޤ���

��:
   require 'rubygems'
   
   spec = Gem::Specification.new do |s|
     s.platform = Gem::Platform::RUBY
     s.summary = "Ruby based make-like utility."
     s.name = 'rake'
     s.version = PKG_VERSION
     s.requirements << 'none'
     s.require_path = 'lib'
     s.autorequire = 'rake'
     s.files = PKG_FILES
     s.description = <<EOF
   Rake is a Make-like program implemented in Ruby. Tasks
   and dependencies are specified in standard Ruby syntax. 
   EOF
   end
   
   Rake::GemPackageTask.new(spec) do |pkg|
     pkg.need_zip = true
     pkg.need_tar = true
   end

= class Rake::GemPackageTask < Rake::PackageTask

Gem Spec �ե�����򸵤ˤ��� Gem �ѥå�������������륿������������뤿��Υ��饹�Ǥ���


== Public Instance Methods

--- define
#@todo

��������������ޤ���

--- gem_file -> String
#@todo

Gem �ѥå�������̾�����֤��ޤ���

--- gem_spec -> Gem::Specification
#@todo

package �������åȤǻ��Ѥ��� gemspec ���֤��ޤ���

gemspec �ˤϥѥå�����̾���С�����󡢥ѥå������˴ޤޤ��ե�����ʤɤ����
����Ƥ���Τǡ�����������Ū�˻��ꤹ��ɬ�פϤ���ޤ���

--- gem_spec=(gem_spec)
#@todo

gemspec �򥻥åȤ��ޤ���

@param gem_spec [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- init(gem_spec)
#@todo

���Ȥγ�°���˽���ͤ򥻥åȤ��ޤ���

== Singleton Methods

--- new(gem_spec){|t| ... }

���Ȥ��������ƥ�������������ޤ���

�֥�å���Ϳ����줿���ϡ����Ȥ�֥�å��ѥ�᡼���Ȥ���
�֥�å���ɾ�����ޤ���

@param gem_spec [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���
