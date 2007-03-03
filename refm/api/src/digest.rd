#@since 1.8.6
digest/md5
digest/rmd160
digest/sha1
digest/sha2
#@end

��å����������������ȥ饤�֥�ꡣ
����Ū�ʻȤ����ϤɤΥ��르�ꥺ��Ǥ�Ʊ���Ǥ���
[[c:Digest::Base]]�򻲾ȡ�

���٤ƤΥ�å����������������Ȥμ������饹�ϴ��쥯�饹�Ǥ���
Digest::Base ��Ʊ�����󥿥ե���������ġ�

= module Digest

#@since 1.8.6
== Module Functions

--- hexencode(string)
#@todo

Generates a hex-encoded version of a given string. 
#@end

#@if(version >= "1.8.6")
= class Digest::Class < Object

= module Digest::Instance

= class Digest::Base < Digest::Class
include Digest::Instance

#@else
= class Digest::Base < Object

#@end

���٤Ƥ� Digest::XXX ���饹�δ��쥯�饹��

�㤨�С�MD5 �ͤ�����ˤϰʲ��Τ褦�ˤ��롣
#@if(version >= "1.8.6")
  require 'digest/md5'

  p Digest::MD5.hexdigest('abc')               #=> '900150983cd24fb0d6963f7d28e17f72'
  p Digest::MD5.file('ruby-1.8.5.tar.gz').to_s #=> '3fbb02294a8ca33d4684055adba5ed6f'
#@else
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
#@end

���٤Ƥ� Digest::XXX ���饹�ϰʲ��ζ��̥��󥿥ե���������ġ�

== Class Methods

#@if(version < "1.8.6")
--- new([str])

�����������������ȥ��֥������Ȥ��������롣ʸ���������Ϳ�������
������ɲä���([[m:Digest::Base#update]] ����)��
#@else
--- new
�����������������ȥ��֥������Ȥ��������롣
#@end

--- digest(str)

Ϳ����줿ʸ������Ф���ϥå����ͤ�ʸ������֤���
new(str).digest ��������

--- hexdigest(str)

Ϳ����줿ʸ������Ф���ϥå����ͤ�ASCII�����ɤ�Ȥä�
16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤���
new(str).hexdigest ��������

#@since 1.8.6
--- file(file)
#@todo
creates a digest object and reads a given file, name.

  p Digest::SHA256.file("X11R6.8.2-src.tar.bz2").hexdigest
  # => "f02e3c85572dc9ad7cb77c2a638e3be24cc1b5bea9fdbb0b0299c9668475c534"
#@end

== Instance Methods

--- dup
--- clone

�����������ȥ��֥������Ȥ�ʣ�����롣

--- digest

new�ΰ�����Ϳ����ʸ����䡢
update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�ʸ������֤���
MD5�Ǥ�16�Х���Ĺ��SHA1�����RMD160�Ǥ�20�Х���Ĺ��SHA256�Ǥ�32�Х���Ĺ��
SHA384�Ǥ�48�Х���Ĺ��SHA512�Ǥ�64�Х���Ĺ�Ȥʤ롣

������

        require 'digest/md5'
        digest = Digest::MD5.new("ruby")
        p digest.digest # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"

[[m:Digest::Base#hexdigest]]��[[c:Digest::Base.new]]��
[[m:Digest::Base#update]]��[[m:Digest::Base#<<]]�򻲾ȡ�

#@since 1.8.6
--- digest!
#@todo

Returns the resulting hash value and resets the digest to the initial state. 
#@end

--- hexdigest
--- to_s

new�ΰ�����Ϳ����ʸ����䡢
update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�
ASCII�����ɤ�Ȥä�16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤���
MD5�Ǥ�32�Х���Ĺ��SHA1�����RMD160�Ǥ�40�Х���Ĺ��SHA256�Ǥ�64�Х���Ĺ��
SHA384�Ǥ�96�Х���Ĺ��SHA512�Ǥ�128�Х���Ĺ�Ȥʤ롣
Ruby�ǽ񤯤Ȱʲ���Ʊ����

        def hexdigest
          digest.unpack("H*")[0]
        end

������(MD5�ξ��)

        require 'digest/md5'
        digest = Digest::MD5.new("ruby")
        p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"

[[m:Digest::Base#digest]]��[[c:Digest::Base.new]]��
[[m:Digest::Base#update]]��[[m:Digest::Base#<<]]�򻲾ȡ�

#@since 1.8.6
--- hexdigest!
#@todo
Returns the resulting hash value and resets the digest to the
initial state.
#@end

--- update(str)
--- <<(str)

ʸ������ɲä��롣self ���֤���
ʣ����update��Ƥ֤��Ȥ�ʸ�����Ϣ�뤷��update��Ƥ֤��Ȥ���������
���ʤ�� m.update(a); m.update(b) ��
m.update(a + b) �ȡ� m << a << b �� m << a + b �Ȥ��줾������
�Ǥ��롣

@param str �ɲä���ʸ����

        require 'digest/md5'
        digest = Digest::MD5.new
        digest.update("r")
        digest.update("u")
        digest.update("b")
        digest.update("y")
        p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"

--- ==(md)

Ϳ����줿�����������ȥ��֥������Ȥ���Ӥ��롣

--- ==(str)

Ϳ����줿ʸ����� digest �͡��⤷���� hexdigest �ͤ���Ӥ��롣
��������ͤȸ��뤫��Ϳ����줿ʸ�����Ĺ���ˤ�äƼ�ưȽ��
����롣

#@since 1.8.6
--- file 
#@todo
updates the digest with the contents of a given file _name_ and
returns self.

--- block_length
#@todo

Returns the block length of the digest.

This method is overridden by each implementation subclass. 

--- digest_length 
--- length 
--- size
#@todo

Returns the length of the hash value of the digest.

This method should be overridden by each implementation subclass.
If not, digest_obj.digest().length() is returned. 
#@end

--- reset
#@todo
Resets the digest to the initial state and returns self.

This method is overridden by each implementation subclass.

#@since 1.8.6
= reopen Kernel
== Private Instance Methods
--- Digest(name)
#@todo
#@end
