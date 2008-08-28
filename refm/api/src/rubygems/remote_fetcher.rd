require rubygems

��⡼�ȥ��������� Gem �ѥå������� Gem �ѥå������ξ����������뤿��Υ饤�֥��Ǥ���

= class Gem::RemoteFetcher
include Gem::UserInteraction

��⡼�ȥ��������� Gem �ѥå������� Gem �ѥå������ξ����������뤿��Υ��饹�Ǥ���

== Singleton Methods

--- fetcher -> Gem::RemoteFetcher
#@todo

���Υ��饹��ͣ��Υ��󥹥��󥹤��֤��ޤ���

== Instance Methods

--- download(spec, source_uri, install_dir = Gem.dir) -> String
#@todo

source_uri ����������� Gem �ѥå������򥭥�å���ǥ��쥯�ȥ�����֤��ޤ���

���� Gem �ѥå�������¸�ߤ�����ϡ��ե�������֤������ޤ��� source_uri ��
������ѥ� (file://) �Ǥ�����Ͼ�˥ե�������֤������ޤ���

@param spec [[c:Gem::Specification]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param source_uri ������� URI ����ꤷ�ޤ���

@param install_dir ��������ɤ����ե���������������ꤷ�ޤ���

@return ������˥��ԡ����� Gem �ե�����Υѥ����֤��ޤ���

@raise Gem::RemoteFetcher::FetchError 

--- fetch_path(uri, mtime = nil, head = false) -> String | Hash
#@todo

Ϳ����줿 URI �����������ɤ����ǡ�����ʸ����Ȥ����֤��ޤ���

�إå�����Τ߼����������ϥϥå�����֤��ޤ���

@param uri �ǡ���������� URI ����ꤷ�ޤ���

@param mtime �����������ꤷ�ޤ���

@param head ������ꤹ��ȥإå�����Τ߼������ޤ���

--- fetch_size(uri) -> Integer
#@todo

Ϳ����줿 URI �����������ɤ���ǡ����Υ��������֤��ޤ���

@param uri �ǡ���������� URI ����ꤷ�ޤ���

--- escape(str) -> String
#@todo

URI ʸ����򥨥󥳡��ɤ���ʸ������֤��ޤ���

@see [[m:URI.#escape]]

--- unescape(str) -> String
#@todo

URI ʸ�����ǥ����ɤ���ʸ������֤��ޤ���

@see [[m:URI.#unescape]]

--- get_proxy_from_env -> URI | nil
#@todo

�Ķ��ѿ��˥��åȤ���Ƥ��� HTTP proxy �ξ������������֤��ޤ���

�����ǥ����å����Ƥ���Ķ��ѿ��ϰʲ����̤�Ǥ���

 * http_proxy
 * http_proxy_user
 * http_proxy_pass
 * HTTP_PROXY
 * HTTP_PROXY_USER
 * HTTP_PROXY_PASS

--- normalize_uri(uri) -> String
#@todo

URI �Υ���������ʬ���礱�Ƥ������ "http://" ����ä��֤��ޤ���

@param uri URI ʸ�������ꤷ�ޤ���

--- connection_for(uri) -> Net::HTTP
#@todo

HTTP ���ͥ����������������֤��ޤ���

������³���Ƥ��� URI �Ǥ���С������ѤߤΥ��ͥ��������֤��ޤ���
�ޤ���ɬ�פ�����Хץ�������Ѥ��ޤ���

@param uri ��³��� URI ����ꤷ�ޤ���

--- open_uri_or_path(uri, last_modified = nil, head = false, depth = 0)
#@todo

@param uri URI ����ꤷ�ޤ���

@param last_modified �ǽ������������ꤷ�ޤ���

@param head ������ꤹ��ȥإå�����Τ߼������ޤ���

@param depth ���ߤΥ�����쥯�Ȳ������ꤷ�ޤ���

@raise Gem::RemoteFetcher::FetchError �ǥե���ȤǤ� 11 �������쥯�Ȥ�������ȯ�����ޤ���
       depth ����ꤹ��� 10 - depth ����¿��������쥯�Ȥ������ˤ����㳰��ȯ������褦�ˤʤ�ޤ���
       �ޤ� HTTP �Υ쥹�ݥ󥹤����곰�Τ�Τξ��ˤ�ȯ�����ޤ���

--- request(uri, request_class, last_modified = nil) -> Net::HTTPResponse
#@todo

Ϳ����줿 URI ���Ф��ƥꥯ�����Ȥ�¹Ԥ���[[c:Net::HTTPResponse]] ���֤��ޤ���

@param uri URI ����ꤷ�ޤ���

@param request_class [[c:Net::HTTP::Head]] �� [[c:Net::HTTP::Get]] ����ꤷ�ޤ���

@param last_modified �ǽ������������ꤷ�ޤ���

@see [[c:Net::HTTP]], [[c:Net::HTTP::Head]], [[c:Net::HTTP::Get]]

--- reset(connection) -> Net::HTTP
#@todo

Ϳ����줿���ͥ�������ꥻ�åȤ��ޤ���

@param connection ���ͥ���������ꤷ�ޤ���


--- file_uri?(uri) -> bool
#@todo

"file://" �ǻϤޤ�ʸ����Ǥ�����Ͽ����֤��ޤ��������Ǥʤ����ϵ����֤��ޤ���

@param uri URI ��ɽ��ʸ�������ꤷ�ޤ���

--- get_file_uri_path(uri) -> String

Ϳ����줿 URI ���� "file://" ���������ʸ������֤��ޤ���

@param uri URI ��ɽ��ʸ�������ꤷ�ޤ���

= class Gem::RemoteFetcher::FetchError < Gem::Exception

[[c:Gem::RemoteFetcher]] �Ǥν�����ȯ������ IO �� HTTP ���㳰���åפ����㳰���饹�Ǥ���

== Singleton Methods

--- new(message, uri) -> Gem::RemoteFetcher::FetchError

�����㳰���饹���������ޤ���

@param message ��å���������ꤷ�ޤ���

@param uri ���꤬ȯ������ URI ����ꤷ�ޤ���


== Instance Methods

--- uri -> URI

���꤬ȯ������ URI ���֤��ޤ���

--- to_s -> String

�㳰�ξ����ʸ����Ȥ����֤��ޤ���
