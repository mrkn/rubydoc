�ƥ�ݥ��ǥ��쥯�ȥ�Τ���Υ饤�֥��Ǥ���

= reopen Dir

== Class Methods

#@since 1.8.7
--- mktmpdir(prefix_suffix = nil, tmpdir = nil)             -> String
--- mktmpdir(prefix_suffix = nil, tmpdir = nil){|dir| ... } -> object

����ǥ��쥯�ȥ��������ޤ���

�������줿�ǥ��쥯�ȥ�Υѡ��ߥå����� 0700 �Ǥ���

�֥�å���Ϳ����줿���ϡ��֥�å���ɾ����������
�������줿����ǥ��쥯�ȥ�䤽���۲��ˤ��ä��ե������
[[m:FileUtils.remove_entry_secure]] ���Ѥ��ƺ�����ޤ���
�֥�å���Ϳ�����ʤ��ä����ϡ�������������ǥ��쥯�ȥ�Υѥ���
�֤��ޤ������ξ�硢���Υ᥽�åɤϺ�����������ǥ��쥯�ȥ�������ޤ���

@param prefix_suffic nil �ξ��ϡ�'d' ��ǥե���ȤΥץ�ե������Ȥ��ƻ��Ѥ��ޤ������ե��å������դ��ޤ���
                     ʸ����Ϳ����줿���ϡ�����ʸ�����ץ�ե������Ȥ��ƻ��Ѥ��ޤ������ե��å������դ��ޤ���
                     2 ���Ǥ�����Ϳ����줿���ϡ�����ܤ����Ǥ�ץ�ե�����������ܤ����Ǥ򥵥ե��å����Ȥ��ƻ��Ѥ��ޤ���

@param tmpdir nil �ξ��� [[m:Dir.#tmpdir]] ����Ѥ��ޤ���
              �����Ǥʤ����ϡ����Υǥ��쥯�ȥ����Ѥ��ޤ���


  Dir.mktmpdir{|dir| dir is ".../d..." }
  Dir.mktmpdir("foo"){|dir| dir is ".../foo..." }
  Dir.mktmpdir(["foo", "bar"]){|dir| dir is ".../foo...bar" }
  
  Dir.mktmpdir {|dir| dir is "#{Dir.tmpdir}/d..." }
  Dir.mktmpdir(nil, "/var/tmp") {|dir| dir is "/var/tmp/d..." }
  
  Dir.mktmpdir {|dir|
    use the directory...
    open("#{dir}/foo", "w") { ... }
  }
  
  dir = Dir.mktmpdir
  begin
   use the directory...
    open("#{dir}/foo", "w") { ... }
  ensure
   remove the directory.
    FileUtils.remove_entry_secure dir
  end


#@end

--- tmpdir    -> String

�ƥ�ݥ��ե�������������Τ˻Ȥ��ǥ��쥯�ȥ�(�ƥ�ݥ��ǥ��쥯�ȥ�)�����Хѥ���
ʸ����Ȥ����֤��ޤ���
[[m:$SAFE]] �ˤ�ä��֤�ʸ������Ѥ��ޤ���

  # WindowsXP�ξ��

  require "tmpdir"

  p Dir.tmpdir #=> "C:/DOCUME~1/taro3/LOCALS~1/Temp"
  $SAFE = 1
  p Dir.tmpdir #=> "C:/WINDOWS/temp"
  $SAFE = 2
  p Dir.tmpdir #=> "C:/WINDOWS/temp"
  $SAFE = 3
  p Dir.tmpdir #=> "C:/WINDOWS/temp"

  # Linux�ξ�� /tmp �˲ä����Ķ��ѿ� ENV['TMPDIR'], ENV['TMP'], ENV['TEMP'], ENV['USERPROFILE']�򻲾Ȥ��ޤ�
  

