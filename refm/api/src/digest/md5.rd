= Digest::MD5

RFC1321�˵��Ҥ���Ƥ���RSA Data Security, Inc. �� MD5 Message-Digest
Algorithm��������륯�饹��

== �Ȥ�����

  require 'digest/md5'

== �����ѡ����饹:

* ((<Digest::Base>))

== ���饹�᥽�å�:

--- Digest::MD5.new([str])
--- Digest::MD5.digest(str)
--- Digest::MD5.hexdigest(str)

    ((<Digest::Base>)) �Υڡ����򻲾ȤΤ��ȡ�

== �᥽�å�:

--- dup
--- clone
--- digest
--- hexdigest
--- to_s
--- update(str)
--- self << str
--- self == md
--- self == str

    ((<Digest::Base>)) �Υڡ����򻲾ȤΤ��ȡ�
