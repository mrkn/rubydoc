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
    res.error!
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
      response.error!
    end
  end

  print fetch('http://www.ruby-lang.org')

���ܤ����� [[c:HTTPResponse]]�� [[c:Net::HTTPSuccess]]��
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
���Υɥ�����ȤǤ� 1.1 �ߴ�ư��ˤĤ��Ƥϲ��⤷�ޤ���

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
@param proxy_addr �ץ����Υۥ���̾����ꤷ�ޤ���
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
@param proxy_addr �ץ����Υۥ���̾����ꤷ�ޤ���
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
  http = proxy_class.new('www.ruby-lang.org')
  http.start {|h|
    h.get('/ja/') # proxy.example.com ��ͳ����³���ޤ���
  }
��2: [[m:Net::HTTP.start]] ��Ȥ�
  require 'net/http'
  proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  proxy_class.start('www.ruby-lang.org') {|h|
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
#@since 1.9.1
--- debug_outupt=(io)
�ǥХå����Ϥ���ꤷ�ޤ���
���Υ᥽�åɤϿ���ʥ������ƥ��ۡ���θ���
�ˤʤ뤿�ᡢ�ǥХå��ʳ��ǤϷ褷�ƻȤ�ʤ��Ǥ���������

@param io ���������ꤷ�ޤ������Υ��֥������Ȥ� << �Ȥ���
          �᥽�åɤ���äƤ���ɬ�פ�����ޤ���

#@end

--- close_on_empty_response -> bool
--- close_on_empty_response=(bool)
�쥹�ݥ󥹤��ܥǥ�����äƤ��ʤ����˥��ͥ�������
�Ĥ��뤫�ɤ����Ǥ����ǥե���ȤǤϵ�(�Ĥ��ʤ�)�Ǥ���

@param bool �쥹�ݥ󥹤��ܥǥ�����äƤ��ʤ����˥��ͥ�������
            �Ĥ��뤫�ɤ������ꤷ�ޤ���

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
--- open_timeout=(seconds)

��³�����Ԥĺ����ÿ��������ÿ����äƤ⥳�ͥ������
�����ʤ�����㳰 [[c:TimeoutError]] ��ȯ�����ޤ���

@second �Ԥ��ÿ�����ꤷ�ޤ���
@see [[m:Net::HTTP#read_timeout]]

--- read_timeout -> Integer
--- read_timeout=(seconds)

�ɤߤ��� ([[man:read(2)]] ���) �ǥ֥�å����Ƥ褤�����ÿ���
�����ÿ����äƤ��ɤߤ���ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

@second �Ԥ��ÿ�����ꤷ�ޤ���
@see [[m:Net::HTTP#open_timeout]]

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

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���
@param dest ���Ѥ��ʤ��Ǥ���������
@see [[m:Net::HTTP#request_get]]

��:
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

--- head(path, header = nil) -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ��Υإå��Τߤ�������ޤ���
[[c:Net::HTTPResponse]] �Υ��󥹥��󥹤��֤��ޤ���

header �� nil
�Ǥʤ���С��ꥯ�����Ȥ�����Ȥ��ˤ������Ƥ� HTTP �إå��Ȥ���
����ޤ��� header �� { 'Accept' = > '*/*', ... } �Ȥ���
���Υϥå���Ǥʤ���Ф����ޤ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���
@param dest ���Ѥ��ʤ��Ǥ���������
@see [[m:Net::HTTP#request_head]]

��:
  response = nil
  Net::HTTP.start('some.www.server', 80) {|http|
    response = http.head('/index.html')
  }
  p response['content-type']



--- post(path, data, header = nil, dest = nil) -> Net::HTTPResponse
--- post(path, data, header = nil, dest = nil) {|body_segment| .... } -> Net::HTTPResponse

�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
POST ������ޤ���

�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

�֥�å��Ȱ��˸ƤӤ����줿�Ȥ��ϥ���ƥ��ƥ��ܥǥ��򾯤�����ʸ����Ȥ���
�֥�å���Ϳ���ޤ������ΤȤ�����ͤ� HTTPResponse ���֥������Ȥ�ͭ���� body ��
�����ޤ���

dest �ϻ����٤�ΰ����Ǥ������Ѥ��ʤ��Ǥ���������

POST ������ˤϥإå��� Content-Type: ����ꤹ��ɬ�פ�����ޤ���
�⤷ header �˻��ꤷ�ʤ��ä��ʤ�С� Content-Type �Ȥ���
"application/x-www-form-urlencoded" ���Ѥ��ޤ���

@param path POST��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param header �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���
@param dest ���Ѥ��ʤ��Ǥ���������
@see [[m:Net::HTTP#request_post]]
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
@see [[m:Net::HTTP#get]], [[m:Net::HTTPResponse#read_body]]

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

@see [[m:Net::HTTP#head]]

��:
  response = http.request_head('/index.html')
  p response['content-type']

head2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

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
@see [[m:Net::HTTP#post]], [[m:Net::HTTPResponse#read_body]]

  # example
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

post2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������


--- put(path, data, initheader = nil) -> Net::HTTPResponse
�����о�� path �ˤ��륨��ƥ��ƥ����Ф�ʸ���� data ��
PUT ������ޤ���

�֤��ͤ� [[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ǥ���

@param path �������륨��ƥ��ƥ��Υѥ���ʸ����ǻ��ꤷ�ޤ���
@param data ����ǡ�����ʸ����ǻ��ꤷ�ޤ���
@param initheader �ꥯ�����Ȥ� HTTP �إå���ϥå���ǻ��ꤷ�ޤ���

@see [[m:Net::HTTP#request_put]]

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

@see [[m:Net::HTTP#put]]

put2 �ϻ����٤�ʤΤǻȤ�ʤ��Ǥ���������

--- send_request(name, path, data = nil, header = nil) -> Net::HTTPResponse
HTTP �ꥯ�����Ȥ򥵡��Ф����ꡢ���Υ쥹�ݥ󥹤�
[[c:Net::HTTPResponse]] �Υ��󥹥��󥹤Ȥ����֤��ޤ���

@param name �ꥯ�����ȤΥ᥽�å�̾��ʸ�����Ϳ���ޤ���
@param path �ꥯ�����ȤΥѥ���ʸ�����Ϳ���ޤ���
@param data �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param header �ꥯ�����ȤΥإå���ϥå����Ϳ���ޤ���
@see [[m:Net::HTTP#request]]

��:
  response = http.send_request('GET', '/index.html')
  puts response.body

--- request(request [, data]) -> Net::HTTPResponse
--- request(request [, data]) {|response| .... } -> Net::HTTPResponse

[[c:Net::HTTPResquest]] ���֥������� request �򥵡��Ф��������ޤ���
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
�إå��� initheader �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Copy]]


--- delete(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� DELETE �ꥯ�����Ȥ�
�إå��� initheader �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Delete]]


--- lock(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� LOCK �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Lock]]

--- mkcol(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� MKCOL �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Mkcol]]

--- move(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� MOVE �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Move]]

--- options(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� OPTIONS �ꥯ�����Ȥ�
�إå��� initheader �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Options]]


--- propfind(path, body, initheader = {'Depth' => '0'}) -> Net::HTTPResponse
�����Ф� path �� PROPFIND �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Propfind]]


--- proppatch(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� PROPPATCH �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Proppatch]]

--- trace(path, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� TRACE �ꥯ�����Ȥ�
�إå��� initheader �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Trace]]


--- unlock(path, body, initheader = nil) -> Net::HTTPResponse
�����Ф� path �� UNLOCK �ꥯ�����Ȥ�
�إå��� initheader, �ܥǥ��� body �Ȥ������ꡢ
�쥹�ݥ󥹤� [[c:Net::HTTPResponse]] �Υ��֥�������
���֤��ޤ���

@param path �ꥯ�����Ȥ�����ѥ���ʸ�����Ϳ���ޤ���
@param body �ꥯ�����ȤΥܥǥ���ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȤΥإå����ʸ����=>ʸ����פ�
                  �ϥå����Ϳ���ޤ���
@see [[c:Net::NTTP::Unlock]]


--- use_ssl? -> bool
SSL�����Ѥ�����³������˿����֤��ޤ���

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

@see [[m:Net::HTTPHeader#[]= ]],
#@since 1.8.3
     [[m:Net::HTTPHeader#add_field]],
     [[m:Net::HTTPHeader#get_field]]
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
     [[m:Net::HTTPHeader#get_field]]
#@end

#@since 1.8.3
--- add_field(key, val) -> ()

key �إå��ե�����ɤ� val ���ɲä��ޤ���

key �˸������ꤵ��Ƥ����ͤ��˴����줺������� val �ɲä���ޤ���

@param key �إå��ե�����̾��ʸ�����Ϳ���ޤ���
@param val key�ǻ��ꤷ���ե�����ɤ��ɲä���ʸ�����Ϳ���ޤ���
@see [[m:Net::HTTPHeader#[] ]], [[m:Net::HTTPHeader#[]= ]],
     [[m:Net::HTTPHeader#get_field]]

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
@see [[m:Net::HTTPHeader#[] ]], [[m:Net::HTTPHeader#[]= ]],
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
@raise IndexError IndexError ����default��֥�å���Ϳ�����Ƥʤ�����������õ���� ���Ԥ����ȯ�����ޤ���
@see [[m:Net::HTTPHeader#[] ]

--- size -> Integer
--- length -> Integer

���Υ᥽�åɤ� obsolete �Ǥ���


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

--- main_type -> String|nil
"text/html" �ˤ����� "text" �Τ褦�� Content-Type ��ɽ��
ʸ������֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���

--- sub_type -> String|nil
"text/html" �ˤ����� "html" �Τ褦�� Content-Type ��ɽ��
ʸ������֤��ޤ���

Content-Type: �إå��ե�����ɤ�¸�ߤ��ʤ����ˤ� nil ���֤��ޤ���

--- type_params -> Hash
Content-Type �Υѥ�᡼���� {"charset" => "iso-2022-jp"}
�Ȥ����褦�ʷ��� [[c:Hash]] ���֤��ޤ���

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
@param �������줿�ե�����ɤ��ͤ��֤��ޤ���
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

�إå��ե�����ɤ�����̾�Ȥ����ͤΥڥ���
�֥�å����Ϥ����ƤӤ����ޤ���

����̾�� name ���Ф�
  name.downcase.split(/-/).capitalize.join('-')
�ǵ�ޤ�ʸ����Ǥ���

--- each_capitalized_name {|name| .... } -> ()
�ݻ����Ƥ���إå�̾�򥭥�ԥ��饤��
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

@param HTTPHeaderSyntaxError Range:�إå�����Ȥ������̤�Ǥʤ�
                             ����ȯ�����ޤ���
--- range=(r)
--- set_range(i, len) -> ()
--- set_range(n) -> ()

�ϰϤ���ꤷ�ƥ���ƥ��ƥ���������뤿��Υإå� Range: �򥻥åȤ��ޤ���

�ʲ���3�Ĥ�Ʊ�����Ȥ�ɽ���Ƥ��ޤ���
  req.range = 0..1023
  req.set_range(0, 1024)
  req.set_range(1024)

���̤ʾ��Ȥ��ơ�
n �������Ϳ�������ˤϺǽ餫��(-n)�Х��ȤޤǤ��ϰϤ�ɽ���ޤ���
r �� x..-1 �Ȥ������ˤϡ�x �����ʤ��
x �Х����ܤ���Ǹ�ޤǤ��ϰϤ�
x ����ʤ�кǽ餫�� x �Х����ܤޤǤ��ϰϤ�ɽ���ޤ���

@param r �ϰϤ� [[c:Range]] ���֥������Ȥ�Ϳ���ޤ���
@param i �ϰϤλ�����������Ϳ���ޤ���
@param len �ϰϤ�Ĺ����������Ϳ���ޤ���
@param n 0�����Ĺ����������Ϳ���ޤ���

= class Net::HTTPGenericRequest < Object

include Net::HTTPHeader

[[c:Net::HTTPRequest]] �Υ����ѡ����饹�Ǥ���
���Υ��饹��ľ�ܤϻȤ�ʤ��Ǥ���������

[[c:Net::HTTPRequest]] �Υ��֥��饹��ȤäƤ���������

== Class Methods

#@# 
#@# --- new(m, reqbody, resbody, path, initheader = nil)

== Instance Methods

#@# --- inspect


--- body_exist? -> bool
���Υ᥽�åɤ� obsolete �Ǥ���

[[m:Net::HTTPGenericRequest#response_body_permitted?]]
����̾�Ǥ���

#@since 1.8.0
--- body -> String
�����Ф�����ꥯ�����ȤΥ���ƥ��ƥ��ܥǥ����֤��ޤ���

@see [[m:Net::HTTPGenericRequest#body=]]

--- body=(body)

�����Ф�����ꥯ�����ȤΥ���ƥ��ƥ��ܥǥ���ʸ��������ꤷ�ޤ���

@param body ���ꤹ��ܥǥ���ʸ�����Ϳ���ޤ���
@see [[m:Net::HTTPGenericRequest#body]]

#@end

#@since 1.9.1
--- body_stream -> object
--- body_stream=(f)

�����Ф�����ꥯ�����ȤΥ���ƥ��ƥ��ܥǥ���
[[c:IO]] ���֥������ȤʤɤΥ��ȥ꡼������ꤷ�ޤ���
f �� read(size) �᥽�åɤ��������Ƥ���ɬ�פ�����ޤ���

@param f ����ƥ��ƥ��ܥǥ��Υǡ��������륹�ȥ꡼�४�֥������Ȥ�Ϳ���ޤ���

#@end

--- method -> String
�ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ������֤��ޤ���

--- path -> String

�ꥯ�����Ȥ��� path ��ʸ������֤��ޤ���

--- request_body_permitted? -> bool

�ꥯ�����Ȥ˥���ƥ��ƥ��ܥǥ���������뤳�Ȥ�������Ƥ���
HTTP �᥽�å� (POST �ʤ�)�ξ�翿���֤��ޤ���

--- response_body_permitted? -> bool

�����Ф���Υ쥹�ݥ󥹤˥���ƥ��ƥ��ܥǥ���ޤळ�Ȥ�������Ƥ���
HTTP �᥽�å� (GET, POST �ʤ�)�ξ�翿���֤��ޤ���


= class Net::HTTPRequest < Net::HTTPGenericRequest
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
--- new(path, initheader = nil) -> Net::HTTPRequest
HTTP �ꥯ�����ȥ��֥������Ȥ��������ޤ���

initheader �ǥꥯ�����ȥإå�����ꤹ�뤳�Ȥ��Ǥ��ޤ���
{�إå��ե������̾(ʸ����)=>�������(ʸ����)} �Ȥ���
[[c:Hash]] ���Ѥ��ޤ���

@param path �ꥯ�����Ȥ��� path ��ʸ�����Ϳ���ޤ���
@param initheader �ꥯ�����ȥإå���ϥå���ǻ��ꤷ�ޤ���

#@# == Constants
#@# --- METHOD -> String
#@# �ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ������֤��ޤ���

#@# �ºݤˤϤ�������ϳƥ��֥��饹���������Ƥ��ޤ���

#@# --- REQUEST_HAS_BODY -> bool
#@# �ꥯ�����Ȥ˥���ƥ��ƥ��ܥǥ���������뤳�Ȥ�������Ƥ���
#@# HTTP �᥽�å� (POST �ʤ�)�ξ�翿���֤��ޤ���

#@# �ºݤˤϤ�������ϳƥ��֥��饹���������Ƥ��ޤ���

#@# --- RESPONSE_HAS_BODY -> bool
#@# �����Ф���Υ쥹�ݥ󥹤˥���ƥ��ƥ��ܥǥ���ޤळ�Ȥ�������Ƥ���
#@# HTTP �᥽�å� (GET, POST �ʤ�)�ξ�翿���֤��ޤ���

�ºݤˤϤ�������ϳƥ��֥��饹���������Ƥ��ޤ���

= class Net::HTTP::Head < Net::HTTPRequest
HTTP �� HEAD �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Get < Net::HTTPRequest
HTTP �� GET �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Post < Net::HTTPRequest
HTTP �� POST �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Put < Net::HTTPRequest
HTTP �� PUT �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Copy < Net::HTTPRequest
HTTP �� COPY �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Delete < Net::HTTPRequest
HTTP �� DELETE �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Lock < Net::HTTPRequest
HTTP �� LOCK �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Mkcol < Net::HTTPRequest
HTTP �� MKCOL �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Move < Net::HTTPRequest
HTTP �� MOVE �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Options < Net::HTTPRequest
HTTP �� OPTIONS �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Propfind < Net::HTTPRequest
HTTP �� PROPFIND �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Proppatch < Net::HTTPRequest
HTTP �� PROPPATCH �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Trace < Net::HTTPRequest
HTTP �� TRACE �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTP::Unlock < Net::HTTPRequest
HTTP �� UNLOCK �ꥯ�����Ȥ�ɽ�����饹�Ǥ���

= class Net::HTTPResponse < Object
include Net::HTTPHeader

HTTP �쥹�ݥ󥹤�ɽ�����륯�饹�Ǥ���
Net::HTTP ���饹�ϼºݤˤ� HTTPResponse �Υ��֥��饹���֤��ޤ���

== Class Methods

#@# --- new(http_version, result_code, message) 
#@# �饤�֥�������ѥ᥽�åɤǤ����Ȥ�ʤ��Ǥ���������

--- body_permitted? -> bool
����ƥ��ƥ��ܥǥ���ޤळ�Ȥ�������Ƥ���쥹�ݥ󥹥��饹
�ʤ�п��򡢤����Ǥʤ���е����֤��ޤ���

#@# --- exception_type
#@# --- read_new 
#@# internal use only

== Instance Methods

--- code -> String

HTTP �Υꥶ��ȥ����ɤǤ����㤨�� '302' �ʤɤǤ���

�����ͤ򸫤뤳�Ȥǥ쥹�ݥ󥹤μ����Ƚ�̤Ǥ��ޤ�����
�쥹�ݥ󥹥��֥������Ȥ��ɤΥ��饹�Υ��󥹥��󥹤���
���뤳�ȤǤ�쥹�ݥ󥹤μ����Ƚ�̤Ǥ��ޤ���

--- message -> String
--- msg -> String

HTTP �����Ф��ꥶ��ȥ����ɤ��ղä����֤���å������Ǥ���
�㤨�� 'Not Found' �ʤɤǤ���

msg �� obsolete �Ǥ����Ȥ�ʤ��Ǥ���������

--- http_version -> String

�����Ф����ݡ��Ȥ��Ƥ��� HTTP �ΥС�������ʸ������֤��ޤ���

#@since 1.8.0
--- to_ary -> [Net::HTTPResponse, String]
���Υ᥽�åɤ� net/http.rb 1.1 �Ȥθߴ����Τ����¸�ߤ��ޤ���
#@end

--- value -> nil
�쥹�ݥ󥹤� 2xx(����)�Ǥʤ��ä����ˡ��б�����
�㳰��ȯ�������ޤ���

@raise HTTPError �쥹�ݥ󥹤� 1xx �Ǥ��뤫�� net/http ���Τ�ʤ�
                 ����Υ쥹�ݥ󥹤Ǥ������ȯ�����ޤ���
@raise HTTPRetriableError �쥹�ݥ󥹤� 3xx �Ǥ������ȯ�����ޤ���
@raise HTTPFatalError �쥹�ݥ󥹤� 4xx �Ǥ������ȯ�����ޤ���
@raise HTTPServerError �쥹�ݥ󥹤� 5xx �Ǥ������ȯ�����ޤ���


--- response -> self
--- header -> self
--- reader_header -> self

�ߴ������ݤĤ��������Ƴ�����줿�᥽�åɤǤ���
�Ȥ�ʤ��Ǥ���������

--- body -> String | () | nil
--- entity -> String | () | nil

����ƥ��ƥ��ܥǥ����֤��ޤ���

�쥹�ݥ󥹤˥ܥǥ����ʤ����ˤ� nil ���֤��ޤ���

[[m:Net::HTTPResponse#read_body]] ��֥�å��դ��ǸƤ�����ˤ�
���Υ᥽�åɤ�Net::ReadAdapter �Υ��󥹥��󥹤��֤��ޤ�����
����ϻȤ�ʤ��Ǥ���������



entity �� obsolete �Ǥ���

--- read_body(dest=nil) -> String|nil
--- read_body {|str| .... } -> ()

�֥�å���Ϳ���ʤ��ä����ˤϥ���ƥ��ƥ��ܥǥ���
ʸ������֤��ޤ���
�֥�å���Ϳ�������ˤ�
����ƥ��ƥ��ܥǥ��򾯤����ļ������ƽ缡�֥�å���Ϳ���ޤ���

�쥹�ݥ󥹤��ܥǥ�������ʤ����ˤ� nil ���֤��ޤ���

���٥֥�å���Ϳ�����ˤ��Υ᥽�åɤ�Ƥ�����ˤϡ�
������Ϥ��Ǥ��ɤߤ������ܥǥ���ʸ����Ȥ���
�֤��ޤ����ޤ����٥֥�å���Ϳ���Ƥ��Υ᥽�åɤ�Ƥ�����ˤϡ�
������� Net::ReadAdapter �Υ��󥹥��󥹤����äƤ��ޤ�����
���ξ��Ϥ��Υ��֥������ȤϻȤ�ʤ��Ǥ���������

dest �� obsolete �Ǥ����Ȥ�ʤ��Ǥ���������

#@# = Constants
#@# --- CODE_CLASS_TO_OBJ
#@# --- CODE_TO_OBJ

= class Net::HTTPUnknownResponse < Net::HTTPResponse
���Υ饤�֥�꤬�Τ�ʤ��쥹�ݥ󥹤�ɽ�����륯�饹�Ǥ���

= class Net::HTTPInformation < Net::HTTPResponse
HTTP �쥹�ݥ� 1xx (Informational) ��ɽ�����륯�饹�Ǥ���

�ꥯ�����Ȥ�����˼�������������³���Ƥ��뤳�Ȥ�ɽ�路��
���ޤ���

= class Net::HTTPSuccess < Net::HTTPResponse
HTTP �쥹�ݥ� 2xx (Success) ��ɽ�����륯�饹�Ǥ���

�ꥯ�����Ȥ�����˼������������줿���Ȥ�ɽ���Ƥ��ޤ���

= class Net::HTTPRedirection < Net::HTTPResponse
HTTP �쥹�ݥ� 3xx (Redirection) ��ɽ�����륯�饹�Ǥ���

�ꥯ�����Ȥ�����˼������ޤ�������������λ���뤿��ˤ�
����ʤ�ư�ɬ�פʤ��Ȥ�ɽ���ޤ���

= class Net::HTTPClientError < Net::HTTPResponse
HTTP �쥹�ݥ� 4xx (Client Error) ��ɽ�����륯�饹�Ǥ���

�ꥯ�����ȹ�ʸ���ְ�äƤ���ʤɡ����饤����Ȥ��ְ�ä�
���뤳�Ȥ�ɽ���Ƥ��ޤ���

= class Net::HTTPServerError < Net::HTTPResponse
HTTP �쥹�ݥ� 2xx (Server Error) ��ɽ�����륯�饹�Ǥ���

�����Ф����顼�򵯤����Ƥ���ʤɡ�������¦�ǽ���
��λ���뤳�Ȥ��Ǥ��ʤ����Ȥ�ɽ���Ƥ��ޤ���

= class Net::HTTPContinue < Net::HTTPInformation
HTTP �쥹�ݥ� 100 (Continue) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPSwitchProtocol < Net::HTTPInformation
HTTP �쥹�ݥ� 101 (Switching Protocols) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPOK < Net::HTTPSuccess
HTTP �쥹�ݥ� 200 (OK) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPCreated < Net::HTTPSuccess
HTTP �쥹�ݥ� 201 (Created) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPAccepted < Net::HTTPSuccess
HTTP �쥹�ݥ� 202 (Accepted) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNonAuthoritativeInformation < Net::HTTPSuccess
HTTP �쥹�ݥ� 203 (Non-Authoritative Information) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNoContent < Net::HTTPSuccess
HTTP �쥹�ݥ� 204 (No Content) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPResetContent < Net::HTTPSuccess
HTTP �쥹�ݥ� 205 (Reset Content) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPPartialContent < Net::HTTPSuccess
HTTP �쥹�ݥ� 206 (Partial Content) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������


= class Net::HTTPMultipleChoice < Net::HTTPRedirection
HTTP �쥹�ݥ� 300 (Multiple Choices) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPMovedPermanently < Net::HTTPRedirection
HTTP �쥹�ݥ� 301 (Moved Permanently) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPFound < Net::HTTPRedirection
alias Net::HTTPMovedTemporarily

HTTP �쥹�ݥ� 302 (Found) ��ɽ�����륯�饹�Ǥ���
�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPSeeOther < Net::HTTPRedirection
HTTP �쥹�ݥ� 303 (See Other) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNotModified < Net::HTTPRedirection
HTTP �쥹�ݥ� 304 (Not Modified) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPUseProxy < Net::HTTPRedirection
HTTP �쥹�ݥ� 305 (Use Proxy) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

#@# 306 unused
= class Net::HTTPTemporaryRedirect < Net::HTTPRedirection
HTTP �쥹�ݥ� 307 (Temporary Redirect) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������


= class Net::HTTPBadRequest < Net::HTTPClientError
HTTP �쥹�ݥ� 400 (Bad Request) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPUnauthorized < Net::HTTPClientError
HTTP �쥹�ݥ� 401 (Unauthorized) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPPaymentRequired < Net::HTTPClientError
HTTP �쥹�ݥ� 402 (Payment Required) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPForbidden < Net::HTTPClientError
HTTP �쥹�ݥ� 403 (Forbidden) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNotFound < Net::HTTPClientError
HTTP �쥹�ݥ� 404 (Not Found) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPMethodNotAllowed < Net::HTTPClientError
HTTP �쥹�ݥ� 405  (Method Not Allowed) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNotAcceptable < Net::HTTPClientError
HTTP �쥹�ݥ� 406 (Not Acceptable) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPProxyAuthenticationRequired < Net::HTTPClientError
HTTP �쥹�ݥ� 407 (Proxy Authentication Required) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPRequestTimeOut < Net::HTTPClientError
HTTP �쥹�ݥ� 408 (Request Time-out) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPConflict < Net::HTTPClientError
HTTP �쥹�ݥ� 409 (Conflict) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPGone < Net::HTTPClientError
HTTP �쥹�ݥ� 410 (Gone) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPLengthRequired < Net::HTTPClientError
HTTP �쥹�ݥ� 411 (Length Required) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPPreconditionFailed < Net::HTTPClientError
HTTP �쥹�ݥ� 412 (Precondition Failed) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPRequestEntityTooLarge < Net::HTTPClientError
HTTP �쥹�ݥ� 413 (Request Entity Too Large) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPRequestURITooLong < Net::HTTPClientError
alias Net::HTTPRequestURITooLarge

HTTP �쥹�ݥ� 414 (Request-URI Too Large) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPUnsupportedMediaType < Net::HTTPClientError

HTTP �쥹�ݥ� 415 (Unsupported Media Type) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPRequestedRangeNotSatisfiable < Net::HTTPClientError
HTTP �쥹�ݥ� 416 (Requested range not satisfiable) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPExpectationFailed < Net::HTTPClientError
HTTP �쥹�ݥ� 417 (Expectation Failed) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������


= class Net::HTTPInternalServerError < Net::HTTPServerError
HTTP �쥹�ݥ� 500 (Internal Server Error) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPNotImplemented < Net::HTTPServerError
HTTP �쥹�ݥ� 501 (Not Implemented) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPBadGateway < Net::HTTPServerError
HTTP �쥹�ݥ� 502 (Bad Gateway) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPServiceUnavailable < Net::HTTPServerError
HTTP �쥹�ݥ� 503 (Service Unavailable) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPGatewayTimeOut < Net::HTTPServerError
HTTP �쥹�ݥ� 504 (Gateway Time-out) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������

= class Net::HTTPVersionNotSupported < Net::HTTPServerError
HTTP �쥹�ݥ� 505 (HTTP Version not supported) ��ɽ�����륯�饹�Ǥ���

�ܤ����� [[RFC:2616]] �򸫤Ƥ���������


= module Net::HTTPExceptions
HTTP �㳰���饹�Ǥ���

�ºݤˤϤ���� include �����ʲ��Υ��֥��饹��
�㳰��ȯ�����ޤ���

  * [[c:Net::HTTPError]]
  * [[c:Net::HTTPRetriableError]]
  * [[c:Net::HTTPServerError]]
  * [[c:Net::HTTPFatalError]]

�ޤ����㳰��ȯ�������뤿��ˤ� [[m:HTTPResponse#value]] ��
�Ƥ�ɬ�פ�����ޤ���

== Instance Methods
--- response -> Net::HTTPResponse
--- data -> Net::HTTPResponse

���顼�θ����Ȥʤä��쥹�ݥ󥹥��֥������Ȥ��֤��ޤ���

#@# = class HTTPError < ProtocolError
= class HTTPError < StandardError
include Net::HTTPExceptions

HTTP ���ơ����������� 1xx �������ä��Ȥ����㳰�Ǥ���
�ޤ��ϡ����ơ����������ɤ�̤�ΤΤ�ΤǤ������
������б����ޤ���

#@# = class HTTPRetriableError < ProtoRetriableError
= class HTTPRetriableError < StandardError
include Net::HTTPExceptions

HTTP ���ơ����������� 3xx �������ä��Ȥ����㳰�Ǥ���

�꥽��������ư�����ʤɤ���ͳ�ˤ�ꡢ�ꥯ�����Ȥ�λ������ˤϹ���
�륢�������ɬ�פˤʤ�ޤ���

#@# = class HTTPServerException < ProtoServerError
= class HTTPServerException < StandardError
include Net::HTTPExceptions

HTTP ���ơ����������� 5xx �������ä��Ȥ����㳰�Ǥ���

���饤����ȤΥꥯ�����Ȥ˸�꤬���뤫�������Ф˥ꥯ�����Ȥ���ݤ�
�줿(ǧ�ڤ�ɬ�ס��꥽������¸�ߤ��ʤ��ʤɤ�)���Ȥ򼨤��ޤ���

#@# = class HTTPFatalError < ProtoFatalError
= class HTTPFatalError < StandardError
include Net::HTTPExceptions

HTTP ���ơ����������� 4xx �������ä��Ȥ����㳰�Ǥ���

���饤����ȤΥꥯ�����Ȥ˸�꤬���뤫�������Ф˥ꥯ�����Ȥ���ݤ�
�줿(ǧ�ڤ�ɬ�ס��꥽������¸�ߤ��ʤ��ʤɤ�)���Ȥ򼨤��ޤ���


#@# internal classes
#@# = module Net::HTTP::ProxyDelta
