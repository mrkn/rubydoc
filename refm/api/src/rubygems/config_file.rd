require rubygems

����ե�����˽񤫤�Ƥ��� gem ���ޥ�ɤΥ��ץ�����
���֥������Ȥ���¸���뤿��Υ饤�֥��Ǥ���

= class Gem::ConfigFile

����ե�����˽񤫤�Ƥ��� gem ���ޥ�ɤΥ��ץ�����
���֥������Ȥ���¸���뤿��Υ��饹�Ǥ���

���Υ��饹�Υ��󥹥��󥹤ϥϥå���Τ褦�˿����񤤤ޤ���

== Public Instance Methods

--- [](key) -> object
#@todo

������Ϳ����줿�������б��������������֤��ޤ���

@param key ��������������뤿��˻��Ѥ��륭������ꤷ�ޤ���

--- []=(key, value)
#@todo

������Ϳ����줿�������б������������򼫿Ȥ���¸���ޤ���

@param key �������򥻥åȤ��뤿��˻��Ѥ��륭������ꤷ�ޤ���

@param value ���������ͤ���ꤷ�ޤ���

--- args -> Array
#@todo

����ե����륪�֥������Ȥ�Ϳ����줿���ޥ�ɥ饤������Υꥹ�Ȥ��֤��ޤ���

--- backtrace -> bool
#@todo

���顼ȯ�����˥Хå��ȥ졼������Ϥ��뤫�ɤ������֤��ޤ���

���ξ��ϥХå��ȥ졼������Ϥ��ޤ��������Ǥʤ����ϥХå��ȥ졼������Ϥ��ޤ���

--- backtrace=(backtrace)
#@todo

���顼ȯ�����˥Хå��ȥ졼������Ϥ��뤫�ɤ������ꤷ�ޤ���

@param backtrace ������ꤹ��ȥ��顼ȯ�����˥Хå��ȥ졼������Ϥ���褦�ˤʤ�ޤ���

--- benchmark -> bool
#@todo

���ξ��ϥ٥���ޡ�����¹Ԥ��ޤ���

--- benchmark=(benchmark)
#@todo

�٥���ޡ�����¹Ԥ��뤫�ɤ������ꤷ�ޤ���

@param benchmark ������ꤹ��ȥ٥���ޡ�����¹Ԥ���褦�ˤʤ�ޤ���

--- bulk_threshold -> Integer
#@todo

Bulk threshold value.  If the number of missing gems are above
this threshold value, then a bulk download technique is used.

--- bulk_threshold=(bulk_threshold)
#@todo

Bulk threshold value.  If the number of missing gems are above
this threshold value, then a bulk download technique is used.

--- config_file_name -> String
#@todo

����ե������̾�����֤��ޤ���

--- each{|key, value| ... }
#@todo

����ե�����γƹ��ܤΥ������ͤ�֥�å������Ȥ���Ϳ����줿�֥�å���ɾ�����ޤ���

--- handle_arguments(arg_list)
#@todo

���ޥ�ɤ��Ϥ��줿������������ޤ���

@param arg_list ���ޥ�ɤ��Ϥ��줿�������������ꤷ�ޤ���

--- load_file(file_name) -> object
#@todo

Ϳ����줿�ե�����̾�Υե����뤬¸�ߤ���� YAML �ե�����Ȥ��ƥ��ɤ��ޤ���

@param file_name YAML �����ǵ��Ҥ��줿����ե�����̾����ꤷ�ޤ���

--- path -> String
#@todo

Gem ��õ������ѥ����֤��ޤ���

--- path=(path)
#@todo

Gem ��õ������ѥ��򥻥åȤ��ޤ���

--- really_verbose -> bool
#@todo

���Υ᥽�åɤ��֤��ͤ����ξ��� verbose �⡼�ɤ���¿���ξ����ɽ�����ޤ���

--- update_sources -> bool
#@todo

���ξ��� [[c:Gem::SourceInfoCache]] ����󹹿����ޤ���
�����Ǥʤ����ϡ�����å��夬����Х���å���ξ������Ѥ��ޤ���

--- update_sources=(update_sources)
#@todo

@param update_sources ������ꤹ������ [[c:Gem::SourceInfoCache]] �򹹿����ޤ���

--- verbose -> bool | Symbol
#@todo

���ν��ϥ�٥���֤��ޤ���

@see [[m:Gem::ConfigFile#verbose=]]

--- verbose=(verbose_level)
#@todo

���ν��ϥ�٥�򥻥åȤ��ޤ���

�ʲ��ν��ϥ�٥�����ꤹ�뤳�Ȥ��Ǥ��ޤ���

: false
  ������Ϥ��ޤ���
: true
  �̾�Υ�����Ϥ��ޤ���
: :loud
  ���¿���Υ�����Ϥ��ޤ���

@param verbose_level �����ͤޤ��ϥ���ܥ����ꤷ�ޤ���

--- write
#@todo

���Ȥ��ɤ߹��������ե������񤭴����ޤ���

== Protected Instance Methods

--- hash -> Hash
#@todo



== Constants

--- DEFAULT_BACKTRACE -> false
#@todo

�ǥե���ȤǥХå��ȥ졼����ɽ������뤫�ɤ���

--- DEFAULT_BENCHMARK -> false
#@todo

--- DEFAULT_BULK_THRESHOLD -> 1000
#@todo

--- DEFAULT_UPDATE_SOURCES -> true
#@todo

--- DEFAULT_VERBOSITY -> true
#@todo

--- OPERATING_SYSTEM_DEFAULTS -> {}
#@todo

Ruby ��ѥå������󥰤��Ƥ���ͤ��ǥե���Ȥ������ͤ򥻥åȤ��뤿��˻��Ѥ��ޤ���

���Ѥ���ե������ rubygems/defaults/operating_system.rb �Ǥ���

--- PLATFORM_DEFAULTS -> {}
#@todo

Ruby �μ����Ԥ��ǥե���Ȥ������ͤ򥻥åȤ��뤿��˻��Ѥ��ޤ���

���Ѥ���ե������ rubygems/defaults/#{RUBY_ENGINE}.rb �Ǥ���

--- SYSTEM_WIDE_CONFIG_FILE -> String
#@todo

