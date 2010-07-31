#@since 1.9.1
HTTP ���å��������Ѥ��뤿��Υ��饹����������饤�֥��Ǥ���
#@end

#@# = class CGI::Cookie < DelegateClass(Array)
= class CGI::Cookie < Array

���å�����ɽ�����饹�Ǥ���

��:
  cookie1 = CGI::Cookie.new("name", "value1", "value2", ...)
  cookie1 = CGI::Cookie.new({"name" => "name", "value" => "value"})
  cookie1 = CGI::Cookie.new({'name'    => 'name',
                             'value'   => ['value1', 'value2', ...],
                             'path'    => 'path',   # optional
                             'domain'  => 'domain', # optional
                             'expires' => Time.now, # optional
                             'secure'  => true      # optional
                            })

  cgi.out({"cookie" => [cookie1, cookie2]}){ "string" }

  name    = cookie1.name
  values  = cookie1.value
  path    = cookie1.path
  domain  = cookie1.domain
  expires = cookie1.expires
  secure  = cookie1.secure

  cookie1.name    = 'name'
  cookie1.value   = ['value1', 'value2', ...]
  cookie1.path    = 'path'
  cookie1.domain  = 'domain'
  cookie1.expires = Time.now + 30
  cookie1.secure  = true

@see [[rfc:2965]]

== Class Methods

--- new(name = "", *value) -> CGI::Cookie

���å������֥������Ȥ�������ޤ���

�������˥ϥå������ꤹ����ϡ��ʲ��Υ��������Ѳ�ǽ�Ǥ���

: name
  ���å�����̾������ꤷ�ޤ���ɬ�ܡ�
: value
  ���å������͡��ޤ����ͤΥꥹ�Ȥ���ꤷ�ޤ���
: path
  ���Υ��å�����Ŭ�Ѥ���ѥ�����ꤷ�ޤ����ǥե���ȤϤ��� CGI ������ץȤΥ١����ǥ��쥯�ȥ�Ǥ���
: domain
  ���Υ��å�����Ŭ�Ѥ���ɥᥤ�����ꤷ�ޤ���
: expires
  ���Υ��å�����ͭ�����¤� [[c:Time]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���
: secure
  ������ꤹ��ȡ����Υ��å����ϥ����奢���å����ˤʤ�ޤ���
  �ǥե���Ȥϵ��Ǥ��������奢���å����� HTTPS �λ��Τ���������ޤ���

@param name ���å�����̾����ʸ����ǻ��ꤷ�ޤ���
            ���å�����̾�����ͤ����ǤȤ���ϥå������ꤷ�ޤ���

@param value name ��ʸ����Ǥ����硢�ͤΥꥹ�Ȥ��İʾ���ꤷ�ޤ���

        �㡧
        cookie1 = CGI::Cookie.new("name", "value1", "value2", ...)
        cookie1 = CGI::Cookie.new({"name" => "name", "value" => "value"})
        cookie1 = CGI::Cookie.new({'name'    => 'name',
                                   'value'   => ['value1', 'value2', ...],
                                   'path'    => 'path',   # optional
                                   'domain'  => 'domain', # optional
                                   'expires' => Time.now, # optional
                                   'secure'  => true      # optional
                                  })

        cgi.out({"cookie" => [cookie1, cookie2]}){ "string" }

        name    = cookie1.name
        values  = cookie1.value
        path    = cookie1.path
        domain  = cookie1.domain
        expires = cookie1.expires
        secure  = cookie1.secure

        cookie1.name    = 'name'
        cookie1.value   = ['value1', 'value2', ...]
        cookie1.path    = 'path'
        cookie1.domain  = 'domain'
        cookie1.expires = Time.now + 30
        cookie1.secure  = true

--- parse(raw_cookie) -> Hash

���å���ʸ�����ѡ������ޤ���

@param raw_cookie ���Υ��å�����ɽ��ʸ�������ꤷ�ޤ���

        �㡧
        cookies = CGI::Cookie.parse("raw_cookie_string")
          # { "name1" => cookie1, "name2" => cookie2, ... }

== Instance Methods

--- name -> String

���å�����̾�����֤��ޤ���

--- name=(value)

���å�����̾���򥻥åȤ��ޤ���

@param value ̾������ꤷ�ޤ��� 

--- value -> Array

���å������ͤ��֤��ޤ���

--- value=(value)

���å������ͤ򥻥åȤ��ޤ���

@param value �ѹ�����ͤ���ꤷ�ޤ���

--- path -> String

���å�����Ŭ�Ѥ���ѥ����֤��ޤ���

--- path=(value)

���å�����Ŭ�Ѥ���ѥ��򥻥åȤ��ޤ���

@param value �ѥ�����ꤷ�ޤ���

--- domain -> String

���å�����Ŭ�Ѥ���ɥᥤ����֤��ޤ���

--- domain=(value)

���å�����Ŭ�Ѥ���ɥᥤ��򥻥åȤ��ޤ���

@param value �ɥᥤ�����ꤷ�ޤ���

--- expires -> Time

���å�����ͭ�����¤��֤��ޤ���

--- expires=(value)

���å�����ͭ�����¤򥻥åȤ��ޤ���

@param value ͭ�����¤� [[c:Time]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���

--- secure -> bool

���Ȥ������奢���å����Ǥ�����ϡ������֤��ޤ���
�����Ǥʤ����ϡ������֤��ޤ���

--- secure=(val)

�����奢���å����Ǥ��뤫�ɤ������ѹ����ޤ���

@param val ������ꤹ��ȼ��Ȥϥ����奢���å����ˤʤ�ޤ���

--- to_s -> String

���å�����ʸ����ɽ�����֤��ޤ���
