#@since 1.8.0

require win32/registry

win32/resolv �� Win32 �ץ�åȥե������̾�����˴ؤ��������������
����Υ饤�֥��Ǥ���

= class Win32::Resolv

̾�����˴ؤ�������������뤿��Υ��饹�Ǥ���

== module functions
--- get_hosts_path -> String | nil

hosts �ե�����Υѥ����֤��ޤ����ե����뤬¸�ߤ��ʤ����� nil ���֤��ޤ���

��:

  require "win32/resolv"
  p Win32::Resolv.get_hosts_path #=> "C:\Windows\System32\drivers\etc\hosts"

--- get_resolv_info -> [[String], [String]]

�ɥᥤ��̾�ȥ͡��ॵ���Ф������������֤��ޤ���

��:

  require "win32/resolv"
  p Win32::Resolv.get_resolv_info #=> [["my.example.com"], ["192.168.1.1"]]

���ꤵ��Ƥ��ʤ������ nil �ˤʤ�ޤ���

  # �ɥᥤ��̾�����ꤵ��Ƥ��ʤ���硣
  require "win32/resolv"
  p Win32::Resolv.get_resolv_info #=> [nil, ["192.168.1.1"]]

#@end
