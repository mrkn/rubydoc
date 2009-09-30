#@since 1.8.6
require digest/md5
require digest/rmd160
require digest/sha1
require digest/sha2
#@end

��å����������������ȥ饤�֥�ꡣ

[[c:Digest::MD5]] �� [[c:Digest::SHA1]] �ʤɤ�
���ƤΥ�å����������������Ȥμ������饹�ϡ�
���쥯�饹�Ǥ��� [[c:Digest::Base]] ��Ʊ�����󥿥ե�����������ޤ���
����Ū�ʻȤ����ϡ�MD5��SHA1�ʤɡ��ɤΥ��르�ꥺ��Ǥ�Ʊ���Ǥ���
�ܤ����� [[c:Digest::Base]] �򻲾Ȥ��Ƥ���������

�ʤ����֥�å����������������ȡפȤϡ�
�ǡ����������Ĺ�ε����������������黻��ˡ�Τ��ȤǤ���

= module Digest

#@since 1.8.6
== Module Functions

--- hexencode(string) -> String

Ϳ����줿ʸ������Ф���ϥå����ͤ�
ASCII�����ɤ�Ȥä�16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤��ޤ���

@param string �ϥå����ͤ������оݤ�ʸ����Ǥ���

������(MD5�ξ��)

        require 'digest/md5'
        Digest::MD5.hexdigest("ruby") # => "58e53d1324eef6265fdb97b08ed9aadf"

@see [[m:Digest::Base#hexdigest]]

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
--- file(path) -> object

�����������������ȥ��֥������Ȥ���������
�ե�����̾ file �ǻ��ꤷ���ե���������Ƥ��ɤ߹��ߡ�
���Υ����������ȥ��֥������Ȥ��֤��ޤ���

@param path �ɤ߹����оݤΥե�����̾�Ǥ���
@return �����������ȥ��֥������Ȥ��֤��ޤ���

������(SHA256�ξ��)

        digest = Digest::SHA256.file("X11R6.8.2-src.tar.bz2")
        digest.hexdigest
        # => "f02e3c85572dc9ad7cb77c2a638e3be24cc1b5bea9fdbb0b0299c9668475c534"
#@end

== Instance Methods

--- dup
--- clone

�����������ȥ��֥������Ȥ�ʣ�����롣

--- digest -> String

update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�ʸ������֤��ޤ���

�֤�ʸ����ϡ�MD5�Ǥ�16�Х���Ĺ��SHA1�����RMD160�Ǥ�20�Х���Ĺ��
SHA256�Ǥ�32�Х���Ĺ��SHA384�Ǥ�48�Х���Ĺ��SHA512�Ǥ�64�Х���Ĺ�Ǥ���

��:

  # MD5�ξ��
  require 'digest/md5'
  digest = Digest::MD5.new
  digest.update("ruby")
  p digest.digest # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"

@see [[m:Digest::Base#hexdigest]]

#@since 1.8.6
--- digest! -> String

update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�ʸ������֤��ޤ���
[[m:Digest::Base#digest]]�Ȱ㤤��
�᥽�åɤν����塢
���֥������Ȥξ��֤�������(new����ľ���Ʊ�ͤξ���)���ᤷ�ޤ���

�֤�ʸ����ϡ�MD5�Ǥ�16�Х���Ĺ��SHA1�����RMD160�Ǥ�20�Х���Ĺ��
SHA256�Ǥ�32�Х���Ĺ��SHA384�Ǥ�48�Х���Ĺ��SHA512�Ǥ�64�Х���Ĺ�Ǥ���

��:

  # MD5�ξ��
  require 'digest/md5'
  digest = Digest::MD5.new
  digest.update("ruby")
  p digest.digest! # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"
  p digest.digest! # => "\324\035\214\331\217\000\262\004\351\200\t\230\354\370B~"

@see [[m:Digest::Base#digest]]��[[m:Digest::Base#hexdigest!]]

#@end

--- hexdigest -> String
--- to_s -> String

update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�
ASCII�����ɤ�Ȥä�16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤���

�֤�ʸ����ϡ�
MD5�Ǥ�32�Х���Ĺ��SHA1�����RMD160�Ǥ�40�Х���Ĺ��SHA256�Ǥ�64�Х���Ĺ��
SHA384�Ǥ�96�Х���Ĺ��SHA512�Ǥ�128�Х���Ĺ�Ǥ���

Ruby�ǽ񤯤Ȱʲ���Ʊ���Ǥ���

  def hexdigest
    digest.unpack("H*")[0]
  end

��:

  # MD5�ξ��
  require 'digest/md5'
  digest = Digest::MD5.new
  digest.update("ruby")
  p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"

@see [[m:Digest::Base#digest]]

#@since 1.8.6
--- hexdigest! -> String

update��<<�ˤ�ä��ɲä���ʸ������Ф���ϥå����ͤ�
ASCII�����ɤ�Ȥä�16�ʿ�����򼨤�ʸ����˥��󥳡��ɤ����֤��ޤ���
[[m:Digest::Base#hexdigest]]�Ȱ㤤��
�᥽�åɤν����塢
���֥������Ȥξ��֤�������(new����ľ���Ʊ�ͤξ���)���ᤷ�ޤ���

��:

  # MD5�ξ��
  require 'digest/md5'
  digest = Digest::MD5.new
  digest.update("ruby")
  p digest.hexdigest! # => "58e53d1324eef6265fdb97b08ed9aadf"
  p digest.hexdigest! # => "d41d8cd98f00b204e9800998ecf8427e"

@see [[m:Digest::Base#hexdigest]]��[[m:Digest::Base#digest!]]

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

        digest = Digest::MD5.new
        digest << "r"
        digest << "u"
        digest << "b"
        digest << "y"
        p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"

--- ==(md)

Ϳ����줿�����������ȥ��֥������Ȥ���Ӥ��롣

@param md ����оݤΥ����������ȥ��֥�������

        require 'digest/md5'
        digest1 = Digest::MD5.new
        digest1.update("ruby")
        digest2 = Digest::MD5.new
        digest2.update("ruby")
        p digest1 == digest2 # => true
        digest2.update("RUBY")
        p digest1 == digest2 # => false

--- ==(str)

#@if(version >= "1.8.6")
Ϳ����줿ʸ����� hexdigest �ͤȸ��ơ����Ȥ� hexdigest �ͤ���Ӥ��롣

@param str ����оݤ� hexdigest ʸ����
#@else
Ϳ����줿ʸ����� digest �͡��⤷���� hexdigest �ͤ���Ӥ��롣
��������ͤȸ��뤫��Ϳ����줿ʸ�����Ĺ���ˤ�äƼ�ưȽ��
����롣

@param str ����оݤ�(�����������Ȥ�)ʸ����
#@end

        require 'digest/md5'
        digest = Digest::MD5.new
        digest.update("ruby")
        p digest == "58e53d1324eef6265fdb97b08ed9aadf" # => true

#@since 1.8.6
--- file(path) -> self

�ե�����̾ file �ǻ��ꤷ���ե���������Ƥ��ɤ߹���ǥ����������Ȥ򹹿�����
���֥������ȼ��Ȥ��֤��ޤ���

@param path �ɤ߹����оݤΥե�����̾�Ǥ���
@return �����������ȥ��֥������Ȥ��֤��ޤ���

��(MD5�ξ��)

  require 'digest/md5'
  digest = Digest::MD5.new
  digest.file("/path/to/file") # => Digest::MD5�Υ��󥹥���
  digest.hexdigest # => "/path/to/file"��MD5��

--- block_length -> Integer

�����������ȤΥ֥�å�Ĺ��������ޤ���
�㤨�С�Digest::MD5�Ǥ����64��Digest::SHA512�Ǥ����128�Ǥ���

�ܥ᥽�åɤϡ�Digest::MD5�ʤɤΥ����������ȤΥ��֥��饹�ˤ�ꡢ
���줾��μ�����Ŭ������Τ˥����С��饤�ɤ���ޤ���

��: Digest::MD��Digest::SHA1��Digest::SHA512�Υ֥�å�Ĺ����֤�Ĵ�٤롣

  for a in ["MD5", "SHA1", "SHA512"]
    digest = Digest(a).new
    p digest.block_length # => 64, 128, 128
  end

--- digest_length -> Integer
--- length -> Integer
--- size -> Integer
#@todo

�����������ȤΥϥå����ͤΥХ���Ĺ��������롣
�㤨�С�Digest::MD5�Ǥ����16��Digest::SHA1�Ǥ����20�Ǥ���

If not, digest_obj.digest().length() is returned. 
(����ư�ʬ����ޤ���
��μ긵��1.8.6�Ǥ�digest.length == digest_length�Ǥ�����)

�ܥ᥽�åɤϡ�Digest::MD5�ʤɤΥ����������ȤΥ��֥��饹�ˤ�ꡢ
���줾��μ�����Ŭ������Τ˥����С��饤�ɤ���ޤ���

��: Digest::MD��Digest::SHA1��Digest::SHA512�Υϥå����ͤΥХ���Ĺ����֤�Ĵ�٤롣

  for a in ["MD5", "SHA1", "SHA512"]
    digest = Digest(a).new
    p digest.digest_length # => 16, 20, 64
  end

#@end

--- reset -> self

���֥������Ȥξ��֤�������(new����ľ���Ʊ�ͤξ���)���ᤷ��
���֥������ȼ��Ȥ��֤��ޤ���

�ܥ᥽�åɤϡ�Digest::MD5�ʤɤΥ����������ȤΥ��֥��饹�ˤ�ꡢ
���줾��μ�����Ŭ������Τ˥����С��饤�ɤ���ޤ���

#@since 1.8.6
= reopen Kernel
== Private Instance Methods
--- Digest(name) -> object

"MD5"��"SHA1"�ʤɤΥ����������Ȥ򼨤�ʸ���� name ����ꤷ��
�б���������������ȤΥ��饹��������ޤ���

@param name "MD5"��"SHA1"�ʤɤΥ����������Ȥ򼨤�ʸ�������ꤷ�ޤ���
@return Digest::MD5��Digest::SHA1�ʤɤ��б���������������ȤΥ��饹���֤��ޤ������󥹥��󥹤ǤϤʤ������饹���֤��ޤ�����դ��Ƥ���������

��: Digest::MD��Digest::SHA1��Digest::SHA512�Υ��饹̾����֤˽��Ϥ��롣

  for a in ["MD5", "SHA1", "SHA512"]
    p Digest(a) # => Digest::MD5, Digest::SHA1, Digest::SHA512
  end

#@end
