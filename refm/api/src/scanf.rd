[[m:String#scan]] �Υե����ޥåȻ����ǤȤ�����᥽�å� [[m:String#scanf]]
��������ޤ���

�Ȥ߹��ߥ��饹 [[c:String]] �� [[c:IO]] ���ĥ���ޤ���

=== ��
  require 'scanf'
  
  p "a 10  1.2".            scanf("%s %d %f")   # => ["a", 10, 1.2]
  p "a 10  1.2 b 20 1.5e10".scanf("%s %d %f")   # => ["a", 10, 1.2]
  p "a 10  1.2 b 20 1.5e10".scanf("%s %d %f") {|*v| v}
                  # => [["a", 10, 1.2], ["b", 20, 15000000000.0]]
  
  p "a 10  1.2 b 20 1.5e10 c".scanf("%s %d %f") {|*v| v}
                 # => [["a", 10, 1.2], ["b", 20, 15000000000.0], [["c"]]]
  
                                                       #    [["c"]] (?)
  
  require 'scanf'
  p "a, 10, 1.2".scanf("%s,%d,%f")
  # => ["a,"]      %s �� "," ����߹��फ�����餷��
  
  p "a, 10, 1.2".scanf("%1s,%d,%f")
  # => ["a", 10, 1.2]
  
  p "a, 10, 1.2".scanf("%[^,],%d,%f")
  # => ["a", 10, 1.2]

= reopen String

== Instance Methods

--- scanf(format) -> Array
--- scanf(format) {|*ary| ...} -> Array

�֥�å�����ꤷ�ʤ���硢���Ĥ��ä�ʸ����� format �˽��ä���
���������Υ��֥������Ȥ�������֤��ޤ���
format �ǻ��ꤷ��ʸ���󤬸��Ĥ���ʤ����϶��������
���������֤��ޤ���

  str = "123 abc 456 def 789 ghi"
  p str.scanf("%d%s") #=> [123, "abc"]

�֥�å�����ꤷ������ scanf ���³���Ƽ¹Ԥ����缡
���Ĥ��ä�ʸ������Ѵ��������֥������Ȥ����������ˡ��֥�å���
�¹Ԥ��ޤ������ΤȤ����֥�å��μ¹Է�̤����ǤȤ���������֤��ޤ���

  str = "123 0x45 678 0x90"
  p str.scanf("%d%x"){|n, s| [n, s]}
  #=> [[123, 69], [678, 144]]

format�˴����˥ޥå����Ƥ��ʤ��Ƥ⡢��ʬŪ�˥ޥå����Ƥ���С�
�֥�å��ϼ¹Ԥ���ޤ���

  str = "123 abc 456 def"
  ret = str.scanf("%s%d") { |s, n| [s, n] }
  p ret #=> [["123", nil], ["abc", 456], ["def", nil]]


@param format ������󤹤�ե����ޥåȤ�ʸ����ǻ��ꤷ�ޤ���
              �ܺ٤ϡ�[[ref:m:String#scanf#format]] �򻲾Ȥ��Ƥ���������

������:
  str = "123 abc 456 def 789 ghi"
  p str.scanf("%d%s") #=> [123, "abc"]

====[a:format] scanf�ե����ޥå�ʸ����

ʸ�� '%' ��(s,d �Τ褦��)�ؼ��Ҥδ֤ˡ���������ꤹ����ˤ���ɤ߹���ʸ���������
���ꤹ������Ǥ��ޤ����⤷����Ϳ�����ʤ���С�̵������ͤ������ͤȤ��ƻ��Ѥ���ޤ���
(â����%c �Ǥϡ����ε����ͤ�Ŭ�Ѥ���ޤ���) 
�嵭���������� n ��Ϳ����줿��硢¿���Ƥ� n �Ĥ�ʸ���󤬥ޥå����ޤ���
���Υե����ޥå�ʸ����ˤ��ޥå��μ¹�����¿���ξ������ʸ����Υ��ڡ������ɤ����Ф���ޤ���
�Ĥޤꡢ���ڡ��������ο��Ȥ��ƿ������ʤ����ˤʤ�ޤ���

ư����;
  p "a           10".scanf("%s %d")  # => ["a", 10]
  p "a10".scanf("%1s %d")      # => ["a", 10]


�����㡨
  str = "1234"
  p str.scanf("%1s%3d")  #=> ["1", 234]

#@since 1.9.1
�ޤ���1.9 �ʹߤǤϡ����ڡ����ˤ�����ʸ���󤬴ޤޤ�ޤ���

ư���㡨
  # encoding: utf-8
  require 'scanf'

  str = "1����������aaa"
  p str.scanf("%d %s") #=> [1, "aaa"]
#@end

#@# There may be an optional maximum field width, expressed as a decimal
#@# integer, between the % and the conversion. If no width is given, a
#@# default of `infinity' is used (with the exception of the %c specifier;
#@# see below).  Otherwise, given a field width of <em>n</em> for a given
#@# conversion, at most <em>n</em> characters are scanned in processing
#@# that conversion.  Before conversion begins, most conversions skip
#@# white space in the input string; this white space is not counted
#@# against the field width.


: space
 �ե����ޥå���ζ����(0�Ĥ�ޤ�)Ǥ�դο��ζ���˥ޥå����ޤ���
//emlist{
  p "a           10".scanf("%s %d")  # => ["a", 10]
  p "a10".scanf("%1s %d")            # => ["a", 10]
//}
: %%
 % ���Τ��

: %d
: %u
 ����դ�10�ʿ�

: %i
 [[m:Kernel.#Integer]]�Τ褦����Ƭ��������դ�������դ�����

: %o
 ����դ�8�ʿ�

: %x
: %X
 ����դ�16�ʿ�

: %e
: %f
: %g
: %E
: %F
: %G
#@since 1.9.2
: %a
: %A
#@end
 ����դ���ư��������

: %s
 ����ʸ����ޤޤʤ�ʸ����
 (�������ꤵ��Ƥ���Ȥ��ϻ��ꤵ�줿ʸ����������ʸ����ľ���ޤǤ�û����)

: %c
 1ʸ��(�������ꤵ��Ƥ���Ȥ��ϻ��ꤵ�줿ʸ����)

: [...]
 [[ref:d:spec/regexp#string]]

= reopen IO
== Instance Methods
--- scanf(format) -> Array
--- scanf(format) {|*ary| ...} -> Array

[[m:String#scanf]]�⻲�Ȥ��Ƥ���������

@param format ������󤹤�ե����ޥåȤ�ʸ����ǻ��ꤷ�ޤ���
              �ܺ٤ϡ�[[ref:m:String#scanf#format]] �򻲾Ȥ��Ƥ���������

#@#The trick here is doing a match where you grab one line of input at a time. 
#@#The linebreak may or may not occur at the boundary where the string matches 
#@#a format specifier. And if it does, some rule about whitespace may or may not 
#@#be in effect...
#@#
#@#That��s why this is much more elaborate than the string version.
#@#
#@#For each line: 
#@#
#@#Match succeeds (non-emptily) 
#@#
#@#a) and the last attempted spec/string sub-match succeeded:
#@#
#@#  a-1) could the last spec keep matching?
#@#    yes: save interim results and continue (next line)
#@#
#@#b) The last attempted spec/string did not match:
#@#
#@#  b-1)are we on the next-to-last spec in the string?
#@#
#@#  yes:
#@#    is fmt_string.string_left all spaces?
#@#      yes: does current spec care about input space?
#@#        yes: fatal failure
#@#        no: save interim results and continue
#@#  no: continue  [this state could be analyzed further]
#@#

= reopen Kernel
== Private Instance Methods

--- scanf(format) -> Array
--- scanf(format) {|*ary| ...} -> Array

STDIN.scanf ��Ʊ���Ǥ���
[[m:IO#scanf]]��[[m:Stdin#scanf]]�⻲�Ȥ��Ƥ���������

@param format ������󤹤�ե����ޥåȤ�ʸ����ǻ��ꤷ�ޤ���
              �ܺ٤ϡ�[[ref:m:String#scanf#format]] �򻲾Ȥ��Ƥ���������

@see [[m:IO#scanf]], [[m:Stdin#scanf]]
