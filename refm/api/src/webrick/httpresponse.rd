#@#require time
require webrick/httpversion
require webrick/htmlutils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPResponse < Object

== Class Methods

--- new(config)
#@todo
HTTPResponse ���֥������Ȥ��������롣config �ˤ��������¸�����ϥå����Ϳ���롣

== Instance Methods

--- [](field)
#@todo
�쥹�ݥ󥹤Υإå��γ����������Ƥ�ʸ������֤���

--- []=(field, val)
#@todo
�쥹�ݥ󥹤γ�������إå��� val �����ꤹ�롣val ��ʸ����

--- body
--- body=(val)
#@todo
���饤����Ȥ��֤����Ƥ����ꤹ�롣val ��ʸ����

--- chunked?
--- chunked=()
#@todo
�쥹�ݥ󥹤� chunk ��ʬ���ƥ��饤����Ȥ��֤����ɤ��������ꤹ�롣

--- config
#@todo

--- content_length
--- content_length=(len)
#@todo

--- content_type
--- content_type=(val)
#@todo
content-type �إå������ꤹ�롣val ��ʸ����

--- cookies
#@todo
[[c:WEBrick::Cookie]] ��������֤���

--- each{|key, val| ... }
#@todo
�إå�̾�� key�����Ƥ� val �Ȥ��ƥ֥�å���ɾ�����ޤ���

--- filename
--- filename=(filename)
#@todo

--- header
#@todo
�إå�̾�� key�����Ƥ� val �Ȥ���ϥå�����֤���key �� val ��ʸ����

--- http_version
#@todo
HTTP �ΥС������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥ��֤���

--- keep_alive?
--- keep_alive
--- keep_alive=()
#@todo
keep_alive �򥪥�ˤ��뤫�ɤ��������ꤹ�롣

--- reason_phrase
--- reason_phrase=(val)
#@todo
HTTP �Υ쥹�ݥ󥹤κǽ�ιԤ� reason phrase �����ꤹ�롣val ��ʸ����

--- request_http_version
--- request_http_version=(version)
#@todo

--- request_method
--- request_method=(method)
#@todo

--- request_uri
--- request_uri=(uri)
#@todo

--- send_body(socket)
#@todo

--- send_header(socket)
#@todo

--- send_response(socket)
#@todo

--- sent_size
#@todo

--- set_error(ex, backtrace = false)
#@todo

--- set_redirect(status, url)
#@todo

--- setup_header
#@todo

--- status
--- status=(status)
#@todo
status �����ɤ��������֤���

--- status_line
#@todo

--- to_s
#@todo
