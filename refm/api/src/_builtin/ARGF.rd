= object ARGF

extend Enumerable

������ץȤ˻��ꤷ������
([[m:Kernel::ARGV]] �򻲾�) ��ե�����̾�Ȥߤʤ��ơ�
�����Υե������Ϣ�뤷�� 1 �Ĥβ��ۥե������ɽ�����֥������ȤǤ���
ARGV �����ʤ�ɸ�����Ϥ��оݤȤ��ޤ���
ARGV ���ѹ�����Ф��Υ��֥������Ȥ�ư��˱ƶ����ޤ���

    while line = ARGF.gets
      ....
    end

�ϡ�

    while argv = ARGV.shift
      File.open(argv) {|file|
        while line = file.gets
          ....
        end
      }
    end

�Τ褦��ư��ޤ���

ARGF ��������뤴�Ȥ� ARGV �����Ǥϰ�Ĥ��ļ�������ޤ���
�Ǹ�ޤ� ARGF ���ɤ߹�����塢���� ARGF �������Ƥ��ɤ��
(ARGV �����ʤΤ�)ɸ�����Ϥ�����ɤ߹��ߤȤʤ�ޤ���

    ARGV.replace %w(/tmp/foo /tmp/bar)
    ARGF.each {|line|
        # ������� ARGV �����Ƥ�ɽ��
        p [ARGF.filename, ARGV]
        ARGF.skip
    }
        # => ["/tmp/foo", ["/tmp/bar"]]
        #    ["/tmp/bar", []]
    # �Ǹ�ޤ��ɤ���� (ARGV ����) ��ư��
    p ARGF.gets      # => nil
    p ARGF.filename  # => "-"

[[m:Kernel#gets]] �ʤɰ�����[[unknown:�Ȥ߹��ߴؿ�]]��
ARGF.gets �ʤɤ��Υ��֥������Ȥ�쥷���ФȤ����᥽�åɤξ�ά���Ǥ���

#@if (version >= "1.8.0")
--- filename
--- path

�����оݤΥե�����̾���֤��ޤ���
ɸ�����Ϥ��Ф��Ƥ� - ���֤��ޤ���
�Ȥ߹����ѿ� [[m:$FILENAME]] ��Ʊ���Ǥ���

--- to_s

���ʸ���� "ARGF" ���֤��ޤ���
#@else

--- filename
--- to_s

�����оݤΥե�����̾���֤��ޤ���
ɸ�����Ϥ��Ф��Ƥ� - ���֤��ޤ���
�Ȥ߹����ѿ� [[m:$FILENAME]] ��Ʊ���Ǥ���
#@end

--- file

�����оݤ� [[c:File]] ���֥�������(�ޤ��� [[c:IO]] ���֥�������)��
�֤��ޤ���

--- lineno
--- lineno=

�������ե�������ĤΥե�����Ȥߤʤ����Ȥ��θ��ߤι��ֹ���֤��ޤ���
�ġ��ΰ����ե�������ι��ֹ������ˤ� ARGF.file.lineno �Ȥ��ޤ���

--- skip

�����оݤΥե�����򥯥������ޤ���
������ɤ߹��ߤϼ��ΰ����������оݤˤʤ�ޤ���

self ���֤��ޤ���

--- binmode

--- close

--- closed?

--- dup

--- each

--- each_byte

--- each_line

--- eof
--- eof?

--- fileno

--- getc

--- gets

--- pos
--- pos=

--- read

--- readchar

--- readline

--- readlines

--- rewind

--- seek

--- tell

--- to_a

--- to_i

--- to_io

