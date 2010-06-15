Ruby ���󥿥ץ꥿�����������ꤵ�줿������Ǽ�����饤�֥��Ǥ���

#@since 1.9.1
= module Config
[[c:RbConfig]] ����̾�Ǥ���

= module RbConfig
[[unknown:��ɮ���罸]]

Ruby ���󥿥ץ꥿�����������ꤵ�줿������Ǽ�����饤�֥��Ǥ���
RbConfig �⥸�塼���������ޤ���

#@else
= module RbConfig
[[c:Config]] ����̾�Ǥ���

= module Config
[[unknown:��ɮ���罸]]

Ruby ���󥿥ץ꥿�����������ꤵ�줿������Ǽ�����饤�֥��Ǥ���
Config �⥸�塼���������ޤ���

#@if (version >= "1.8.5")
RbConfig �⥸�塼��� Config ��Ʊ����ΤȤ���������ޤ���
#@end

#@end
#@#=== �Ȥ�����

#@#  require 'rbconfig'

== Singleton Methods

#@if (version >= "1.8.5")
--- expand(val)
#@todo

#@since 1.9.1
@see [[m:RbConfig::MAKEFILE_CONFIG]]
#@else
@see [[m:Config::MAKEFILE_CONFIG]]
#@end
#@end
#@since 1.9.2
--- ruby
#@todo

returns the absolute pathname of the ruby command.
#@end

== Constants

--- DESTDIR
#@todo

--- TOPDIR
#@todo

--- CONFIG
#@todo


�����ͤ��Ǽ�����ϥå���Ǥ����ʲ��Υ������ͤ�����ޤ���

: srcdir
      ����ѥ��뤷�� Ruby �Υ������ǥ��쥯�ȥ�
: prefix
      Ruby �Υ��󥹥ȡ�����δ��ǥ��쥯�ȥ�
: ruby_install_name
: RUBY_INSTALL_NAME
      ruby ���󥿥ץ꥿�Υե�����̾
: EXEEXT
      �¹ԥե�����γ�ĥ��
: SHELL
      ������Υѥ�̾
: CFLAGS
      C ����ѥ���Υ��ץ����
: CPPFLAGS
      C �ץ�ץ��å��Υ��ץ����
: CXXFLAGS
      C++ ����ѥ���Υ��ץ����
: FFLAGS
      Fortran ����ѥ���Υ��ץ����
: LDFLAGS
      ��󥫥��ץ����
: LIBS
      �饤�֥��
: exec_prefix
      �������ƥ������¸�μ¹ԥե�����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: bindir
      �¹ԥե�����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: sbindir
      �������Ѽ¹ԥե�����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: libexecdir
      ¾�Υץ���फ��¹Ԥ����¹ԥե�����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: datadir
      �������ƥ�����˰�¸���ʤ��ǡ����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: sysconfdir
      ����ե�����Υ��󥹥ȡ�����ǥ��쥯�ȥ�
: sharedstatedir
: localstatedir
: libdir
: includedir
: oldincludedir
: infodir
: mandir
: MAJOR
      Ruby �� major �С�������ֹ�(1.6.5��1)
: MINOR
      Ruby �� minor �С�������ֹ�(1.6.5��6)
: TEENY
      Ruby �� teeny �С�������ֹ�(1.6.5��5)
: host
: host_alias
: host_cpu
: host_vendor
: host_os
      �¹Ԥ��륷���ƥ�ξ���
#@todo
//emlist{
        ��:

        C:\>ruby -v -r rbconfig -e "p Config::CONFIG['host']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i686-pc-cygwin"
//}
: target
: target_alias
: target_cpu
: target_vendor
: target_os
      �������줿�����ɤ�¹Ԥ��륷���ƥ�ξ���
//emlist{
        ��:

        C:\>ruby -v -r rbconfig -e "p Config::CONFIG['target']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i386-pc-cygwin"
//}
: build
: build_alias
: build_cpu
: build_vendor
: build_os
      �ӥ�ɤ��������ƥ�ξ���
//emlist{
        ��:

        C:\>ruby -vrrbconfig -e "p Config::CONFIG['build']"
        ruby 1.8.1 (2003-12-25) [i386-cygwin]
        "i586-pc-linux-gnu"
//}
: CC
      �ӥ�ɤ˻Ȥ�줿 C ����ѥ���
: CPP
      �ӥ�ɤ˻Ȥ�줿 C �ץ�ץ��å�
: YACC
      �ӥ�ɤ˻Ȥ�줿 ����ѥ��饳��ѥ���
: RANLIB
: AR
      �ӥ�ɤ˻Ȥ�줿�饤�֥�ꥢ��
: NM
: DLLWRAP
: AS
: DLLTOOL
      �ӥ�ɤ˻Ȥ�줿�饤�֥�����ޥ��
      (?)
: WINDRES
      Windows �Υ꥽�������ޥ��
: LN_S
      ����ܥ�å���󥯺������ޥ��
: SET_MAKE
: OBJEXT
      ���֥������ȥե�����(����ѥ����������ƥ�����Υե�����)�γ�ĥ��
: LIBOBJS
      ruby���Τ˥�󥯤���Ƥ��륪�֥������ȥե�����
      (?)
: ALLOCA
: XLDFLAGS
: DLDFLAGS
: STATIC
: CCDLFLAGS
: LDSHARED
: DLEXT
: DLEXT2
      �����ʥߥå���󥯥饤�֥��γ�ĥ��
: STRIP
      ���֥������ȥե����뤫�饷��ܥ���ڤ�ΤƤ륳�ޥ��
: EXTSTATIC
: setup
: MINIRUBY
      �ӥ������˺�������뵡ǽ������ruby��compile_dir��������Хѥ�
: PREP
: LIBRUBY_LDSHARED
: LIBRUBY_DLDFLAGS
: RUBY_SO_NAME
      ruby��ͭ�饤�֥���̾��
: LIBRUBY_A
: LIBRUBY_SO
: LIBRUBY_ALIASES
: LIBRUBY
: LIBRUBYARG
: SOLIBS
: DLDLIBS
: ENABLE_SHARED
      configure��--enable-shared���ä����ɤ���(�ͤ�"yes"�ޤ���"no")
: MAINLIBS
: arch
      �¹��оݤȤʤ륢�����ƥ����㡣RUBY_PLATFORM��Ʊ����
#@since 1.8.0
: sitearch
      �����Ȥ��Ȥγ�ĥ�饤�֥�ꥤ�󥹥ȡ������arch����������Ѥ�����͡�
      �̾��arch��Ʊ���ˤʤ뤬������Υץ�åȥե�����(mswin32��mingw32)�Ǥ�
      �ۤʤ롣
      ��ĥ�饤�֥��˥Х��ʥ�ߴ���������arch�֤ǡ���ĥ�饤�֥���ͭ����
      ������Ѥ����롣
#@end
: sitedir
: configure_args
      �ӥ�ɻ���configure�ΰ�����
: ruby_version
      ruby�ΥС������(��:"1.6")
: rubylibdir
: archdir
: sitelibdir
: sitearchdir
: compile_dir
      �ӥ�ɻ��κ�ȥǥ��쥯�ȥꡣ

--- MAKEFILE_CONFIG
#@todo

[[m:Config::CONFIG]] ��Ʊ���Ǥ����������ͤϰʲ��Τ褦�ʷ�
��¾���ѿ��ؤλ��Ȥ�ޤߤޤ���
  MAKEFILE_CONFIG["bindir"] = "$(exec_prefix)/bin"
����ϡ�Makefile ���ѿ����Ȥη����� MAKEFILE_CONFIG �ϡ�
Makefile �����κݤ����Ѥ���뤳�Ȥ����ꤷ�Ƥ��ޤ���

  require 'rbconfig'
  
  print <<-END_OF_MAKEFILE
  prefix = #{Config::MAKEFILE_CONFIG['prefix']}
  exec_prefix = #{Config::MAKEFILE_CONFIG['exec_prefix']}
  bindir = #{Config::MAKEFILE_CONFIG['bindir']}
  END_OF_MAKEFILE
  
  => prefix = /usr/local
     exec_prefix = $(prefix)
     bindir = $(exec_prefix)/bin

[[m:Config.expand]] �ϡ����Τ褦�ʻ��Ȥ��褹��
�᥽�åɤȤ��� rbconfig ���������Ѥ���Ƥ��ޤ���
(CONFIG �ѿ��ϡ�MAKEFILE_CONFIG �����Ƥ���
[[m:Config.expand]] ��Ȥä���������Ƥ��ޤ�)

  require 'rbconfig'
  p Config.expand(Config::MAKEFILE_CONFIG["bindir"])
  # => "/usr/local/bin"
