#@since 1.8.1
#@#require xsd/datatypes
require soap/soap
require soap/element
require soap/generator
require soap/encodingstyle/soapHandler
require soap/encodingstyle/literalHandler
require soap/encodingstyle/aspDotNetHandler

= module SOAP::Processor

== Class Methods

--- marshal(env, opt = {}, io = nil)

--- unmarshal(stream, opt = {})

--- default_parser_option
--- default_parser_option=(rhs)

#@end
