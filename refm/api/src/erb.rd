eRuby������ץȤ򰷤�����Υ��饹�饤�֥��Ǥ���


= class ERB < Object

eRuby ������ץȤ�������륯�饹��

���� ERbLight �ȸƤФ�Ƥ�����Τǡ�
ɸ����Ϥؤΰ�����ʸ����������Ȥʤ�ʤ����� eruby �Ȱۤʤ�ޤ���

 * [[url:http://jp.rubyist.net/magazine/?0017-BundledLibraries]]


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

== Class Methods

--- new(eruby_script, safe_level=nil, trim_mode=nil, eoutvar='_erbout') -> ERB

ERB���֥������Ȥ����������֤��ޤ���

eruby_script ���� ERB ���������ޤ���eval ���� $SAFE��trim_mode(���)��
eoutvar(eRuby ������ץȤ���Ǥ���� ERB ��Ȥ��Ȥ����ѹ����ޤ���
���̡��ѹ�����ɬ�פϤ���ޤ���)�����Ǥ��ޤ���

@param eruby_script eRuby������ץ�

@param safe_level eRuby������ץȤ��¹Ԥ����Ȥ��Υ����ե�٥�

@param trim_mode �����ε�ư���ѹ����륪�ץ����

@param eoutvar eRuby������ץȤ���ǽ��Ϥ򤿤�Ƥ����ѿ�

--- version -> String

erb.rb�Υ�ӥ���������֤��ޤ���

== Instance Methods

--- run(b=TOPLEVEL_BINDING) -> String

ERB �� b �� binding �Ǽ¹Ԥ�����̤�ɸ����Ϥذ������ޤ���

@param b eRuby������ץȤ��¹Ԥ����Ȥ���binding

--- result(b=TOPLEVEL_BINDING) -> String

ERB �� b �� binding �Ǽ¹Ԥ�����̤�ʸ������֤��ޤ���

@param b eRuby������ץȤ��¹Ԥ����Ȥ���binding

--- src -> String

�Ѵ����� Ruby ������ץȤ�������ޤ���

--- def_method(mod, methodname, fname='(ERB)') -> nil

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ���������ޤ���

�����Υ⥸�塼��� mod �ǻ��ꤷ���᥽�å�̾�� methodname �ǻ��ꤷ�ޤ���
fname �ϥ�����ץȤ��������ݤΥե�����̾�Ǥ�����˥��顼���˳������ޤ���

@param mod �᥽�åɤ��������⥸�塼��ʤޤ��ϥ��饹��

@param methodname �᥽�å�̾

@param fname ������ץȤ��������ݤΥե�����̾

��:

  erb = ERB.new(script)
  erb.def_method(MyClass, 'foo(bar)', 'foo.erb')

--- def_module(methodname='erb') -> Module

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ����������̵̾�Υ⥸�塼����֤��ޤ���

@param methodname �᥽�å�̾

--- def_class(suplerklass=Object, methodname='erb') -> Class

�Ѵ����� Ruby ������ץȤ�᥽�åɤȤ����������̵̾�Υ��饹���֤��ޤ���
#@# �Ȥ��Ӥ��ʤ��������ġ�

@param suplerklass ̵̾���饹�Υ����ѡ����饹

@param methodname �᥽�å�̾

--- set_eoutvar(compiler, eoutvar = '_erbout') -> ??

eRuby������ץȤ���ǽ��Ϥ򤿤�Ƥ����ѿ������ꤷ�ޤ���

Can be used to set eoutvar as described in ERB#new. It's probably
easier to just use the constructor though, since calling this
method requires the setup of an ERB compiler object.

@param compiler eRuby����ѥ���

@param eoutvar eRuby������ץȤ���ǽ��Ϥ򤿤�Ƥ����ѿ�

#@since 1.8.1

--- filename -> String

������ץȤ��������ݤΥե�����̾��������ޤ���

--- filename= -> String

������ץȤ��������ݤΥե�����̾�����ꤷ�ޤ���

#@end

= module ERB::Util

== Module Functions

--- html_escape(s) -> String
--- h(s) -> String

ʸ���� s �� HTML�Ѥ˥��������פ���ʸ������֤��ޤ���

ʸ���� s ��˴ޤޤ��  &"<> �򡢼��λ��� &amp; &quot; &lt; &gt; �ˤ��줾���ѹ�����ʸ������֤��ޤ�
([[m:CGI.escapeHTML]]�Ȥۤ�Ʊ���Ǥ�)��

@param s HTML���������פ�Ԥ�ʸ����

--- url_encode(s)  -> String
--- u(s) -> String

ʸ���� s �� URL���󥳡��ɤ���ʸ������֤��ޤ���

ʸ���� s ��˴ޤޤ�� 2�Х���ʸ����Ⱦ�ѥ��ڡ����ˤĤ��� URL ���󥳡��ɤ�Ԥä�ʸ������֤��ޤ�([[m:CGI.escape]]�Ȥۤ�Ʊ���Ǥ�)��

@param s URL���󥳡��ɤ�Ԥ�ʸ����

= module ERB::DefMethod

== Module Functions

--- def_erb_method(methodname, erb) -> nil

self �� erb �Υ�����ץȤ�᥽�åɤȤ���������ޤ���

�᥽�å�̾�� methodname �ǻ��ꤷ�ޤ���
erb ��ʸ����λ������Υե�������ɤ߹��� ERB ���Ѵ������Τ����᥽�åɤȤ���������ޤ���

@param methodname �᥽�å�̾

@param erb ERB���󥹥��󥹤⤷����ERB�������ե�����̾

��:

  class Writer
    extend ERB::DefMethod
    def_erb_method('to_html', 'writer.erb')
    ...
  end
  ...
  puts writer.to_html
