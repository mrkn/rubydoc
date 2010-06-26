#@since 1.8.1
����Ͽ���뤿��Υ饤�֥��Ǥ���

=== �Ȥ���

5�ʳ��ν����٤�ʬ���ƥ���Ͽ���ޤ���
#@# ������ -> ����٥� �ˤ���٤�����


: FATAL
  �ץ����򥯥�å��夵����褦�������Բ�ǽ�ʥ��顼
: ERROR
  ���顼
: WARN
  �ٹ�
: INFO
   ����Ū�ʾ���
: DEBUG
  ���٥�ξ���

���ƤΥ�å�������ɬ�������٤�����ޤ����ޤ� Logger ���֥������Ȥ�Ʊ���褦��
�����٤�����ޤ�����å������ν����٤� Logger ���֥������Ȥν����٤���
�㤤����å������ϵ�Ͽ����ޤ���

���ʤ� INFO ������Ͽ���Ƥ��ʤ������ǥХå�����ɬ�פˤʤä����ˤϡ�
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

[[m:Logger#formatter=]] ���Ѥ��ƥե����ޥåȤ��ѹ����뤳�Ȥ��Ǥ��ޤ���

   logger.formatter = proc { |severity, datetime, progname, msg|
     "#{datetime}: #{msg}\n"
   }
   # => "Thu Sep 22 08:51:08 GMT+9:00 2005: hello world"

=== ����

: Rubyist Magazine
  [[url:http://jp.rubyist.net/magazine/]]
: ɸ��ź�ե饤�֥��Ҳ���� 2 ���
  [[url:http://jp.rubyist.net/magazine/?0008-BundledLibraries]]

= class Logger < Object
include Logger::Severity


����Ͽ���뤿��Υ��饹�Ǥ���

== Class Methods

--- new(logdev, shift_age = 0, shift_size = 1048576) -> Logger

Logger ���֥������Ȥ��������롣

@param logdev ����񤭹���ե�����̾���� IO ���֥�������(STDOUT, STDERR �ʤ�)����ꤷ�ޤ���

@param shift_age ���ե�������ݻ�������������ե�������ڤ��ؤ������٤���ꤷ�ޤ���
                 ���٤ˤ� daily, weekly, monthly ��ʸ����ǻ��ꤹ�뤳�Ȥ��Ǥ��ޤ���
                 ��ά����ȡ�������¸����ڤ��ؤ��ޤ���

@param shift_size shift_age �������ǻ��ꤷ�����Τ�ͭ���Ǥ���
                  ���Υ������ǥ��ե�������ڤ��ؤ��ޤ���

��:

  logger = Logger.new(STDERR)
  logger = Logger.new(STDOUT)
  logger = Logger.new('logfile.log')
  
  file = File.open('foo.log', File::WRONLY | File::APPEND)
  logger = Logger.new(file, 'daily')


== Instance Methods

--- <<(msg) -> Integer | nil

������Ϥ��ޤ���

@param msg ���˽��Ϥ����å�������

--- add(severity, message = nil, progname = nil) -> true
--- add(severity, message = nil, progname = nil){ ... } -> true
--- log(severity, message = nil, progname = nil) -> true
--- log(severity, message = nil, progname = nil){ ... } -> true

��å���������˵�Ͽ���ޤ���

�֥�å���Ϳ�������ϥ֥�å���ɾ�������֤��ͤ��å������Ȥ��ƥ��˵�Ͽ���ޤ���
�桼�������Υ᥽�åɤ�ľ�ܻȤ����ȤϤ��ޤꤢ��ޤ���

@param severity �����١�[[c:Logger]] ���饹���������Ƥ����������ꤷ�ޤ���
                �����ͤ��쥷���С������ꤵ��Ƥ����٥�����㤤��硢
                ��å������ϵ�Ͽ����ޤ���

@param message ���˽��Ϥ����å�������ʸ�����㳰���֥������Ȥ���ꤷ�ޤ���
               ��ά����� nil ���Ѥ����ޤ���

@param progname ����å������Ȱ��˵�Ͽ����ץ����̾����ꤷ�ޤ���
                ��ά����� nil �����Ѥ���ޤ������ºݤˤ��������ݻ�����Ƥ����ͤ����Ѥ���ޤ���

--- close -> nil

�����Ϥ˻��Ѥ��Ƥ��� IO ���֥������Ȥ��Ĥ��ޤ���

--- datetime_format -> String

���˵�Ͽ����������դΥե����ޥåȤǤ���

�ǥե���ȤǤ� "%Y-%m-%dT%H:%M:%S.%06d "�Ǥ���

@see [[m:Time#strftime]], [[m:Logger#datetime_format=]]


--- datetime_format=(format)

���˵�Ͽ����������դΥե����ޥåȤ򥻥åȤ��ޤ���

@see [[m:Time#strftime]], [[m:Logger#datetime_format]]

--- debug? -> bool

���ߤ� Logger ���֥������Ȥ� DEBUG �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- info? -> bool

���ߤ� Logger ���֥������Ȥ� INFO �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- warn? -> bool

���ߤ� Logger ���֥������Ȥ� WARN �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- error? -> bool

���ߤ� Logger ���֥������Ȥ� ERROR �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- fatal? -> bool

���ߤ� Logger ���֥������Ȥ� FATAL �ʾ�ν����٤Υ�å�������Ͽ����ʤ�
�����֤��ޤ���

--- debug(progname = nil) -> true
--- debug(progname = nil){ ... } -> true

�����٤� DEBUG �Υ�å���������Ϥ��ޤ���

���ߤ� Logger �ν����٤� DEBUG ����⤤��硢��å������Ͻ��Ϥ���ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

��:

  logger.debug "Waiting for input from user"
  # ...
  logger.debug { "User typed #{input}" }

  logger.debug("MainApp") { "Received connection from #{ip}" }

--- info(progname = nil){ ... } -> true
--- info(progname = nil) -> true

INFO �������Ϥ��ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

@see [[m:Logger#debug]]

--- warn(progname = nil){ ... } -> true
--- warn(progname = nil) -> true

WARN �������Ϥ��ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

@see [[m:Logger#debug]]

--- error(progname = nil){ ... } -> true
--- error(progname = nil) -> true

ERROR �������Ϥ��ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

@see [[m:Logger#debug]]

--- fatal(progname = nil){ ... } -> true
--- fatal(progname = nil) -> true

FATAL �������Ϥ��ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

@see [[m:Logger#debug]]

--- unknown(progname = nil){ ... } -> true
--- unknown(progname = nil) -> true

UNKNOWN �������Ϥ��ޤ���

�֥�å���Ϳ���ʤ��ä����ϡ�progname ���å������Ȥ��ƥ�����Ϥ��ޤ���

�֥�å���Ϳ�������ϡ��֥�å���ɾ��������̤��å������Ȥ���
������Ϥ��ޤ���

�����ȥ֥�å���Ʊ����Ϳ�������ϡ�progname ��ץ����̾���֥�å���ɾ������
���å������Ȥ��ƥ�����Ϥ��ޤ���

@param progname �֥�å���Ϳ���ʤ����ϡ���å������Ȥ���ʸ����ޤ����㳰���֥������Ȼ��ꤷ�ޤ���
                �֥�å���Ϳ�������ϡ��ץ����̾��ʸ����Ȥ���Ϳ���ޤ���

@see [[m:Logger#debug]]

--- level -> Integer
--- sev_threshold -> Integer

�쥷���Ф˥��åȤ���Ƥ������٥��������ޤ���

--- level=(level)
--- sev_threshold=(level)

Logger ���֥������Ȥν����٤����ꤷ�ޤ��������٤��������㤤��å�������
���Ϥ���ޤ���

@param level �����٤���ꤷ�ޤ���

--- progname -> String

���˽��Ϥ���ץ����̾��������ޤ���

--- progname=(name)

���˽��Ϥ���ץ����̾�����ꤷ�ޤ���

#@since 1.8.3
--- formatter -> String

������Ϥ���ݤ˻��Ѥ���ե����ޥå�����������ޤ���

���Υ᥽�åɤ��֤��ͤ����� call �᥽�åɤ� 4 �Ĥΰ��� (severity, time, program name, message) ������Ȥ�ޤ���


--- formatter=(formatter)

������Ϥ���ݤ˻��Ѥ���ե����ޥå����򥻥åȤ��ޤ���

@param formatter 4 �Ĥΰ��� (severity, time, program name, message) �������� call �᥽�åɤ�
                 ���ĥ��֥������Ȥ���ꤷ�ޤ���call �᥽�åɤ��֤��ͤ�ʸ����ˤ��Ƥ���������

  logger = Logger.new
  logger.formatter = proc{|severity, datetime, progname, message|
    "#{datetime}: #{message}\n"
  }

#@end

== Constants

#@until 1.8.3
--- Format -> String

���ѤΥե����ޥå�ʸ����

#@end

--- ProgName -> String
���ե�����������˻Ȥ��ץ����̾��

#@since 1.9.1
--- VERSION -> String
���Υ饤�֥��ΥС�������ɽ��ʸ����

#@end

--- SEV_LABEL -> Array

�����٤Υ�٥���Ǽ��������

= class Logger::Application < Object
include Logger::Severity

�桼������Υ��ץꥱ�������˥���ǽ���ñ���ɲä��뤳�Ȥ��Ǥ��ޤ���

=== ������ˡ

  (1) ���Υ��饹�Υ��֥��饹�Ȥ��ƥ桼������Υ��ץꥱ�������Υ��饹��������ޤ���
  (2) �桼������Υ��饹�ǥᥤ�������Ԥ� run �᥽�åɤ�������ޤ���
  (3) ���Υ��饹�򥤥󥹥��󥹲����� start �᥽�åɤ�ƤӽФ��ޤ���


��:

  class FooApp < Application
    def initialize(foo_app, application_specific, arguments)
      super('FooApp') # Name of the application.
    end
  
    def run
      ...
      log(WARN, 'warning', 'my_method1')
      ...
      @log.error('my_method2') { 'Error!' }
      ...
    end
  end
  
  status = FooApp.new(....).start

== Class Methods

--- new(appname = nil) -> Logger::Application

���Υ��饹���������ޤ���

@param appname ���ץꥱ�������̾����ꤷ�ޤ���

== Instance Methods

--- appname -> String

���ץꥱ�������̾��������ޤ���

--- level=(level)

���ν����٤򥻥åȤ��ޤ���

@param level ���ν����١�

@see [[c:Logger::Severity]]

--- log(severity, message = nil) -> true
--- log(severity, message = nil){ ... } -> true

��å���������˵�Ͽ���ޤ���

�֥�å���Ϳ�������ϥ֥�å���ɾ�������֤��ͤ��å������Ȥ��ƥ��˵�Ͽ���ޤ���

@param severity �����١�[[c:Logger::Severity]] ���饹���������Ƥ����������ꤷ�ޤ���
                �����ͤ��쥷���С������ꤵ��Ƥ����٥�����㤤��硢
                ��å������ϵ�Ͽ����ޤ���

@param message ���˽��Ϥ����å�������ʸ�����㳰���֥������Ȥ���ꤷ�ޤ���
               ��ά����� nil ���Ѥ����ޤ���

@see [[m:Logger#add]]

--- log=(logdev)

���ν�����򥻥åȤ��ޤ���

@param logdev ���ե�����̾�� IO ���֥������Ȥ���ꤷ�ޤ���

#@until 1.9.1
--- logdev -> ()

���Υ᥽�åɤϻ��Ѥ���Ƥ��ޤ���

#@end

--- set_log(logdev, shift_age = 0, shift_size = 1024000) -> Integer

�����ǻ��Ѥ��� [[c:Logger]] �Υ��֥������Ȥ��������ޤ���

@param logdev ����񤭹���ե�����̾���� IO ���֥�������(STDOUT, STDERR �ʤ�)����ꤷ�ޤ���

@param shift_age ���ե�������ݻ�������������ե�������ڤ��ؤ������٤���ꤷ�ޤ���
                 ���٤ˤ� daily, weekly, monthly ��ʸ����ǻ��ꤹ�뤳�Ȥ��Ǥ��ޤ���
                 ��ά����ȡ�������¸����ڤ��ؤ��ޤ���

@param shift_size shift_age �������ǻ��ꤷ�����Τ�ͭ���Ǥ���
                  ���Υ������ǥ��ե�������ڤ��ؤ��ޤ���

@return ���ν����٤��֤��ޤ���

--- start -> ()

���ץꥱ�������򥹥����Ȥ����ޤ���

@return run �᥽�åɤ����ͤ��֤��ޤ���

@raise RuntimeError ���֥��饹�� run �᥽�åɤ�������Ƥ��ʤ�����ȯ�����ޤ���

#@since 1.8.3
= class Logger::Formatter < Object

�����Υե����ޥå�ʸ����򰷤����饹��

[[c:Logger]] �Υǥե���ȤΥե����ޥå����Ǥ���

== Instance Methods

--- call(severity, time, progname, msg) -> String

�������ե����ޥåȤ����֤��ޤ���

@param severity �����١�

@param time ���֡�[[c:Time]] ���饹�Υ��֥������ȡ�

@param progname �ץ����̾

@param msg ��å�������

--- datetime_format -> String

���������ե����ޥåȤ�������ޤ���

@see [[m:Time#strftime]]

--- datetime_format=(format)

���������ե����ޥåȤ򥻥åȤ��ޤ���

@param format �����Υե����ޥå�ʸ����[[m:Time#strftime]] �ǻ��Ѥ���ե����ޥå�ʸ�����
              Ʊ����Τ���ѤǤ��ޤ���

@see [[m:Time#strftime]]

== Constants

--- Format -> String

�ե����ޥå�ʸ����

#@end

= class Logger::LogDevice < Object

[[c:Logger]] �������ǻ��Ѥ�����ν������ɽ�����饹�Ǥ���

== Class Methods

--- new(log = nil, opt = {}) -> Logger::LogDevice

���ν�������������ޤ���

@param log ���ν����衣IO ���֥������Ȥ���ꤷ�ޤ���
           ��ά����� nil �����Ѥ���ޤ������¹�����㳰��ȯ�����ޤ���

@param opt ���ץ�����ϥå���ǻ��ꤷ�ޤ���
           �ϥå���Υ����ˤ� :shift_age, :shift_size ����ꤷ�ޤ���
           ��ά����ȡ����줾�� 7, 1048756 (1 MByte) �����Ѥ���ޤ���

@see [[m:Logger.new]]


== Instance Methods

--- close -> nil

������� IO ���֥������Ȥ��Ĥ��ޤ���

���Υ᥽�åɤ�Ʊ������ޤ���

@see [[m:IO#close]]

--- dev -> IO

������� IO ���֥������Ȥ�������ޤ���

--- filename -> String | nil

������Υե�����̾��������ޤ���

�����褬�ե�����ǤϤʤ����� nil ���֤��ޤ���

--- write(message) -> Integer

������� IO ���֥������Ȥ˥�å�������񤭹��ߤޤ���

���Υ᥽�åɤ�Ʊ������ޤ���

@see [[m:IO#write]]

#@since 1.8.3
= class Logger::LogDevice::LogDeviceMutex < Object
include MonitorMixin

���ν�����ե������Ʊ�����뤿��Υ��饹�Ǥ���

@see [[c:MonitorMixin]]

#@end

= module Logger::Severity

[[lib:logger]] �ǻ��Ѥ�������٤���������⥸�塼�롣

== Constants
--- DEBUG -> Integer
������:�ǥХå���ɽ������Ǥ���

--- INFO  -> Integer
������:�����ɽ������Ǥ���

--- WARN  -> Integer
������:�ٹ��ɽ������Ǥ���

--- ERROR -> Integer
������:���顼��ɽ������Ǥ���

--- FATAL -> Integer
������:��̿Ū�ʥ��顼��ɽ������Ǥ���

--- UNKNOWN -> Integer
������:�����ʥ��顼��ɽ������Ǥ���

= class Logger::Error < RuntimeError

���Υ饤�֥��ǻ��Ѥ����㳰�Ǥ���

= class Logger::ShiftingError < Logger::Error

���ե�������ڤ��ؤ��˼��Ԥ�������ȯ�������㳰�Ǥ���

#@end
