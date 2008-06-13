#@since 1.8.7
UNIX Bourne �������ñ��ʬ�䵬§�˽��ä�ʸ����䵡ǽ��ʸ���󥨥�������
��ǽ���󶡤��ޤ���

Shellwords �⥸�塼��ϡ�������ڤ��ñ��ʬ���Ԥ� shellsplit��
ʸ����򥨥������פ��� shellescape��ʸ���󥨥������פ�ʸ����ꥹ�Ȥ�
�Ф���Ŭ�Ѥ��� shelljoin ��3�ĤΥ⥸�塼��ؿ����󶡤��ޤ���

�ޤ���shellwords �饤�֥��� require ����ȡ��Ȥ߹��ߥ��饹 String
�� Array ����ĥ���졢�����Υ⥸�塼��ؿ���Ʊ����ǽ��
String#shellsplit, String#shellescape, Array#shelljoin �Ȥ��ƻȤ���
�褦�ˤʤ�ޤ���

#@else
UNIX ������Υ��ޥ�ɥ饤����Ϥ˻���������ڤ��ñ��ʬ���Ԥ�
�饤�֥��Ǥ���
#@end

= module Shellwords

#@since 1.8.7
UNIX Bourne �������ñ��ʬ�䵬§�˽��ä�ʸ����ʬ���ʸ���󥨥�������
��Ԥ��⥸�塼��Ǥ���

Shellwords �⥸�塼��ϡ�������ڤ��ñ��ʬ���Ԥ� shellsplit��ʸ�����
���������פ��� shellescape��ʸ���󥨥������פ�ʸ����ꥹ�Ȥ��Ф���Ŭ��
���� shelljoin ��3�ĤΥ⥸�塼��ؿ����󶡤��ޤ���

�����Υ᥽�åɤ���̾�Ȥ��ơ�Shellwords.split, Shellwords.escape,
Shellwords.join ����Ѳ�ǽ�Ǥ���
��������������û�̷����Υ᥽�åɤϥ��饹�᥽�åɤȤ��ƤΤ���������
���ᡢ�ؿ������θƤӽФ��ϤǤ��ޤ���

#@else
UNIX ������Υ��ޥ�ɥ饤����Ϥ˻���������ڤ��ñ��ʬ���Ԥ��⥸�塼��Ǥ���
#@end

== Module Functions

#@since 1.8.7
--- shellsplit(line) -> [String]
#@end
--- shellwords(line) -> [String]

#@since 1.8.7
Bourne �������ñ��ʬ�䵬§�˽��ä�������ڤ��ñ��ʬ���Ԥ���
ñ�� (ʸ����) ��������֤��ޤ���
#@else
UNIX ������Υ��ޥ�ɥ饤����Ϥ˻���������ڤ��ñ��ʬ���Ԥ���
ñ�� (ʸ����) ��������֤��ޤ���
#@end

���򡢥��󥰥륯������ (')�����֥륯������ (")���Хå�����å��� (\)
���ᤷ�ޤ���

@param line ʬ����оݤȤʤ�ʸ�������ꤷ�ޤ���
@return ʬ���̤γ�ʸ��������ǤȤ���������֤��ޤ���
#@since 1.8.7
@raise ArgumentError ����������ФǤʤ����󥰥륯�����Ȥޤ��ϥ��֥�
       �������Ȥ����줿����ȯ�����ޤ���
#@else
@raise ArgumentError ������ʸ����Ǥʤ���礫������������ФǤʤ�
       ���󥰥륯�����Ȥޤ��ϥ��֥륯�����Ȥ����줿����ȯ�����ޤ���
#@end

��:
    require 'shellwords'
    
    p Shellwords.shellwords(%q{  foo bar "foo bar"\ baz 'foo bar'  })
    # => ["foo", "bar", "foo bar baz", "foo bar"]
     
    p Shellwords.shellwords(%q{  A B C "D E F" "G","H I"  })
    # => ["A", "B", "C", "D E F", "G,H I"]

#@since 1.8.7
--- shellescape(str) -> String

ʸ����� Bourne ������Υ��ޥ�ɥ饤����ǰ����˻Ȥ���褦�˥��������פ��ޤ���

@param str ���������פ��оݤȤʤ�ʸ�������ꤷ�ޤ���
@return ���������פ��줿ʸ������֤��ޤ���

��:
    require 'shellwords'
    
    pattern = 'Jan 15'
    puts "grep #{Shellwords.shellescape(pattern)} file"
    # => grep Jan\ 15 file

--- shelljoin(array) -> String

����γ����ǤǤ���ʸ������Ф��ơ�Bourne ������Υ��ޥ�ɥ饤����ǰ�����
�Ȥ��뤿��Υ��������פ�Ŭ�Ѥ�������ʸ����𤷤Ƥ�����Ϣ�뤷�����ޥ��
�饤��ʸ������������ޤ���

�ġ����������Ǥ��Ф��륨�������פˤϡ�[[m:Shellwords.#shellescape]] ��
Ʊ����§��Ŭ�Ѥ���ޤ���

@param array �����������оݤ�ʸ��������ǤȤ����������ꤷ�ޤ���
@return ���������׷�̤�Ϣ�뤷��ʸ������֤��ޤ���

��:
    require 'shellwords'
    
    pattern = 'Jan 15'
    file = 'file name with spaces'
    puts Shellwords.shelljoin(['grep', pattern, file])
    # => grep Jan\ 15 file\ name\ with\ spaces
#@end

#@since 1.8.7
== Singleton Methods

--- split(line) -> [String]
Bourne �������ñ��ʬ�䵬§�˽��ä�������ڤ��ñ��ʬ���Ԥ���
ñ�� (ʸ����) ��������֤��ޤ���

���Υ᥽�åɤϡ�[[m:Shellwords.#shellsplit]] ����̾�Ǥ���

@param line ʬ����оݤȤʤ�ʸ�������ꤷ�ޤ���
@return ʬ���̤γ�ʸ��������ǤȤ���������֤��ޤ���
@raise ArgumentError ����������ФǤʤ����󥰥륯�����Ȥޤ��ϥ��֥�
       �������Ȥ����줿����ȯ�����ޤ���

--- escape(str) -> String
ʸ����� Bourne ������Υ��ޥ�ɥ饤����ǰ����˻Ȥ���褦�˥��������פ��ޤ���

���Υ᥽�åɤϡ�[[m:Shellwords.#shellescape]] ����̾�Ǥ���

@param str ���������פ��оݤȤʤ�ʸ�������ꤷ�ޤ���
@return ���������פ��줿ʸ������֤��ޤ���

--- join(array) -> String
����γ����ǤǤ���ʸ������Ф��ơ�Bourne ������Υ��ޥ�ɥ饤����ǰ�����
�Ȥ��뤿��Υ��������פ�Ŭ�Ѥ�������ʸ����𤷤Ƥ�����Ϣ�뤷�����ޥ��
�饤��ʸ������������ޤ���

���Υ᥽�åɤϡ�[[m:Shellwords.#shelljoin]] ����̾�Ǥ���

@param array �����������оݤ�ʸ��������ǤȤ����������ꤷ�ޤ���
@return ���������׷�̤�Ϣ�뤷��ʸ������֤��ޤ���
#@end

#@since 1.8.7
= reopen String

== Instance Methods

--- shellsplit -> [String]
Bourne �������ñ��ʬ�䵬§�˽��ä�������ڤ��ñ��ʬ���Ԥ���
ñ�� (ʸ����) ��������֤��ޤ���

string.shellsplit �ϡ�Shellwords.shellsplit(string) �������Ǥ���

@return ʬ���̤γ�ʸ��������ǤȤ���������֤��ޤ���
@raise ArgumentError ����������ФǤʤ����󥰥륯�����Ȥޤ��ϥ��֥�
       �������Ȥ����줿����ȯ�����ޤ���
@see [[m:Shellwords.#shellsplit]]

--- shellescape -> String
ʸ����� Bourne ������Υ��ޥ�ɥ饤����ǰ����˻Ȥ���褦�˥��������פ��ޤ���

string.shellescape �ϡ�Shellwords.escape(string) �������Ǥ���

@return ���������פ��줿ʸ������֤��ޤ���
@see [[m:Shellwords.#shellescape]]

= reopen Array

== Instance Methods

--- shelljoin -> String
����γ����ǤǤ���ʸ������Ф��ơ�Bourne ������Υ��ޥ�ɥ饤����ǰ�����
�Ȥ��뤿��Υ��������פ�Ŭ�Ѥ�������ʸ����𤷤Ƥ�����Ϣ�뤷�����ޥ��
�饤��ʸ������������ޤ���

array.shelljoin �ϡ�Shellwords.shelljoin(array) �������Ǥ���

@return ���������׷�̤�Ϣ�뤷��ʸ������֤��ޤ���
@see [[m:Shellwords.#shelljoin]]
#@end
