���ѥǡ���ž���ץ�ȥ��� HTTP �򰷤��饤�֥��Ǥ���
������ [[RFC:2616]] �˴𤭤ޤ���

=== ������

==== �����֥����Ф���ɥ�����Ȥ����� (GET)

  require 'net/http'
  Net::HTTP.version_1_2   # ���ޤ��ʤ�
  Net::HTTP.start('www.example.com', 80) {|http|
    response = http.get('/index.html')
    puts response.body
  }

�ޤ��ʲ���Ʊ����̣��û���񤤤���ΤǤ���

  require 'net/http'
  Net::HTTP.version_1_2   # ���ޤ��ʤ�
  Net::HTTP.get_print 'www.example.com', '/index.html'

==== �ե�����ξ������������ (POST)

  require 'net/http'
  Net::HTTP.version_1_2   # ���ޤ��ʤ�
  Net::HTTP.start('www.example.com', 80) {|http|
    response = http.post('/cgi-bin/somecgi.rb',
                         'querytype=subject&target=ruby')
  }

(����: �ե�������ͤζ��ڤ�ʸ���ˤĤ���)

==== �ץ�����ͳ�Υ�������

Net::HTTP �Υ��饹�᥽�å� Net::HTTP.Proxy �ϡ���˥ץ�����ͳ��
��³����褦��ư��򤹤롢���������饹����������֤��ޤ������Υ��饹��
Net::HTTP ��Ѿ����Ƥ���Τ� Net::HTTP ������Ʊ���褦�˻Ȥ��ޤ���

  require 'net/http'
  Net::HTTP.version_1_2   # ���ޤ��ʤ�
  
  $proxy_addr = 'your.proxy.addr'
  $proxy_port = 8080
        :
  Net::HTTP::Proxy($proxy_addr, $proxy_port).start( 'some.www.server' ) {|http|
    # always connect to your.proxy.addr:8080
        :
  }

�ޤ� Net::HTTP.Proxy ���������� nil ���� Net::HTTP ���Ȥ��֤��Τ�
��Υ����ɤΤ褦�˽񤤤Ƥ����Хץ����ʤ��ξ��ˤ��б��Ǥ��ޤ���

==== ������쥯�Ȥ��б�����

�ʲ��Υ᥽�å� fetch �ϥ�����쥯�Ȥ��б����Ƥ��ޤ���
limit ����ʾ������쥯�Ȥ����饨�顼�ˤ��ޤ���

  require 'uri'
  require 'net/http'
  Net::HTTP.version_1_2    # ���ޤ��ʤ�
  
  def fetch(uri_str, limit = 10)
    # Ŭ�ڤ��㳰���饹���Ѥ���٤�
    raise ArgumentError, 'http redirect too deep' if limit == 0
    
    response = Net::HTTP.get_response(URI.parse(uri_str))
    case response
    when Net::HTTPSuccess     then response
    when Net::HTTPRedirection then fetch(response['location'], limit - 1)
    else
      response.error!
    end
  end
  
  print fetch('http://www.ruby-lang.org')

==== Basic ǧ��

  require 'net/http'
  Net::HTTP.version_1_2   # ���ޤ��ʤ�
  
  req = Net::HTTP::Get.new('/need-auth.cgi')
  req.basic_auth 'account', 'password'
  Net::HTTP.start('www.example.com') {|http|
    response = http.request(req)
    print response.body
  }

=== ���������ͤؤ��ѹ��Ȱܹ����֤ˤĤ���

Ruby 1.6 �����äƤ���Τ� net/http 1.1 �� 1.7 �ʹߤ� 1.2 �Ǥ�����
���δ֤ǤϤ��ʤ��礭�����ͤ��Ѥ��ޤ��������������˻��ͤ��ѹ�
����ΤǤʤ���ξ���μ�������¸������������ߤ��뤳�Ȥˤ��ޤ�����

�᥽�å� HTTP.version_1_2��HTTP.version_1_1 ��Ƥ֤�
���Τ��Ȥ���������� Net::HTTP ���֥������ȤϤ��줾���
�С������λ��ͤ�ư���褦�ˤʤ�ޤ����ʲ��ϻ�����Ǥ���

  # example
  Net::HTTP.start {|http1| ...(http1 has 1.2 features)... }
  
  Net::HTTP.version_1_1
  Net::HTTP.start {|http2| ...(http2 has 1.1 features)... }
  
  Net::HTTP.version_1_2
  Net::HTTP.start {|http3| ...(http3 has 1.2 features)... }

�Ĥޤ� Ruby 1.6 �Ǥ� Net::HTTP.version_1_2 ��Ƥ٤� 1.2 �ε�ư�ˤʤ�ޤ�����
��Ⱦ�Υ᥽�åɤϸƤ٤ޤ� (Ruby 1.8 �Ǥ�᥽�åɤ������Ƥ���Τ����ƤǤϤ���ޤ���)��
Ruby 1.8 �Ǥ� Net::HTTP.version_1_1 ��Ƥ٤и��ε�ư�ˤǤ���Τǡ������ߴ�����
�ݤĤ��Ȥ��Ǥ��ޤ���

�����������ε�ǽ�ϥ���åɥ����դǤϤ���ޤ���
�Ĥޤꡢʣ������åɤǤ��줾��� version_1_1 �� version_1_2 ��Ƥ����硢
������������ Net::HTTP ���֥������Ȥ��ɤ���ΥС������ˤʤ뤫���ݾڤǤ��ޤ���
���ץꥱ����������ΤǤɤ��餫�ΥС������˸��ꤹ��ɬ�פ�����ޤ���

�ʤ��ɤ����Ȥ����Ǥ��������줫��񤯤ʤ����� version_1_2 �Ǥ���
require 'net/http' ľ��� Net::HTTP.version_1_2 ��Ƥ��
1.1 �Τ��Ȥ�˺��Ƥ���������

=== �㳰

get��head��post �᥽�åɤ�ȯ������ HTTP �ץ�ȥ����Ϣ���㳰�Ȥ��ơ�
�ʲ��˵󤲤��Τ�����ޤ���
�����˵󤲤��㳰���饹�οƥ��饹�Ϥ��٤� Net::ProtocolError ���饹�ǡ�
response �᥽�åɤˤ�äƥ��顼�θ����Ȥʤä��쥹�ݥ󥹥��֥������Ȥ�
���뤳�Ȥ��Ǥ��ޤ���

: ProtoRetriableError
    HTTP ���ơ����������� 3xx �������ä�����ȯ�����ޤ���
    �꥽��������ư�����ʤɤ���ͳ�ˤ�ꡢ�ꥯ�����Ȥ�λ������ˤϹ���
    �륢�������ɬ�פˤʤ�ޤ���
: ProtoFatalError
    HTTP ���ơ����������� 4xx �������ä�����ȯ�����ޤ���
    ���饤����ȤΥꥯ�����Ȥ˸�꤬���뤫�������Ф˥ꥯ�����Ȥ���ݤ�
    �줿(ǧ�ڤ�ɬ�ס��꥽������¸�ߤ��ʤ��ʤɤ�)���Ȥ򼨤��ޤ���
: ProtoServerError
    HTTP ���ơ����������� 5xx �������ä�����ȯ�����ޤ���
    �����Ф��ꥯ�����Ȥ������˥��顼��ȯ���������Ȥ򼨤��ޤ���
: ProtoUnknownError
    �ץ�ȥ���ΥС�����󤬾夬�ä������뤤�ϥ饤�֥��ΥХ��ʤɤǡ�
    �饤�֥�꤬�б����Ƥ��ʤ�������ȯ�����ޤ�����

=== �ե�������ͤζ��ڤ�ʸ���ˤĤ���

POST�� application/x-www-form-urlencoded �Ȥ���ʣ���Υե�������ͤ������硢
���߹����Ԥʤ��Ƥ���Τϡ� name0=value0&name1=value1 �Τ褦�˥���ѥ����
(`&') �Ƕ��ڤ��꤫���Ǥ���
������ˡ�ϡ�RFC1866 Hypertext Markup Language - 2.0 �ǽ��Ƹ������о줷��
HTML 4.01 Specification �� 17.13.4 Form content types
�Ǥ⤽�Τ褦�˽񤫤�Ƥ��ޤ���

�Ȥ�����Ʊ�� HTML 4.01 Specification ��
B.2.2 Ampersands in URI attribute values �Ǥϡ�
���� `&' ��SGML��ʸ�����λ��Ȥ��Ѥ����뤳�Ȥ���Ŧ����Ƥ��ꡢ
CGI�䥵���Фμ����Ԥ��Ф� `&' �������
���ߥ���� `;' �򥵥ݡ��Ȥ��뤳�Ȥ򾩤�Ƥ��ޤ���

���������ºݤˤ� `;' ���ᤷ�ʤ�CGI�䥵���Ф�ޤ��ޤ����������뤿��
���Υ�ե���󥹥ޥ˥奢��Ǥ���Ȥ��� `&' ���Ѥ��ޤ�����

�ʤ� Ruby ɸ��� [[lib:cgi]] �饤�֥��Ǥ� '&' �� ';' ��ξ�����ݡ��Ȥ��Ƥ��ޤ��Τǡ�
[[lib:cgi]] �饤�֥���Ȥä� CGI ������ץȤ�񤯾��Ϥ����ΰ㤤�򵤤ˤ���
ɬ�פϤ���ޤ���



= class Net::HTTP < Object

HTTP �Υ��饤����ȤΤ���Υ��饹�Ǥ���

== Class Methods

--- new(address, port = 80, proxy_addr = nil, proxy_port = nil)
#@todo

������ HTTP ���֥������Ȥ��������ޤ���address �� HTTP �����С��� FQDN �ǡ�
port ����³����ݡ����ֹ�Ǥ������Υ᥽�åɤǤϤޤ���³�Ϥ��ޤ���

proxy_addr ��Ϳ����ȥץ�����𤷤���³���륪�֥������Ȥ��������ޤ���

--- start(address, port = 80, proxy_addr = nil, proxy_port = nil)
--- start(address, port = 80, proxy_addr = nil, proxy_port = nil) {|http| .... }
#@todo

�ʲ���Ʊ���Ǥ���

  Net::HTTP.new(address, port, proxy_addr, proxy_port).start(&block)

--- get(address, path, port = 80)
#@todo

�ۥ��� address �� port �֥ݡ��Ȥ���³���� path ��ɽ������
����ƥ��ƥ��ܥǥ����������ʸ������֤��ޤ���

--- get_print(address, path, port = 80)
#@todo

�ۥ��� address �� port �֥ݡ��Ȥ���³���� path ��ɽ������
����ƥ��ƥ��ܥǥ����������������$stdout �� << �ǽ��Ϥ��ޤ���

--- get_response(uri)
--- get_response(host, path = nil, port = nil)
#@todo

#@since 1.8.3
--- post_form(uri, params)
#@todo
#@end

--- proxy_address
#@todo

--- proxy_port
#@todo

--- proxy_pass
#@todo

--- proxy_user
#@todo

--- socket_type
#@todo

���Υ᥽�åɤ� obsolete �Ǥ���

--- Proxy(address, port = 80)
#@todo

Proxy ��ͳ�� http �����Ф���³���뤿��Υ��饹��������֤��ޤ���
���Υ��饹�� Net::HTTP ��Ѿ����Ƥ���Τ� Net::HTTP ������
Ʊ���褦�˻Ȥ��ޤ������ꤵ�줿�ץ������˷�ͳ���� http ������
����³���ޤ���

  address �� nil �ΤȤ��� Net::HTTP ���饹�򤽤Τޤ��֤��ޤ���

  require 'net/http'
  proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  http = proxy_class.new('www.ruby-lang.org')
  http.start {|h|
    h.get('/ja/') # proxy.example.com ��ͳ����³���ޤ���
  }

--- proxy_class?
#@todo

���Ȥ� (Proxy �᥽�åɤˤ�äƺ������줿) �ץ����ѤΥ��饹�ʤ�п���

#@since 1.8.3
--- http_default_port
#@end
--- default_port
--- port
#@todo

HTTP �Υǥե���ȥݡ��� (80) �Ǥ���

#@since 1.8.3
--- https_default_port
#@todo

HTTPS �Υǥե���ȥݡ��� (443) �Ǥ���
#@end

--- version_1_1?
--- version_1_1
--- is_version_1_1?
#@todo

�饤�֥��ΥС������ 1.1 �ΤȤ� true ���֤��ޤ���
Ruby 1.8 �ʹߤǤϾ�� false �Ǥ���

--- version_1_2?
--- version_1_2
--- is_version_1_2?
#@todo

�饤�֥��ΥС������ 1.2 �ΤȤ� true ���֤��ޤ���
Ruby 1.8 �ʹߤǤϾ�� true �Ǥ���

== Instance Methods

--- start
--- start {|http| .... }
#@todo

TCP ���ͥ�������ĥ�ꡢHTTP ���å����򳫻Ϥ��ޤ���
���Ǥ˥��å���󤬳��Ϥ��Ƥ������㳰 IOError ��ȯ�����ޤ���

���ƥ졼���Ȥ��ƸƤФ줿���ϥ֥�å��δ֤������å�������³����
�֥�å���λ�ȤȤ�˼�ưŪ�˥��å������Ĥ��ޤ���

--- started?
--- active?
#@todo

HTTP ���å���󤬳��Ϥ���Ƥ����鿿��

--- set_debug_output(io)
#@since 1.9.1
--- debug_outupt=(io)
#@todo
#@end

--- close_on_empty_response
--- close_on_empty_response=(bool)
#@todo

--- address
#@todo

��³���륢�ɥ쥹

--- port
#@todo

��³����ݡ����ֹ�

--- proxy?
#@todo

�ץ�����𤷤���³����ʤ鿿���֤��ޤ���

--- proxy_address
--- proxyaddr
#@todo

�ץ�����ͳ����³���� HTTP ���֥������Ȥʤ�ץ����Υ��ɥ쥹��
�����Ǥʤ��ʤ� nil��

--- proxy_port
--- proxyport
#@todo

�ץ�����ͳ����³���� HTTP ���֥������Ȥʤ�ץ����Υݡ��ȡ�
�����Ǥʤ��ʤ� nil��

--- proxy_pass
#@todo

--- proxy_user
#@todo

--- open_timeout
--- open_timeout=(seconds)
#@todo

��³�����Ԥĺ����ÿ��������ÿ����äƤ⥳�ͥ������
�����ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

--- read_timeout
--- read_timeout=(seconds)
#@todo

�ɤߤ��� ([[man:read(2)]] ���) �ǥ֥�å����Ƥ褤�����ÿ���
�����ÿ����äƤ��ɤߤ���ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

--- finish
#@todo

HTTP ���å�����λ���ޤ������å���󳫻����ˤ��Υ᥽�åɤ�
�ƤФ줿�����㳰 IOError ��ȯ�����ޤ���

--- get(path, header = nil)
--- get(path, header = nil) {|str| .... }
#@todo

�����о�� path �ˤ��륨��ƥ��ƥ���������ޤ����ޤ� header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ��ƽ�
���ߤޤ���header �ϥϥå���ǡ��֥إå�̾ => ���ơפΤ褦�ʷ�����
�ʤ���Ф����ޤ���

����ͤϡ��С������ 1.1 �Ǥ� HTTPResponse �ȥ���ƥ��ƥ��ܥǥ�ʸ�����
�����Ǥ�����Ǥ���1.2 �Ǥ� HTTPResponse �����ҤȤĤΤߤǤ������ξ�硢
����ƥ��ƥ��ܥǥ��� response.body �������ޤ���

�֥�å��ȤȤ�˸ƤФ줿���ϥ���ƥ��ƥ��ܥǥ��򾯤����ĥ֥�å���
Ϳ���ޤ���

1.1 �Ǥ� 3xx (�ƻ�Բ�ǽ�ʥ��顼)���Ф��Ƥ��㳰��ȯ�����ޤ������ξ��
HTTPResponse ���㳰���֥������Ȥ��� err.response �����뤳�Ȥ��Ǥ��ޤ���
���� 1.2 �Ǥ������㳰��ȯ�����ޤ���

  # net/http version 1.1 (Ruby 1.6.x)
  response, body = http.get( '/index.html' )
  
  # net/http version 1.2 (Ruby 1.8.x or later)
  response = http.get('/index.html')
  
  # compatible in both version
  response , = http.get('/index.html')
  response.body
  
  # compatible, using block
  File.open('save.txt', 'w') {|f|
    http.get('/~foo/', nil) do |str|
      f.write str
    end
  }

--- head(path, header = nil)
#@todo

�����о�� path �ˤ��륨��ƥ��ƥ��Υإå��Τߤ�������ޤ���
�ޤ� header �� nil �Ǥʤ���Хꥯ�����Ȥ�����Ȥ��ˤ������Ƥ�
HTTP �إå��Ȥ��ƽ񤭤��ߤޤ���header �ϥϥå���ǡ�
�֥إå�̾ => ���ơפΤ褦�ʷ����Ǥʤ���Ф����ޤ���

HTTPResponse ���֥������Ȥ��֤��ޤ���

net/http version 1.1 �Ǥ� 3xx (�ƻ�Բ�ǽ�ʥ��顼) ���Ф��Ƥ��㳰��ȯ�����ޤ���
���ξ�硢HTTPResponse ��
�㳰���֥������Ȥ��� err.response �����뤳�Ȥ��Ǥ��ޤ���
���� net/http version 1.2 �Ǥ������㳰��ȯ�����ޤ���

  response = nil
  Net::HTTP.start('some.www.server', 80) {|http|
    response = http.head('/index.html')
  }
  p response['content-type']

--- post(path, data, header = nil, dest = nil)
--- post(path, data, header = nil) {|str| .... }
#@todo

�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
����ޤ���

����ͤ� get ��Ʊ���褦�ˡ�net/http �С������ 1.1 �Ǥ� HTTPResponse ��
����ƥ��ƥ��ܥǥ�ʸ����������Ǥ�����Ǥ���
net/http 1.2 �Ǥ� HTTPResponse �����ҤȤĤΤߤǤ���
���ξ�硢����ƥ��ƥ��ܥǥ��� response.body �������ޤ���

header �� get �᥽�åɤ�Ʊ���Ǥ���

dest ��Ϳ�������ˤϡ��쥹�ݥ󥹤� << �᥽�åɤ�Ȥä� dest �˽񤭤��ޤ�ޤ���
dest �ˤ� << �᥽�åɤ�������줿���֥������ȡ��̾� [[c:String]] ���֥������Ȥ�
[[c:Array]] ���֥������Ȥ�Ϳ���ޤ���
���� dest ������ͤ� HTTPResponse ���֥������Ȥ� body �ˤ�ʤ�ޤ���

�֥�å��Ȱ��˸ƤӤ����줿�Ȥ��ϥ���ƥ��ƥ��ܥǥ��򾯤�����ʸ����Ȥ���
�֥�å���Ϳ���ޤ������ΤȤ�����ͤ� HTTPResponse ���֥������Ȥ�ͭ���� body ��
�����ޤ���

dest �ȥ֥�å���Ʊ����Ϳ���ƤϤ����ޤ���
Ʊ����Ϳ���������㳰 ArgumentError ��ȯ�����ޤ���

net/http version 1.1 �Ǥ� 3xx (�ƻ�Բ�ǽ�ʥ��顼)���Ф��Ƥ��㳰��ȯ�����ޤ���
���ξ�硢HTTPResponse ���㳰���֥������Ȥ���
err.response �����뤳�Ȥ��Ǥ��ޤ���
���� net/http version 1.2 �Ǥ������㳰��ȯ�����ޤ���

  # net/http version 1.1 (Ruby 1.6.x)
  response, body = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  
  # version 1.2 (Ruby 1.8.x or later)
  response = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  
  # compatible in both version
  response , = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  
  # compatible, using block
  File.open('save.html', 'w') {|f|
    http.post('/cgi-bin/search.rb', 'query=subject&target=ruby') do |str|
      f.write str
    end
  }

--- request_get(path, header = nil)
--- request_get(path, header = nil) {|response| .... }
--- get2(path, header = nil)
--- get2(path, header = nil) {|response| .... }
#@todo

path �ˤ��륨��ƥ��ƥ���������ޤ���
HTTPResponse ���֥������Ȥ��֤��ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ��֥�å��¹������³��
�ݻ������ޤ� HTTPResponse ���֥������Ȥ�֥�å����Ϥ��ޤ���

���Υ᥽�åɤ� HTTP �ץ�ȥ���˴�Ϣ�����㳰��ȯ�������ޤ���

  # example
  response = http.request_get('/index.html')
  p response['content-type']
  puts response.body          # body is already read
  
  # using block
  http.request_get('/index.html') {|response|
    p response['content-type']
    response.read_body do |str|   # read body now
      print str
    end
  }

--- request_head(path, header = nil)
--- request_head(path, header = nil) {|response| .... }
--- head2(path, header = nil)
--- head2(path, header = nil) {|response| .... }
#@todo

--- request_post(path, data, header = nil)
--- request_post(path, data, header = nil) {|response| .... }
--- post2(path, data, header = nil)
--- post2(path, data, header = nil) {|response| .... }
#@todo

path �ˤ��륨��ƥ��ƥ���������ޤ���
HTTPResponse ���֥������Ȥ��֤��ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ��ܥǥ����ɤߤ�������
HTTPResponse ���֥������Ȥ�֥�å����Ϥ��ޤ���

���Υ᥽�åɤ� HTTP �ץ�ȥ���˴�Ϣ�����㳰��ȯ�������ޤ���

  # example
  response = http.post2('/cgi-bin/nice.rb', 'datadatadata...')
  p response.status
  puts response.body          # body is already read
  
  # using block
  http.post2('/cgi-bin/nice.rb', 'datadatadata...') {|response|
    p response.status
    p response['content-type']
    response.read_body do |str|   # read body now
      print str
    end
  }

--- put(path, data, initheader = nil)
#@todo

--- request_put(path, data, initheader = nil)
--- request_put(path, data, initheader = nil) {|response| .... }
--- put2(path, data, initheader = nil)
--- put2(path, data, initheader = nil) {|response| .... }
#@todo


--- send_request(name, path, data = nil, header = nil)
#@todo

--- request(request [, data])
--- request(request [, data]) {|response| .... }
#@todo

HTTPResquest ���֥������� request ���������ޤ���POST/PUT �λ��� data ��
Ϳ�����ޤ� (POST/PUT �ʳ��� data ��Ϳ����� ArgumentError ��ȯ�����ޤ�)��

�֥�å��ȤȤ�˸ƤӤ����줿�Ȥ��ϥܥǥ����ɤߤ��ޤ��� HTTPResponse
���֥������Ȥ�֥�å���Ϳ���ޤ���

���Υ᥽�åɤ� HTTP �ץ�ȥ���˴�Ϣ�����㳰��ȯ�������ޤ���

--- inspect
#@todo

#@since 1.8.3
--- copy(path, initheader = nil)
#@todo

--- delete(path, initheader = nil)
#@todo

--- lock(path, body, initheader = nil)
#@todo

--- mkcol(path, body, initheader = nil)
#@todo

--- move(path, body, initheader = nil)
#@todo

--- options(path, initheader = nil)
#@todo

--- propfind(path, body, initheader = {'Depth' => '0'})
#@todo

--- proppatch(path, body, initheader = nil)
#@todo

--- trace(path, initheader = nil)
#@todo

--- unlock(path, body, initheader = nil)
#@todo

#@end
= module Net::HTTPHeader

== Instance Methods

--- [](key)
#@todo

key �إå��ե������ (ʸ����) ���֤��ޤ���
���Ȥ��Х��� 'content-length' ���Ф��Ƥ� '2048' �Τ褦��ʸ���������ޤ���
key ����ʸ����ʸ������̤��ޤ���

--- []=(key)
#@todo

key �إå��ե�����ɤ� val �򥻥åȤ��ޤ���
key ����ʸ����ʸ������̤��ޤ���

#@since 1.8.3
--- add_field(key, val)
#@todo

key �إå��ե�����ɤ� val ���ɲä��ޤ���

--- get_fields(key)
#@todo

key �إå��ե�����ɤ��� (ʸ����) ��������֤��ޤ���
���Ȥ��Х��� 'content-length' ���Ф��Ƥ� ['2048'] �Τ褦��ʸ���������ޤ���
key ����ʸ����ʸ������̤��ޤ���
#@end

--- fetch(key)
--- fetch(key, default)
--- fetch(key) {|hash| .... }
#@todo

--- size
--- length
#@todo

���Υ᥽�åɤ� obsolete �Ǥ���

--- basic_auth(account, password)
#@todo

Authorization: �إå��� BASIC ǧ���Ѥ˥��åȤ��ޤ���

--- content_length
--- content_length=(len)
#@todo

Content-Length: �إå����� (����)��

--- content_type
#@todo

--- content_type=(type)
--- set_content_type(type, params = {})
#@todo

--- main_type
#@todo

--- sub_type
#@todo

--- type_params
#@todo

--- form_data=(params)
--- set_form_data(params, sep = '&')
#@todo

--- content_range
#@todo

Content-Range: �إå��ե�����ɤ��ͤ� Range ���֤��ޤ���
Range ��ɽ�魯Ĺ���� [[m:Net::HTTPHeader#range_length]] �������ޤ���

--- range_length
#@todo

Content-Range: �إå��ե�����ɤ�ɽ���Ƥ���Ĺ�����������֤��ޤ���

--- delete(key)
#@todo

key �إå��ե�����ɤ������ޤ���

--- each {|name, val| .... }
--- each_header {|name, val| .... }
#@todo

�إå�̾�Ȥ����ͤ��Ф��뤯�꤫�������إå�̾�Ͼ�ʸ�������줵��ޤ���

--- each_capitalized {|name, value| .... }
--- canonical_each {|name, value| .... }
#@todo

�إå��ե�����ɤ�����̾�Ȥ����ͤΥڥ����Ф��Ʒ����֤��ޤ���

--- each_capitalized_name {|name| .... }
#@todo

--- each_name {|name| ... }
--- each_key {|name| ... }
#@todo

--- each_value {|value| .... }
#@todo

--- key?(key)
#@todo

key �Ȥ����إå��ե�����ɤ�����п����֤��ޤ���
key ����ʸ����ʸ������̤��ޤ���

--- method
#@todo

�ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ������֤��ޤ���

--- path
#@todo

�ꥯ�����Ȥ��� path ��ʸ������֤��ޤ���

--- proxy_basic_auth(account, password)
#@todo

Proxy ǧ�ڤΤ���� Proxy-Authorization: �إå��򥻥åȤ��ޤ���

--- range
#@todo

Range: �إå��μ����ϰϤ� Range ���֥������Ȥ��֤��ޤ���

--- range=(r)
--- set_range(i, len)
#@todo

�ϰϤ���ꤷ�ƥ���ƥ��ƥ���������뤿��Υإå� Range: �򥻥åȤ��ޤ���
r �� Range ���֥������ȡ�i, len �ϻ�����Ĺ���Ǥ���
= class Net::HTTPRequest < Object

include Net::HTTPHeader

HTTP �ꥯ�����Ȥ���ݲ����륯�饹�Ǥ���
Net::HTTPRequest ����ݥ��饹�ʤΤǼºݤˤϥ��֥��饹��

  * [[c:Net::HTTP::Get]]
  * [[c:Net::HTTP::Head]]
  * [[c:Net::HTTP::Post]]
  * [[c:Net::HTTP::Put]]
  * [[c:Net::HTTP::Copy]]
  * [[c:Net::HTTP::Delete]]
  * [[c:Net::HTTP::Lock]]
  * [[c:Net::HTTP::Mkcol]]
  * [[c:Net::HTTP::Move]]
  * [[c:Net::HTTP::Options]]
  * [[c:Net::HTTP::Propfind]]
  * [[c:Net::HTTP::Proppatch]]
  * [[c:Net::HTTP::Trace]]
  * [[c:Net::HTTP::Unlock]]

����Ѥ��Ƥ���������

=== ��

  require 'net/http'
  http = Net::HTTP.new('www.example.com', 80)
  req = Net::HTTP::Get.new('/somefile')
  res = http.request(req)
  print res.body

== Class Methods

--- new(path, initheader = nil)
#@todo

HTTP �ꥯ�����ȥ��֥������Ȥ��������ޤ���
�ꥯ�����Ȥ��� path ��ʸ�����Ϳ���ޤ���

== Instance Methods

--- inspect
#@todo

--- body_exist?
#@todo

#@since 1.8.0
--- body
--- body=(body)
#@todo

�����Ф�����ꥯ�����ȤΥ���ƥ��ƥ��ܥǥ���ʸ��������ꤷ�ޤ���
#@end

#@since 1.9.1
--- body_stream
--- body_stream=(f)
#@todo

�����Ф�����ꥯ�����ȤΥ���ƥ��ƥ��ܥǥ���
[[c:IO]] ���֥������ȤʤɤΥ��ȥ꡼������ꤷ�ޤ���
read(size) �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���
#@end

--- method
#@todo

�ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ������֤��ޤ���

--- path
#@todo

�ꥯ�����Ȥ��� path ��ʸ������֤��ޤ���

--- request_body_permitted?
#@todo

�ꥯ�����Ȥ˥���ƥ��ƥ��ܥǥ���������뤳�Ȥ�������Ƥ���
HTTP �᥽�å� (POST �ʤ�)�ξ�翿���֤��ޤ���

--- response_body_permitted?
#@todo

�����Ф���Υ쥹�ݥ󥹤˥���ƥ��ƥ��ܥǥ���ޤळ�Ȥ�������Ƥ���
HTTP �᥽�å� (GET, POST �ʤ�)�ξ�翿���֤��ޤ���



= class Net::HTTP::Head < Net::HTTPRequest

= class Net::HTTP::Get < Net::HTTPRequest

= class Net::HTTP::Post < Net::HTTPRequest

= class Net::HTTP::Put < Net::HTTPRequest

= class Net::HTTP::Copy < Net::HTTPRequest

= class Net::HTTP::Delete < Net::HTTPRequest

= class Net::HTTP::Lock < Net::HTTPRequest

= class Net::HTTP::Mkcol < Net::HTTPRequest

= class Net::HTTP::Move < Net::HTTPRequest

= class Net::HTTP::Options < Net::HTTPRequest

= class Net::HTTP::Propfind < Net::HTTPRequest

= class Net::HTTP::Proppatch < Net::HTTPRequest

= class Net::HTTP::Trace < Net::HTTPRequest

= class Net::HTTP::Unlock < Net::HTTPRequest

= class Net::HTTPResponse < Object

include Net::HTTPHeader

HTTP �쥹�ݥ󥹤�ɽ�����륯�饹�Ǥ���
Net::HTTP ���饹�ϼºݤˤ� HTTPResponse �Υ��֥��饹���֤��ޤ���

== Class Methods

--- new(http_version, result_code, message)
#@todo

�饤�֥�������ѥ᥽�åɤǤ����Ȥ�ʤ��Ǥ���������

--- body_permitted?
#@todo

== Instance Methods

--- code
#@todo

HTTP �Υꥶ��ȥ����ɤǤ����㤨�� '302' �ʤɤǤ���

--- message
--- msg
#@todo

HTTP �����Ф��ꥶ��ȥ����ɤ��ղä����֤���å������Ǥ���
�㤨�� 'Not Found' �ʤɤǤ���

--- http_version
#@todo

�����Ф����ݡ��Ȥ��Ƥ��� HTTP �ΥС�������ʸ������֤��ޤ���

#@since 1.8.0
--- to_ary
#@todo
#@end

--- value
#@todo

--- response
--- header
--- reader_header
#@todo

�ߴ������ݤĤ��������Ƴ�����줿�᥽�åɤǤ���
�Ȥ�ʤ��Ǥ���������

--- body
--- entity
#@todo

����ƥ��ƥ��ܥǥ��Ǥ���
[[m:Net::HTTPResponse#read_body]] ��Ƥ�Ǥ���Ф��ΰ��� dest��
�Ƥ�Ǥ��ʤ���Х���ƥ��ƥ��ܥǥ���ʸ����Ȥ����ɤߤ�����֤��ޤ���

--- read_body(dest = '')
#@todo

����ƥ��ƥ��ܥǥ�������� dest �� << �᥽�åɤ�Ȥäƽ񤭤��ߤޤ���
Ʊ�� HTTPResponse ���֥������Ȥ��Ф������ʾ�ƤФ줿��硢
����ܤ���Ϥʤˤ⤻���˰���ܤ�����ͤ򤽤Τޤ��֤��ޤ���

--- read_body {|str| .... }
#@todo

����ƥ��ƥ��ܥǥ��򾯤����ļ������ƽ缡�֥�å���Ϳ���ޤ���


= class Net::HTTPUnknownResponse < Net::HTTPResponse

= class Net::HTTPInformation < Net::HTTPResponse
1xx
= class Net::HTTPSuccess < Net::HTTPResponse
2xx
= class Net::HTTPRedirection < Net::HTTPResponse
3xx
= class Net::HTTPClientError < Net::HTTPResponse
4xx
= class Net::HTTPServerError < Net::HTTPResponse
5xx

= class Net::HTTPContinue < Net::HTTPInformation
100
= class Net::HTTPSwitchProtocol < Net::HTTPInformation
101

= class Net::HTTPOK < Net::HTTPSuccess
200
= class Net::HTTPCreated < Net::HTTPSuccess
201
= class Net::HTTPAccepted < Net::HTTPSuccess
202
= class Net::HTTPNonAuthoritativeInformation < Net::HTTPSuccess
203
= class Net::HTTPNoContent < Net::HTTPSuccess
204
= class Net::HTTPResetContent < Net::HTTPSuccess
205
= class Net::HTTPPartialContent < Net::HTTPSuccess
206

= class Net::HTTPMultipleChoice < Net::HTTPRedirection
300
= class Net::HTTPMovedPermanently < Net::HTTPRedirection
301
= class Net::HTTPFound < Net::HTTPRedirection
302
#@# alias: Net::HTTPMovedTemporarily
= class Net::HTTPSeeOther < Net::HTTPRedirection
303
= class Net::HTTPNotModified < Net::HTTPRedirection
304
= class Net::HTTPUseProxy < Net::HTTPRedirection
305
#@# 306 unused
= class Net::HTTPTemporaryRedirect < Net::HTTPRedirection
307

= class Net::HTTPBadRequest < Net::HTTPClientError
400
= class Net::HTTPUnauthorized < Net::HTTPClientError
401
= class Net::HTTPPaymentRequired < Net::HTTPClientError
402
= class Net::HTTPForbidden < Net::HTTPClientError
403
= class Net::HTTPNotFound < Net::HTTPClientError
404
= class Net::HTTPMethodNotAllowed < Net::HTTPClientError
405
= class Net::HTTPNotAcceptable < Net::HTTPClientError
406
= class Net::HTTPProxyAuthenticationRequired < Net::HTTPClientError
407
= class Net::HTTPRequestTimeOut < Net::HTTPClientError
408
= class Net::HTTPConflict < Net::HTTPClientError
409
= class Net::HTTPGone < Net::HTTPClientError
410
= class Net::HTTPLengthRequired < Net::HTTPClientError
411
= class Net::HTTPPreconditionFailed < Net::HTTPClientError
412
= class Net::HTTPRequestEntityTooLarge < Net::HTTPClientError
413
= class Net::HTTPRequestURITooLong < Net::HTTPClientError
#@# alias: Net::HTTPRequestURITooLarge
414
= class Net::HTTPUnsupportedMediaType < Net::HTTPClientError
415
= class Net::HTTPRequestedRangeNotSatisfiable < Net::HTTPClientError
416
= class Net::HTTPExpectationFailed < Net::HTTPClientError
417

= class Net::HTTPInternalServerError < Net::HTTPServerError
500
= class Net::HTTPNotImplemented < Net::HTTPServerError
501
= class Net::HTTPBadGateway < Net::HTTPServerError
502
= class Net::HTTPServiceUnavailable < Net::HTTPServerError
503
= class Net::HTTPGatewayTimeOut < Net::HTTPServerError
504
= class Net::HTTPVersionNotSupported < Net::HTTPServerError
505
