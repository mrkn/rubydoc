���Υ饤�֥��� obsolete �Ǥ���
[[lib:cgi]] �饤�֥���ȤäƤ���������

= class CGI_cgi_lib

���Υ饤�֥��� obsolete �Ǥ���
[[lib:cgi]] �饤�֥���ȤäƤ���������

== Singleton Methods

--- new(input = $stdin) -> CGI_cgi_lib

���Ȥ��������ޤ���

--- rfc1123_date(time) -> String

Ϳ����줿 [[c:Time]] ���֥������Ȥ� [[rfc:1123]] ������줿������ʸ������Ѵ����ޤ���

@param time [[c:Time]] ���֥������Ȥ���ꤷ�ޤ���

--- escape(str) -> String

Ϳ����줿ʸ����� URL ���󥳡��ɤ��ޤ���

@param str ʸ�������ꤷ�ޤ���

--- unescape(str) -> String

URL ���󥳡��ɤ��줿ʸ�����ǥ����ɤ��ޤ���

@param str URL ���󥳡��ɤ��줿ʸ�������ꤷ�ޤ���

--- escapeHTML(str) -> String

Ϳ����줿ʸ����˴ޤޤ�����ʸ�������ֻ��Ȥ��֤������ޤ���

@param str ʸ�������ꤷ�ޤ���

--- tag(element, attributes = {}) -> String
--- tag(element, attributes = {}){ ... } -> String

HTML ������ɽ��ʸ������ä��֤��ޤ���

�֥�å���Ϳ����줿���ϡ��֥�å���ɾ��������̤� HTML �����˶��ޤ�ޤ���

@param element ������̾������ꤷ�ޤ���

@param attributes �����˻��ꤹ��°����ϥå���ǻ��ꤷ�ޤ���

--- cookie(options) -> String

���Υ��å���ʸ�����������ޤ���

@param options �ϥå������ꤷ�ޤ���

--- header(*options) -> String
HTTP �إå�ʸ�����������ޤ���

@param options ���ץ�������ꤷ�ޤ���

--- print(*options){ ... } -> ()

ɸ����Ϥ˥֥�å���ɾ��������̤�񤭹��ߤޤ���

@param options [[m:CGI_cgi_lib.header]] ��Ʊ���Ǥ���

--- message(message, title = "", header = ["Content-Type: text/html"]) -> true
��å�������ɸ����Ϥ˽��Ϥ��ޤ���

@param message ��å���������ꤷ�ޤ���

@param title �����ȥ����ꤷ�ޤ���

@param header HTTP �إå�������ꤷ�ޤ���

--- error -> ()
���顼��å���������Ϥ��� [[m:Kernel.#exit]] ���ޤ���

== Instance Methods

--- read_from_cmdline

���ե饤��⡼�ɡ�

���ޥ�ɥ饤���������ɸ�����Ϥ��饯����ѥ�᡼�����ɤ߹��ߤޤ���

--- inputs -> Hash

������ѥ�᡼����ɽ���ϥå��塣

--- cookie -> Hash

���å�����ɽ���ϥå��塣

== Constants

--- CR -> String

�����å��꥿����Ǥ���

--- LF -> String

�饤��ե����ɤǤ���

--- EOL -> String

�����Ǥ���

--- RFC822_DAYS -> [String]

[[rfc:822]] �������Ƥ���������ά�ΤǤ���

--- RFC822_MONTHS -> [String]

[[rfc:822]] �������Ƥ�����ά�ΤǤ���
