= module WEBrick::AccessLog

WEBrick::HTTPServer �Υ����������η�����������뤿��������ǻȤ���⥸�塼��Ǥ���

�����������η����� Apache �� mod_log_config �η����˽�򤷤ޤ�����HTTP ���ơ����������ɤ�
���ꤹ�뤳�ȤϽ���ޤ��󡣺Ǹ�Υ��ơ�������ɽ�� %>s �� %s ��Ʊ���褦�˲�ᤵ��ޤ���

 "%h %l %u %t \"%r\" %s %b"
 "%{User-Agent}i"

����Ǥ�������ϰʲ��ΤȤ���Ǥ���
#@todo
  %a    req.peeraddr[3]
  %b    res.sent_size
  %e    ENV
  %f    res.filename || ""
  %h    req.peeraddr[2]
  %i    req
  %l    "-"
  %m    req.request_method
  %n    req.attributes
  %o    res
  %p    req.port
  %q    req.query_string
  %r    req.request_line.sub(/\x0d?\x0a\z/o, '')
  %s    res.status       # won't support "%>s"
  %t    req.request_time
  %T    Time.now - req.request_time
  %u    req.user || "-"
  %U    req.unparsed_uri
  %v    config[:ServerName]

== Constants

--- CLF_TIME_FORMAT

Apache �Υ�����������Ʊ������η�����ɽ���ʲ���ʸ����Ǥ���
  "[%d/%b/%Y:%H:%M:%S %Z]"

--- COMMON_LOG_FORMAT
--- CLF

Apache �Υ����������ǰ���Ū�˻Ȥ��������ɽ���ʲ���ʸ����Ǥ���
  "%h %l %u %t \"%r\" %s %b"

--- REFERER_LOG_FORMAT

Apache �Υ����������ǰ���Ū�˻Ȥ����ե���η�����ɽ���ʲ���ʸ����Ǥ���
  "%{Referer}i -> %U"

--- AGENT_LOG_FORMAT

Apache �Υ����������ǰ���Ū�˻Ȥ��� User-Agent �η�����ɽ���ʲ���ʸ����Ǥ���
  "%{User-Agent}i"

--- COMBINED_LOG_FORMAT

Apache �Υ����������ǰ���Ū�˻Ȥ��������ɽ���ʲ���ʸ����Ǥ���
  "%h %l %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\""

= class WEBrick::AccessLog::AccessLogError < StandardError

���ꤵ�줿�����������η������������ʤ�����ȯ�����ޤ���
