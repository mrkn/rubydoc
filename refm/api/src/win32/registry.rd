#@if (version >= "1.7.0")
#@# = win32/registry

win32/registry �� Win32 �ץ�åȥե�����ǥ쥸���ȥ�򥢥��������뤿���
�饤�֥��Ǥ���Win32 API �θƤӽФ��� [[c:Win32API]] ��Ȥ��ޤ���

//emlist{
Win32::Registry::HKEY_CURRENT_USER.open('SOFTWARE\foo') do |reg|
  value = reg['foo']                               # �ͤ��ɤ߹���
  value = reg['foo', Win32::Registry::REG_SZ]      # ������ꤷ���ɤ߹���
  type, value = reg.read('foo')                    # �ͤ��ɤ߹���
  reg['foo'] = 'bar'                               # �ͤν񤭹���
  reg['foo', Win32::Registry::REG_SZ] = 'bar'      # �������դ��ͤν񤭹���
  reg.write('foo', Win32::Registry::REG_SZ, 'bar') # �ͤν񤭹���

  reg.each_value { |name, type, data| ... }        # �ͤ����
  reg.each_key { |key, wtime| ... }                # ���֥��������

  reg.delete_value('foo')                          # �ͤκ��
  reg.delete_key('foo')                            # ���֥����κ��
  reg.delete_key('foo', true)                      # ���֥����κƵ����
end
//}

=== WSH ���Ѥ����쥸���ȥꥢ������

�쥸���ȥ�򥢥���������ˤ� [[c:WIN32OLE]] ��Ȥä� [[m:WScript.Shell]] ���֥������ȷ�ͳ�ǥ�������������ˡ�⤢��ޤ���

  wsh = WIN32OLE.new('WScript.Shell')
  value = wsh.RegRead 'HKLM\Software\Microsoft\Windows\...'
  wsh.RegWrite 'HKCR\foofile\shell\open\command\', 'REG_SZ', '"C:\..." "%1"'

����������������󤷤��ꡤ��ͳ�ʥХ��ʥ��ͤ��ɤ߽񤭤��뤳�Ȥ��Ǥ��ޤ���

= class Win32::Registry < Object

include Enumerable
include Win32::Registry::Constants

== Class Methods

--- new(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)
--- new(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED) {|reg| ... }
--- open(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)
--- open(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED) {|reg| ... }

�쥸���ȥꥭ�� key ���Υ��� subkey �򳫤���
������������ɽ�� Win32::Registry ���֥������Ȥ��֤��ޤ���
key �ϿƤΥ����� Win32::Registry ���֥������Ȥǻ��ꤷ�ޤ���
�ƤΥ����ˤ�����ѥ��� HKEY_* ����ѤǤ��ޤ� (��[[m:Win32::Registry#constants]])

desired �ϥ��������ޥ����Ǥ���opt �ϥ����Υ��ץ����Ǥ���
�ܺ٤� [[unknown:MSDN Library|URL:http://msdn.microsoft.com/library/en-us/sysinfo/base/registry_key_security_and_access_rights.asp]] �򻲾Ȥ��Ƥ���������

�֥�å���Ϳ������ȡ������ϼ�ưŪ���Ĥ����ޤ���

--- create(key, subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED)
--- create(key, subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED) {|reg| ... }

�쥸���ȥꥭ�� key ���˥��� subkey ���������
������������ɽ�� Win32::Registry ���֥������Ȥ��֤��ޤ���
key �ϿƤΥ����� Win32::Registry ���֥������Ȥǻ��ꤷ�ޤ���
�ƤΥ����ˤ�����ѥ��� HKEY_* ����ѤǤ��ޤ� (��[[m:Win32::Registry#constants]])

���֥���������¸�ߤ��Ƥ���Х����Ϥ��������졤[[unknown:created?|Win32::Registry/created?]]
�᥽�åɤ� false ���֤��ޤ���

�֥�å���Ϳ������ȡ������ϼ�ưŪ���Ĥ����ޤ���

--- expand_environ(str)

str �� %\w+% �Ȥ����¤Ӥ�Ķ��ѿ����ִ����ޤ���
REG_EXPAND_SZ ���Ѥ����ޤ���

�ܺ٤� [[unknown:ExpandEnvironmentStrings|URL:http://msdn.microsoft.com/library/en-us/sysinfo/base/expandenvironmentstrings.asp]] Win32 API �򻲾Ȥ��Ƥ���������

--- type2name(type)

�쥸���ȥ��ͤη��������������ʸ������Ѵ����ޤ���

--- wtime2time(wtime)

64bit �� [[unknown:FILETIME|URL:http://msdn.microsoft.com/library/en-us/sysinfo/base/filetime_str.asp]] �� Time ���֥������Ȥ��Ѵ����ޤ���

--- time2wtime(time)

Time ���֥������Ȥޤ��� Integer ���֥������Ȥ������ꡤ
64bit �� FILETIME ���Ѵ����ޤ���

== Instance Methods

--- open(subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)

[[m:Win32::Registry.open]](self, subkey, desired, opt) ��Ʊ���Ǥ���

--- create(subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED)

[[m:Win32::Registry.create]](self, subkey, desired, opt) ��Ʊ���Ǥ���

--- close

������Ƥ��륭�����Ĥ��ޤ���

�Ĥ���줿��Ǥϡ�¿���Υ᥽�åɤ��㳰��ȯ�����ޤ���

--- read(name, *rtype)

�쥸���ȥ��� name ���ɤߡ�[ type, data ]
��������֤��ޤ���
name �� nil �ξ�硤(ɸ��) �쥸���ȥ��ͤ��ɤ߹��ޤ�ޤ���

type �ϥ쥸���ȥ��ͤη��Ǥ���(��[[unknown:Registry::Constants module|Win32::Registry/Registry::Constants module]])
data �ϥ쥸���ȥ��ͤΥǡ����ǡ����饹�ϰʲ����̤�Ǥ�:
  * REG_SZ, REG_EXPAND_SZ
    String
  * REG_MULTI_SZ
    String ������
  * REG_DWORD, REG_DWORD_BIG_ENDIAN, REG_QWORD
    Integer
  * REG_BINARY
    String (�Х��ʥ�ǡ�����ޤߤޤ�)

���ץ������� rtype �����ꤵ��Ƥ�����硤�쥸���ȥ��ͤη���
Ϳ����줿 rtype �������¸�ߤ��뤫�����å����졤¸�ߤ��ʤ�����
[[c:TypeError]] ��ȯ�����ޤ���

--- [](name, *rtype)

�쥸���ȥ��� name ���ɤߡ������ͤ��֤��ޤ������饹��
[[unknown:read|Win32::Registry/read]] �˽स�ޤ���

�쥸���ȥ��ͤη��� REG_EXPAND_SZ ���ä���硤�Ķ��ѿ����ִ�����ޤ���
�쥸���ȥ��ͤη��� REG_SZ, REG_EXPAND_SZ, REG_MULTI_SZ, REG_DWORD,
REG_DWORD_BIG_ENDIAN, REG_QWORD �ʳ����ä����� TypeError ��ȯ�����ޤ���

���ץ������� rtype �ΰ�̣�� read ��Ʊ���Ǥ���

--- read_s(name)
--- read_i(name)
--- read_bin(name)

�������줾�� REG_SZ(read_s), REG_DWORD(read_i), REG_BINARY(read_bin)
�Ǥ���쥸���ȥ��� name ���ɤߡ������ͤ��֤��ޤ���

�����ޥå����ʤ��ä���硤TypeError ��ȯ�����ޤ���

--- read_s_expand(name)

���� REG_SZ �ޤ��� REG_EXPAND_SZ �Ǥ���쥸���ȥ��� name ���ɤߡ�
�����ͤ��֤��ޤ���

���� REG_EXPAND_SZ ���ä���硤�Ķ��ѿ����ִ����줿�ͤ��֤�ޤ���
REG_SZ �ޤ��� REG_EXPAND_SZ �ʳ����ä���硤TypeError ��ȯ�����ޤ���

--- write(name, type, data)

�쥸���ȥ��� name �˷� type �� data ��񤭹��ߤޤ���
name �� nil �ξ�硤(ɸ��) �쥸���ȥ��ͤ˽񤭹��ߤޤ���

type �ϥ쥸���ȥ��ͤη��Ǥ���(��[[unknown:Registry::Constants module|Win32::Registry/Registry::Constants module]])
data �Υ��饹�� [[unknown:read|Win32::Registry/read]]
�᥽�åɤ˽स�Ƥ��ʤ���Фʤ�ޤ���

--- [](name, wtype = nil)

�쥸���ȥ��� name �� value ��񤭹��ߤޤ���

���ץ������� wtype ����ꤷ�����ϡ����η��ǽ񤭹��ߤޤ���
���ꤷ�ʤ��ä���硤value �Υ��饹�˱����Ƽ��η��ǽ񤭹��ߤޤ�:
  * Integer
    REG_DWORD
  * String
    REG_SZ
  * Array
    REG_MULTI_SZ

--- write_s(name, value)
--- write_i(name, value)
--- write_bin(name, value)

�쥸���ȥ��� name �� value ��񤭹��ߤޤ���

�쥸���ȥ��ͤη��Ϥ��줾�� REG_SZ(write_s), REG_DWORD(write_i),
REG_BINARY(write_bin) �Ǥ���

--- each {|name, type, value| ... }
--- each_value {|name, type, value| ... }

���������ĥ쥸���ȥ��ͤ���󤷤ޤ���

--- each_key {|subkey, wtime| ... }

�����Υ��֥�������󤷤ޤ���

subkey �ϥ��֥�����̾����ɽ�� String �Ǥ���
wtime �Ϻǽ����������ɽ�� FILETIME (64-bit ����) �Ǥ���
(��[[m:Registry.wtime2time]])

--- delete(name)
--- delete_value(name)

�쥸���ȥ��� name �������ޤ���
(ɸ��) �쥸���ȥ��ͤ������뤳�ȤϤǤ��ޤ���

--- delete_key(name, recursive = false)

���֥��� name �Ȥ��Υ��������Ĥ��٤Ƥ��ͤ������ޤ���

recursive �� false �ξ�硤���Υ��֥����ϥ��֥�������äƤ��ƤϤʤ�ޤ���
true �ξ�硤�����ϺƵ�Ū�˺������ޤ���

--- flush

���������ƤΥǡ�����쥸���ȥ�ե�����˽񤭹��ߤޤ���

--- created?

�������������������줿��硤�����֤��ޤ���
(��[[m:Registry.create]])

--- opened?

�������ޤ��Ĥ����Ƥ��ʤ���硤�����֤��ޤ���

--- parent

�ƤΥ�����ɽ�� Win32::Registry ���֥������Ȥ��֤��ޤ���
����ѥ����Ǥ� nil ���֤��ޤ���

--- keyname

[[m:Registry.open]] �ޤ��� [[m:Registry.create]] �˻��ꤵ�줿
subkey ���ͤ��֤��ޤ���

--- disposition

������ disposition �ͤ��֤��ޤ���
(REG_CREATED_NEW_KEY �ޤ��� REG_OPENED_EXISTING_KEY)

--- name
--- to_s

�����Υե�ѥ��� 'HKEY_CURRENT_USER\SOFTWARE\foo\bar'
�Τ褦�ʷ����֤��ޤ���

--- info

���������ʲ����ͤ�������֤��ޤ�:
  * num_keys
    ���֥����θĿ�
  * max_key_length
    ���֥���̾�κ���Ĺ
  * num_values
    �ͤθĿ�
  * max_value_name_length
    �ͤ�̾���κ���Ĺ
  * max_value_length
    �ͤκ���Ĺ
  * descriptor_length
    �������ƥ����һҤ�Ĺ��
  * wtime
    �ǽ��������� (FILETIME)

�ܺ٤� [[unknown:RegQueryInfoKey|URL:http://msdn.microsoft.com/library/en-us/sysinfo/base/regqueryinfokey.asp]] Win32 API �򻲾Ȥ��Ƥ���������

--- num_keys
--- max_key_length
--- num_values
--- max_value_name_length
--- max_value_length
--- descriptor_length
--- wtime

��������θġ����ͤ��֤��ޤ���


--- []=(name, rtype, value = nil)

--- _dump

--- hkey

--- inspect

--- keys

--- open?


== Constants

--- HKEY_CLASSES_ROOT
--- HKEY_CURRENT_USER
--- HKEY_LOCAL_MACHINE
--- HKEY_PERFORMANCE_DATA
--- HKEY_CURRENT_CONFIG
--- HKEY_DYN_DATA

���줾�������ѥ�����ɽ�� Win32::Registry ���֥������ȤǤ���
�ܺ٤� [[unknown:MSDN Library|URL:httphttp://msdn.microsoft.com/library/en-us/sysinfo/base/predefined_keys.asp]] �򻲾Ȥ��Ƥ���������


= module Win32::Registry::API
== Module Functions
--- CloseKey(hkey)
--- CreateKey(hkey, name, opt, desired)
--- DeleteKey(hkey, name)
--- DeleteValue(hkey, name)
--- EnumKey(hkey, index)
--- EnumValue(hkey, index)
--- FlushKey(hkey)
--- OpenKey(hkey, name, opt, desired)
--- QueryInfoKey(hkey)
--- QueryValue(hkey, name)
--- SetValue(hkey, name, type, data, size)
--- check(result)
--- packdw(dw)
--- packqw(qw)
--- unpackdw(dw)
--- unpackqw(qw)

== Constants
--- RegCloseKey
--- RegCreateKeyExA
--- RegDeleteKey
--- RegDeleteValue
--- RegEnumKeyExA
--- RegEnumValueA
--- RegFlushKey
--- RegOpenKeyExA
--- RegQueryInfoKey
--- RegQueryValueExA
--- RegSetValueExA

= class Win32::Registry::Error < StandardError

== Instance Methods

--- code

== Constants

--- FormatMessageA


= class Win32::Registry::PredefinedKey < Win32::Registry

== Class Methods

--- new(hkey, keyname)

== Instance Methods

--- class

--- close

= module Win32::Registry::Constants

�ܺ٤� [[unknown:MSDN Library|URL:http://msdn.microsoft.com/library/en-us/sysinfo/base/registry.asp]] �򻲾Ȥ��Ƥ���������

== Constants

--- HKEY_CLASSES_ROOT
--- HKEY_CURRENT_USER
--- HKEY_LOCAL_MACHINE
--- HKEY_USERS
--- HKEY_PERFORMANCE_DATA
--- HKEY_PERFORMANCE_TEXT
--- HKEY_PERFORMANCE_NLSTEXT
--- HKEY_CURRENT_CONFIG
--- HKEY_DYN_DATA

����ѥ����͡�
������ Integer �ǡ�Win32::Registry ���֥������ȤǤϤ���ޤ���

--- REG_NONE
--- REG_SZ
--- REG_EXPAND_SZ
--- REG_BINARY
--- REG_DWORD
--- REG_DWORD_LITTLE_ENDIAN
--- REG_DWORD_BIG_ENDIAN
--- REG_LINK
--- REG_MULTI_SZ
--- REG_RESOURCE_LIST
--- REG_FULL_RESOURCE_DESCRIPTOR
--- REG_RESOURCE_REQUIREMENTS_LIST
--- REG_QWORD
--- REG_QWORD_LITTLE_ENDIAN

�쥸���ȥ��ͤη���

--- STANDARD_RIGHTS_READ
--- STANDARD_RIGHTS_WRITE
--- KEY_QUERY_VALUE
--- KEY_SET_VALUE
--- KEY_CREATE_SUB_KEY
--- KEY_ENUMERATE_SUB_KEYS
--- KEY_NOTIFY
--- KEY_CREATE_LINK
--- KEY_READ
--- KEY_WRITE
--- KEY_EXECUTE
--- KEY_ALL_ACCESS

�������ƥ����������ޥ�����


--- REG_CREATED_NEW_KEY
--- REG_OPENED_EXISTING_KEY

���������������줿������¸�����������줿����
[[m:Win32::Registry.disposition]] �᥽�åɤ⻲�Ȥ��Ƥ���������

--- REG_OPTION_RESERVED
--- REG_OPTION_NON_VOLATILE
--- REG_OPTION_VOLATILE
--- REG_OPTION_CREATE_LINK
--- REG_OPTION_BACKUP_RESTORE
--- REG_OPTION_OPEN_LINK
--- REG_LEGAL_OPTION

--- REG_WHOLE_HIVE_VOLATILE
--- REG_REFRESH_HIVE
--- REG_NO_LAZY_FLUSH
--- REG_FORCE_RESTORE

--- MAX_KEY_LENGTH
--- MAX_VALUE_LENGTH

#@end
