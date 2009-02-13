require webrick/httpversion
require webrick/htmlutils
require webrick/httputils
require webrick/httpstatus

= class WEBrick::HTTPResponse < Object

HTTP �Υ쥹�ݥ󥹤�ɽ������Υ��饹�Ǥ���

�̾� WEBrick::HTTPResponse ���֥������Ȥϥ����֥�åȤ� service �᥽�åɤ� do_XXX �᥽�åɤ�
�����Ȥ���Ϳ�������ΤǤ��ꡢ�桼��������Ū����������ɬ�פϤ���ޤ���

== Class Methods

--- new(config)
#@todo
HTTPResponse ���֥������Ȥ����������֤��ޤ���

@param config �������¸�����ϥå������ꤷ�ޤ���:HTTPVersion ��ɬ�ܤǤ���

  res = WEBrick::HTTPResponse.new( { :HTTPVersion => "1.1" } )

== Instance Methods

--- [](field)    -> String
#@todo
�쥹�ݥ󥹤Υإå��γ����������Ƥ�ʸ������֤��ޤ���

@param field �إå�̾��ʸ����ǻ��ꤷ�ޤ�����ʸ���Ⱦ�ʸ������̤��ޤ���

  p res['date']   #=> "Sat, 27 Oct 2007 08:53:03 GMT"

--- []=(field, val)
#@todo
�쥹�ݥ󥹤γ�������إå��� val �����ꤹ�롣val ��ʸ����

@param field �إå�̾��ʸ����ǻ��ꤷ�ޤ�����ʸ���Ⱦ�ʸ������̤��ޤ���

@param val �إå����ͤ���ꤷ�ޤ���to_s �᥽�åɤˤ�ä�ʸ������Ѵ�����ޤ���

  require 'time'
  res['last-modified'] = Time.now.httpdate

@see [[m:WEBrick::HTTPResponse#chunked?]], [[m:WEBrick::HTTPResponse#content_length]], 
     [[m:WEBrick::HTTPResponse#content_type]]

--- body        -> String | IO
--- body=(val)

���饤����Ȥ��֤�����(����ƥ��ƥ��ܥǥ�)��ɽ�����������Ǥ���

���Ȥ� chunked �Ǥ��äƤ� body ���ͤϥ���󥯷����ǤϤ���ޤ���

@param val ��å������ܥǥ���ʸ���� [[c:IO]] ���֥������Ȥǻ��ꤷ�ޤ���
           ���Ȥ� chunked �Ǥ��äƤ����󥯷����ˤ���ɬ�פϤ���ޤ���
           Ŭ�ڤ˥���󥯷������󥳡��ǥ��󥰤���ޤ���

  require 'webrick'
  include WEBrick
  res = HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.body = 'hoge'
  print res.to_s

  #=> ���Ϸ��
  HTTP/1.1 200 OK
  Connection: Keep-Alive
  Date: Sat, 27 Oct 2007 08:58:49 GMT
  Server:
  Content-Length: 4
  
  hoge

--- chunked?     -> bool
--- chunked=(flag)

���饤����Ȥ��֤�����(����ƥ��ƥ��ܥǥ�)�� chunk ��ʬ���뤫�ɤ����򿿵���ɽ�����������Ǥ���

���Ȥ� [[m:WEBrick::HTTPResponse#request_http_version]] �� 1.0 �ʲ��Ǥ����硢�����ͤ�̵�뤵��ޤ���

@param flag true ����ꤷ����硢�쥹�ݥ󥹤� chunk ��ʬ���ƥ��饤����Ȥ��֤��ޤ���

  require 'webrick'
  include WEBrick
  res = HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.body = 'hoge'
  res.chunked = true
  print res.to_s

  #=> ���Ϸ��
  HTTP/1.1 200 OK
  Connection: Keep-Alive
  Date: Sat, 27 Oct 2007 09:04:28 GMT
  Server:
  Transfer-Encoding: chunked
  
  4
  hoge
  0
  
  #
--- config    -> Hash

���Ȥ������������˻��ꤵ�줿�ϥå�����֤��ޤ���

#@since 1.8.2
--- content_length         -> Integer | nil
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

  require 'webrick'
  include WEBrick
  res = HTTPResponse.new( { :HTTPVersion => "1.1" } )
  f = File.new('testfile')
  res.body = f
  res.content_length = 2
  print res.to_s
  
  #=> ���Ϸ��
  HTTP/1.1 200 OK
  Connection: Keep-Alive
  Date: Sat, 27 Oct 2007 12:04:32 GMT
  Server:
  Content-Length: 2
  
  ho

--- content_type         -> String | nil
--- content_type=(val)
#@todo
Content-Type �إå����ͤ�ʸ�����ɽ�����������Ǥ���

@param val Content-Type �إå����ͤ�ʸ����ǻ��ꤷ�ޤ���

  res.content_type = "text/html"

@see [[m:WEBrick::HTTPUtils.#mime_type]]
#@end

--- cookies    -> [WEBrick::Cookie]

�쥹�ݥ󥹤� Set-Cookie �إå����ͤ�ɽ�� [[c:WEBrick::Cookie]] ���֥������Ȥ�����Ǥ���
�쥹�ݥ󥹤˿����� Cookie ��ä��������Ϥ�������� [[c:WEBrick::Cookie]] ���֥������Ȥ�ä��ޤ���

  res.cookies << WEBrick::Cookie.parse_set_cookie(k)

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

  require 'webrick'
  res = WEBrick::HTTPResponse.new( { :HTTPVersion => "1.1" } )
  p res.http_version.class                                        #=> WEBrick::HTTPVersion
  p res.http_version.to_s                                         #=> "1.1"

--- keep_alive?        -> bool
--- keep_alive         -> bool
--- keep_alive=(flag)

�쥹�ݥ󥹤� keep_alive ��ͭ���Ǥ��뤫�򿿵���ɽ�����������Ǥ���
�ǥե���Ȥ� true �Ǥ���

@param flag true ����ꤹ��� Keep-Alive ��ͭ���ˤ��ޤ���

--- reason_phrase         -> String | nil
--- reason_phrase=(val)
#@todo
HTTP �Υ쥹�ݥ󥹤κǽ�ιԤ� reason phrase ��ʸ�����ɽ�����������Ǥ���
�����ͤ� nil �ξ�� reason phrase �� status ������������ޤ���
�ǥե���Ȥ� nil �Ǥ���

@param val reason phrase ��ɽ��ʸ�������ꤷ�ޤ���

  require 'webrick'
  res = WEBrick::HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.status = 404
  
  p res.reason_phrase    #=> "Not Found"

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

--- sent_size    -> Integer

���饤����Ȥ�����줿����(����ƥ��ƥ��ܥǥ�)�ΥХ��ȿ���ɽ���������֤��ޤ���

--- set_error(status, backtrace = false)    -> ()

���Ȥ�����(����ƥ��ƥ��ܥǥ�)����ꤵ�줿 status �Υ��顼�ڡ����ˤ��ޤ���

@param status [[c:WEBrick::HTTPStatus::Status]] �Υ��֥��饹�����̤��㳰���饹����ꤷ�ޤ���

@param backtrace true ����ꤷ�����Хå��ȥ졼���򥨥顼�ڡ����˽��Ϥ��ޤ���

--- set_redirect(status, url)    -> ()
#@todo

���ꤵ�줿 url �˥�����쥯�Ȥ��뤿��Υإå�������(����ƥ��ƥ��ܥǥ�)�����ꤷ�㳰 status ��
ȯ�������ޤ���

--- status           -> Integer

�쥹�ݥ󥹤Υ��ơ����������ɤ�ɽ���������֤��ޤ���
�ǥե���Ȥ� [[m:WEBrick::HTTPStatus::RC_OK]] �Ǥ���

--- status=(status)

�쥹�ݥ󥹤Υ��ơ����������ɤ������ǻ��ꤷ�ޤ���
reason_phrase ��Ŭ�ڤʤ�Τ����ꤵ��ޤ���

@param status ���ơ����������ɤ������ǻ��ꤷ�ޤ���

  require 'webrick'
  res = WEBrick::HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.status = 404
  
  p res.reason_phrase    #=> "Not Found"

--- status_line    -> String

HTTP �Υ��ơ������饤��� CR+LF �դ�ʸ������֤��ޤ���

  require 'webrick'
  res = WEBrick::HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.status = 404
  
  p res.status_line    #=>  "HTTP/1.1 404 Not Found \r\n"

--- to_s    -> String

�ºݤ˥��饤����Ȥ�������ǡ�����ʸ����Ȥ����֤��ޤ���

  require 'webrick'
  include WEBrick
  res = HTTPResponse.new( { :HTTPVersion => "1.1" } )
  res.body = 'hoge'
  print res.to_s

  #=> ���Ϸ��
  HTTP/1.1 200 OK
  Connection: Keep-Alive
  Date: Sat, 27 Oct 2007 08:58:49 GMT
  Server:
  Content-Length: 4
  
  hoge
