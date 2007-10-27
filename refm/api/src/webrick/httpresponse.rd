require webrick/httpversion
require webrick/htmlutils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPResponse < Object

HTTP �Υ쥹�ݥ󥹤�ɽ������Υ��饹�Ǥ���

== Class Methods

--- new(config)
#@todo
HTTPResponse ���֥������Ȥ��������롣config �ˤ��������¸�����ϥå����
Ϳ���ޤ���:HTTPVersion ��ɬ�ܤǤ���

== Instance Methods

--- [](field)    -> String
#@todo
�쥹�ݥ󥹤Υإå��γ����������Ƥ�ʸ������֤��ޤ���

@param field �إå�̾��ʸ����ǻ��ꤷ�ޤ�����ʸ���Ⱦ�ʸ������̤��ޤ���

--- []=(field, val)
#@todo
�쥹�ݥ󥹤γ�������إå��� val �����ꤹ�롣val ��ʸ����

@param field �إå�̾��ʸ����ǻ��ꤷ�ޤ�����ʸ���Ⱦ�ʸ������̤��ޤ���

@param val �إå����ͤ���ꤷ�ޤ���to_s �᥽�åɤˤ�ä�ʸ������Ѵ�����ޤ���

@see [[m:WEBrick::HTTPResponse#chunked?]], [[m:WEBrick::HTTPResponse#content_length]], 
     [[m:WEBrick::HTTPResponse#content_type]]

--- body        -> String | IO
--- body=(val)

���饤����Ȥ��֤�����(����ƥ��ƥ��ܥǥ�)��ɽ�����������Ǥ���

���Ȥ� chunked �Ǥ��äƤ� body ���ͤϥ���󥯷����ǤϤ���ޤ���

@param val ��å������ܥǥ���ʸ���� [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���
           ���Ȥ� chunked �Ǥ��äƤ����󥯷����ˤ���ɬ�פϤ���ޤ���
           Ŭ�ڤ˥���󥯷������󥳡��ǥ��󥰤���ޤ���

--- chunked?     -> bool
--- chunked=(flag)

���饤����Ȥ��֤�����(����ƥ��ƥ��ܥǥ�)�� chunk ��ʬ���ƥ��饤����Ȥ�
�֤����ɤ����򿿵���ɽ�����������Ǥ���

���Ȥ� [[m:WEBrick::HTTPResponse#request_http_version]] �� 1.0 �ʲ��Ǥ����硢�����ͤ�̵�뤵��ޤ���

@param flag true ����ꤷ����硢�쥹�ݥ󥹤� chunk ��ʬ���ƥ��饤����Ȥ��֤��ޤ���

--- config    -> Hash

���Ȥ������������˻��ꤵ�줿�ϥå�����֤��ޤ���

#@since 1.8.2
--- content_length         -> Intger | nil
--- content_length=(len)
#@todo

Content-Length �إå����ͤ�������ɽ�����������Ǥ����ǥե���Ȥ� nil �Ǥ���

: body �� String ���֥������ȤǤ�����
  content_length ���ͤ� nil �ΤȤ� Content-Length �إå��ˤ�
  body �Υ��������Ȥ��ޤ���nil �Ǥʤ��Ȥ� body �μºݤΥ������Ȥ����ͤ�Ʊ�����ɤ����θ��ڤϹԤ��ޤ���
: body �� IO ���֥������ȤǤ�����
  content_length ���ͤ� nil �ΤȤ� Content-Length �إå��ϥ쥹�ݥ󥹤˴ޤޤ줺��IO �������Ƥ��ɤ߹���
  �Ǥ���򥨥�ƥ��ƥ��ܥǥ��Ȥ��ޤ���nil �Ǥʤ��Ȥ� IO ���� content_length �Х��Ȥ����ɤ߹��ߤ����
  ����ƥ��ƥ��ܥǥ��Ȥ��ޤ���

�ޤ� RFC2616 4.4 ������줿 Content-Length �إå������äƤϤ����ʤ��������ƤϤޤ���ˤ�
content_length ���ͤ�̵�뤵�� Content-Length �إå��ϥ쥹�ݥ󥹤˴ޤޤ�ޤ���

@param len �إå����ͤ������ǻ��ꤷ�ޤ���nil ����ꤹ�뤳�ȤϽ���ޤ���

--- content_type         -> String | nil
--- content_type=(val)
#@todo
Content-Type �إå����ͤ�ʸ�����ɽ�����������Ǥ���

@param val Content-Type �إå����ͤ�ʸ����ǻ��ꤷ�ޤ���
#@end

--- cookies    -> [WEBrick::Cookie]

���Ȥ��ݻ����� [[c:WEBrick::Cookie]] ��ɽ������Ǥ���

  res.cookies << Cookie.parse_set_cookie(k)

--- each{|key, val| ... }

�쥹�ݥ󥹤Υإå�̾�� key�����Ƥ� val �Ȥ��ƥ֥�å���ɾ�����ޤ���

--- filename            -> String | nil
--- filename=(file)

���Ȥ����Ƥ�����ե�����Τ���Ǥ�����ˡ����Υե�����̾��ʸ�����ɽ�����������Ǥ���
�ǥե���Ȥ� nil �Ǥ���

@param file �ե�����̾��ɽ��ʸ����Ǥ���

--- header     -> Hash

�إå�̾�򥭡����إå����ͤ��ͤȤ���ϥå�����֤��ޤ����ϥå���Υ������ͤ�ʸ����Ǥ���

--- http_version    -> WEBrick::HTTPVersion

�쥹�ݥ󥹤� HTTP �ΥС�������ɽ�� [[c:WEBrick::HTTPVersion]] ���֥������Ȥ��֤��ޤ���

--- keep_alive?        -> bool
--- keep_alive         -> bool
--- keep_alive=(flag)

�쥹�ݥ󥹤� keep_alive ��ͭ���Ǥ��뤫��ɽ�������Ǥ���
�ǥե���Ȥ� false �Ǥ���

@param flag true ����ꤹ��� Keep-Alive ��ͭ���ˤ��ޤ���

--- reason_phrase         -> String | nil
--- reason_phrase=(val)
#@todo
HTTP �Υ쥹�ݥ󥹤κǽ�ιԤ� reason phrase ��ʸ�����ɽ�����������Ǥ���
�����ͤ� nil �ξ�� reason phrase �� status ������������ޤ���
�ǥե���Ȥ� nil �Ǥ���

@param val reason phrase ��ɽ��ʸ�������ꤷ�ޤ���

--- request_http_version           -> WEBrick::HTTPVersion
--- request_http_version=(ver)

�ꥯ�����Ȥ� HTTP �С������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥ�ɽ�����������Ǥ���
�ǥե���ȤǤϼ��Ȥ� [[m:WEBrick::HTTPResponse#http_version]] ���Ȥ��ޤ���

@param ver �ꥯ�����Ȥ� HTTP �С������� [[c:WEBrick::HTTPVersion]] ���֥������Ȥǻ��ꤷ�ޤ���

--- request_method          -> String | nil
--- request_method=(method)

�ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ�����ɽ�����������Ǥ���
�ǥե���Ȥ� nil �Ǥ���

@param method �ꥯ�����Ȥ� HTTP �᥽�åɤ�ʸ����ǻ��ꤷ�ޤ���

--- request_uri        -> URI | nil
--- request_uri=(uri)

�ꥯ�����Ȥ� URI �� [[c:URI]] ���֥������Ȥ�ɽ�����������Ǥ���
�ǥե���Ȥ� nil �Ǥ���

@param method �ꥯ�����Ȥ� URI �� [[c:URI]] ���֥������Ȥǻ��ꤷ�ޤ���

--- sent_size    -> Intger

���饤����Ȥ�����줿����(����ƥ��ƥ��ܥǥ�)�ΥХ��ȿ���ɽ���������֤��ޤ���

--- set_error(ex, backtrace = false)
#@todo

--- set_redirect(status, url)
#@todo

���ꤵ�줿 url �˥�����쥯�Ȥ��뤿��Υإå�������(����ƥ��ƥ��ܥǥ�)�����ꤷ�㳰 status ��
ȯ�������ޤ���

--- status           -> Intger

�쥹�ݥ󥹤Υ��ơ����������ɤ�ɽ���������֤��ޤ���
�ǥե���Ȥ� [[m:WEBrick::HTTPStatus::RC_OK]] �Ǥ���

--- status=(status)

�쥹�ݥ󥹤Υ��ơ����������ɤ������ǻ��ꤷ�ޤ���
reason_phrase ��Ŭ�ڤʤ�Τ����ꤷ�ޤ���

@param status ���ơ����������ɤ������ǻ��ꤷ�ޤ���

--- status_line    -> String

HTTP �Υ��ơ������饤���ʸ������֤��ޤ���

--- to_s    -> String
#@todo
�ºݤ˥��饤����Ȥ�������ǡ�����ʸ����Ȥ����֤��ޤ���
