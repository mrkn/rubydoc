require xsd/qname
require xsd/ns
require xsd/charset
require xsd/datatypes
require xsd/xmlparser
require wsdl/wsdl
require wsdl/data
require wsdl/xmlSchema/data
require wsdl/soap/data

= class WSDL::Parser::ParseError < WSDL::Error

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
#@todo

== Instance Methods

--- name
#@todo

°��

--- node
--- node=(node)
#@todo

°��

--- ns
#@todo

°��

= class WSDL::Parser < Object

== Class Methods

--- new(opt = {} )
#@todo

== Instance Methods

--- characters(text)
#@todo


--- charset
#@todo


--- end_element(name)
#@todo


--- parse(string_or_readable)
#@todo


--- start_element(name, attrs)
#@todo


== Private Instance Methods

--- decode_tag(ns, name, attrs, parent)
#@todo

--- decode_tag_end(ns, node)
#@todo

--- decode_text(ns, text)
#@todo


