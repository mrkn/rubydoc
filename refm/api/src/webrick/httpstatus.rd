HTTP �Υ��ơ�������ɽ���㳰���饹���󶡤��ޤ���

= module WEBrick::HTTPStatus

HTTP �Υ��ơ�������ɽ���㳰���饹���󶡤���⥸�塼��Ǥ���
���ơ����������� 200 �ʤɤ������ξ���ޤޤ�ޤ���

�ʲ��Τ褦�ʷѾ��ˤ�볬�ؤ������Ƥ��ޤ���

 StandardError
  * WEBrick::HTTPStatus::Status
     * WEBrick::HTTPStatus::Info             (1XX)
     * WEBrick::HTTPStatus::Success          (2XX)
     * WEBrick::HTTPStatus::Redirect         (3XX)
     * WEBrick::HTTPStatus::Error            
        * WEBrick::HTTPStatus::ClientError   (4XX)
        * WEBrick::HTTPStatus::ServerError   (5XX)

== Singleton Methods

--- [](code)    -> WEBrick::HTTPStatus::Status

���ꤵ�줿������ɽ�����ơ����������ɤ��б����� WEBrick::HTTPStatus::Status
�Υ��֥��饹���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ����������ꤷ�ޤ���

  require 'webrick'
  p WEBrick::HTTPStatus[200]   #=> WEBrick::HTTPStatus::OK

== Module Functions

--- reason_phrase(code)     -> String

���ꤵ�줿������ɽ�����ơ����������ɤ��б����� reason phrase
��ɽ��ʸ������֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

  require 'webrick'
  p WEBrick::HTTPStatus.reason_phrase(304)   #=> "Not Modified"

--- info?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 1XX �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ����������ꤷ�ޤ���

--- success?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 2XX �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

--- redirect?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 3XX �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

--- error?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 4XX, 5xx �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

--- client_error?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 4XX �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

--- server_error?(code)    -> bool

���ꤵ�줿������ɽ�����ơ����������ɤ� 5XX �Ǥ������
true ���֤��ޤ��������Ǥʤ����� false ���֤��ޤ���

@param code HTTP �Υ��ơ����������ɤ�ɽ��������ʸ�������ꤷ�ޤ���

== Constants

#@#--- StatusMessage
#@#todo

#@#--- CodeToError
#@#todo

--- RC_CONTINUE
--- RC_SWITCHING_PROTOCOLS
--- RC_OK
--- RC_CREATED
--- RC_ACCEPTED
--- RC_NON_AUTHORITATIVE_INFORMATION
--- RC_NO_CONTENT
--- RC_RESET_CONTENT
--- RC_PARTIAL_CONTENT
--- RC_MULTIPLE_CHOICES
--- RC_MOVED_PERMANENTLY
--- RC_FOUND
--- RC_SEE_OTHER
--- RC_NOT_MODIFIED
--- RC_USE_PROXY
--- RC_TEMPORARY_REDIRECT
--- RC_BAD_REQUEST
--- RC_UNAUTHORIZED
--- RC_PAYMENT_REQUIRED
--- RC_FORBIDDEN
--- RC_NOT_FOUND
--- RC_METHOD_NOT_ALLOWED
--- RC_NOT_ACCEPTABLE
--- RC_PROXY_AUTHENTICATION_REQUIRED
--- RC_REQUEST_TIMEOUT
--- RC_CONFLICT
--- RC_GONE
--- RC_LENGTH_REQUIRED
--- RC_PRECONDITION_FAILED
--- RC_REQUEST_ENTITY_TOO_LARGE
--- RC_REQUEST_URI_TOO_LARGE
--- RC_UNSUPPORTED_MEDIA_TYPE
--- RC_REQUEST_RANGE_NOT_SATISFIABLE
--- RC_EXPECTATION_FAILED
--- RC_INTERNAL_SERVER_ERROR
--- RC_NOT_IMPLEMENTED
--- RC_BAD_GATEWAY
--- RC_SERVICE_UNAVAILABLE
--- RC_GATEWAY_TIMEOUT
--- RC_HTTP_VERSION_NOT_SUPPORTED

HTTP �Υ��ơ����������ɤ�ɽ�������Ǥ���

  require 'webrick'
  p WEBrick::HTTPStatus::RC_INTERNAL_SERVER_ERROR   #=> 500


= class WEBrick::HTTPStatus::Status < StandardError
HTTP �Υ��ơ����������ɤοƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::Info < WEBrick::HTTPStatus::Status
HTTP �Υ��ơ����������ɾ����� 1XX �οƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::Success < WEBrick::HTTPStatus::Status
HTTP �Υ��ơ��������������� 2XX �οƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::Redirect < WEBrick::HTTPStatus::Status
HTTP �Υ��ơ�����������ž�� 3XX �οƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::Error < WEBrick::HTTPStatus::Status
HTTP �Υ��ơ����������ɥ��顼�οƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::ClientError < WEBrick::HTTPStatus::Error
HTTP �Υ��ơ����������ɥ��饤����ȥ��顼 4XX �οƥ��饹�Ǥ���
= class WEBrick::HTTPStatus::ServerError < WEBrick::HTTPStatus::Error
HTTP �Υ��ơ����������ɥ����Х��顼 5XX �οƥ��饹�Ǥ���

= class WEBrick::HTTPStatus::EOFError < StandardError

= class WEBrick::HTTPStatus::Continue < WEBrick::HTTPStatus::Info
HTTP �Υ��ơ����������� 100 Continue ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::SwitchingProtocols < WEBrick::HTTPStatus::Info
HTTP �Υ��ơ����������� 101 Switching Protocols ��ɽ�����饹�Ǥ���

= class WEBrick::HTTPStatus::OK < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 200 OK ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Created < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 201 Created ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Accepted < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 202 Accepted ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NonAuthoritativeInformation < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 203 Non-Authoritative Information ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NoContent < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 204 No Content ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::ResetContent < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 205 Reset Content ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::PartialContent < WEBrick::HTTPStatus::Success
HTTP �Υ��ơ����������� 206 Partial Content ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::MultipleChoices < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 300 Multiple Choices ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::MovedPermanently < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 301 Moved Permanently ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Found < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 302 Found ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::SeeOther < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 303 See Other ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NotModified < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 304 Not Modified ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::UseProxy < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 305 Use Proxy ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::TemporaryRedirect < WEBrick::HTTPStatus::Redirect
HTTP �Υ��ơ����������� 307 Temporary Redirect ��ɽ�����饹�Ǥ���

= class WEBrick::HTTPStatus::BadRequest < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 400 Bad Request ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Unauthorized < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 401 Unauthorized ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::PaymentRequired < WEBrick::HTTPStatus::ClientError

= class WEBrick::HTTPStatus::Forbidden < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 403 Forbidden ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NotFound < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 404 Not Found ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::MethodNotAllowed < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 405 Method Not Allowed ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NotAcceptable < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 406 Not Acceptable ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::ProxyAuthenticationRequired < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 407 Proxy Authentication Required ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::RequestTimeout < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 408 Request Timeout ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Conflict < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 409 Conflict ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::Gone < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 410 Gone ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::LengthRequired < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 411 Length Required ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::PreconditionFailed < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 412 Precondition Failed ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::RequestEntityTooLarge < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 413 Request Entity Too Large ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::RequestURITooLarge < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 414 Request-URI Too Long ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::UnsupportedMediaType < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 415 Unsupported Media Type ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::RequestRangeNotSatisfiable < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 416 Requested Range Not Satisfiable ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::ExpectationFailed < WEBrick::HTTPStatus::ClientError
HTTP �Υ��ơ����������� 417 Expectation Failed ��ɽ�����饹�Ǥ���

= class WEBrick::HTTPStatus::InternalServerError < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 500 Internal Server Error ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::NotImplemented < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 501 Not Implemented ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::BadGateway < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 502 Bad Gateway ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::ServiceUnavailable < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 503 Service Unavailable ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::GatewayTimeout < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 504 Gateway Timeout ��ɽ�����饹�Ǥ���
= class WEBrick::HTTPStatus::HTTPVersionNotSupported < WEBrick::HTTPStatus::ServerError
HTTP �Υ��ơ����������� 505 HTTP Version Not Supported ��ɽ�����饹�Ǥ���
