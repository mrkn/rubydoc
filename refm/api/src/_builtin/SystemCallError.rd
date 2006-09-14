= class SystemCallError < StandardError

�����ƥॳ���뤬���Ԥ�������ȯ�������㳰�Ǥ����ºݤˤ�
SystemCallError ���Τ�ΤǤϤʤ������֥��饹�Ǥ��� [[c:Errno]]
�⥸�塼����������饹(��errno��Ʊ��̾��)�Ǥ���

== Class Methods

--- new(error_message)
#@if (version >= "1.8.0")
--- new(error_message, errno)
--- new(errno)

errno ����ꤷ�ʤ������ܤη����Ǥϡ�SystemCallError ��
�֥������Ȥ����������֤��ޤ�������ʳ��Ǥϡ����� errno �˳�
������[[c:Errno::EXXX]] ���֥������Ȥ����������֤��ޤ���

��:

  p SystemCallError.new("message")
  p SystemCallError.new("message", 2)
  p SystemCallError.new(2)
  p SystemCallError.new(256)
  
  # => #<SystemCallError: unknown error - message>
       #<Errno::ENOENT: No such file or directory - message>
       #<Errno::ENOENT: No such file or directory>
       #<SystemCallError: Unknown error 256>
#@else
SystemCallError ���֥������Ȥ����������֤��ޤ���
#@end

#@if (version >= "1.7.0")
--- ===(other)

other �� SystemCallError �Υ��֥��饹�Ǥ���п��Ǥ���
([[m:Module#===]] ��Ʊ��)��

�ޤ������դ� SystemCallError �Υ��֥��饹�Ǥ����硢
other.errno ����(nil �ʤ�� ���Υ��饹��
[[unknown:Errno|Errno::EXXX/Errno]] �������)��
self::Errno ��Ʊ�����˿����֤��ޤ���

���Υ᥽�åɤˤ�ꡢ�����ƥ�ˤ�ä� errno ��Ʊ���ͤ��㳰���Ф���
�ʲ�����Τ褦����ª�Ǥ���褦�ˤʤäƤ��ޤ�����

  p Errno::EAGAIN::Errno
  p Errno::EWOULDBLOCK::Errno
  begin
    raise Errno::EAGAIN, "pseudo error"
  rescue Errno::EWOULDBLOCK
    p $!
  end
  
  # => 11
       11
       #<Errno::EAGAIN: pseudo error>

���ߡ� SystemCallError#=== �Τ�����ħ���ä˰�̣������ޤ���
(�ʲ��Τ褦��Ʊ��Υ��֥������ȤˤʤäƤ��뤫��Ǥ�)

  p Errno::EAGAIN
  p Errno::EWOULDBLOCK
  p Errno::EWOULDBLOCK.object_id
  p SystemCallError.new(11).class.object_id
  
  => Errno::EAGAIN
     Errno::EAGAIN
     537747360
     537747360
#@end

== Instance Methods

--- errno

�����ƥफ���֤��줿 errno ���ͤ��֤��ޤ���
�ºݤ˥����ƥॳ���륨�顼��ȯ�����Ƥʤ���� nil ���֤��ޤ���

��:

����ܤ���Τ褦�� raise�ˤ�äƸΰդ˥��顼��ȯ�����Ƥ��뤫�Τ褦��
���������������դ��Ƥ���������

  begin
    open("nonexistent file")
  rescue Errno::ENOENT
    p Errno::ENOENT::Errno      # => 2
    p $!.errno                  # => 2
  end
  
  begin
    raise Errno::ENOENT
  rescue Errno::ENOENT
    p Errno::ENOENT::Errno      # => 2
    p $!.errno                  # => nil
  end

#@if (version >= "1.8.0")
Errno::EXXX �㳰���֥������Ȥ��б�����
errno �ͤ������������ꤹ��褦�ˤʤ�ޤ�����

  begin
    raise Errno::ENOENT
  rescue Errno::ENOENT
    p Errno::ENOENT::Errno      # => 2
    p $!.errno                  # => 2
  end

ȯ�����Ƥʤ��㳰���б����� errno ���ͤ��Τꤿ������
[[unknown:Errno::EXXX::Errno|Errno::EXXX/Errno]] �������Ѥ��Ƥ���������
#@end
