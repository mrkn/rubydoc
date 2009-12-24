���ѥǡ���ž���ץ�ȥ��� HTTP �򰷤��饤�֥��Ǥ���
������ [[RFC:2616]] �˴𤭤ޤ���

=== ������

==== �����֥����Ф���ɥ�����Ȥ����� (GET)

��1: GET ���� ɽ���������
  require 'net/http'
  Net::HTTP.get_print 'www.example.com', '/index.html'

��2: [[c:URI]] ��Ȥ�
  require 'net/http'
  require 'uri'
  Net::HTTP.get_print URI.parse('http://www.example.com/index.html')

��3: �������Ū����

  require 'net/http'
  require 'uri'
  
  url = URI.parse('http://www.example.com/index.html')
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.get('/index.html')
  }
  puts res.body

��4: ������ꤵ�������Ū����
  require 'net/http'
  
  url = URI.parse('http://www.example.com/index.html')
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  puts res.body

==== �ե�����ξ������������ (POST)
  require 'net/http'
  require 'uri'

  #��1: POST�������
  res = Net::HTTP.post_form(URI.parse('http://www.example.com/search'),
                            {'q'=>'ruby', 'max'=>'50'})
  puts res.body
  
  #��2: ǧ���դ��� POST ����
  res = Net::HTTP.post_form(URI.parse('http://jack:pass@www.example.com/todo.cgi'),
                            {'from'=>'2005-01-01', 'to'=>'2005-03-31'})
  puts res.body

  #��3: ���٤������椹��
  url = URI.parse('http://www.example.com/todo.cgi')
  req = Net::HTTP::Post.new(url.path)
  req.basic_auth 'jack', 'pass'
  req.set_form_data({'from'=>'2005-01-01', 'to'=>'2005-03-31'}, ';')
  res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
  case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    # OK
  else
    res.value
  end

==== �ץ�����ͳ�Υ�������

[[m:Net::HTTP.Proxy]] �ϥץ�����ͳ�Ǥ���³��Ԥʤ����饹��
���������֤��ޤ������Υ��饹�� [[c:Net::HTTP]] ��Ʊ��
�᥽�åɤ������Ʊ���褦��ư��򤷤ޤ���������
��³����ݤˤϾ�˥ץ�����ͳ�Ȥʤ�ޤ���
  require 'net/http'
  
  proxy_addr = 'your.proxy.host'
  proxy_port = 8080
          :
  Net::HTTP::Proxy(proxy_addr, proxy_port).start('www.example.com') {|http|
    # always connect to your.proxy.addr:8080
          :
  }

�ޤ� [[m:Net::HTTP.Proxy]] ���������� nil ���� 
Net::HTTP ���Ȥ��֤��Τ�
��Υ����ɤΤ褦�˽񤤤Ƥ����Хץ����ʤ��ξ��ˤ��б��Ǥ��ޤ���

[[m:Net::HTTP.Proxy]] �ˤϥ桼��̾�ȥѥ���ɤ���
���ץ������������ꡢ�ʲ��Τ褦�ˤ���
�ץ�����ǧ�ڤ򤹤뤳�Ȥ��Ǥ��ޤ���
  proxy_host = 'your.proxy.host'
  proxy_port = 8080
  uri = URI.parse(ENV['http_proxy'])
  proxy_user, proxy_pass = uri.userinfo.split(/:/) if uri.userinfo
  Net::HTTP::Proxy(proxy_host, proxy_port,
                   proxy_user, proxy_pass).start('www.example.com') {|http|
    # always connect to your.proxy.addr:8080 using specified username and password
          :
  }
���Υ饤�֥��ϴĶ��ѿ� HTTP_PROXY ����ڹ�θ���ʤ�����
����դ��Ƥ����������ץ�����Ȥ��������Ͼ����Τ褦��
����Ū�˼�갷��ʤ���Фʤ�ޤ���

==== ������쥯�Ȥ��б�����
�ʲ������ fetch �ϥ�����쥯�Ȥ��б����Ƥ��ޤ���
limit ����ʾ������쥯�Ȥ����饨�顼�ˤ��ޤ���

  require 'net/http'
  require 'uri'
  
  def fetch(uri_str, limit = 10)
    # You should choose better exception. 
    raise ArgumentError, 'HTTP redirect too deep' if limit == 0

    response = Net::HTTP.get_response(URI.parse(uri_str))
    case response
    when Net::HTTPSuccess
      response
    when Net::HTTPRedirection
      fetch(response['location'], limit - 1)
    else
      response.value
    end
  end

  print fetch('http://www.example.org')

���ܤ����� [[c:Net::HTTPResponse]]�� [[c:Net::HTTPSuccess]]��
[[c:Net::HTTPRedirection]] �򻲾Ȥ��Ƥ���������

==== Basic ǧ��

  require 'net/http'
  
  Net::HTTP.start('www.example.com') {|http|
    req = Net::HTTP::Get.new('/secret-page.html')
    req.basic_auth 'account', 'password'
    response = http.request(req)
    print response.body
  }


#@# === �㳰

#@# get��head��post �᥽�åɤ�ȯ������ HTTP �ץ�ȥ����Ϣ���㳰�Ȥ��ơ�
#@# �ʲ��˵󤲤��Τ�����ޤ���
#@# �����˵󤲤��㳰���饹�οƥ��饹�Ϥ��٤� Net::ProtocolError ���饹�ǡ�
#@# response �᥽�åɤˤ�äƥ��顼�θ����Ȥʤä��쥹�ݥ󥹥��֥������Ȥ�
#@# ���뤳�Ȥ��Ǥ��ޤ���

#@# : ProtoRetriableError
#@#     HTTP ���ơ����������� 3xx �������ä�����ȯ�����ޤ���
#@#     �꥽��������ư�����ʤɤ���ͳ�ˤ�ꡢ�ꥯ�����Ȥ�λ������ˤϹ���
#@#     �륢�������ɬ�פˤʤ�ޤ���
#@# : ProtoFatalError
#@#     HTTP ���ơ����������� 4xx �������ä�����ȯ�����ޤ���
#@#     ���饤����ȤΥꥯ�����Ȥ˸�꤬���뤫�������Ф˥ꥯ�����Ȥ���ݤ�
#@#     �줿(ǧ�ڤ�ɬ�ס��꥽������¸�ߤ��ʤ��ʤɤ�)���Ȥ򼨤��ޤ���
#@# : ProtoServerError
#@#     HTTP ���ơ����������� 5xx �������ä�����ȯ�����ޤ���
#@#     �����Ф��ꥯ�����Ȥ������˥��顼��ȯ���������Ȥ򼨤��ޤ���
#@# : ProtoUnknownError
#@#     �ץ�ȥ���ΥС�����󤬾夬�ä������뤤�ϥ饤�֥��ΥХ��ʤɤǡ�
#@#     �饤�֥�꤬�б����Ƥ��ʤ�������ȯ�����ޤ�����

=== �ե�������ͤζ��ڤ�ʸ���ˤĤ���

POST�� application/x-www-form-urlencoded �Ȥ���ʣ���Υե�������ͤ������硢
���߹����Ԥʤ��Ƥ���Τϡ� name0=value0&name1=value1 �Τ褦�˥���ѥ����
(`&') �Ƕ��ڤ��꤫���Ǥ���
������ˡ�ϡ�[[RFC:1866]] Hypertext Markup Language - 2.0 �ǽ��Ƹ������о줷��
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


=== ���������ͤؤ��ѹ��Ȱܹ����֤ˤĤ���

net/http 1.1 (Ruby 1.6�˴ޤޤ�Ƥ��ޤ�)�ε�ư��Ȥ��������ˤ�
[[m:Net::HTTP.version_1_1]] ��Ƥ�Ǥ���������
���θ� [[m:Net::HTTP.version_1_2]] ��Ƥ֤ȵ�ư�� 1.2 ��
���ޤ���

  # example
  Net::HTTP.start {|http1| ...(http1 has 1.2 features)... }
  
  Net::HTTP.version_1_1
  Net::HTTP.start {|http2| ...(http2 has 1.1 features)... }
  
  Net::HTTP.version_1_2
  Net::HTTP.start {|http3| ...(http3 has 1.2 features)... }

�����������ε�ǽ�ϥ���åɥ����դǤϤ���ޤ���
�Ĥޤꡢʣ������åɤǤ��줾��� version_1_1 �� version_1_2 ��Ƥ����硢
������������ Net::HTTP ���֥������Ȥ��ɤ���ΥС������ˤʤ뤫���ݾڤǤ��ޤ���
���ץꥱ����������ΤǤɤ��餫�ΥС������˸��ꤹ��ɬ�פ�����ޤ���

�̾盧�ε�ǽ�ϻȤ�ʤ��Ϥ��Ǥ���1.2��������Ѥ��Ƥ���������

= class Net::HTTP < Object
alias HTTPSession

HTTP �Υ��饤����ȤΤ���Υ��饹�Ǥ���

== Class Methods

--- new(address, port = 80, proxy_addr = nil, proxy_port = nil, proxy_user=nil, proxy_pass=nil) -> Net::HTTP

������ [[c:Net::HTTP]] ���֥������Ȥ��������ޤ���

proxy_addr ��Ϳ����ȥץ�����𤷤���³���륪�֥������Ȥ�
�������ޤ������ΤȤ��� proxy_user����ꤹ��ȥץ�����ǧ�ڤ�
�Ԥ��ޤ�

���Υ᥽�åɤ� TCP ���ͥ�������ĥ��ޤ���

@param address ��³����ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@param port ��³����ݡ����ֹ����ꤷ�ޤ���
@param proxy_addr �ץ����Υۥ���̾����ꤷ�ޤ�����ά�������ˤ�ľ����³���ޤ���
@param proxy_port �ץ����Υۥ���̾����ꤷ�ޤ���
@param proxy_user �ץ�����ǧ�ڤΥ桼��̾����ꤷ�ޤ�����ά�������ˤ�ǧ�ڤϤʤ���ޤ���
@param proxy_pass �ץ�����ǧ�ڤΥѥ���ɤ���ꤷ�ޤ���


--- start(address, port = 80, proxy_addr = nil, proxy_port = nil, proxy_user=nil, proxy_pass=nil) -> Net::HTTP
--- start(address, port = 80, proxy_addr = nil, proxy_port = nil, proxy_user=nil, proxy_pass=nil) {|http| .... } -> object

������ [[c:Net::HTTP]] ���֥������Ȥ���������
TCP ���ͥ������ HTTP ���å����򳫻Ϥ��ޤ���

�֥�å���Ϳ�������ˤ������������֥������Ȥ򤽤Υ֥�å���
�Ϥ����֥�å�������ä��Ȥ�����³���Ĥ��ޤ������ΤȤ���
�֥�å����ͤ��֤��ͤȤ��ޤ���

�֥�å���Ϳ���ʤ��ä����ˤ������������֥������Ȥ��Ϥ��ޤ���
���Ѹ�ˤϤ��Υ��֥������Ȥ� [[c:Net::HTTP#finish]] ���Ƥ���������

���Υ᥽�åɤϰʲ���Ʊ���Ǥ���

  Net::HTTP.new(address, port, proxy_addr, proxy_port, proxy_user, proxy_pass).start(&block)

@param address ��³����ۥ���̾��ʸ����ǻ��ꤷ�ޤ���
@param port ��³����ݡ����ֹ����ꤷ�ޤ���
@param proxy_addr �ץ����Υۥ���̾����ꤷ�ޤ�����ά�������ˤ�ľ����³���ޤ���
@param proxy_port �ץ����Υۥ���̾����ꤷ�ޤ���
@param proxy_user �ץ�����ǧ�ڤΥ桼��̾����ꤷ�ޤ�����ά�������ˤ�ǧ�ڤϤʤ���ޤ���
@param proxy_pass �ץ�����ǧ�ڤΥѥ���ɤ���ꤷ�ޤ���
@see [[m:Net::HTTP.new]], [[m:Net::HTTP#start]]

--- get(uri) -> String
--- get(host, path, port = 80) -> String
���ꤷ���оݤ� GET �ꥯ�����Ȥ����ꡢ���Υܥǥ���
ʸ����Ȥ����֤��ޤ���

�оݤλ�����ˡ�� [[c:URI]] �ǻ��ꤹ�뤫��
(host, port, path) �ǻ��ꤹ�뤫�Τ����줫�Ǥ���

@param uri �ǡ����μ����оݤ� [[c:URI]] �ǻ��ꤷ�ޤ���
@param host ��³��Υۥ��Ȥ�ʸ����ǻ��ꤷ�ޤ���
@param path �ǡ�����¸�ߤ���ѥ���ʸ����ǻ��ꤷ�ޤ���
@param port ��³����ݡ��Ȥ������ǻ��ꤷ�ޤ���
@see [[m:Net::HTTP#get]]

--- get_print(uri) -> ()
--- get_print(host, path, port = 80) -> ()
���ꤷ���оݤ��� HTTP �ǥ���ƥ��ƥ��ܥǥ����������
[[m:$stdout]] �˽��Ϥ��ޤ���

�оݤλ�����ˡ�� [[c:URI]] �ǻ��ꤹ�뤫��
(host, port, path) �ǻ��ꤹ�뤫�Τ����줫�Ǥ���

@param uri �ǡ����μ����оݤ� [[c:URI]] �ǻ��ꤷ�ޤ���
@param host ��³��Υۥ��Ȥ�ʸ����ǻ��ꤷ�ޤ���
@param path �ǡ�����¸�ߤ���ѥ���ʸ����ǻ��ꤷ�ޤ���
@param port ��³����ݡ��Ȥ������ǻ��ꤷ�ޤ���
@see [[m:Net::HTTP.get]]

=== ��
  Net::HTTP.get_print URI.parse('http://www.example.com/index.html')
�⤷����
  Net::HTTP.get_print 'www.example.com', '/index.html'

--- get_response(uri) -> Net::HTTPResponse
--- get_response(host, path = nil, port = nil) -> Net::HTTPResponse
���ꤷ���оݤ� GET �ꥯ�����Ȥ����ꡢ���Υ쥹�ݥ󥹤�
[[c:Net::HTTPResponse]] �Ȥ����֤��ޤ���

�оݤλ�����ˡ�� [[c:URI]] �ǻ��ꤹ�뤫��
(host, port, path) �ǻ��ꤹ�뤫�Τ����줫�Ǥ���

@param uri �ǡ����μ����оݤ� [[c:URI]] �ǻ��ꤷ�ޤ���
@param host ��³��Υۥ��Ȥ�ʸ����ǻ��ꤷ�ޤ���
@param path �ǡ�����¸�ߤ���ѥ���ʸ����ǻ��ꤷ�ޤ���
@param port ��³����ݡ��Ȥ������ǻ��ꤷ�ޤ���
@see [[m:Net::HTTP#get]]

#@since 1.8.3
--- post_form(uri, params) -> Net::HTTPResponse
[[c:URI]] �ǻ��ꤷ���оݤ� �ե�����Υǡ����� HTTP �� 
POST ���ޤ���

����ǡ����� param ��ʸ���󤫤�ʸ����ؤ� [[c:Hash]] �Ȥ���
�Ϥ��ޤ���

@param uri POST �����оݤ� [[c:URI]] �ǻ��ꤷ�ޤ���
@param param POST ����ǡ����Ǥ���

#@end

--- proxy_address -> String|nil
���Ȥ� ([[m:Net::HTTP.Proxy]] �ˤ�äƺ������줿) 
�ץ����ѤΥ��饹�ʤ�Хץ����Υ��ɥ쥹���֤��ޤ���

�����Ǥʤ���� nil ���֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

--- proxy_port -> Integer|nil
���Ȥ� ([[m:Net::HTTP.Proxy]] �ˤ�äƺ������줿) 
�ץ����ѤΥ��饹�ʤ�Хץ����Υݡ����ֹ���֤��ޤ���

�����Ǥʤ���� nil ���֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

--- proxy_pass -> String|nil
���Ȥ� ([[m:Net::HTTP.Proxy]] �ˤ�äƺ������줿) 
�ץ����ѤΥ��饹�ʤ�Хץ���ǧ�ڤΥѥ���ɤ��֤��ޤ���

�����Ǥʤ���� nil ���֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

--- proxy_user -> String|nil
���Ȥ� ([[m:Net::HTTP.Proxy]] �ˤ�äƺ������줿) 
�ץ����ѤΥ��饹�ǡ����ĥץ�����ǧ�ڤ����Ѥ������
�ץ���ǧ�ڤΥ桼��̾���֤��ޤ���

�����Ǥʤ���� nil ���֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

#@# --- socket_type -> Net::BufferedIO
#@# 
#@# ���Υ᥽�åɤ� obsolete �Ǥ���

--- Proxy(address, port = 80) -> Class

Proxy ��ͳ�� http �����Ф���³���뤿��Υ��饹��������֤��ޤ���

���Υ��饹�� Net::HTTP ��Ѿ����Ƥ���Τ� Net::HTTP ������
Ʊ���褦�˻Ȥ��ޤ������ꤵ�줿�ץ������˷�ͳ���� http ������
����³���ޤ���

address �� nil �ΤȤ��� Net::HTTP ���饹�򤽤Τޤ��֤��ޤ���

��1: [[m:Net::HTTP.new]] ��Ȥ�
  require 'net/http'
  proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  http = proxy_class.new('www.example.org')
  http.start {|h|
    h.get('/ja/') # proxy.example.com ��ͳ����³���ޤ���
  }
��2: [[m:Net::HTTP.start]] ��Ȥ�
  require 'net/http'
  proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  proxy_class.start('www.example.org') {|h|
    h.get('/ja/') # proxy.example.com ��ͳ����³���ޤ���
  }

@param address �ץ����Υۥ���̾��ʸ�����Ϳ���ޤ���
@param port �ץ����Υݡ����ֹ��Ϳ���ޤ���

--- proxy_class? -> bool

���Ȥ� ([[m:Net::HTTP.Proxy]] �ˤ�äƺ������줿) �ץ����ѤΥ��饹�ʤ�п����֤��������Ǥʤ���е����֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

#@since 1.8.3
--- http_default_port -> Integer
--- default_port -> Integer
HTTP �Υǥե���ȥݡ��� (80) ���֤��ޤ���

--- https_default_port -> Integer
HTTPS �Υǥե���ȥݡ��� (443) ���֤��ޤ���

#@end

--- version_1_1 -> ()
�饤�֥���ư���С������1.1�ߴ��ˤ��ޤ���

@see [[m:Net::HTTP.version_1_2]], [[m:Net::HTTP.version_1_1?]]
     [[m:Net::HTTP.version_1_2?]]

--- version_1_1? -> bool
--- is_version_1_1? -> bool 
�饤�֥���ư��С������1.1�ߴ��Ǥ�����˿����֤��ޤ���

@see [[m:Net::HTTP.version_1_1]], [[m:Net::HTTP.version_1_2]]
     [[m:Net::HTTP.version_1_2?]]

--- version_1_2 -> ()
�饤�֥���ư���С������1.2�ߴ����Ĥޤ�
�̾��ư��ˤ��ޤ���

@see [[m:Net::HTTP.version_1_1]], [[m:Net::HTTP.version_1_1?]]
     [[m:Net::HTTP.version_1_2?]]

--- version_1_2? -> bool
--- is_version_1_2? -> bool 
�饤�֥���ư��С������1.2�ߴ��Ǥ�����˿����֤��ޤ���

@see [[m:Net::HTTP.version_1_1]], [[m:Net::HTTP.version_1_2]]
     [[m:Net::HTTP.version_1_1?]]

== Instance Methods

--- start -> self
--- start {|http| .... } -> object

TCP ���ͥ�������ĥ�ꡢHTTP ���å����򳫻Ϥ��ޤ���
���Ǥ˥��å���󤬳��Ϥ��Ƥ������㳰 IOError ��ȯ�����ޤ���

�֥�å���Ϳ�������ˤϼ�ʬ���Ȥ򤽤Υ֥�å���
�Ϥ����֥�å�������ä��Ȥ�����³���Ĥ��ޤ������ΤȤ���
�֥�å����ͤ��֤��ͤȤ��ޤ���

�֥�å���Ϳ���ʤ��ä����ˤϼ�ʬ���Ȥ��֤��ޤ���
���Ѹ�ˤϤ��Υ��֥������Ȥ� [[c:Net::HTTP#finish]] ���Ƥ���������

@raise IOError ���Ǥ˥��å���󤬳��Ϥ��Ƥ�������ȯ�����ޤ���

--- started? -> bool
--- active? -> bool

HTTP ���å���󤬳��Ϥ���Ƥ����鿿���֤��ޤ���

active? �ϻ����٤�Υ᥽�åɤǤ���

--- set_debug_output(io) -> ()

�ǥХå����Ϥν��������ꤷ�ޤ���
���Υ᥽�åɤϿ���ʥ������ƥ��ۡ���θ���
�ˤʤ뤿�ᡢ�ǥХå��ʳ��ǤϷ褷�ƻȤ�ʤ��Ǥ���������

io �� nil ����ꤹ��ȥǥХå����Ϥ�ߤ�ޤ���

@param io ���������ꤷ�ޤ������Υ��֥������Ȥ� 
          �᥽�å� << ����äƤ���ɬ�פ�����ޤ���

  http.set_debug_output($stderr)


--- close_on_empty_response -> bool
�쥹�ݥ󥹤��ܥǥ�����äƤ��ʤ����˥��ͥ�������
�Ĥ��뤫�ɤ������֤��ޤ���

�ǥե���ȤǤϵ�(�Ĥ��ʤ�)�Ǥ���

@see [[m:Net::HTTP#close_on_empty_response=]]

--- close_on_empty_response=(bool)
�쥹�ݥ󥹤��ܥǥ�����äƤ��ʤ����˥��ͥ�������
�Ĥ��뤫�ɤ��������ꤷ�ޤ���


@param bool �쥹�ݥ󥹤��ܥǥ�����äƤ��ʤ����˥��ͥ�������
            �Ĥ��뤫�ɤ������ꤷ�ޤ���

@see [[m:Net::HTTP#close_on_empty_response]]

--- address -> String

��³���륢�ɥ쥹���֤��ޤ���

@see [[m:Net::HTTP.new]]
--- port -> Integer

��³����ݡ����ֹ���֤��ޤ���

@see [[m:Net::HTTP.new]]
--- proxy? -> bool

�ץ�����𤷤���³����ʤ鿿���֤��ޤ���

@see [[m:Net::HTTP.Proxy]]

--- proxy_address -> String|nil
--- proxyaddr -> String|nil

�ץ�����ͳ����³���� HTTP ���֥������Ȥʤ�ץ����Υ��ɥ쥹
���֤��ޤ���

�����Ǥʤ��ʤ� nil ���֤��ޤ���

proxyaddr �ϻ����٤�Υ᥽�åɤǤ���

@see [[m:Net::HTTP.Proxy]]

--- proxy_port -> Integer|nil
--- proxyport -> Integer|nil

�ץ�����ͳ����³���� HTTP ���֥������Ȥʤ�ץ����Υݡ����ֹ�
���֤��ޤ���

�����Ǥʤ��ʤ� nil ���֤��ޤ���

proxyport �ϻ����٤�Υ᥽�åɤǤ���
@see [[m:Net::HTTP.Proxy]]
--- proxy_pass -> String|nil
�ץ�����ͳ����³��������˥ץ����Υ桼��ǧ�ڤ�
���� HTTP ���֥������Ȥʤ�ǧ�ڤΥѥ���ɤ�
���֤��ޤ���

�����Ǥʤ��ʤ� nil ���֤��ޤ���
@see [[m:Net::HTTP.Proxy]]

--- proxy_user -> String|nil
�ץ�����ͳ����³��������˥ץ����Υ桼��ǧ�ڤ�
���� HTTP ���֥������Ȥʤ�ǧ�ڤΥ桼��̾��
���֤��ޤ���

�����Ǥʤ��ʤ� nil ���֤��ޤ���
@see [[m:Net::HTTP.Proxy]]

--- open_timeout -> Integer
��³�����Ԥĺ����ÿ����֤��ޤ���

�����ÿ����äƤ⥳�ͥ������
�����ʤ�����㳰 [[c:TimeoutError]] ��ȯ�����ޤ���
�ǥե���Ȥ� 30 (��)�Ǥ���

@see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout=]]

--- open_timeout=(seconds)
��³�����Ԥĺ����ÿ������ꤷ�ޤ���

�����ÿ����äƤ⥳�ͥ������
�����ʤ�����㳰 [[c:TimeoutError]] ��ȯ�����ޤ���

@param second �Ԥ��ÿ�����ꤷ�ޤ���
@see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout]]

--- read_timeout -> Integer
�ɤߤ���([[man:read(2)]]) ���ǥ֥�å����Ƥ褤�����ÿ�
���֤��ޤ���

�����ÿ����äƤ��ɤߤ���ʤ�����㳰 [[c:TimeoutError]]
��ȯ�����ޤ���
�ǥե���Ȥ� 60 (��)�Ǥ���

@see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout=]]

--- read_timeout=(seconds)

�ɤߤ���([[man:read(2)]]) ���ǥ֥�å����Ƥ褤�����ÿ���
���ꤷ�ޤ���

�����ÿ����äƤ��ɤߤ���ʤ�����㳰 [[c:TimeoutError]]
��ȯ�����ޤ���

@param second �Ԥ��ÿ�����ꤷ�ޤ���
@see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout]]

--- finish -> ()

HTTP ���å�����λ���ޤ������å���󳫻����ˤ��Υ᥽�åɤ�
�ƤФ줿�����㳰 IOError ��ȯ�����ޤ���

@raise IOError ���å���󳫻����˸Ƥ֤�ȯ�����ޤ���

--- get(path, header = nil, dest = nil) -> Net::HTTPResponse
--- get(path, header = nil, dest = nil) {|body_segment| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ����������
[[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ȥ����֤��ޤ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

�֥�å��Ȱ��˸ƤӤ����줿�Ȥ���
����ƥ��ƥ��ܥǥ��򾯤�����ʸ����Ȥ���
�֥�å���Ϳ���ޤ������ΤȤ�����ͤ� 
[[c:Net::HTTPResponse]] ���֥������Ȥ�ͭ���� body ��
�����ޤ���

dest �ϻ����٤�ΰ����Ǥ������Ѥ��ʤ��Ǥ���������
dest ����ꤷ�����ˤ�
�ܥǥ��򾯤����ļ������ƽ缡
��dest << �ܥǥ������ҡפ�¹Ԥ��ޤ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���
@param dest ���Ѥ��ʤ��Ǥ���������

1.1 �ߴ��⡼�ɤξ��ϡ��쥹�ݥ󥹤˱������㳰��ȯ�����ޤ���
�ޤ����֤��ͤ� [�쥹�ݥ󥹥��֥�������, ���Υܥǥ�] �Ȥʤ�ޤ���

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

@see [[m:Net::HTTP#request_get]]

--- head(path, header = nil) -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ��Υإå��Τߤ�������ޤ���
[[c:Net::HTTPResponse]] �Υ��󥹥��󥹤��֤��ޤ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

1.1 �ߴ��⡼�ɤξ��ϡ��쥹�ݥ󥹤˱������㳰��ȯ�����ޤ���

  response = nil
  Net::HTTP.start('some.www.server', 80) {|http|
    response = http.head('/index.html')
  }
  p response['content-type']

@see [[m:Net::HTTP#request_head]]

--- post(path, data, header = nil, dest = nil) -> Net::HTTPResponse
--- post(path, data, header = nil, dest = nil) {|body_segment| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
POST ������ޤ���

�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

�֥�å��Ȱ��˸ƤӤ����줿�Ȥ��ϥ���ƥ��ƥ��ܥǥ��򾯤�����ʸ����Ȥ���
�֥�å���Ϳ���ޤ������ΤȤ�����ͤ� HTTPResponse ���֥������Ȥ�ͭ���� body ��
�����ޤ���

POST ������ˤϥإå��� Content-Type: ����ꤹ��ɬ�פ�����ޤ���
�⤷ header �˻��ꤷ�ʤ��ä��ʤ�С� Content-Type �Ȥ���
"application/x-www-form-urlencoded" ���Ѥ��ޤ���

dest �ϻ����٤�ΰ����Ǥ������Ѥ��ʤ��Ǥ���������
dest ����ꤷ�����ˤ�
�ܥǥ��򾯤����ļ������ƽ缡
��dest << �ܥǥ������ҡפ�¹Ԥ��ޤ���

@param path POST��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���
@param dest ���Ѥ��ʤ��Ǥ���������

1.1 �ߴ��⡼�ɤξ��ϡ��쥹�ݥ󥹤˱������㳰��ȯ�����ޤ���
�ޤ����֤��ͤ� [�쥹�ݥ󥹥��֥�������, ���Υܥǥ�] �Ȥʤ�ޤ���

��:
  # net/http version 1.1 (Ruby 1.6.x)
  response, body = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  
  # version 1.2 (Ruby 1.8.x or later)
  response = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  
  # using block
  File.open('save.html', 'w') {|f|
    http.post('/cgi-bin/search.rb', 'query=subject&target=ruby') do |str|
      f.write str
    end
  }

@see [[m:Net::HTTP#request_post]]

--- request_get(path, header = nil) -> Net::HTTPResponse
--- request_get(path, header = nil) {|response| .... } -> Net::HTTPResponse
--- get2(path, header = nil) -> Net::HTTPResponse
--- get2(path, header = nil) {|response| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ���������ޤ���
[[c:Net::HTTPResponse]] ���֥������Ȥ��֤��ޤ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ�
����ƥ��ƥ��ܥǥ��򥽥��åȤ����ɤ߽Ф����ˡ�
��³��ݻ��������֤� [[c:Net::HTTPResponse]]
���֥������Ȥ�֥�å����Ϥ��ޤ���
�礭�ʥ������Υܥǥ�����٤��ɤߤ����Ȥޤ�����
�����ʥ�������ʬ���Ƽ������������ˤϤ�������Ѥ��ޤ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

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

get2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

@see [[m:Net::HTTP#get]], [[m:Net::HTTPResponse#read_body]]

--- request_head(path, header = nil) -> Net::HTTPResponse
--- request_head(path, header = nil) {|response| .... } -> Net::HTTPResponse
--- head2(path, header = nil) -> Net::HTTPResponse
--- head2(path, header = nil) {|response| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ��Υإå��Τߤ�������ޤ���
[[c:Net::HTTPResponse]] ���֥������Ȥ��֤��ޤ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ�
[[m:Net::HTTP#request_get]] ��Ʊ��ư���
���ޤ��������⤽��إå������׵ᤷ�Ƥ��ʤ��Τ�
body �϶��Ǥ������Τ��ᤳ��ư��Ϥ���ۤɰ�̣�Ϥ���ޤ���

@param path �إå���������륨��ƥ��ƥ��Υѥ���
            ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���


head2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

  response = http.request_head('/index.html')
  p response['content-type']

@see [[m:Net::HTTP#head]]

--- request_post(path, data, header = nil) -> Net::HTTPResponse
--- request_post(path, data, header = nil) {|response| .... } -> Net::HTTPResponse
--- post2(path, data, header = nil) -> Net::HTTPResponse
--- post2(path, data, header = nil) {|response| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
POST ������ޤ���
�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ�
����ƥ��ƥ��ܥǥ��򥽥��åȤ����ɤ߽Ф����ˡ�
��³��ݻ��������֤� [[c:Net::HTTPResponse]]
���֥������Ȥ�֥�å����Ϥ��ޤ���

POST ������ˤϥإå��� Content-Type: ����ꤹ��ɬ�פ�����ޤ���
�⤷ header �˻��ꤷ�ʤ��ä��ʤ�С� Content-Type �Ȥ���
"application/x-www-form-urlencoded" ���Ѥ��ޤ���

@param path POST��Υ���ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param data POST����ǡ�����Ϳ���ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

post2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

  # ��
  response = http.request_post('/cgi-bin/nice.rb', 'datadatadata...')
  p response.status
  puts response.body          # body is already read
  
  # using block
  http.request_post('/cgi-bin/nice.rb', 'datadatadata...') {|response|
    p response.status
    p response['content-type']
    response.read_body do |str|   # read body now
      print str
    end
  }

@see [[m:Net::HTTP#post]], [[m:Net::HTTPResponse#read_body]]



--- put(path, data, initheader = nil) -> Net::HTTPResponse
�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
PUT ������ޤ���

�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param data ����ǡ�����ʸ����ǻ��ꤷ�ޤ���
@param initheader �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

@see [[m:Net::HTTP#request_put]]

1.1 �ߴ��⡼�ɤξ��ϡ��쥹�ݥ󥹤˱������㳰��ȯ�����ޤ���

--- request_put(path, data, initheader = nil) -> Net::HTTPResponse
--- request_put(path, data, initheader = nil) {|response| .... } -> Net::HTTPResponse
--- put2(path, data, initheader = nil) -> Net::HTTPResponse
--- put2(path, data, initheader = nil) {|response| .... } -> Net::HTTPResponse
�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
PUT ������ޤ���

�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

�֥�å��ȤȤ�˸ƤӽФ��줿�Ȥ��ϡ�
�ܥǥ��򥽥��åȤ����ɤ߽Ф����ˡ�
��³��ݻ��������֤� [[c:Net::HTTPResponse]]
���֥������Ȥ�֥�å����Ϥ��ޤ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param data ����ǡ�����ʸ����ǻ��ꤷ�ޤ���
@param initheader �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

put2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

@see [[m:Net::HTTP#put]]


--- send_request(name, path, data = nil, header = nil) -> Net::HTTPResponse
HTTP �ꥯ�����Ȥ򥵡��Ф����ꡢ���Υ쥹�ݥ󥹤�
[[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ȥ����֤��ޤ���

@param name �ꥯ�����ȤΥ᥽�å�̾��ʸ�����Ϳ���ޤ���
@param path �ꥯ�����ȤΥѥ���ʸ�����Ϳ���ޤ���
@param data �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param header �ꥯ�����ȤΥإå���ϥå����Ϳ���ޤ���

  response = http.send_request('GET', '/index.html')
  puts response.body

@see [[m:Net::HTTP#request]]

--- request(request [, data]) -> Net::HTTPResponse
--- request(request [, data]) {|response| .... } -> Net::HTTPResponse

[[c:Net::HTTPRequest]] ���֥������� request �򥵡��Ф��������ޤ���

POST/PUT �λ��� data ��Ϳ�����ޤ� 
(GET/HEAD �ʤɤ�  data ��Ϳ����� 
[[c:ArgumentError]] ��ȯ�����ޤ�)��

�֥�å��ȤȤ�˸ƤӤ����줿�Ȥ���
�����åȤ���ܥǥ����ɤߤ��ޤ��� [[c:Net::HTTPResponse]]
���֥������Ȥ�֥�å���Ϳ���ޤ���

@param request �ꥯ�����ȥ��֥������Ȥ�Ϳ���ޤ���
@param data �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���

@raise ArgumentError data��Ϳ����٤��Ǥʤ��ꥯ�����Ȥ�data��
                     Ϳ��������ȯ�����ޤ���
@see [[m:Net::HTTP#send_request]]

#@# --- inspect
#@# 

#@since 1.8.3
--- copy(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� COPY �ꥯ�����Ȥ�
�إå��� initheader �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Copy]]

--- delete(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� DELETE �ꥯ�����Ȥ�
�إå��� initheader �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Delete]]

--- lock(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� LOCK �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Lock]]

--- mkcol(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� MKCOL �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Mkcol]]

--- move(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� MOVE �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Move]]

--- options(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� OPTIONS �ꥯ�����Ȥ�
�إå��� initheader �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Options]]

--- propfind(path, body, initheader = {'Depth' => '0'}) -> Net::HTTPResponse
�����Ф� path �� PROPFIND �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Propfind]]

--- proppatch(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� PROPPATCH �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Proppatch]]

--- trace(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� TRACE �ꥯ�����Ȥ�
�إå��� initheader �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���

@see [[c:Net::HTTP::Trace]]


--- unlock(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� UNLOCK �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ�������ޤ���

�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::HTTP::Unlock]]


--- use_ssl? -> bool
SSL�����Ѥ�����³������˿����֤��ޤ���

[[lib:net/https]] ��Ȥ�ʤ����ˤϾ�˵����֤��ޤ���

@see [[lib:net/https]], [[lib:openssl]] 

#@end

= module Net::HTTPHeader
HTTP �إå��Τ���Υ⥸�塼��Ǥ���

���Υ⥸�塼��� mix-in �� @header �Ȥ���(�ϥå�����������Ƥ���)
�ѿ��ؤΡ���ʸ����ʸ����̵�뤷���ץϥå���Ū���������᥽�åɤ�
�󶡤��ޤ����ޤ��褯���� HTTP �إå��ؤ������ʥ��������᥽�åɤ�
�Ѱդ��ޤ���

== Instance Methods

#@# --- initialize_http_header(initheader) -> ()
#@# ���Υ⥸�塼��� mix-in �������饹��
#@# ��������˸ƤӤ����� ���Υ⥸�塼��γƥ᥽�å�
#@# �����Ѳ�ǽ�ˤ��ޤ��� 
#@# @param initheader ��������Υإå������Ƥ�
#@#                   {�إå��ե������̾(ʸ����)=>�������(ʸ����)}
#@#                   �Ȥ����ϥå����Ϳ���ޤ���

--- [](key) -> String|nil
key �إå��ե�����ɤ��֤��ޤ���

���Ȥ��Х��� 'content-length' ���Ф��Ƥ�  '2048'
�Τ褦��ʸ���������ޤ���������¸�ߤ��ʤ���� nil ���֤��ޤ���

#@since 1.8.3
�����Υإå��ե�����ɤ���ĤΥإå������ʣ��¸�ߤ���
���ˤϤ�������� ", " ��Ϣ�뤷��ʸ������֤��ޤ���
#@end
key ����ʸ����ʸ������̤��ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���

@see [[m:Net::HTTPHeader#[]=]],
#@since 1.8.3
     [[m:Net::HTTPHeader#add_field]],
     [[m:Net::HTTPHeader#get_fields]]
#@end

--- []=(key, val)
key �إå��ե�����ɤ�ʸ���� val �򥻥åȤ��ޤ���

key �˸������ꤵ��Ƥ����ͤ��˴�����ޤ���
key ����ʸ����ʸ������̤��ޤ���
val �� nil ��Ϳ����Ȥ��Υե�����ɤ������ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���
@param val key�ǻ��ꤷ���ե�����ɤ˥��åȤ���ʸ�����Ϳ���ޤ���

@see [[m:Net::HTTPHeader#[] ]],
#@since 1.8.3
     [[m:Net::HTTPHeader#add_field]],
     [[m:Net::HTTPHeader#get_fields]]
#@end

#@since 1.8.3
--- add_field(key, val) -> ()

key �إå��ե�����ɤ� val ���ɲä��ޤ���

key �˸������ꤵ��Ƥ����ͤ��˴����줺������� val �ɲä���ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���
@param val key�ǻ��ꤷ���ե�����ɤ��ɲä���ʸ�����Ϳ���ޤ���
@see [[m:Net::HTTPHeader#[] ]], [[m:Net::HTTPHeader#[]=]],
     [[m:Net::HTTPHeader#get_fields]]

��:
  request.add_field 'X-My-Header', 'a'
  p request['X-My-Header']              #=> "a"
  p request.get_fields('X-My-Header')   #=> ["a"]
  request.add_field 'X-My-Header', 'b'
  p request['X-My-Header']              #=> "a, b"
  p request.get_fields('X-My-Header')   #=> ["a", "b"]
  request.add_field 'X-My-Header', 'c'
  p request['X-My-Header']              #=> "a, b, c"
  p request.get_fields('X-My-Header')   #=> ["a", "b", "c"]
   
--- get_fields(key) -> [String]
key �إå��ե�����ɤ��� (ʸ����) ��������֤��ޤ���

���Ȥ��Х��� 'content-length' ���Ф��Ƥ� ['2048'] �Τ褦��
ʸ���������ޤ��������Υإå��ե�����ɤ���ĤΥإå�����
��ʣ��¸�ߤ��뤳�Ȥ����ꤨ�ޤ���
key ����ʸ����ʸ������̤��ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���
@see [[m:Net::HTTPHeader#[] ]], [[m:Net::HTTPHeader#[]=]],
     [[m:Net::HTTPHeader#add_field]],

#@end

--- fetch(key) -> String
--- fetch(key, default) -> String
--- fetch(key) {|hash| .... } -> String
key �إå��ե�����ɤ��֤��ޤ���

���Ȥ��Х��� 'content-length' ���Ф��Ƥ�  '2048'
�Τ褦��ʸ���������ޤ���������¸�ߤ��ʤ���� nil ���֤��ޤ���

�������륭������Ͽ����Ƥ�
�ʤ����ˤϡ����� default ��Ϳ�����Ƥ���Ф����ͤ򡢥֥��
����Ϳ�����Ƥ���Ф��Υ֥�å���ɾ�������ͤ��֤��ޤ���

#@since 1.8.3
�����Υإå��ե�����ɤ���ĤΥإå������ʣ��¸�ߤ���
���ˤϤ�������� ", " ��Ϣ�뤷��ʸ������֤��ޤ���
#@end
key ����ʸ����ʸ������̤��ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���
@param default �������륭������Ͽ����Ƥ��ʤ������֤��ͤ���ꤷ�ޤ���
@raise IndexError ����default��֥�å���Ϳ�����Ƥʤ�����������õ���� ���Ԥ����ȯ�����ޤ���
@see [[m:Net::HTTPHeader#[] ]]

--- size -> Integer
--- length -> Integer

���Υ᥽�åɤ� obsolete �Ǥ���

�إå��ե�����ɤο����֤��ޤ���

--- basic_auth(account, password) -> ()
Authorization: �إå��� BASIC ǧ���Ѥ˥��åȤ��ޤ���

@param account ���������̾��ʸ�����Ϳ���ޤ���
@param password �ѥ���ɤ�ʸ�����Ϳ���ޤ���

--- chunked? -> bool
Transfer-Encoding: �إå��ե�����ɤ� "chunked" �Ǥ���
���˿����֤��ޤ���

Transfer-Encoding: �إå��ե�����ɤ�¸�ߤ��ʤ��ä��ꡢ
"chunked" �ʳ��Ǥ�����ˤϵ����֤��ޤ���

--- content_type -> String|nil
"text/html" �Τ褦�� Content-Type ��ɽ��
ʸ������֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���

--- content_type=(type)
--- set_content_type(type, params = {})
type �� param ���� Content-Type: �إå��ե�����ɤ�
�ͤ����ꤷ�ޤ���

@param type ��ǥ��������פ�ʸ����ǻ��ꤷ�ޤ���
@param params �ѥ�᡼��°����ϥå���ǻ��ꤷ�ޤ���

--- main_type -> String|nil
"text/html" �ˤ����� "text" �Τ褦�ʥ����פ�ɽ��
ʸ������֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���

--- sub_type -> String|nil
"text/html" �ˤ����� "html" �Τ褦�ʥ��֥����פ�ɽ��
ʸ������֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���

--- type_params -> Hash
Content-Type �Υѥ�᡼���� {"charset" => "iso-2022-jp"}
�Ȥ������� [[c:Hash]] ���֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ�
���Υϥå�����֤��ޤ���

--- form_data=(params) -> ()
--- set_form_data(params, sep = '&') -> ()
HTML�Υե�����Υǡ��� params ����
�إå��ե�����ɤȥܥǥ������ꤷ�ޤ���

�إå��ե������ Content-Type: �ˤ�
'application/x-www-form-urlencoded' �����ꤵ��ޤ���

@param params HTML �Υե�����ǡ����� [[c:Hash]] ��Ϳ���ޤ���
@param sep �ǡ����Υ��ѥ졼����ʸ�����Ϳ���ޤ���

--- content_length -> Integer|nil
Content-Length: �إå��ե�����ɤ�ɽ���Ƥ����ͤ��������֤��ޤ���

�إå������ꤵ��Ƥ��ʤ����ˤ� nil ���֤��ޤ���

@raise Net::HTTPHeaderSyntaxError �ե�����ɤ��ͤ������Ǥ������
                                  ȯ�����ޤ���

--- content_length=(len)
Content-Length: �إå��ե�����ɤ��ͤ����ꤷ�ޤ���

len �� nil ��Ϳ����� Content-Length: �إå��ե�����ɤ�
������ޤ���

@param len ���ꤹ���ͤ�������Ϳ���ޤ���

--- content_range -> Range|nil

Content-Range: �إå��ե�����ɤ��ͤ� Range ���֤��ޤ���
Range ��ɽ�魯Ĺ���� [[m:Net::HTTPHeader#range_length]] �������ޤ���

�إå������ꤵ��Ƥ��ʤ����ˤ� nil ���֤��ޤ���

--- range_length -> Integer|nil

Content-Range: �إå��ե�����ɤ�ɽ���Ƥ���Ĺ�����������֤��ޤ���

�إå������ꤵ��Ƥ��ʤ����ˤ� nil ���֤��ޤ���

@raise Net::HTTPHeaderSyntaxError Content-Range: �إå��ե������
                                  ���ͤ������Ǥ������
                                  ȯ�����ޤ���
                                  
--- delete(key) -> String | nil
key �إå��ե�����ɤ������ޤ���

@param key �������ե������̾
@return �������줿�ե�����ɤ��ͤ��֤��ޤ���
        key �إå��ե�����ɤ�¸�ߤ��ʤ��ä����ˤ�
        nil ���֤��ޤ���

--- each {|name, val| .... } -> ()
--- each_header {|name, val| .... } -> ()

�ݻ����Ƥ���إå�̾�Ȥ����ͤ򤽤줾��
�֥�å����Ϥ��ƸƤӤ����ޤ���

�إå�̾�Ͼ�ʸ�������줵��ޤ���
val �� ", " ��Ϣ�뤷��ʸ���󤬥֥�å����Ϥ���ޤ���

--- each_capitalized {|name, value| .... } -> ()
--- canonical_each {|name, value| .... } -> ()

�إå��ե�����ɤ�������̾�Ȥ����ͤΥڥ���
�֥�å����Ϥ����ƤӤ����ޤ���

������̾�� name ���Ф�
  name.downcase.split(/-/).capitalize.join('-')
�ǵ�ޤ�ʸ����Ǥ���

--- each_capitalized_name {|name| .... } -> ()
�ݻ����Ƥ���إå�̾��������
('x-my-header' -> 'X-My-Header') 
���ơ��֥�å����Ϥ��ޤ���

--- each_name {|name| ... } -> ()
--- each_key {|name| ... } -> ()

�ݻ����Ƥ���إå�̾��֥�å����Ϥ��ƸƤӤ����ޤ���

�إå�̾�Ͼ�ʸ�������줵��ޤ���

--- each_value {|value| .... } -> ()
�ݻ����Ƥ���إå����ͤ�֥�å����Ϥ����ƤӤ����ޤ���

�Ϥ����ʸ����� ", " ��Ϣ�뤷����ΤǤ���

--- key?(key) -> bool
key �Ȥ����إå��ե�����ɤ�����п����֤��ޤ���
key ����ʸ����ʸ������̤��ޤ���

@param key õ���إå��ե������̾��ʸ�����Ϳ���ޤ���

--- method -> String

�ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ������֤��ޤ���

--- proxy_basic_auth(account, password) -> ()

Proxy ǧ�ڤΤ���� Proxy-Authorization: �إå��򥻥åȤ��ޤ���

@param account ���������̾��ʸ�����Ϳ���ޤ���
@param password �ѥ���ɤ�ʸ�����Ϳ���ޤ���

--- range -> Range|nil

Range: �إå��μ����ϰϤ� [[c:Range]] ���֥������Ȥ��֤��ޤ���

�إå��ˤʤ����� nil ���֤��ޤ���

@raise Net::HTTPHeaderSyntaxError Range:�إå�����Ȥ������̤�
                                  �Ǥʤ�����ȯ�����ޤ���

--- range=(r)
--- range=(n)
--- set_range(i, len) -> ()
--- set_range(r) -> ()
--- set_range(n) -> ()

�ϰϤ���ꤷ�ƥ���ƥ��ƥ���������뤿��Υإå� Range: �򥻥åȤ��ޤ���

�ʲ���Ʊ�����Ȥ�ɽ���Ƥ��ޤ���
  req.range = 0..1023
  req.range = 0...1024
  req.range = 1024
  req.set_range(0, 1024)
  req.set_range(0..1023)
  req.set_range(0...1024)
  req.set_range(1024)

���̤ʾ��Ȥ��ơ�
n �������Ϳ��������n�Ϻǽ餫��(-n)�Х��ȤޤǤ��ϰϤ�ɽ���ޤ���
r �� x..-1 �Ȥ������ˤϡ�x �����ʤ��
x �Х����ܤ���Ǹ�ޤǤ��ϰϤ�
x ����ʤ�кǽ餫�� x �Х����ܤޤǤ��ϰϤ�ɽ���ޤ���

@param r �ϰϤ� [[c:Range]] ���֥������Ȥ�Ϳ���ޤ���
@param i �ϰϤλ�����������Ϳ���ޤ���
@param len �ϰϤ�Ĺ����������Ϳ���ޤ���
@param n 0�����Ĺ����������Ϳ���ޤ���

#@# ���λ��ͤϤɤ��ޤǰտ�Ū�ʤΤ�������

#@include(Net__HTTPRequest)

#@include(Net__HTTPResponse)

#@include(Net__HTTPExceptions)

#@# internal classes
#@# = module Net::HTTP::ProxyDelta
