#@since 1.9.1

JSON (JavaScript Object Notation)�򰷤��饤�֥��Ǥ���

JSON �λ��ͤ� [[rfc:4627]] �򻲾Ȥ��Ƥ���������

#@until 1.9.2
��ĥ�饤�֥��ˤ������� Ruby �ˤ����������ꡢ��ĥ�饤�֥��ˤ����������ѤǤ���Ȥ���
��ĥ�饤�֥��ˤ���������Ѥ��ޤ���
Ruby �ˤ������� [[lib:iconv]] �� [[lib:strscan]] �˰�¸���Ƥ��ޤ���
#@end

#@include(json/JSON)
#@include(json/JSON__Generator__GeneratorMethods)
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
include JSON::Generator::GeneratorMethods::Array

= reopen FalseClass
include JSON::Generator::GeneratorMethods::FalseClass

= reopen Float
include JSON::Generator::GeneratorMethods::Float

= reopen Hash
include JSON::Generator::GeneratorMethods::Hash

= reopen Integer
include JSON::Generator::GeneratorMethods::Integer

= reopen NilClass
include JSON::Generator::GeneratorMethods::NilClass

= reopen Object
include JSON::Generator::GeneratorMethods::Object

= reopen String
extend JSON::Generator::GeneratorMethods::String::Extend
include JSON::Generator::GeneratorMethods::String

= reopen TrueClass
include JSON::Generator::GeneratorMethods::TrueClass

#@end
