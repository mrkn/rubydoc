require webrick/httpservlet/abstract

= class WEBrick::HTTPServlet::ProcHandler < WEBrick::HTTPServlet::AbstractServlet

[[c:Proc]] �򰷤�����Υ����֥�åȡ�

[[m:WEBrick::HTTPServer#mount]] �˰����Ȥ���Ϳ���뤳�Ȥ�
����ʤ���[[m:WEBrick::HTTPServer#mount_proc]]��Ȥ���

== Class Methods

--- new(proc)
#@todo
proc �ˤϸƤӽФ����� [[c:Proc]] ���֥������Ȥ�Ϳ���롣proc �ϥ��饤����Ȥ����
�ꥯ�����Ȥ����ä�����proc.call(request, response) �Τ褦�˸ƤӽФ���롣
[[c:WEBrick::HTTPResponse]] ���֥������Ȥ� [[c:WEBrick::HTTPRequest]] ���֥������ȡ�

== Instance Methods

--- get_instance(server, *options)
#@todo

--- do_GET(req, res)
--- do_POST(req, res)
#@todo
