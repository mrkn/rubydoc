require rubygems/command
require rubygems/installer
require rubygems/version_option

���ꤵ�줿 Gem �ѥå������򥫥��ȥǥ��쥯�ȥ��Ÿ�����뤿��Υ饤�֥��Ǥ���

= class Gem::Commands::UnpackCommand < Gem::Command
include Gem::VersionOption

���ꤵ�줿 Gem �ѥå������򥫥��ȥǥ��쥯�ȥ��Ÿ�����뤿��Υ��饹�Ǥ���

== Public Instance Methods

--- get_path(gemname, version_req) -> String | nil
#@todo

�����ǻ��ꤵ�줿���˥ޥå����� Gem �ѥå������Υ���å��夬����ѥ����֤��ޤ���

@param gemname Gem �ѥå�������̾������ꤷ�ޤ���

@param version_req �С��������������٤�����ʸ����ǻ��ꤷ�ޤ���


