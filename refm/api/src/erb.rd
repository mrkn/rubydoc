eRuby ������ץȤ�������륯�饹��
���� ERbLight �ȸƤФ�Ƥ�����Τǡ�
ɸ����Ϥؤΰ�����ʸ����������Ȥʤ�ʤ����� eruby �Ȱۤʤ�ޤ���


=== �Ȥ���

ERB ���饹��Ȥ�����ˤ� require 'erb' ����ɬ�פ�����ޤ���

��:

  require 'erb'

  ERB.new($<.read).run

=== trim_mode

trim_mode �������ε�ư���ѹ����륪�ץ����Ǥ������ο��񤤤����Ǥ��ޤ���
  * ���Ԥΰ���
  * %�ǤϤ��ޤ�Ԥΰ��� (ERB 2.0 �����ɲä���ޤ���)


trim_mode �˻���Ǥ����ͤϼ����̤�Ǥ���

  * ERb-1.4.x �ߴ��λ�����ˡ
    * nil, 0: ���Τޤ��Ѵ�
    * 1: ������%>�ΤȤ����Ԥ���Ϥ��ʤ�
    * 2: ��Ƭ��<%�ǹ�����%>�ΤȤ����Ԥ���Ϥ��ʤ�

  * 2.0 ����λ�����ˡ
    * nil, "": ���Τޤ��Ѵ�
    * ">": 1��Ʊ��
    *  "<>": 2��Ʊ��
    * "-": ������-%>�ΤȤ����Ԥ���Ϥ��ʤ����ޤ�����Ƭ��<%-�ΤȤ���Ƭ�ζ���ʸ����������
    * "%": %�ǤϤ��ޤ�Ԥ�<%..%>�Ȥߤʤ����Ѵ����롣���ιԤβ��ԤϽ��Ϥ��ʤ�
    * "%>", ">%": 1��"%"��ξ����Ԥʤ�
    * "%<>", "<>%": 2��"%"��ξ����Ԥʤ�
    * "%-": "-"��"%"��ξ����Ԥʤ�

�¹���:

  # ������ץ�
  <% 3.times do |n| %>
  % n = 0
  * <%= n%>
  <% end %>
  
  # trim_mode = nil, '', 0
  
  % n = 0
  * 0
  
  % n = 0
  * 1
  
  % n = 0
  * 2
  
  # trim_mode = 1, '>'
  % n = 0
  * 0% n = 0
  * 1% n = 0
  * 2
  
  # trim_mode = 2, '<>'
  % n = 0
  * 0
  % n = 0
  * 1
  % n = 0
  * 2
  
  # trim_mode = '%'
  
  * 0
  
  * 0
  
  * 0
  
  # trim_mode = '%>', '>%'
  * 0* 0* 0
  
  # trim_mode = '%<>', '<>%'
  * 0
  * 0
  * 0
  
  # ������ץ�
  <% 3.times do |n| -%>
  % n = 0
    <%- m = 0 %>*
  * <%= n%>
  <% end -%>
  
  # trim_mode = '%-'
  *
  * 0
  *
  * 0
  *
  * 0
  
  # ������ץ�
  <% 3.times do |n| %>
  % n = 0
    <%- m = 0 %>*
  * <%= n%>
  <% end %>
  
  # trim_mode = '%'
  
    *
  * 0
  
    *
  * 0
  
    *
  * 0

= class ERB < Object

== Class Methods

--- new(eruby_script, safe_level=nil, trim_mode=nil, eoutvar='_erbout')

    eruby_script ���� ERB ���������ޤ���eval ���� $SAFE��trim_mode(���)��
    eoutvar(eRuby ������ץȤ���Ǥ���� ERB ��Ȥ��Ȥ����ѹ����ޤ���
    ���̡��ѹ�����ɬ�פϤ���ޤ���)�����Ǥ��ޤ���

== Instance Methods

--- run(b=TOPLEVEL_BINDING)

ERB ��b �� binding �Ǽ¹Ԥ����������ޤ���

--- result(b=TOPLEVEL_BINDING)

ERB �� b �� binding �Ǽ¹Ԥ���ʸ������֤��ޤ���

--- src

�Ѵ����� Ruby ������ץȤ�������ޤ���

--- def_method(mod, methodname, fname='(ERB)')

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ���������ޤ���
�����Υ⥸�塼��� mod �ǻ��ꤷ���᥽�å�̾�� methodname �ǻ��ꤷ�ޤ���
fname �ϥ�����ץȤ��������ݤΥե�����̾�Ǥ�����˥��顼���˳������ޤ���

��:

  erb = ERB.new(script)
  erb.def_method(MyClass, 'foo(bar)', 'foo.erb')

--- def_module(methodname='erb')

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ����������̵̾�Υ⥸�塼����֤��ޤ���

--- def_class(suplerklass=Object, methodname='erb')

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ����������̵̾�Υ��饹���֤��ޤ���
#@# �Ȥ��Ӥ��ʤ��������ġ�

= module ERB::Util

== Module Functions

--- html_escape(s)
--- h(s)

HTML �� &"<> �򥨥������פ��ޤ�
([[m:CGI.escapeHTML]]�Ȥۤ�Ʊ���Ǥ�)��

--- url_encode(s)
--- u(s)

ʸ����� URL ���󥳡��ɤ��ޤ�
([[m:CGI.escape]]�Ȥۤ�Ʊ���Ǥ�)��

= module ERB::DefMethod

== Module Functions

--- def_erb_method(methodname, erb)

self �� erb �Υ�����ץȤ�᥽�åɤȤ���������ޤ����᥽�å�̾�� methodname �ǻ��ꤷ�ޤ���
self ��ʸ����λ������Υե�������ɤ߹��� ERB ���Ѵ������Τ����᥽�åɤȤ���������ޤ���

��:

  class Writer
    extend ERB::DefMethod
    def_erb_method('to_html', 'writer.erb')
    ...
  end
  ...
  puts writer.to_html
