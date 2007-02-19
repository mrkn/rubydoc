#@if (version >= "1.8.0")
�����Ф�������뤿��Υ饤�֥��Ǥ���

= class GServer < Object

�����Ф�������뤿��Υ��饹�Ǥ���GServer ��Ѿ��������������饹��������ƻȤ��ޤ���
fork �ǤϤʤ�����åɤ�ȤäƤ��ޤ���

��:

  #
  # 1970ǯ����ηв���֤��ä��֤������Ф���Ǥ���
  #
  class TimeServer < GServer
    def initialize(port=10001, *args)
      super(port, *args)
    end
    def serve(io)
      io.puts(Time.now.to_i)
    end
  end
  
  # ����������ǥ����Ф򥹥����Ȥ��ޤ���
  server = TimeServer.new
  server.audit = true                  # Turn logging on.
  server.start
  
  # �ޤ������Ф�ư���Ƥ��뤫���ǧ���Ƥߤޤ��礦��
  GServer.in_service?(10001)           # -> true
  server.stopped?                      # -> false
  
  # �����Ф�ߤ�ޤ���
  server.shutdown
  
  # �������ޥ����Ф�ߤ�뤳�Ȥ�Ǥ��ޤ���
  GServer.stop(10001)
  # ������ server.stop �Ǥ��ǽ�Ǥ���

=== ����
[[url:http://www.ruby-doc.org/stdlib/libdoc/gserver/rdoc/]]

== Constants

--- DEFAULT_HOST
#@todo

"127.0.0.1" �Ǥ���

== Class Methods

--- new(port, host = DEFAULT_HOST, maxConnections = 4, stdlog = $stderr, audit = false, debug = false)
#@todo

GServer ���֥������Ȥ��������ޤ���

--- in_service?(port, host = DEFAULT_HOST)
#@todo

Ϳ����줿 host �� port �� GServer ���֥������Ȥ�Ʊ���ץ������
�����ӥ���ʤ鿿���֤��ޤ���

--- stop(port, host = DEFAULT_HOST)
#@todo

Ϳ����줿 host �� port ���б����� GServer ���֥������Ȥ���ߤ��ޤ���

== Instance Methods

--- audit
#@todo

�᥽�å� starting, connecting, disconnecting, stopping �򤽤줾������줿���˸Ƥ֤ʤ� true�������Ǥʤ��ʤ� false ���֤��ޤ���

--- audit=(bool)
#@todo

true �ʤ� GServer �ϥ����뤿��Υ᥽�å�
starting, connecting, disconnecting, stopping��
���줾������줿���˸ƤӤޤ���

--- connecting(client)
#@todo

audit �� true �����ꤵ��Ƥ���ʤ顢���饤�������³���˸ƤФ�ޤ���
client �ϥ��饤����Ȥ���³���Ƥ��� [[c:TCPSocket]] �Ǥ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- connections()
#@todo

������³���Ƥ��륯�饤����Ȥο����֤��ޤ���

--- disconnecting(clientPort)
#@todo

audit �� true �����ꤵ��Ƥ���ʤ顢���饤����ȤȤ���³��λ���˸ƤФ�ޤ���
clientPort ����³���Ƥ������饤����ȤΥݡ��ȤǤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- debug
#@todo

�ǥХå��⡼�ɤʤ� true�������Ǥʤ��ʤ� false ���֤��ޤ���

--- debug=(bool)
#@todo

�ǥХå��⡼�ɤˤ��뤫�ɤ��������ꤷ�ޤ���

--- error(detail)
#@todo

debug �� true �����ꤵ��Ƥ�������㳰��ȯ������ȸƤФ�ޤ���
detail ���㳰���֥������ȤǤ���protected �᥽�åɤǤ���

--- host
#@todo

�ۥ��Ȥ�ʸ������֤��ޤ���

--- join
#@todo

�����ФΥ����ӥ���¹Ԥ��Ƥ��륹��åɤ� join ���ޤ���

--- log(msg)
#@todo

ʸ���� msg ����˵�Ͽ���ޤ���protected �᥽�åɤǤ���

--- maxConnections
#@todo

�����դ��������³�����֤��ޤ���

--- port
#@todo

�ݡ��Ȥ�����֤��ޤ���

--- serve(io)
#@todo

���⤷�ޤ��󡣥��֥��饹�ǥ����С��饤�ɤ��ޤ���

--- shutdown
#@todo

GServer ����ߤ��ޤ���

--- start(maxConnections = -1)
#@todo

GServer ��ư���ޤ��� 0 ����礭�� maxConnections ��Ϳ�����ʤ顢
������³���Ȥ������ꤵ��ޤ���

--- starting
#@todo

audit �� true �����ꤵ��Ƥ���ʤ顢�����е�ư���˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- stdlog
#@todo

������Ϥ������ [[c:IO]] ���֥������Ȥ��֤��ޤ����ǥե���Ȥ� $stderr �Ǥ���

--- stdlog=(io)
#@todo

������Ϥ������ [[c:IO]] ���֥������Ȥ����ꤷ�ޤ����ǥե���Ȥ� $stderr �Ǥ���

--- stop
#@todo

GServer �򤹤�����ߤ��ޤ���

--- stopping
#@todo

audit �� true �����ꤵ��Ƥ���ʤ顢��������߻��˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- stopped?
#@todo

GServer ����ߤ��Ƥ���ʤ鿿���֤��ޤ���
#@end
