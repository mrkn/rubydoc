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

--- open(name, *rest)
--- open(name, *rest) {|ouri| ...}

'open-uri' �� require ����ȡ�Kernel.open �����������ޤ���

name �� http:// �� ftp:// �ǻϤޤäƤ���ʸ����ʤ� URI �Υ꥽������
����������� [[c:StringIO]] ���֥������ȤȤ����֤��ޤ������� [[c:StringIO]]
���֥������Ȥ� [[c:OpenURI::Meta]] �⥸�塼��ǳ�ĥ����Ƥ��ޤ���
*rest �Ǽ����դ��륪�ץ����˴ؤ��Ƥϡ�
[[m:OpenURI.open_uri]] �򻲾Ȥ��Ʋ�������

name �� open �᥽�åɤ��������Ƥ�����ϡ�*rest ������Ȥ����Ϥ�
name.open(*rest, &block) �Τ褦�� name �� open �᥽�åɤ��ƤФ�ޤ���
����ʳ��ξ��ϡ�name �ϥե�����̾�Ȥ��ư���졢�����
[[m:Kernel#open]] ���ƤФ�ޤ���

  require 'open-uri'
  sio = open('http://www.example.com')
  p sio.is_a?(OpenURI::Meta) # => true
  p sio.content_type
  puts sio.read

�֥�å���Ϳ�������Ͼ�ξ���Ʊ�͡�name �� http:// �� ftp:// ��
�ϤޤäƤ���ʸ����ʤ� URI �Υ꥽���������������� [[c:StringIO]] ���֥������Ȥ�
�����Ȥ��ƥ֥�å���ɾ�����ޤ������Ʊ�ͤǤ���

= reopen URI::HTTP

#@# [[c:OpenURI::OpenRead]] �⥸�塼�� �򥤥󥯥롼�ɤ��ޤ���

= reopen URI::FTP

#@# [[c:OpenURI::OpenRead]] �⥸�塼�� �򥤥󥯥롼�ɤ��ޤ���

= module OpenURI

== Singleton Methods

--- open_uri(name [, mode [, perm]] [, options])
--- open_uri(name [, mode [, perm]] [, options]) {|sio| ... }

URI �Ǥ���ʸ���� name �Υ꥽������������� [[c:StringIO]] ���֥�������
�Ȥ����֤��ޤ��� Ϳ����줿 mode ���񤭹��ߥ⡼�ɤǤ��ä����ϡ��㳰
ArgumentError ���ꤲ�ޤ��� perm ��Ϳ���Ƥ�̵�뤵��ޤ���

  require 'open-uri'
  sio = OpenURI.open_uri('http://www.example.com')
  puts sio.read
  
  OpenURI.open_uri('http://www.example.com'){|sio| sio.read }

�֥�å���Ϳ�������� [[c:StringIO]] ���֥������Ȥ�����Ȥ��ƥ֥�å���
ɾ�����ޤ���

options �ˤ� [[c:Hash]] ��Ϳ���ޤ�����᤹��ϥå����
������ :proxy, :progress_proc, :content_length_proc �Ǥ���HTTP �ǤΤ߰�̣������ޤ���

���� :proxy ���ͤˤϰʲ��Τ����줫��Ϳ���ޤ���

  * ʸ����  => "http://proxy.foo.com:8000/" �Τ褦�ʥץ����� URI��
  * URI ���֥������� => URI.parse("http://proxy.foo.com:8000/") �Τ褦��
    �ץ����� URI ���֥������ȡ�
  * true => Proxy ��Ķ��ѿ��ʤɤ��鸫�Ĥ��褦�Ȥ��롣
  * false => Proxy ���Ѥ��ʤ���
  * nil => Proxy ���Ѥ��ʤ���

  require 'open-uri'
  sio = OpenURI.open_uri('http://www.example.com',
                         { :proxy => 'http://proxy.example.com:8000/' })

���� :content_length_proc ���ͤˤϥ֥�å���Ϳ���ޤ����֥�å����оݤȤʤ� URI ��
Content-Length ������Ȥ��Ƽºݤ�ž�����Ϥޤ�����ɾ������ޤ����֤��ͤ��ä�
���Ѥ���ޤ���

���� :progress_proc ���ͤˤϥ֥�å���Ϳ���ޤ����֥�å����оݤȤʤ� URI ����ǡ�����
���Ҥ�ž������뤿�Ӥˡ��������ҤΥ�����������Ȥ���ɾ������ޤ����֤��ͤ��ä�
���Ѥ���ޤ���

���2�� :content_length_proc �� :progress_proc �ϥץ��쥹�С��Τ����
���Ѥ���뤳�Ȥ����ꤷ�Ƥ��ޤ���

== Constants

--- Options

[[c:Hash]] ���֥������ȡ�open_uri ����᤹�륪�ץ����Υǥե���ȤǤ���

= module OpenURI::OpenRead 

== Instance Methods

--- open(*rest, &block)

OpenURI.open_uri(self, *rest, &block) ��Ʊ���Ǥ���

--- read(options={})

self.open(options={}).read ��Ʊ���Ǥ���
���Υ᥽�åɤˤ�ä��֤����ʸ����� [[c:OpenURI::Meta]]
�ˤ�äƳ�ĥ����Ƥ��ޤ���

  require 'open-uri'
  uri = URI.parse('http://www.example.com/')
  str = uri.read
  p str.is_a?(OpenURI::Meta) # => true
  p str.content_type

= module OpenURI::Meta

== Instance Methods

--- last_modified

�оݤȤʤ� URI �κǽ���������� [[c:Time]] ���֥������Ȥ��֤��ޤ���

--- content_type

�оݤȤʤ� URI �� Content-Type ��ʸ������֤��ޤ���

--- charset

�оݤȤʤ� URI ��ʸ�������ɤ� Content-Type ��ʸ�������ɾ����ʸ������֤��ޤ���

  open("http://www.ruby-lang.org/en") {|f|
    p f.content_type  # => "text/html"
    p f.charset       # => "iso-8859-1"
  }

--- content_encoding

�оݤȤʤ� URI �� Content-Encoding ��ʸ���������Ȥ����֤��ޤ���

--- status

�оݤȤʤ� URI �Υ��ơ����������ɤ� reason phrase ��ʸ���������Ȥ����֤��ޤ���

--- base_uri

������쥯�Ȥ��줿��Υǡ�����¸�ߤ��� URI �� URI ���֥������ȤȤ����֤��ޤ���

--- meta

�إå����Ͽ�����ϥå�����֤��ޤ���

