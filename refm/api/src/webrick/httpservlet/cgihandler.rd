#@#require rbconfig
#@#require tempfile
require webrick/config
require webrick/httpservlet/abstract

= class WEBrick::HTTPServlet::CGIHandler < WEBrick::HTTPServlet::AbstractServlet

CGI �򰷤�����Υ����֥�åȡ�

== Class Methods

--- new(server, name)
name �ϼ¹Ԥ������������ CGI �ե������ʸ�����Ϳ���롣

== Instance Methods

--- do_GET(req, res)
--- do_POST(req, res)

== Constants

--- Ruby

--- CGIRunner
