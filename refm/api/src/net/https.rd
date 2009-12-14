[[lib:net/http]] �� SSL/TLS ��ĥ���������饤�֥��Ǥ���

[���] net/https �� RFC2818 �� 3.1 ������줿
�֥����С��ξ�����˵��ܤ��줿�ȸ��Υ����å��פ�ư�Ǥϼ¹Ԥ��ޤ���
��³���Ƥ���Ϥ��Υ����ФΥۥ���̾�Ⱦ�����˵��ܤ���Ƥ���ۥ���̾��
���פ��뤫��饤�֥��λ��ѼԤ��Ƽ���������ɬ�פ�����ޤ���

[[url:http://www.ipa.go.jp/security/rfc/RFC2818JA.html#31]]

[[ruby-dev:25254]]

=== Example

��ñ�����󤲤ޤ���
verify_mode �˻��ꤹ������˴ؤ��Ƥ� [[c:OpenSSL::SSL]] �򻲾Ȥ��Ƥ���������
ɬ�� use_ssl = true ��ƤФʤ���Ф����ʤ��Ȥ������դ��Ƥ���������

  require 'net/https'
  https = Net::HTTP.new('www.example.com',443)
  https.use_ssl = true
  https.ca_file = '/usr/share/ssl/cert.pem'
  https.verify_mode = OpenSSL::SSL::VERIFY_PEER
  https.verify_depth = 5
  https.start {
    response = https.get('/')
    puts response.body
  }

�ʲ��� HTTPS �ץ�����ͳ�ǥ�������������Ǥ���
�ץ�����ͳ�Ǥ��̿�ϩ�ϰŹ沽����ޤ���
�ܤ����ϰʲ��򻲾Ȥ��Ƥ���������

 * WWW�ץ����ˤ�����SSL�ȥ�ͥ��: [[url:http://www21.ocn.ne.jp/~k-west/SSLandTLS/draft-luotonen-ssl-tunneling-03-Ja.txt]]

  require 'net/https'
  proxy_addr = 'proxy.example.com'
  proxy_port = 3128
  https = Net::HTTP::Proxy(proxy_addr, proxy_port).new('www.example.com',443)
  https.use_ssl = true
  https.ca_file = '/usr/share/ssl/cert.pem'
  https.verify_mode = OpenSSL::SSL::VERIFY_PEER
  https.verify_depth = 5
  https.start {
    response = https.get('/')
    puts response.body
  }

= reopen Net::HTTP

== Instance Methods

--- use_ssl?
#@todo

HTTP �� SSL/TLS ��Ȥ��ʤ� true ���֤��ޤ���

--- use_ssl=(bool)
#@todo

HTTP �� SSL/TLS ��Ȥ����ɤ��������ꤷ�ޤ���
HTTPS �Ȥ����� true ���������ޤ���
�ǥե���ȤǤ� false �Ǥ���
�Ĥޤ� SSL/TLS ��ͭ���ˤ���ˤ�ɬ�� use_ssl = true ��Ƥ�ɬ�פ�����ޤ���

--- ssl_timeout
#@todo

--- ssl_timeout=(sec)
--- timeout=(sec)
#@todo

--- peer_cert
#@todo

�����Ф����äƤ��� X.509 �������
OpenSSL::X509::Certificate ���֥������ȤȤ����֤��ޤ���

--- key
--- key=(key)
#@todo

[[c:OpenSSL::PKey::RSA]] ���֥������Ȥ�
[[c:OpenSSL::PKey::DSA]] ���֥������Ȥ����ꤷ�ޤ���

--- cert
--- cert=(certificate)
#@todo

���饤����Ⱦ�����Ȥ���
[[c:OpenSSL::X509::Certificate]] ���֥������Ȥ����ꤷ�ޤ���

--- ca_file
--- ca_file=(path)
#@todo

PEM ��������¸���줿 CA ������ե�����Υѥ������ꤷ�ޤ���
�ե�����ˤ�ʣ���� CA �����񤬴ޤޤ�Ƥ��Ƥ⹽���ޤ���

--- ca_path
--- ca_path=(path)
#@todo

PEM ��������¸���줿 CA ������ե����뤬¸�ߤ���ǥ��쥯�ȥ�����ꤷ�ޤ���

--- verify_mode
--- verify_mode=(mode)
#@todo

�����о�������Ф��븡�ڥ⡼�ɤ����ꤷ�ޤ���
OpenSSL::SSL::VERIFY_NONE �� OpenSSL::SSL::VERIFY_PEER �������ǽ�Ǥ���
[[c:OpenSSL::SSL]] �⻲�Ȥ��Ƥ���������

--- verify_callback
--- verify_callback=(proc)
#@todo

�̾�Υ����о�����θ��ڤ˲ä��Ƥ����Ŭ�Ѥ����
[[c:Proc]] ���֥������Ȥ����ꤷ�ޤ���

--- verify_depth
--- verify_depth=(depth)
#@todo

�����о�����򸡾ڤ�����ξ������������κ���ο��������ꤷ�ޤ���

--- cert_store
--- cert_store=(store)
#@todo

�����о�����θ��ڤΤ���˻Ȥ����ꤷ�Ƥ��� CA ������Υ��ȥ졼��
[[c:OpenSSL::X509::Store]] ���֥������Ȥ����ꤷ�ޤ���
�̾�� ca_path=(path) �� ca_file=(path) ��Ȥ��ޤ���
