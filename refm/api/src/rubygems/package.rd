require rubygems/digest/md5
require rubygems/security
require rubygems/specification

require rubygems/package/f_sync_dir
require rubygems/package/tar_header
require rubygems/package/tar_input
require rubygems/package/tar_output
require rubygems/package/tar_reader
require rubygems/package/tar_reader/entry
require rubygems/package/tar_writer

���Υ饤�֥��� Gem �ѥå������򰷤�����Υ饤�֥��Ǥ���

= class Gem::FileOperations

���Υ��饹�� [[c:FileUtils]] �Υ�åѡ��Ǥ���

���󥰤ε�ǽ���ɲä��Ƥ��ޤ���

== Singleton Methods

--- new(logger = nil)

���Υ��饹���������ޤ���

@param logger ��������ꤷ�ޤ��������� log �Ȥ���̾���Υ᥽�åɤ���äƤ���ɬ�פ�����ޤ���

= module Gem::Package


== Module Functions

--- open(io, mode = 'r', signer = nil){|tar_io| ... }
#@todo

io �򳫤���Ϳ����줿�֥�å����Ϥ��ƥ֥�å���ɾ�����ޤ���

@param io IO ���֥������Ȥ���ꤷ�ޤ������̤� Gem �ѥå������򳫤����ե����륪�֥������Ȥ���ꤷ�ޤ���

@param mode �⡼�ɤ�ʸ����ǻ��ꤷ�ޤ�������Ǥ���⡼�ɤ��ɤ߹��� (r) �Ƚ񤭹��� (w) �Ǥ���

@param signer ???


--- pack(src, destname, signer = nil)
#@todo

???

@param src ???

@param destname ???

@param signer ???

= class Gem::Package::Error < StandardError

[[c:Gem::Package]] �Ǥδ���Ū���㳰�Ǥ���

= class Gem::Package::NonSeekableIO < Gem::Package::Error

�������Ǥ��ʤ� IO ���Ф��ƥ��������ѤȤ�������ȯ�������㳰�Ǥ���

= class Gem::Package::ClosedIO < Gem::Package::Error

�����Ĥ��Ƥ��� IO ����������ȯ�������㳰�Ǥ���

= class Gem::Package::BadCheckSum < Gem::Package::Error

�����å����ब���פ��ʤ�����ȯ�������㳰�Ǥ���

= class Gem::Package::TooLongFileName < Gem::Package::Error

�ե�����̾��Ĺ���������ȯ�������㳰�Ǥ���

= class Gem::Package::FormatError < Gem::Package::Error

�ե����ޥåȤ˴ؤ����㳰�Ǥ���
