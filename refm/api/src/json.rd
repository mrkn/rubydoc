#@since 1.9.1

JSON (JavaScript Object Notation)�򰷤��饤�֥��Ǥ���

JSON �λ��ͤ� [[rfc:4627]] �򻲾Ȥ��Ƥ���������

��ĥ�饤�֥��ˤ������� Ruby �ˤ����������ꡢ��ĥ�饤�֥��ˤ����������ѤǤ���Ȥ���
��ĥ�饤�֥��ˤ���������Ѥ��ޤ���
Ruby �ˤ������� [[lib:iconv]] �� [[lib:strscan]] �˰�¸���Ƥ��ޤ���


#@include(json/JSON)
#@include(json/JSON__Ext__Generator__GeneratorMethods)
#@until 1.9.2
#@include(json/JSON__Pure__Generator__GeneratorMethods)
#@end
#@include(json/JSON__Parser)
#@include(json/JSON__State)

= reopen Kernel

== Private Instance Methods

--- j(*objects) -> nil

Ϳ����줿���֥������Ȥ� JSON ������ʸ�����ɸ����Ϥ˰�Ԥǽ��Ϥ��ޤ���

@param objects JSON �����ǽ��Ϥ��������֥������Ȥ���ꤷ�ޤ���

@see [[m:Kernel.#p]]

--- jj(*objects) -> nil

Ϳ����줿���֥������Ȥ� JSON ������ʸ�����ɸ����Ϥ˿ʹ֤��ɤߤ䤹���������ƽ��Ϥ��ޤ���

@param objects JSON �����ǽ��Ϥ��������֥������Ȥ���ꤷ�ޤ���

@see [[m:Kernel.#pp]]

--- JSON(object, options = {}) -> object

��������Ϳ����줿���֥������Ȥμ���ˤ�ä� Ruby �Υ��֥������Ȥ� JSON ������ʸ������֤��ޤ���

��������ʸ����Τ褦�ʥ��֥������Ȥ���ꤷ�����ϡ������ [[m:JSON.#parse]] ���Ѥ��ƥѡ���������̤��֤��ޤ���
�����Ǥʤ����֥������Ȥ���ꤷ�����ϡ������ [[m:JSON.#generate]] ���Ѥ����Ѵ�������̤��֤��ޤ���

@param object Ǥ�դΥ��֥������Ȥ���ꤷ�ޤ���

@param options [[m:JSON.#parse]], [[m:JSON.#generate]] ���Ϥ����ץ�������ꤷ�ޤ���

@see [[m:JSON.#parse]], [[m:JSON.#generate]]

= reopen Class

== Public Instance Methods

--- json_creatable? -> bool

���ꥢ�饤�����줿 JSON ������ʸ���󤫤顢���󥹥��󥹤��������Τˤ��Υ��饹����ѤǤ������
�����֤��ޤ��������Ǥʤ����ϡ������֤��ޤ���

���Υ᥽�åɤ������֤����饹�� json_create �Ȥ����᥽�åɤ�������Ƥ��ʤ���Фʤ�ޤ���
�ޤ� json_create ����������ɬ�פʥǡ�����ޤ�ϥå������Ԥ��Ƥ��ޤ���

= reopen Array
== Public Instance Methods
--- to_json(state = nil, depth = 0) -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

@param state �������� JSON ������ʸ����򥫥����ޥ������뤿��� [[c:JSON::State]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param depth �ͥ��Ȥο����򸫤Ĥ��뤿��˻��Ѥ���ޤ���

= reopen FalseClass
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

"false" �Ȥ���ʸ������֤��ޤ���

= reopen Float
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

= reopen Hash
== Public Instance Methods
--- to_json(state = nil, depth = 0) -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

@param state �������� JSON ������ʸ����򥫥����ޥ������뤿��� [[c:JSON::State]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@param depth �ͥ��Ȥο����򸫤Ĥ��뤿��˻��Ѥ���ޤ���

= reopen Integer
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

= reopen NilClass
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

"null" �Ȥ���ʸ������֤��ޤ���

= reopen Object
== Public Instance Methods
--- to_json -> String

���Ȥ� to_s ��ʸ����ˤ�����̤� JSON ������ʸ������Ѵ������֤��ޤ���

���Υ᥽�åɤϤ��륪�֥������Ȥ� to_json �᥽�åɤ��������Ƥ��ʤ����˻��Ѥ���
�ե�����Хå��Τ���Υ᥽�åɤǤ���

= reopen String
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

���ȤΥ��󥳡��ɤ� UTF-8 �Ǥ���٤��Ǥ���
"\u????" �Τ褦�� UTF-16 �ӥå�����ǥ�����ǥ��󥳡��ɤ��줿ʸ������֤����Ȥ�����ޤ���

= reopen TrueClass
== Public Instance Methods
--- to_json -> String

���Ȥ����������� JSON ������ʸ������֤��ޤ���

"true" �Ȥ���ʸ������֤��ޤ���

#@end
