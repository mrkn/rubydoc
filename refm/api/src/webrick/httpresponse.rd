#@#require time
require webrick/httpversion
require webrick/htmlutils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPResponse < Object

== Class Methods

--- new(config)
HTTPResponse ���֥������Ȥ��������롣config �ˤ��������¸�����ϥå����Ϳ���롣

== Instance Methods

--- [](field)
�쥹�ݥ󥹤Υإå��γ����������Ƥ�ʸ������֤���

--- []=(field, val)
�쥹�ݥ󥹤γ�������إå��� val �����ꤹ�롣val ��ʸ����

--- body
--- body=(val)
���饤����Ȥ��֤����Ƥ����ꤹ�롣val ��ʸ����

--- chunked?
--- chunked=()
�쥹�ݥ󥹤� chunk ��ʬ���ƥ��饤����Ȥ��֤����ɤ��������ꤹ�롣

--- config

--- content_length
--- content_length=(len)

--- content_type
--- content_type=(val)
content-type �إå������ꤹ�롣val ��ʸ����

--- cookies
[[c:WEBrick::Cookie]] ��������֤���

--- each{|key, val| ... }
�إå�̾�� key�����Ƥ� val �Ȥ��ƥ֥�å���ɾ�����ޤ���

--- filename
--- filename=(filename)

--- header
�إå�̾�� key�����Ƥ� val �Ȥ���ϥå�����֤���key �� val ��ʸ����

--- http_version
HTTP �ΥС������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥ��֤���

--- keep_alive?
--- keep_alive
--- keep_alive=()
keep_alive �򥪥�ˤ��뤫�ɤ��������ꤹ�롣

--- reason_phrase
--- reason_phrase=(val)
HTTP �Υ쥹�ݥ󥹤κǽ�ιԤ� reason phrase �����ꤹ�롣val ��ʸ����

--- request_http_version
--- request_http_version=(version)

--- request_method
--- request_method=(method)

--- request_uri
--- request_uri=(uri)

--- send_body(socket)

--- send_header(socket)

--- send_response(socket)

--- sent_size

--- set_error(ex, backtrace = false)

--- set_redirect(status, url)

--- setup_header

--- status
--- status=(status)
status �����ɤ��������֤���

--- status_line

--- to_s
