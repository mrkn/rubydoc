#@since 1.8.1
require soap/rpc/httpserver

= class SOAP::RPC::StandaloneServer < SOAP::RPC::HTTPServer

== Class Methods

--- new(appname, default_namespace, host = "0.0.0.0", port = 8080)

== Instance Methods

--- add_servant(obj, namespace = @default_namespace)

--- add_headerhandler(obj)

#@end
