= class SystemExit < Exception

ruby ��λ�����ޤ���
#@# exit�ȤϾ����㤤������ޤ���[[ruby-dev:12785]]

== Class Methods

#@if (version >= "1.7.0")
--- new([status], [error_message])

SystemExit �㳰�����������֤��ޤ���

�������������ξ�硢���� status ����ꤷ����ΤȤߤʤ����
�������Τ��Ȥ�����С������ΰ����� [[m:Exception#Exception.new]]
��Ʊ���Ǥ���

���� status �����ꤵ�줿��硢��λ���ơ������Ȥ�������������
�֥������Ȥ� [[m:SystemExit#status]] °�������ꤵ��ޤ�(��ά����
0 �����ꤵ��ޤ�)��

��:

  e = SystemExit.new(1)
  p e.status
  
  => 1
#@end

== Instance Methods

#@if (version >= "1.7.0")
--- status

��λ���ơ��������֤��ޤ�����λ���ơ������� [[m:Kernel#exit]] ��
[[m:SystemExit#SystemExit.new]] �ʤɤ����ꤵ��ޤ���

��:

  begin
    exit(1)
  rescue SystemExit
    p $!
    p $!.status
  end
  
  => #<SystemExit: exit>
     1
  
  begin
    raise SystemExit.new(1, "bogus exit")
  rescue SystemExit
    p $!
    p $!.status
  end
  
  => #<SystemExit: bogus exit>
     1
#@end

#@if (version >= "1.8.0")
--- success?

��λ���ơ����������ｪλ�򼨤��ʤ� true ���֤��ޤ���

��:

  begin
    exit(false)
  rescue SystemExit
    p $!
    p $!.status
    p $!.success?
  end
  
  # => #<SystemExit: exit>
       1
       false
#@end
