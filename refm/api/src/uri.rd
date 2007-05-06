URI (Uniform Resource Identifier) �Τ���Υ饤�֥��Ǥ���

=== ��Ϣ RFC

�ʲ��ϼ����κݤ˻��Ȥ���Ƥ��� RFC �Ǥ��ꡢ�ǿ��� RFC �Ǥ���Ȥϸ¤�ޤ���

  * [[RFC:1738]] Uniform Resource Locators (URL)                       (Updated by [[rfc:2396]])
  * [[RFC:2255]] The LDAP URL Format                                   (Obsoleted by [[RFC:4510]], [[RFC:4516]])
  * [[RFC:2368]] The mailto URL scheme
  * [[RFC:2373]] IP Version 6 Addressing Architecture                  (Obsoleted by [[rfc:3513]])
  * [[RFC:2396]] Uniform Resource Identifiers (URI): Generic Syntax    (Obsoleted by [[rfc:3986]])
  * [[RFC:2732]] Format for Literal IPv6 Addresses in URL's            (Obsoleted by [[rfc:3986]])

#@include(uri/URI)
#@include(uri/Generic)
#@include(uri/FTP)
#@include(uri/HTTP)
#@include(uri/LDAP)
#@include(uri/MailTo)

#@since 1.8.2
= reopen Kernel

== Module Functions

--- URI(uri_str)
#@todo

[[m:URI.parse]]��Ʊ���Ǥ���
#@end

= class URI::Error < StandardError

���٤Ƥ� URI �㳰���饹�δ��쥯�饹�Ǥ���

= class URI::InvalidURIError < URI::Error

������ URI ����ꤷ���Ȥ���ȯ�����ޤ���

= class URI::InvalidComponentError < URI::Error

�����ʹ������Ǥ���ꤷ���Ȥ���ȯ�����ޤ���

= class URI::BadURIError < URI::Error

URI �Ȥ��������������Ȥ����������Ȥ���ȯ�����ޤ���
