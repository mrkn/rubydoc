�������ƥ졼���򰷤�����Υ饤�֥��Ǥ���

#@since 1.8.1
= class Generator < Object

include Enumerable

�������ƥ졼���������ƥ졼�����Ѥ��뤿��Υ��饹�Ǥ���
������ callcc ��ȤäƤ���Τ��٤��Ǥ���

 * [[c:SyncEnumerator]]

��:

  require 'generator'
  
  # Generator from an Enumerable object
  g = Generator.new(['A', 'B', 'C', 'Z'])
  
  while g.next?
    puts g.next
  end
  
  # Generator from a block
  g = Generator.new { |g|
    for i in 'A'..'C'
      g.yield i
    end
  
    g.yield 'Z'
  }
  
  # The same result as above
  while g.next?
    puts g.next
  end

== Class Methods

--- new(enum = nil) -> Generator
--- new(enum = nil) {|g|  ... } -> Generator

[[c:Enumerable]] ���֥������Ȥ��֥�å����� Generator ���֥������Ȥ��������ޤ���

�֥�å����������� Generator ���֥������Ȥ�֥�å������Ȥ��ƸƤФ�ޤ���

@param enum [[c:Enumerable]] �򥤥󥯥롼�ɤ������֥������Ȥ�Ϳ���ޤ���
            enum �ȥ֥�å���Ʊ����Ϳ�������ϡ��֥�å���̵�뤵��ޤ���



== Instance Methods

--- current -> object

���ߤΰ��֤ˤ������Ǥ��֤��ޤ���next �Ȱ㤤���֤ϰ�ư���ޤ���

��:

  g = Generator.new(['A', 'B', 'C', 'Z'])
  p g.current # => 'A'
  p g.current # => 'A'

--- each {|e| ... } -> self

�����ͥ졼�������Ǥ�����Ȥ��ƥ֥�å���ɾ�����ޤ���self ���֤��ޤ���

--- end? -> bool

�������Ǥ��ʤ��������ͥ졼����������ã���Ƥ���ʤ鿿���֤��ޤ���

--- index -> Integer
--- pos   -> Ingeter

���ߤΰ��֤��֤��ޤ���

��:

  g = Generator.new(['A', 'B', 'C', 'Z'])
  p g.pos     # => 0
  p g.next    # => 'A'
  p g.pos     # => 1

--- next -> object

���ߤΰ��֤ˤ������Ǥ��֤������֤�1�Ŀʤ�ޤ���

@raise EOFError �������Ǥ�̵������ȯ�����ޤ���

��:

  g = Generator.new() do |g|
        ['A', 'B', 'C', 'Z'].each{|s|
          g.yield s
        }
      end
  p g.next # => 'A'
  p g.next # => 'B'

--- next? -> bool

�������Ǥ�¸�ߤ���ʤ鿿���֤��ޤ���

--- rewind -> self

�����ͥ졼����ǽ�˴����ᤷ�ޤ���self ���֤��ޤ���

��:

  g = Generator.new() do |g|
        ['A', 'B', 'C', 'Z'].each{|s|
          g.yield s
        }
      end
  p g.next # => 'A'
  p g.next # => 'B'
  g.rewind
  p g.next # => 'A'

--- yield(val) -> self

val �򥸥��ͥ졼�����Ϥ��ޤ���
Generator.new() {|g|  ... } �Υ֥�å�����Ǥ����Ƥ֤��Ȥ��Ǥ��ޤ���
�����ͥ졼�����Ϥ��줿 val �� next �ʤɤǼ��Ф����Ȥ��Ǥ��ޤ���

��:

  g = Generator.new() do |g|
        n = 0
        loop do
          g.yield n
          n += 1
        end
      end
  p g.next # => 0
  p g.next # => 1
  p g.next # => 2
  g.rewind
  p g.next # => 0

= class SyncEnumerator < Object
include Enumerable

ʣ���� [[c:Enumerable]] ���֥������Ȥ��¹Ԥ��� yield ���뤿��Υ��饹�Ǥ���

��:

  require 'generator'
  
  s = SyncEnumerator.new([1,2,3], ['a', 'b', 'c'])
  
  # Yields [1, 'a'], [2, 'b'], and [3,'c']
  s.each { |row| puts row.join(', ') }

== Class Methods

--- new(*enums) -> SyncEnumerator

SyncEnumerator ���֥������Ȥ��������ޤ���

ʣ���� [[c:Enumerable]] ���֥������Ȥ�Ϳ���ޤ���
Enumerable ���֥������ȤΥ������ϰۤʤäƤ��Ƥ⹽���ޤ���

== Instance Methods

--- each {|elem| ... } -> self

Ϳ����줿 Enumerable ���֥������ȤΤ��줾������Ǥ����������Ȥ���
�֥�å���ɾ�����ޤ���self ���֤��ޤ���

���Ǥ����� Enumerable ���֥������Ȥ��ҤȤĤǤ⤢��С�ɾ����³���ޤ���
���ǤΤʤ��ʤä� Enumerable ���֥������Ȥ������ nil ����������ǤȤ��ޤ���
���Ƥ� Enumerable ���֥������Ȥ����Ǥ��ʤ��ʤ�Ȥ����ǡ��֥�å���ɾ����ߤ�ޤ���

��:

  s = SyncEnumerator.new([1, 2, 3], ['a', 'b'], ['X'])
  s.each{|arry| p arry}
  
  # => ���
  # [1, "a", "X"]
  # [2, "b", nil]
  # [3, nil, nil]

--- end?(i = nil) -> bool

SyncEnumerator ��������ã���Ƥ�����Ͽ����֤��ޤ���

i ��Ϳ�������ϡ�i ���ܤ� Enumerable ���֥������Ȥ�������
ã���Ƥ����硢�����֤��ޤ���

--- length -> Integer
--- size   -> Integer

Ϳ����줿 Enumerable ���֥������Ȥο����֤��ޤ���
#@end



= reopen Enumerable::Enumerator

--- next -> object

���ߤΰ��֤ˤ������Ǥ��֤������֤��Ŀʤ�ޤ���

@raise EOFError �������Ǥ�̵������ȯ�����ޤ���

@see [[m:Generator#next]]


--- rewind -> self

�������ݻ����Ƥ��른���ͥ졼����ǽ�ޤǴ����ᤷ�ޤ���

@see [[m:Generator#rewind]]
