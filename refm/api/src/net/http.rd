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


#@include(HTTP)
#@include(HTTPHeader)
#@include(HTTPRequest)
#@include(HTTPResponse)
