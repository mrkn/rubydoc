require rake
require rake/tasklib

���ۤ���ѥå����� (zip, tar, etc...) ��������뤿��Υ�������������ޤ���

���Υ饤�֥�����ɤ���Ȱʲ��Υ����������Ѳ�ǽ�ˤʤ�ޤ���

: package
  �ѥå�������������ޤ���
: clobber_package
  ���������ѥå������������ޤ������Υ������� clobber �������åȤˤ��ɲä���ޤ���
: repackage
  �ѥå��������Ť��ʤ����Ǥ�ѥå�������ƺ������ޤ���
: PACKAGE_DIR/NAME-VERSION.tgz
  [[m:Rake::PackageRask#need_tar]] �����ξ�� gzip ���줿 tar �ѥå�������������ޤ���
: PACKAGE_DIR/NAME-VERSION.tar.gz
  [[m:Rake::PackageRask#need_tar_gz]] �����ξ�� gzip ���줿 tar �ѥå�������������ޤ���
: PACKAGE_DIR/NAME-VERSION.tar.bz2
  [[m:Rake::PackageRask#need_tar_bz2]] �����ξ�� bzip2 ���줿 tar �ѥå�������������ޤ���
: PACKAGE_DIR/NAME-VERSION.zip
  [[m:Rake::PackageRask#need_zip]] �����ξ�� zip ���줿�ѥå�������������ޤ���

��:
   Rake::PackageTask.new("rake", "1.2.3") do |t|
     t.need_tar = true
     t.package_files.include("lib/**/*.rb")
   end

= class Rake::PackageTask < Rake::TaskLib

���ۤ���ѥå����� (zip, tar, etc...) ��������뤿��Υ�������������륯�饹�Ǥ���

== Public Instance Methods

--- define -> self
#@todo

��������������ޤ���

@raise RuntimeErro �С���������򥻥åȤ��Ƥ��ʤ�����ȯ�����ޤ���
                   ��������� :noversion �����ꤵ��Ƥ������ȯ�����ޤ���

--- init(name, version)
#@todo

���Ȥγ�°���˥ǥե�����ͤ򥻥åȤ��ޤ���

@param name �ѥå�������̾������ꤷ�ޤ���

@param version �ѥå������ΥС���������ꤷ�ޤ���

--- name -> String
#@todo

�С����������ޤޤʤ��ѥå�������̾�����֤��ޤ���

--- name=(name)
#@todo

�С����������ޤޤʤ��ѥå�������̾���򥻥åȤ��ޤ���

@param name �ѥå�������̾������ꤷ�ޤ���

--- need_tar -> bool
#@todo

�����ͤ����Ǥ������ gzip ���� tar �ե����� (tgz) ��������ޤ���
�ǥե���Ȥϵ��Ǥ���

--- need_tar=(flag)
#@todo

 gzip ���� tar �ե����� (tgz) ��������뤫�ɤ��������ꤷ�ޤ���

@param flag ���ޤ��ϵ�����ꤷ�ޤ���

--- need_tar_bz2 -> bool
#@todo

�����ͤ����Ǥ������ bzip2 ���� tar �ե����� (tar.bz2) ��������ޤ���
�ǥե���Ȥϵ��Ǥ���

--- need_tar_bz2=(flag)
#@todo

bzip2 ���� tar �ե����� (tar.bz2) ��������뤫�ɤ��������ꤷ�ޤ���

@param flag ���ޤ��ϵ�����ꤷ�ޤ���

--- need_tar_gz -> bool
#@todo

�����ͤ����Ǥ������ gzip ���� tar �ե����� (tar.gz) ��������ޤ���
�ǥե���Ȥϵ��Ǥ���

--- need_tar_gz=(flag)
#@todo

gzip ���� tar �ե����� (tar.gz) ��������뤫�ɤ��������ꤷ�ޤ���

@param flag ���ޤ��ϵ�����ꤷ�ޤ���

--- need_zip -> bool
#@todo

�����ͤ����Ǥ������ zip �ե������������ޤ���
�ǥե���Ȥϵ��Ǥ���

--- need_zip=(flag)
#@todo

zip �ե����� (tgz) ��������뤫�ɤ��������ꤷ�ޤ���

@param flag ���ޤ��ϵ�����ꤷ�ޤ���

--- package_dir -> String
#@todo

�ѥå������������ե��������¸����ǥ��쥯�ȥ�̾���֤��ޤ���

--- package_dir=(dirname)
#@todo

�ѥå������������ե��������¸����ǥ��쥯�ȥ�̾�򥻥åȤ��ޤ���

@param dirname �ѥå������������ե��������¸����ǥ��쥯�ȥ�̾����ꤷ�ޤ���

--- package_dir_path -> String
#@todo

�ѥå������˴ޤ�ե���������֤���ǥ��쥯�ȥ���֤��ޤ���

--- package_files -> Rake::FileList
#@todo

�ѥå������˴ޤ�ե�����ꥹ�Ȥ��֤��ޤ���

--- package_files=(file_list)
#@todo

�ѥå������˴ޤ�ե�����ꥹ�Ȥ����ꤷ�ޤ���

@param file_list �ե�����ꥹ�Ȥ���ꤷ�ޤ���

--- package_name -> String
#@todo

�С����������ޤ�ѥå�����̾���֤��ޤ���

--- tar_bz2_file -> String
#@todo

tar.bz2 �ѤΥե�����̾���֤��ޤ���

--- tar_command -> String
#@todo

tar ���ޥ�ɤȤ��ƻ��Ѥ��륳�ޥ�ɤ��֤��ޤ���

�ǥե���Ȥ� 'tar' �Ǥ���

--- tar_command=(command)
#@todo

tar ���ޥ�ɤȤ��ƻ��Ѥ��륳�ޥ�ɤ����ꤷ�ޤ���

@param command ���ޥ�ɤ�ʸ����ǻ��ꤷ�ޤ���

--- tar_gz_file -> String
#@todo

tar.gz �ѤΥե�����̾���֤��ޤ���

--- tgz_file -> String
#@todo

tgz �ѤΥե�����̾���֤��ޤ���

--- version -> String
#@todo

��������ѥå������ΥС�������ɽ��ʸ������֤��ޤ���

--- version=(str)
#@todo

��������ѥå������ΥС������򥻥åȤ��ޤ���

@param str �С�������ɽ��ʸ�������ꤷ�ޤ���

--- zip_command -> String
#@todo

zip ���ޥ�ɤȤ��ƻ��Ѥ��륳�ޥ�ɤ��֤��ޤ���

�ǥե���Ȥ� 'zip' �Ǥ���

--- zip_command=(command)
#@todo

zip ���ޥ�ɤȤ��ƻ��Ѥ��륳�ޥ�ɤ����ꤷ�ޤ���

@param command ���ޥ�ɤ�ʸ����ǻ��ꤷ�ޤ���

--- zip_file -> String
#@todo

zip �ե������ѤΥե�����̾���֤��ޤ���


== Singleton Methods

--- new(name = nil, version = nil){|t| ... }

���Ȥ��������ƥ�������������ޤ���

�֥�å���Ϳ����줿���ϡ����Ȥ�֥�å��ѥ�᡼���Ȥ���
�֥�å���ɾ�����ޤ���

@param name �ѥå�����̾����ꤷ�ޤ���

@param version �ѥå������ΥС���������ꤷ�ޤ���
               ':noversion' �Ȥ�������ܥ����ꤹ��ȥС���������򥻥åȤ��ޤ���
