URI (Uniform Resource Identifier) ���ݡ��ȥ饤�֥��

=== ��Ϣ RFC

    * [[RFC:1738]] Uniform Resource Locators (URL)
    * [[RFC:1808]] Relative Uniform Resource Locators
    * [[RFC:2255]] The LDAP URL Format
    * [[RFC:2368]] The mailto URL scheme
    * [[RFC:2373]] IP Version 6 Addressing Architecture
    * [[RFC:2396]] Uniform Resource Identifiers (URI): Generic Syntax
    * [[RFC:2732]] Format for Literal IPv6 Addresses in URL's

= module URI

#@#== Class Variables

#@#--- @@schemes

#@#    �⥸�塼��ؿ� parse �ˤ�ä�������ǽ�ʥ��饹���ͤȤ���ϥå��塣
#@#    �����ϥ����������ʸ��������ɽ����ʸ����
#@#    URI::Generic��Ѿ�������ˤ��Υϥå���˥���ȥ���ɲä����
#@#    ���Υ��饹�� URI.parse �ˤ�äƥ��ݡ��Ȥ���ޤ���

== Singleton Methods

--- split(url)

URI ��ʲ������Ǥ�ʬ�䤷��������֤��ޤ���

      * scheme
      * userinfo
      * host
      * port
      * registry
      * path
      * opaque
      * query
      * fragment

��:
        require 'uri'
        p URI.split("http://www.ruby-lang.org/")
        # => ["http", nil, "www.ruby-lang.org", nil, nil, "/", nil, nil, nil]

--- parse(uri_str)

Ϳ����줿 URI ���鳺������ URI ���֥��饹�Υ��󥹥��󥹤���������
�֤��ޤ���

        require 'uri'
        p uri = URI.parse("http://www.ruby-lang.org/")

        # => #<URI::HTTP:0x201002a6 URL:http://www.ruby-lang.org/>
        p uri.scheme    # => "http"
        p uri.host      # => "www.ruby-lang.org"
        p uri.port      # => 80
        p uri.path      # => "/"

--- join(uri_str[, str, ...])

ʸ���� uri_str �� str ... ��URI�Ȥ���Ϣ�뤷��������
URI���֥������Ȥ��֤��ޤ���

�ʲ��������Ǥ�

        URI.parse(uri_str) + str + ....
#@#    URI �����Хѥ���Ĥʤ��ޤ���((-���餤 2002-09-24: ����ɽ������ʤ�������ʡ�����-))

��

        require 'uri'
        p URI.join('http://www.ruby-lang.org/', '/ja/man-1.6/')
        => #<URI::HTTP:0x2010017a URL:http://www.ruby-lang.org/ja/man-1.6/>

--- extract(str[, schemes])
--- extract(str[, schemes]) {|uri_str| ... }

ʸ���� str ���Ф��ƥѥ�����ޥå��󥰤��ߡ�
����URI�˥ޥå�������ʬʸ���󤫤�ʤ�����Ȥ����֤��ޤ���
��Ф��� URI ���ʤ���ж���������֤��ޤ���

��2������ʸ��������� schemes ��Ϳ����줿����
���Υ�����������򸡺����ޤ���

�֥�å���Ϳ����줿���� String#scan ��Ʊ�ͤǡ�
�ޥå�������ʬ���ߤĤ��뤿�Ӥ� uri_str ��
������ʬ���������ƥ֥�å���ɾ�����ޤ���
���ΤȤ����ͤ� nil �Ǥ���

        # �Ĥޤ�󥵥�ץ��������
        require 'uri'
        str = "
                http://www.ruby-lang.org/
                http://www.ruby-lang.org/man-1.6/
        "
        p URI.extract(str, %w(http))
        => ["http://www.ruby-lang.org/", "http://www.ruby-lang.org/man-1.6/"]

#@since 1.8.1
--- regexp([match_schemes])

URI�˥ޥå���������ɽ�����֤��ޤ���

������ʸ��������� match_schemes ��Ϳ�������ϡ�
����ʸ����ǻ��ꤵ��륹������� URI �Τߤ˥ޥå�����
����ɽ�����֤��ޤ���

������ξ����֤��ͤ�����ɽ���������������ɽ�����롼��
(���) ��ޤߤޤ������γ�̤ο��ϥС������ˤ�ä���ư
�����ǽ��������Τǡ�����˰�¸���������ɤ�񤯤٤��Ǥ�
����ޤ���
#@end

--- escape(str[, unsafe])
--- encode(str[, unsafe])

URI ʸ����򥨥󥳡��ɤ���ʸ������֤��ޤ���unsafe �ˤϡ�URI
�Ȥ��ƻ���Ǥ��ʤ�ʸ��������ɽ����ʸ����ǻ��ꤷ�ޤ�(�ǥե���Ȥϡ�
��� URI::UNSAFE
        /[^-_.!~*'()a-zA-Z\d;\/?:@&=+$,\[\]]/n
�Ǥ�)��

        require 'uri'
        $KCODE = 'EUC'
        p URI.escape('http://www.ruby-lang.org/ja/man-1.6/?cmd=view;name=Ruby��ե���󥹥ޥ˥奢��')

        => "http://www.ruby-lang.org/ja/man-1.6/?cmd=view;name=Ruby%A5%EA%A5%D5%A5%A1%A5%EC%A5%F3%A5%B9%A5%DE%A5%CB%A5%E5%A5%A2%A5%EB"

--- unescape(str)
--- decode(str)

URI ʸ�����ǥ����ɤ���ʸ������֤��ޤ���

        require 'uri'
        $KCODE = 'EUC'
        p URI.unescape('http://www.ruby-lang.org/ja/man-1.6/?cmd=view;name=Ruby%A5%EA%A5%D5%A5%A1%A5%EC%A5%F3%A5%B9%A5%DE%A5%CB%A5%E5%A5%A2%A5%EB')

        => "http://www.ruby-lang.org/ja/man-1.6/?cmd=view;name=Ruby��ե���󥹥ޥ˥奢��"


= class URI::Generic
include URI

���٤Ƥ� URI ���饹�δ��쥯�饹�Ǥ���

== Class Methods

--- default_port

����������б�����ǥե���ȤΥݡ����ֹ���֤��ޤ���

        require 'uri'
        p URI::Generic.default_port     # => nil
        p URI::HTTP.default_port        # => 80

--- component

URI �ι������Ǥ�������֤��ޤ���

        require 'uri'
        p URI::Generic.component
        p URI::MailTo.component

        # => [:scheme, :userinfo, :host, :port, :registry, :path, :opaque, :query, :fragment]
        # => [:scheme, :to, :headers]

--- use_registry

#@#    �������� registry ������դ���ʤ� true ���֤��ޤ���(URI::Generic 
#@#    ���饹�Ǥ� false)
registry �������Ѥ��뤫�ݤ���ɽ�������͡�
�����ͤ����ΤȤ���new �˵��Ǥʤ� registry ����Ϳ�������
�㳰 URI::InvalidURIError ��������ޤ���

--- build2(ary)
--- build2(hash)

URI::Generic.build ��Ʊ���Ǥ������㳰 URI::InvalidComponentError
��ȯ���������ˡ������γ����Ǥ� URI.escape ���ƺ��� build ����
�ޤ���

--- build(ary)
--- build(hash)

������Ϳ����줿 URI �������Ǥ��� URI::Generic ���֥������Ȥ��������ޤ���
�������Ǥϡ�
      [scheme, userinfo, host, port, registry, path, opaque, query, fragment]
�����󤫥ϥå����Ϳ���ޤ���

--- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment[, arg_check])

#@#    ����Ū�ʹ������Ǥ��� URI::Generic ���֥������Ȥ��������ޤ���build 
#@#    �Ȱۤʤꡢ�������������򸡺����ޤ���
�ư�������ʬ�Ȥ�������URI���֥������Ȥ����������֤��ޤ���

use_registry �����ΤȤ���new �˵��Ǥʤ� registry
����Ϳ��������㳰 URI::InvalidURIError ��������ޤ���

��10����arg_check�Ȥ��ƿ���Ϳ����줿���ϡ�
�ͤ��֤����˳ư��������絬§��Ŭ�礷�Ƥ��뤫�ݤ��򸡺�����
Ŭ�礷�ʤ������㳰 URI::InvalidComponentError ������ޤ���

== Instance Methods

--- default_port

self.class.default_port �Ǥ���

--- component

self.class.component �Ǥ���

--- scheme
--- scheme=()
--- userinfo
--- userinfo=()
--- user
--- user=()
--- password
--- password=()
--- host
--- host=()
--- port
--- port=()
--- registry
--- registry=()
--- path
--- path=()
--- query
--- query=()
--- opaque
--- opaque=()
--- fragment
--- fragment=()

�ƹ������Ǥ�°���᥽�åɤǤ���°������Ǥϡ�������������������å�
�������ʰ������Ф����㳰 URI::InvalidComponentError ��ȯ�������ޤ���
((-���餤 2002-09-24: InvalidURIError �򵯤�����Τ⤢��ΤϤ虜�ȡ�-))

--- hierarchical?

path �����ʤ鿿�Ǥ���

--- absolute?

scheme �����ʤ鿿�Ǥ���

--- relative?

scheme �����ʤ鿿�Ǥ���

--- merge(rel)
--- +(rel)

rel ��Ϣ�뤹�롣
rel ��ʸ����ξ��� URI.parse(rel) �ˤ�äơ�
URI ���Ѵ����Ƥ���Ϣ�뤹�롣

        require 'uri'
        p URI.parse('http://www.ruby-lang.org/') + '/en/raa.html'
        => #<URI::HTTP:0x201001c0 URL:http://www.ruby-lang.org/en/raa.html>

--- route_from(src)
--- -(src)

src��������Хѥ����֤��ޤ���

        require 'uri'
        p URI.parse('http://www.ruby-lang.org/en/raa.html') - 'http://www.ruby-lang.org/'
        => #<URI::Generic:0x20100256 URL:en/raa.html>

--- route_to(dst)

dst�ؤ����Хѥ����֤��ޤ���

        require 'uri'
        p URI.parse('http://www.ruby-lang.org/').route_to('http://www.ruby-lang.org/en/raa.html')

        => #<URI::Generic:0x20100198 URL:en/raa.html>

--- normalize
--- normalize!

URI ���֥������Ȥ������������֤��ޤ����ۥ���̾��ʸ���ˤ���path
�������Ǥ��ʤ���� '/' �򥻥åȤ��ޤ���

--- to_s
--- to_str

URI ���֤��ޤ���

--- ==(uri)

�����˻��ꤷ�� URI (ʸ����ޤ���URI���֥�������)�Ȥΰ���Ƚ���Ԥ�
�ޤ���URI ��������������Ӥ���ޤ���

--- to_a
--- to_ary

URI ���֥������Ȥι������Ǥ�������֤��ޤ���

= class URI::FTP < URI::Generic

== Class Methods

--- build(ary)
--- build(hash)

������Ϳ����줿 URI �������Ǥ��� URI::FTP ���֥������Ȥ��������ޤ���
�������Ǥϡ�
      [userinfo, host, port, path, typecode]
�����󤫥ϥå����Ϳ���ޤ���typecode �ϡ�"a"��"i" ���뤤�� "d" �Ǥ���
"a" �ϥƥ����ȡ�"i" �ϥХ��ʥꡢ"d" �ϥǥ��쥯�ȥ��ɽ���ޤ���
"a" ���ƥ����Ȥǡ�"i" ���Х��ʥ�ʤΤϡ����줾��Υǡ��������פ�
FTP�Υץ�ȥ���� ASCII �� IMAGE �ȸƤФ�Ƥ�������Ǥ���

--- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment[, arg_check])

����Ū�ʹ������Ǥ��� URI::FTP ���֥������Ȥ��������ޤ���build
�Ȱۤʤꡢ�������������򸡺����ޤ���

      require 'uri'
      p ftp = URI.parse("ftp://ftp.ruby-lang.org/pub/ruby/;type=d")
      p ftp.typecode
      => #<URI::FTP:0x2010029c URL:ftp://ftp.ruby-lang.org/pub/ruby/;type=d>
         "d"


#@# bc-rdoc: detected missing name: new2
--- new2(user, password, host, port, path, typecode = nil, arg_check = true)

== Instance Methods

--- typecode
--- typecode=()

�ƹ������Ǥ�°���᥽�åɤǤ���°������Ǥϡ�������������������å�
�������ʰ������Ф����㳰 URI::InvalidComponentError ��ȯ�������ޤ���

= class URI::HTTP < URI::Generic

== Class Methods

--- build(ary)
--- build(hash)

������Ϳ����줿 URI �������Ǥ��� URI::HTTP ���֥������Ȥ��������ޤ���
�������Ǥϡ�
      [userinfo, host, port, path, query, fragment]
�����󤫥ϥå����Ϳ���ޤ���

--- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment[, arg_check])

����Ū�ʹ������Ǥ��� URI::HTTP ���֥������Ȥ��������ޤ���build
�Ȱۤʤꡢ�������������򸡺����ޤ���

== Instance Methods

--- request_uri

path + '?' + query ���֤��ޤ���

= class URI::HTTPS < URI::HTTP

= class URI::LDAP < URI::Generic

LDAP URI SCHEMA (described in [[RFC:2255]])

  ldap://<host>/<dn>[?<attrs>[?<scope>[?<filter>[?<extensions>]]]]

== Class Methods

--- build(ary)
--- build(hash)

--- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment[, arg_check])

== Instance Methods

--- dn

--- dn=()

--- attributes

--- attributes=()

--- scope

--- scope=()

--- filter

--- filter=()

--- extensions

--- extensions=()

= class URI::MailTo < URI::Generic

[[RFC:2368]], The mailto URL scheme

== Class Methods

--- build(ary)
--- build(hash)

������Ϳ����줿 URI �������Ǥ��� URI::MailTo ���֥������Ȥ��������ޤ���
�������Ǥϡ�
      [to, headers]
�����󤫥ϥå����Ϳ���ޤ���headers �ϡ��ʲ��Τ褦��ʸ���������
Ϳ���ޤ���

      "subject=subscribe&cc=addr"

      [["subject", "subscribe"], ["cc", "addr"]]

--- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment[, arg_check])

����Ū�ʹ������Ǥ��� URI::MailTo ���֥������Ȥ��������ޤ���build
�Ȱۤʤꡢ�������������򸡺����ޤ���

== Instance Methods

--- to
--- to=()
--- headers
--- headers=()

�ƹ������Ǥ�°���᥽�åɤǤ���°������Ǥϡ�������������������å�
�������ʰ������Ф����㳰 URI::InvalidComponentError ��ȯ�������ޤ���

--- to_mailtext
--- to_rfc822text

URI ���֥������Ȥ���᡼��ƥ�����ʸ������������ޤ���

      require 'uri'
      p mailto = URI.parse("mailto:ruby-list@ruby-lang.org?subject=subscribe&cc=myaddr")
      print mailto.to_mailtext

      => #<URI::MailTo:0x20104a0e URL:mailto:ruby-list@ruby-lang.org?subject=subscribe&cc=myaddr>
         To: ruby-list@ruby-lang.org
         Subject: subscribe
         Cc: myaddr

#@since 1.8.2
= reopen Kernel

== Private Instance Methods

--- URI(uri_str)

[[m:URI.parse]]��Ʊ���Ǥ���
#@end

= class URI::Error < StandardError

���٤Ƥ� URI �㳰���饹�δ��쥯�饹�Ǥ���

= class URI::InvalidURIError < URI::Error

������ URI ����ꤷ���Ȥ���ȯ�����ޤ���

= class URI::InvalidComponentError < URI::Error

�����ʹ������Ǥ���ꤷ���Ȥ���ȯ�����ޤ���

= class URI::BadURIError < URI::Error

URI �Ȥ��������������Ȥ����������Ȥ���ȯ�����ޤ���
