#@since 1.8.1
����Ͽ���뤿��Υ饤�֥��Ǥ���

= class Logger < Object

����Ͽ���뤿��Υ��饹�Ǥ���

=== �Ȥ���

5�ʳ��ν����٤�ʬ���ƥ���Ͽ���ޤ���

  * FATAL: �ץ����򥯥�å��夵����褦�������Բ�ǽ�ʥ��顼
  * ERROR: ���顼
  * WARN: �ٹ�
  * INFO: ����Ū�ʾ���
  * DEBUG: ���٥�ξ���

���ƤΥ�å�������ɬ�������٤�����ޤ����ޤ� Logger ���֥������Ȥ�Ʊ���褦��
�����٤�����ޤ�����å������ν����٤� Logger ���֥������Ȥν����٤���
�㤤����å������ϵ�Ͽ����ޤ���

���ʤ� INFO ������Ͽ���Ƥ��ʤ����ɡ��ǥХå�����ɬ�פˤʤä����ˤϡ�
Logger ���֥������Ȥν����٤� DEBUG �˲�����ʤɤȤ����Ȥ����򤷤ޤ���

��:

  require 'logger'
  log = Logger.new(STDOUT)
  log.level = Logger::WARN
  
  log.debug("Created logger")
  log.info("Program started")
  log.warn("Nothing to do!")

�����Ǥϥ��ˤ� WARN �Τߤ���Ͽ����ޤ�������������Ǥ���

  W, [2005-02-10T20:03:56.489954 #12469]  WARN -- : Nothing to do!

�㳰���֥������Ȥ⵭Ͽ�����å������Ȥ��ƻȤ��ޤ���

��:

  require 'logger'
  log = Logger.new(STDOUT)
  log.level = Logger::ERROR
  
  begin
    File.each_line(path) do |line|
      unless line =~ /^(\w+) = (.*)$/
        log.error("Line in wrong format: #{line}")
      end
    end
  rescue => err
    log.fatal("Caught exception; exiting")
    log.fatal(err)
  end

=== ����

  * [[unknown:Rubyist Magazine|URL:http://jp.rubyist.net/magazine/]]
  * [[unknown:ɸ��ź�ե饤�֥��Ҳ���� 2 ��� Logger|URL:http://jp.rubyist.net/magazine/?0008-BundledLibraries]]

== Class Methods

--- new(logdev, shift_age = 0, shift_size = 1048576)

Logger ���֥������Ȥ��������롣logdev �ˤ�
��Ͽ����ե�����̾����write �� close ��������줿���֥�������(IO
���֥������Ȥʤ�)��Ϳ���ޤ���

��:

  logger = Logger.new(STDERR)
  logger = Logger.new(STDOUT)
  logger = Logger.new('logfile.log')

shift_age �� [[c:Integer]] ��Ϳ�������ϡ�rotate �������ե������
�Ĥ��Ŀ��Ȳ�ᤵ��ޤ���shift_size ��� rotate ����ޤ���
shift_age �� 'daily', 'weekly', 'monthly' �Τ����줫��ʸ�����
Ϳ�������ϡ����δֳ���˥��� rotate ����ޤ���

��:

  file = File.open('foo.log', File::WRONLY | File::APPEND)
  logger = Logger.new(file, 'daily')

shift_size �� shift_age �� [[c:Integer]] ��Ϳ�������ˤΤ�
ͭ���Ǥ���

== Instance Methods

--- <<(msg)

--- add(severity, message = nil, progname = nil) { ... }
--- log(severity, message = nil, progname = nil) { ... }

��å���������˵�Ͽ���ޤ���message ��ʸ�����㳰���֥������ȤǤ���
severity �ˤϥ�å�������
�����٤� DEBUG  = 0 ���� UNKNOWN = 5 �ޤǤ�����ǻ��ꤷ�ޤ���������
�礭���ۤɽ����٤�⤯�ʤ�ޤ�����å������ν����� severity ��
Logger ���֥������Ȥ� level �����㤤��硢��å������ϵ�Ͽ����ޤ���
progname �ˤϥ��˥�å������Ȱ��˵�Ͽ����ץ����̾��Ϳ���ޤ���
�ǥե���Ȥϥ��󥹥����ѿ� @progname �Ǥ���

�֥�å���Ϳ�������ϥ֥�å���ɾ�������֤��ͤ��å������Ȥ��ƥ��˵�Ͽ���ޤ���

�桼�������Υ᥽�åɤ�ľ�ܻȤ����ȤϤ��ޤꤢ��ޤ���

--- close

--- datetime_format
--- datetime_format=(format)

���˵�Ͽ����������դΥե����ޥåȤǤ����ǥե���ȤǤ� "%Y-%m-%dT%H:%M:%S.%06d "
�Ǥ���[[m:Time#strftime]] �򻲾Ȥ��Ʋ�������

--- debug?

���ߤ� Logger ���֥������Ȥ� DEBUG �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- info?

���ߤ� Logger ���֥������Ȥ� INFO �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- warn?

���ߤ� Logger ���֥������Ȥ� WARN �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- error?

���ߤ� Logger ���֥������Ȥ� ERROR �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- fatal?

���ߤ� Logger ���֥������Ȥ� FATAL �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- debug(progname = nil) { ... }
--- debug(message = nil)
--- debug { ... }

DEBUG ���� message ��Ͽ���ޤ����֥�å���Ϳ�������ϡ��֥�å���ɾ������
�֤��ͤ��å������Ȥ��Ƶ�Ͽ���ޤ������ߤ� Logger �ν����٤� DEBUG ����⤤��硢
��å������ϵ�Ͽ����ޤ���

��:

  logger.debug "Waiting for input from user"
  # ...
  logger.debug { "User typed #{input}" }

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname �ϥץ����̾���֥�å���ɾ������
�֤��ͤ���å������Ȥʤ�ޤ���

��:

  logger.debug("MainApp") { "Received connection from #{ip}" }

--- info(progname = nil) { ... }
--- info(message = nil)
--- info { ... }

INFO �����Ͽ���ޤ���debug �򻲾Ȥ��Ʋ�������

--- warn(progname = nil) { ... }
--- warn(message = nil)
--- warn { ... }

WARN �����Ͽ���ޤ���debug �򻲾Ȥ��Ʋ�������

--- error(progname = nil) { ... }
--- error(message = nil)
--- error { ... }

ERROR �����Ͽ���ޤ���debug �򻲾Ȥ��Ʋ�������

--- fatal(progname = nil) { ... }
--- fatal(message = nil)
--- fatal { ... }

FATAL �����Ͽ���ޤ���debug �򻲾Ȥ��Ʋ�������

--- unknown(progname = nil) { ... }
--- unknown(message = nil)
--- unknown { ... }

--- level
--- level=(level)

Logger ���֥������Ȥν����٤����ꤷ�ޤ��������٤��������㤤��å�������
��Ͽ����ޤ���

--- sev_threshold
--- sev_threshold=(level)

level ����̾�Ǥ���

--- progname
--- progname=(name)

���˵�Ͽ����ץ����̾�����ꤷ�ޤ���

--- formatter
--- formatter=(formatter)

== Constants

--- DEBUG
--- INFO
--- WARN
--- ERROR
--- FATAL
--- UNKNOWN

�����٤�ɽ������Ǥ���

#@if (version <= "1.8.2")
--- Format
#@end

--- ProgName

--- VERSION

--- SEV_LABEL

= class Logger::Application < Object

== Class Methods

--- new(appname = nil)

== Instance Methods

--- appname

--- level=(level)

--- log(severity, message = nil) { ... }

--- log=(logdev)

--- logdev

--- set_log(logdev, shift_age = 0, shift_size = 1024000)

--- start

= class Logger::Error < RuntimeError

= class Logger::Formatter < Object

== Class Methods

--- new

== Instance Methods

--- call(severity, time, progname, msg)

--- datetime_format
--- datetime_format=(format)

== Constants

--- Format

= class Logger::LogDevice < Object

== Class Methods

--- new(log = nil, opt = {})

== Instance Methods

--- close

--- dev

--- filename

--- write(message)

= class Logger::LogDevice::LogDeviceMutex < Object
include MonitorMixin

= module Logger::Severity

== Constants

--- DEBUG
--- INFO
--- WARN
--- ERROR
--- FATAL
--- UNKNOWN

= class Logger::ShiftingError < Logger::Error
#@end
