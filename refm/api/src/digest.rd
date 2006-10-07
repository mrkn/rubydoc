��å����������������ȥ饤�֥�ꡣ
����Ū�ʻȤ����ϤɤΥ��르�ꥺ��Ǥ�Ʊ���Ǥ���
[[c:Digest::Base]]�򻲾ȡ�

���٤ƤΥ�å����������������Ȥμ������饹�ϴ��쥯�饹�Ǥ���
Digest::Base ��Ʊ�����󥿥ե���������ġ�



= class Digest::Base < Object

���٤Ƥ� Digest::XXX ���饹�δ��쥯�饹��

�㤨�С�MD5 �ͤ�����ˤϰʲ��Τ褦�ˤ��롣

        require 'digest/md5'
        p Digest::MD5.hexdigest(File.open('ruby-1.8.5.tar.gz','rb').read)

        # => "3fbb02294a8ca33d4684055adba5ed6f"

���뤤��(�礭��ʸ������������ʤ���ˡ)

        require 'digest/md5'

        class Digest::Base
          def self.open(path)
            obj = new

            File.open(path, 'rb') {|f|
              buf = ""
              while f.read(256, buf)
                obj << buf
              end
            }
            obj
          end
        end

        p Digest::MD5.open("ruby-1.8.5.tar.gz").hexdigest

        # => "3fbb02294a8ca33d4684055adba5ed6f"

���٤Ƥ� Digest::XXX ���饹�ϰʲ��ζ��̥��󥿥ե���������ġ�

== Class Methods

--- new([str])

�����������������ȥ��֥������Ȥ��������롣ʸ���������Ϳ�������
������ɲä���([[m:Digest::Base#update]] ����)��

--- digest(str)

Ϳ����줿ʸ������Ф���ϥå����ͤ�ʸ������֤���
new(str).digest ��������

--- hexdigest(str)

Ϳ����줿ʸ������Ф���ϥå����ͤ�ASCII�����ɤ�Ȥä�
16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤���
new(str).hexdigest ��������

== Instance Methods

--- dup
--- clone

�����������ȥ��֥������Ȥ�ʣ�����롣

--- digest

���ޤǤ��ɲä���ʸ������Ф���ϥå����ͤ�ʸ������֤���MD5�Ǥ�
16�Х���Ĺ��SHA1�����RMD160�Ǥ�20�Х���Ĺ��SHA256�Ǥ�32�Х���Ĺ��
SHA384�Ǥ�48�Х���Ĺ��SHA512�Ǥ�64�Х���Ĺ�Ȥʤ롣

--- hexdigest
--- to_s

���ޤǤ��ɲä���ʸ������Ф���ϥå����ͤ�ASCII�����ɤ�Ȥä�
16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤���MD5�Ǥ�32�Х���Ĺ��
SHA1�����RMD160�Ǥ�40�Х���Ĺ��SHA256�Ǥ�64�Х���Ĺ��SHA384�Ǥ�
96�Х���Ĺ��SHA512�Ǥ�128�Х���Ĺ�Ȥʤ롣Ruby�ǽ񤯤Ȱʲ���Ʊ����

        def hexdigest
          digest.unpack("H*")[0]
        end

--- update(str)
--- <<(str)

ʸ������ɲä��롣ʣ����update��Ƥ֤��Ȥ�ʸ�����Ϣ�뤷��
update��Ƥ֤��Ȥ������������ʤ�� m.update(a); m.update(b) ��
m.update(a + b) �ȡ� m << a << b �� m << a + b �Ȥ��줾������
�Ǥ��롣

self ���֤���

--- ==(md)

Ϳ����줿�����������ȥ��֥������Ȥ���Ӥ��롣

--- ==(str)

Ϳ����줿ʸ����� digest �͡��⤷���� hexdigest �ͤ���Ӥ��롣
��������ͤȸ��뤫��Ϳ����줿ʸ�����Ĺ���ˤ�äƼ�ưȽ��
����롣
