require xsd/qname
require xsd/ns
require xsd/charset
require xsd/datatypes
require xsd/xmlparser
require wsdl/wsdl
require wsdl/data
require wsdl/xmlSchema/data
require wsdl/soap/data

= class WSDL::ParseError < WSDL::Error

= class WSDL::Parser::FormatDecodeError < WSDL::Parser::ParseError

= class WSDL::Parser::UnknownElementError < WSDL::Parser::FormatDecodeError

= class WSDL::Parser::UnknownAttributeError < WSDL::Parser::FormatDecodeError

= class WSDL::Parser::UnexpectedElementError < WSDL::Parser::FormatDecodeError

= class WSDL::Parser::ElementConstraintError < WSDL::Parser::FormatDecodeError

= class WSDL::Parser::AttributeConstraintError < WSDL::Parser::FormatDecodeError


= class WSDL::Parser::ParseFrame < Object

[[c:WSDL::Parser]] �����ǤΤ߻��Ѥ��륯�饹
#@# �ΤϤ�

== Class Methods

--- new(ns, name, node)

== Instance Methods

--- name

°��

--- node
--- node=(node)

°��

--- ns

°��

= class WSDL::Parser < Object

== Class Methods

--- new(opt = {} )

== Instance Methods

--- characters(text)


--- charset


--- end_element(name)


--- parse(string_or_readable)


--- start_element(name, attrs)


== Private Instance Methods

--- decode_tag(ns, name, attrs, parent)

--- decode_tag_end(ns, node)

--- decode_text(ns, text)


