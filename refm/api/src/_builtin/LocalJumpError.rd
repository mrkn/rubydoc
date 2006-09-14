= class LocalJumpError < StandardError

�������פ�ФƤ��ޤä� [[c:Proc]] �����
[[unknown:���湽¤/return]],
[[unknown:���湽¤/break]],
[[unknown:���湽¤/retry]] ��ȯ�����ޤ���

[[c:Proc]] ����򻲾Ȥ��Ƥ���������

== Instance Methods

#@if (version >= "1.8.0")
--- exit_value

�㳰 LocalJumpError ��ȯ�������� break �� return �˻��ꤷ��
����ͤ��֤��ޤ���

��:

  def foo
    proc { return 10 }
  end
  
  begin
    foo.call
  rescue LocalJumpError
    p $!
    p $!.reason
    p $!.exit_value
  end
  
  => ruby 1.8.0 (2003-06-09) [i586-linux]
     #<LocalJumpError: return from block-closure>
     :return
     10
  
  begin
    Block.new { break 5 }.call
  rescue LocalJumpError
    p $!
    p $!.reason
    p $!.exit_value
  end
  
  => ruby 1.8.0 (2003-06-09) [i586-linux]
     #<LocalJumpError: break from block-closure>
     :break
     5

--- reason

�㳰��ȯ�������������򥷥�ܥ���֤��ޤ����֤��ͤϡ�

  * :break
  * :redo
  * :retry
  * :next
  * :return
#@#       * :noreason

�Τ����줫�Ǥ���[[m:LocalJumpError#exit_value]] ����򻲾Ȥ��Ƥ���������
#@end
