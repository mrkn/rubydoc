�����Ф�������뤿��Υ饤�֥��Ǥ���

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
  GServer.in_service?(10001)           # => true
  server.stopped?                      # => false
  
  # �����Ф�ߤ�ޤ���
  server.shutdown
  
  # �������ޥ����Ф�ߤ�뤳�Ȥ�Ǥ��ޤ���
  GServer.stop(10001)
  # ������ server.stop �Ǥ��ǽ�Ǥ���

= class GServer < Object

�����Ф�������뤿��Υ��饹�Ǥ���[[c:GServer]] ��Ѿ��������������饹��������ƻȤ��ޤ���
fork �ǤϤʤ�����åɤ�ȤäƤ��ޤ���

== Constants

--- DEFAULT_HOST -> String

"127.0.0.1" �Ǥ���

== Class Methods

--- new(port, host = GServer::DEFAULT_HOST, maxConnections = 4, stdlog = $stderr, audit = false, debug = false)

GServer ���֥������Ȥ��������ޤ���

@param port �����Ф���å��󤹤�ݡ��Ȥ���ꤷ�ޤ���

@param host �ۥ��Ȥ���ꤷ�ޤ���

@param maxConnections ������³������ꤷ�ޤ����ǥե���Ȥ� 4 �Ǥ���

@param stdlog ���ν��������ꤷ�ޤ����ǥե���Ȥ�ɸ�२�顼���ϤǤ���

@param audit ������ꤹ��ȥ����Фε�ư������³�������ǻ�����߻��˥�����Ϥ��ޤ���

@param debug ������ꤹ��ȥǥХå�������Ϥ��ޤ���

--- in_service?(port, host = GServer::DEFAULT_HOST) -> bool

Ϳ����줿 host �� port �� GServer ���֥������Ȥ�Ʊ���ץ������
�����ӥ���ʤ鿿���֤��ޤ���

@param port �ݡ����ֹ����ꤷ�ޤ���

@param host �ۥ��Ȥ���ꤷ�ޤ���

--- stop(port, host = DEFAULT_HOST) -> ()

Ϳ����줿 host �� port ���б����� GServer ���֥������Ȥ���ߤ��ޤ���

@param port �ݡ����ֹ����ꤷ�ޤ���

@param host �ۥ��Ȥ���ꤷ�ޤ���

== Instance Methods

--- audit -> bool
���Ǥ���С������Фε�ư������³�������ǻ�����߻��˥�����Ϥ��ޤ���

@see [[m:GServer#starting]], [[m:GServer#connecting]], [[m:GServer#disconnecting]], [[m:GServer#stopping]]

--- audit=(bool)

������ꤹ��ȡ������Фε�ư������³�������ǻ�����߻��˥�����Ϥ��ޤ���

@param bool �����ͤ���ꤷ�ޤ���

@see [[m:GServer#starting]], [[m:GServer#connecting]], [[m:GServer#disconnecting]], [[m:GServer#stopping]]

--- connections() -> Fixnum

������³���Ƥ��륯�饤����Ȥο����֤��ޤ���

--- debug -> bool

�ǥХå��⡼�ɤʤ鿿�������Ǥʤ��ʤ鵶���֤��ޤ���

--- debug=(bool)

������ꤹ��ȥǥХå��⡼�ɤ�ͭ���ˤʤ�ޤ���
������ꤹ��ȥǥХå��⡼�ɤ�̵���ˤʤ�ޤ���

@param bool �����ͤ���ꤷ�ޤ���

--- host -> String

�ۥ��Ȥ�ʸ������֤��ޤ���

--- join

�����ФΥ����ӥ���¹Ԥ��Ƥ��륹��åɤ� [[m:Thread#join]] ���ޤ���

@see [[m:Thread#join]]

--- maxConnections -> Fixnum

�����դ��������³�����֤��ޤ���

--- port -> Fixnum

�ݡ��Ȥ�����֤��ޤ���

--- serve(io) -> nil

���⤷�ޤ��󡣥��֥��饹�ǥ����С��饤�ɤ��ޤ���

@param io ���饤����Ȥ���³���Ƥ��� [[c:TCPSocket]] ����ꤷ�ޤ���

--- shutdown -> true

���Ȥ���ߤ��ޤ���

--- start(maxConnections = -1) -> self

���Ȥ�ư���ޤ���

@param maxConnections 0 ����礭�����ͤ���ꤹ��ȡ�������³���Ȥ������ꤵ��ޤ���

--- stdlog -> IO

������Ϥ������ [[c:IO]] ���֥������Ȥ��֤��ޤ����ǥե���Ȥ� [[m:$stderr]] �Ǥ���

--- stdlog=(io)

������Ϥ������ [[c:IO]] ���֥������Ȥ����ꤷ�ޤ���

@param io ������Ϥ������ [[c:IO]] ���֥������Ȥ����ꤷ�ޤ���

--- stop -> ()

���Ȥ򤹤�����ߤ��ޤ���

--- stopped? -> bool

���Ȥ���ߤ��Ƥ���ʤ鿿���֤��ޤ���

== Protected Instance Methods

--- connecting(client) -> true

[[m:GServer#audit]] �����ʤ�С����饤�������³���˸ƤФ�ޤ���

���֥��饹�ǥ����С��饤�ɤ��ޤ���

@param client ���饤����Ȥ���³���Ƥ��� [[c:TCPSocket]] �Ǥ���

--- disconnecting(clientPort) -> ()

[[m:GServer#audit]] �����ʤ�С����饤����ȤȤ���³��λ���˸ƤФ�ޤ���

���֥��饹�ǥ����С��饤�ɤ��ޤ���

@param clientPort ��³���Ƥ������饤����ȤΥݡ��ȤǤ���

--- starting -> ()

[[m:GServer#audit]] �����ʤ�С������е�ư���˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- stopping -> ()
#@todo

[[m:GServer#audit]] �����ʤ�С���������߻��˸ƤФ�ޤ���
���֥��饹�ǥ����С��饤�ɤ��ޤ���

--- error(detail) -> ()

[[m:GServer#debug]] �����ξ�硢�㳰��ȯ������ȸƤФ�ޤ���

@param detail �㳰���֥������ȤǤ���

--- log(msg) -> ()

Ϳ����줿ʸ�������˵�Ͽ���ޤ���

@param msg ���Ȥ��Ƶ�Ͽ����ʸ�������ꤷ�ޤ���

