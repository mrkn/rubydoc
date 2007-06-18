#@# = open-uri

http/ftp �˴�ñ�˥����������뤿��Υ��饹�Ǥ���
Kernel �Υ⥸�塼��ؿ�(�Ȥ߹��ߴؿ�) open ���������ޤ���

=== ������

http/ftp �� URL �����̤Υե�����Τ褦�˳����ޤ���

  require 'open-uri'
  open("http://www.ruby-lang.org/") {|f|
    f.each_line {|line| p line}
  }

�������ե����륪�֥������Ȥ� StringIO �⤷���� Tempfile �Ǥ��� [[c:OpenURI::Meta]] �⥸�塼��ǳ�ĥ����Ƥ��ơ�
�᥿������������᥽�åɤ��Ȥ��ޤ���
  open("http://www.ruby-lang.org/en") {|f|
    f.each_line {|line| p line}
    p f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
    p f.content_type     # "text/html"
    p f.charset          # "iso-8859-1"
    p f.content_encoding # []
    p f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
  }
�ϥå�������ǡ��ɲäΥإå��ե�����ɤ����Ǥ��ޤ���
  open("http://www.ruby-lang.org/en/",
    "User-Agent" => "Ruby/#{RUBY_VERSION}",
    "From" => "foo@bar.invalid",
    "Referer" => "http://www.ruby-lang.org/") {|f|
    ...
  }
http_proxy �� ftp_proxy �ʤɤδĶ��ѿ��ϡ��ǥե���Ȥ�ͭ���ˤʤäƤ��ޤ���
�ץ�����̵���ˤ���ˤ� :proxy => nil �Ȥ��ޤ���
  open("http://www.ruby-lang.org/en/raa.html",
    :proxy => nil) {|f|
    ...
  }

�ޤ���open-uri ���ɤ߹���� [[c:URI::HTTP]] �� [[c:URI::FTP]] ��
[[c:OpenURI::OpenRead]] �⥸�塼��򥤥󥯥롼�ɤ��ޤ����Ǥ��Τǡ�
URI ���֥������Ȥ�����褦����ˡ�ǳ����ޤ���
  uri = URI.parse("http://www.ruby-lang.org/en/")
  uri.open {|f|
    ...
  }
URI ���֥������Ȥ�ľ���ɤ߹��ळ�Ȥ��Ǥ��ޤ���
����ͤ�ʸ����ϡ�[[c:OpenURI::Meta]] �ǳ�ĥ����Ƥ��ޤ���
  str = uri.read
  p str.base_uri

= redefine Kernel

== Module Functions

--- open(name, *rest)                -> StringIO | File
--- open(name, *rest) {|ouri| ...}   -> nil
#@todo

name �� http:// �� ftp:// �ǻϤޤäƤ���ʸ����ʤ� URI �Υ꥽������
����������� [[c:StringIO]] ���֥������ȤȤ����֤��ޤ���

name �� open �᥽�åɤ��������Ƥ�����ϡ�*rest ������Ȥ����Ϥ�
name.open(*rest, &block) �Τ褦�� name �� open �᥽�åɤ��ƤФ�ޤ���

����ʳ��ξ��ϡ�name �ϥե�����̾�Ȥ��ư���졢�����
[[m:Kernel#open]](name, *rest) ���ƤФ�ޤ���

  require 'open-uri'
  sio = open('http://www.example.com')
  p sio.is_a?(OpenURI::Meta) # => true
  p sio.content_type
  puts sio.read

�֥�å���Ϳ�������Ͼ�ξ���Ʊ�͡�name �� http:// �� ftp:// ��
�ϤޤäƤ���ʸ����ʤ� URI �Υ꥽���������������� [[c:StringIO]] ���֥������Ȥ�
�����Ȥ��ƥ֥�å���ɾ�����ޤ������Ʊ�ͤǤ���

@param name �����ץ󤷤����꥽������ʸ�����Ϳ���ޤ���

@param rest [[m:OpenURI.open_uri]] �򻲾Ȥ��Ʋ�������

@return �֤��ͤǤ��� StringIO ���֥������Ȥ� [[c:OpenURI::Meta]] �⥸�塼��� extend ����Ƥ��ޤ���

@raise OpenURI::HTTPError �оݤȤʤ� URI �Υ������ब http �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ�������ȯ�����ޤ���

@raise Net::FTPError �оݤȤʤ� URI �Υ������ब ftp �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ������� [[c:Net::FTPError]] �Υ��֥��饹��ȯ�����ޤ����ܤ����� [[lib:net/ftp]] �򻲾Ȥ��Ʋ�������

= reopen URI::HTTP
include OpenURI::OpenRead

= reopen URI::FTP
include OpenURI::OpenRead

= module OpenURI
http/ftp �˴�ñ�˥����������뤿��Υ⥸�塼��Ǥ���

== Singleton Methods

--- open_uri(name, mode = 'r', perm = nil, options = {})                  -> StringIO
--- open_uri(name, mode = 'r', perm = nil, options = {}) {|sio| ... }     -> nil
#@todo

URI �Ǥ���ʸ���� name �Υ꥽������������� [[c:StringIO]] ���֥�������
�Ȥ����֤��ޤ���

�֥�å���Ϳ�������� [[c:StringIO]] ���֥������Ȥ�����Ȥ��ƥ֥�å���
ɾ�����ޤ����֥�å��ν�λ���� StringIO �� close ����ޤ���nil ���֤��ޤ���

  require 'open-uri'
  sio = OpenURI.open_uri('http://www.example.com')
  p sio.last_modified 
  puts sio.read
  
  OpenURI.open_uri('http://www.example.com'){|sio| sio.read }

options �ˤ� [[c:Hash]] ��Ϳ���ޤ������򤹤�ϥå����
�����ϰʲ���4�ĤΥ���ܥ롢
 * :proxy
 * :progress_proc
 * :content_length_proc
 * :http_basic_authentication 
�Ǥ���HTTP �ǤΤ߰�̣������ޤ���
��:content_length_proc�פȡ�:progress_proc�פϥץ��쥹�С���
���Ѥ���뤳�Ȥ����ꤷ�Ƥ��ޤ���

  require 'open-uri'
  sio = OpenURI.open_uri('http://www.example.com',
                         { :proxy => 'http://proxy.example.com:8000/',
                           :http_basic_authentication => [usrname, password] })

: :proxy
 �ͤˤϰʲ��Τ����줫��Ϳ���ޤ���
//emlist{
   * ʸ����  => "http://proxy.foo.com:8000/" �Τ褦�ʥץ����� URI��
   * URI ���֥������� => URI.parse("http://proxy.foo.com:8000/") �Τ褦��
     �ץ����� URI ���֥������ȡ�
   * true => Proxy ��Ķ��ѿ��ʤɤ��鸫�Ĥ��褦�Ȥ��롣
   * false => Proxy ���Ѥ��ʤ���
   * nil => Proxy ���Ѥ��ʤ���
//}

: :http_basic_authentication


: :content_length_proc
 �ͤˤϥ֥�å���Ϳ���ޤ����֥�å����оݤȤʤ� URI ��
 Content-Length �إå����ͤ�����Ȥ��ơ��ºݤ�ž�����Ϥޤ�����ɾ������ޤ���Redirect ���줿���ϡ�
 �ºݤ�ž�������꥽������ HTTP �إå������Ѥ��ޤ���Content-Length �إå����ʤ����ϡ�nil ��
 �����Ȥ��ƥ֥�å���ɾ�����ޤ����֥�å����֤��ͤ��ä����Ѥ���ޤ���
 
: :progress_proc
 �ͤˤϥ֥�å���Ϳ���ޤ����֥�å����оݤȤʤ� URI ����ǡ�����
 ���Ҥ�ž������뤿�Ӥˡ��������ҤΥ�����������Ȥ���ɾ������ޤ����֥�å����֤��ͤ��ä�
 ���Ѥ���ޤ���

@param name �����ץ󤷤����꥽������ʸ�����Ϳ���ޤ���

@param mode �⡼�ɤ�ʸ�����Ϳ���ޤ���

@param perm ̵�뤵��ޤ���

@return �֤��ͤǤ��� StringIO ���֥������Ȥ� [[c:OpenURI::Meta]] �⥸�塼��� extend ����Ƥ��ޤ���

@raise OpenURI::HTTPError �оݤȤʤ� URI �Υ������ब http �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ�������ȯ�����ޤ���

@raise Net::FTPError �оݤȤʤ� URI �Υ������ब ftp �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ������� [[c:Net::FTPError]] �Υ��֥��饹��ȯ�����ޤ����ܤ����� [[lib:net/ftp]] �򻲾Ȥ��Ʋ�������

@raise ArgumentError Ϳ����줿 mode ���ɤ߹��ߥ⡼�ɤǤʤ��ä�����ȯ�����ޤ���

= module OpenURI::OpenRead 
[[c:URI::HTTP]] �� [[c:URI::FTP]] ���ĥ���뤿����Ѱդ��줿�⥸�塼��Ǥ���

== Instance Methods

--- open(*rest)                 -> StringIO
--- open(*rest){|sio| ... }     -> nil
#@todo

[[m:OpenURI.open_uri]](self, *rest, &block) ��Ʊ���Ǥ���

@return �֤��ͤǤ��� StringIO ���֥������Ȥ� [[c:OpenURI::Meta]] �⥸�塼��� extend ����Ƥ��ޤ���

@raise OpenURI::HTTPError �оݤȤʤ� URI �Υ������ब http �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ�������ȯ�����ޤ���

@raise Net::FTPError �оݤȤʤ� URI �Υ������ब ftp �Ǥ��ꡢ���ĥ꥽�����μ����˼��Ԥ������� [[c:Net::FTPError]] �Υ��֥��饹��ȯ�����ޤ����ܤ����� [[lib:net/ftp]] �򻲾Ȥ��Ʋ�������

--- read(options={})     -> String
#@todo

self.open(options={}).read ��Ʊ���Ǥ���
���Υ᥽�åɤˤ�ä��֤����ʸ����� [[c:OpenURI::Meta]]
�ˤ�ä� extend ����Ƥ��ޤ���

  require 'open-uri'
  uri = URI.parse('http://www.example.com/')
  str = uri.read
  p str.is_a?(OpenURI::Meta) # => true
  p str.content_type

= module OpenURI::Meta
�����Ф�����������ǡ�����°���򰷤�����˻Ȥ���⥸�塼��Ǥ���
�ǡ�����ɽ��ʸ����� [[c:StringIO]] �� extend ���ޤ���

== Instance Methods

--- last_modified    -> Time | nil
#@todo

�оݤȤʤ� URI �κǽ���������� [[c:Time]] ���֥������Ȥ��֤��ޤ���
Last-Modified �إå����ʤ����� nil ���֤��ޤ���

--- content_type    -> String
#@todo

�оݤȤʤ�꥽������ Content-Type ��ʸ�����������֤��ޤ���Content-Type �إå��ξ��󤬻Ȥ��ޤ���
Content-Type �إå����ʤ����ϡ�"application/octet-stream" ���֤��ޤ���

--- charset       -> String | nil
--- charset{...}  -> String
#@todo

�оݤȤʤ�꥽������ʸ�������ɤ�ʸ������֤��ޤ���Content-Type �إå���ʸ�������ɾ��󤬻Ȥ��ޤ���
ʸ����Ͼ�ʸ���ؤ��Ѵ�����Ƥ��ޤ���

Content-Type �إå����ʤ����ϡ�nil ���֤��ޤ������������֥�å���Ϳ�����Ƥ�����ϡ�
���η�̤��֤��ޤ����ޤ��оݤȤʤ� URI �Υ������ब HTTP �Ǥ��ꡢ���ȤΥ����פ� text �Ǥ�����ϡ�
RFC2616 3.7.1 �������Ƥ���Ȥ��ꡢʸ���� "iso-8859-1" ���֤��ޤ���

  open("http://www.ruby-lang.org/en") {|f|
    p f.content_type  # => "text/html"
    p f.charset       # => "iso-8859-1"
  }

--- content_encoding    -> [String]
#@todo

�оݤȤʤ�꥽������ Content-Encoding ��ʸ���������Ȥ����֤��ޤ���
Content-Encoding �إå����ʤ����ϡ�����������֤��ޤ���

--- status    -> [String]
#@todo

�оݤȤʤ�꥽�����Υ��ơ����������ɤ� reason phrase ��ʸ���������Ȥ����֤��ޤ���

--- base_uri    -> URI
#@todo

�꥽�����μºݤ� URI �� URI ���֥������ȤȤ����֤��ޤ���
������쥯�Ȥ��줿���ϡ�������쥯�Ȥ��줿��Υǡ�����¸�ߤ��� URI ���֤��ޤ���

--- meta    -> Hash
#@todo

�إå����Ͽ�����ϥå�����֤��ޤ���

= class OpenURI::HTTPError < StandardError

�꥽�����μ����˼��Ԥ��������ꤲ���ޤ���
