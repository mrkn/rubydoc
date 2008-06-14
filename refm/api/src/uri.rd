URI (Uniform Resource Identifier) �Τ���Υ饤�֥��Ǥ���

=== ��Ϣ RFC

�ʲ��ϼ����κݤ˻��Ȥ���Ƥ��� RFC �Ǥ��ꡢ�ǿ��� RFC �Ǥ���Ȥϸ¤�ޤ���

  * [[RFC:1738]] Uniform Resource Locators (URL)                       (Updated by [[RFC:2396]])
  * [[RFC:2255]] The LDAP URL Format                                   (Obsoleted by [[RFC:4510]], [[RFC:4516]])
  * [[RFC:2368]] The mailto URL scheme
  * [[RFC:2373]] IP Version 6 Addressing Architecture                  (Obsoleted by [[RFC:3513]])
  * [[RFC:2396]] Uniform Resource Identifiers (URI): Generic Syntax    (Obsoleted by [[RFC:3986]])
  * [[RFC:2732]] Format for Literal IPv6 Addresses in URL's            (Obsoleted by [[RFC:3986]])
  * [[RFC:3986]] Uniform Resource Identifier (URI): Generic Syntax


#@include(uri/URI)
#@include(uri/Generic)
#@include(uri/FTP)
#@include(uri/HTTP)
#@include(uri/LDAP)
#@since 1.8.7
#@include(uri/LDAPS)
#@end
#@include(uri/MailTo)

#@since 1.8.2
= reopen Kernel

== Module Functions

--- URI(uri_str) -> object

Ϳ����줿 URI ���鳺������ [[c:URI::Generic]] �Υ��֥��饹�Υ��󥹥��󥹤���������
�֤��ޤ���scheme �����ꤵ��Ƥ��ʤ����ϡ�[[c:URI::Generic]] ���֥������Ȥ��֤��ޤ���

@param url �ѡ��������� URI ��ʸ����Ȥ���Ϳ���ޤ���

@raise URI::InvalidURIError �ѡ����˼��Ԥ�������ȯ�����ޤ���

@see [[m:URI.parse]]

#@end

= class URI::Error < StandardError

���٤Ƥ� URI �㳰���饹�δ��쥯�饹�Ǥ���

= class URI::InvalidURIError < URI::Error

������ URI ����ꤷ���Ȥ���ȯ�����ޤ���

= class URI::InvalidComponentError < URI::Error

�����ʹ������Ǥ���ꤷ���Ȥ���ȯ�����ޤ���

= class URI::BadURIError < URI::Error

URI �Ȥ��������������Ȥ����������Ȥ���ȯ�����ޤ���
