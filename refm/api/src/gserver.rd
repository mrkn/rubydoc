#@if (version >= "1.8.0")
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
[[url:http:#/www.ruby-doc.org/stdlib/libdoc/gserver/rdoc/]]

== Constants

--- DEFAULT_HOST

"127.0.0.1" �Ǥ���

== Class Methods

--- new(port, host = DEFAULT_HOST, maxConnections = 4, stdlog = $stderr, audit = false, debug = false)

GServer ���֥������Ȥ��������ޤ���

--- in_service?(port, host = DEFAULT_HOST)

Ϳ����줿 host �� port �� GServer ���֥������Ȥ�Ʊ���ץ������
�����ӥ���ʤ鿿���֤��ޤ���

--- stop(port, host = DEFAULT_HOST)

Ϳ����줿 host �� port ���б����� GServer ���֥������Ȥ���ߤ��ޤ���

== Instance Methods

--- audit

�᥽�å� starting, connecting, disconnecting, stopping �򤽤줾������줿���˸Ƥ֤ʤ� true�������Ǥʤ��ʤ� false ���֤��ޤ���

--- audit=(bool)

true �ʤ� GServer �ϥ����뤿��Υ᥽�å�
starting, connecting, disconnecting, stopping��
���줾������줿���˸ƤӤޤ���

--- connecting(client)

audit �� true �����ꤵ��Ƥ���ʤ顢���饤�������³���˸ƤФ�ޤ���
client �ϥ��饤����Ȥ���³���Ƥ��� [[c:TCPSocket]] �Ǥ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- connections()

������³���Ƥ��륯�饤����Ȥο����֤��ޤ���

--- disconnecting(clientPort)

audit �� true �����ꤵ��Ƥ���ʤ顢���饤����ȤȤ���³��λ���˸ƤФ�ޤ���
clientPort ����³���Ƥ������饤����ȤΥݡ��ȤǤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- debug

�ǥХå��⡼�ɤʤ� true�������Ǥʤ��ʤ� false ���֤��ޤ���

--- debug=(bool)

�ǥХå��⡼�ɤˤ��뤫�ɤ��������ꤷ�ޤ���

--- error(detail)

debug �� true �����ꤵ��Ƥ�������㳰��ȯ������ȸƤФ�ޤ���
detail ���㳰���֥������ȤǤ���protected �᥽�åɤǤ���

--- host

�ۥ��Ȥ�ʸ������֤��ޤ���

--- join

�����ФΥ����ӥ���¹Ԥ��Ƥ��륹��åɤ� join ���ޤ���

--- log(msg)

ʸ���� msg ����˵�Ͽ���ޤ���protected �᥽�åɤǤ���

--- maxConnections

�����դ��������³�����֤��ޤ���

--- port

�ݡ��Ȥ�����֤��ޤ���

--- serve(io)

���⤷�ޤ��󡣥��֥��饹�ǥ����С��饤�ɤ��ޤ���

--- shutdown

GServer ����ߤ��ޤ���

--- start(maxConnections = -1)

GServer ��ư���ޤ��� 0 ����礭�� maxConnections ��Ϳ�����ʤ顢
������³���Ȥ������ꤵ��ޤ���

--- starting

audit �� true �����ꤵ��Ƥ���ʤ顢�����е�ư���˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- stdlog

������Ϥ������ [[c:IO]] ���֥������Ȥ��֤��ޤ����ǥե���Ȥ� $stderr �Ǥ���

--- stdlog=(io)

������Ϥ������ [[c:IO]] ���֥������Ȥ����ꤷ�ޤ����ǥե���Ȥ� $stderr �Ǥ���

--- stop

GServer �򤹤�����ߤ��ޤ���

--- stopping

audit �� true �����ꤵ��Ƥ���ʤ顢��������߻��˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- stopped?

GServer ����ߤ��Ƥ���ʤ鿿���֤��ޤ���
#@end
