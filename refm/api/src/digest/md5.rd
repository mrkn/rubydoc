require digest

= class Digest::MD5 < Digest::Base

RFC1321に記述されているRSA Data Security, Inc. の MD5 Message-Digest
Algorithmを実装するクラス。

== Class Methods

--- new([str])
--- digest(str)
--- hexdigest(str)
#@todo

[[c:Digest::Base]] のページを参照のこと。

== Instance Methods

--- dup
--- clone
--- digest
--- hexdigest
--- to_s
--- update(str)
--- <<(str)
--- ==(md)
--- ==(str)
#@todo

[[c:Digest::Base]] のページを参照のこと。
