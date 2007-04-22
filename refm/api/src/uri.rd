URI (Uniform Resource Identifier) ���ݡ��ȥ饤�֥��

=== ��Ϣ RFC

    * [[RFC:1738]] Uniform Resource Locators (URL)
    * [[RFC:1808]] Relative Uniform Resource Locators
    * [[RFC:2255]] The LDAP URL Format
    * [[RFC:2368]] The mailto URL scheme
    * [[RFC:2373]] IP Version 6 Addressing Architecture
    * [[RFC:2396]] Uniform Resource Identifiers (URI): Generic Syntax
    * [[RFC:2732]] Format for Literal IPv6 Addresses in URL's

#@include(uri/URI)
#@include(uri/Generic)
#@include(uri/FTP)
#@include(uri/HTTP)
#@include(uri/LDAP)
#@include(uri/MailTo)

#@since 1.8.2
= reopen Kernel

== Private Instance Methods

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
