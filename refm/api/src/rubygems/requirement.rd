require rubygems/version

Gem �ѥå������ΥС������˴ؤ���ɬ�ܾ��򰷤�����Υ饤�֥��Ǥ���

= class Gem::Requirement
alias Gem::Version::Requirement
include Comparable

Gem ��ɬ�׾��򰷤����饹�Ǥ���

���Υ��饹�Υ��󥹥��󥹤ˤ�ʣ����ɬ�׾���ޤ�뤳�Ȥ��Ǥ��ޤ���

== Constants

--- OPS -> Hash
#@todo

��ӱ黻�Ҥ��б�����������Ǽ�����ϥå���Ǥ���

--- OP_RE
#@todo

��ӱ黻�ҤΤ����줫�˥ޥå���������ɽ���Ǥ���

== Singleton Methods

--- create -> Gem::Requirement
#@todo

[[c:Gem::Requirement]] �Υ��󥹥��󥹤�������뤿��Υե����ȥ�᥽�åɤǤ���

@param input ʸ�������� [[c:Gem::Requirement]], [[c:Gem::Version]] �Υ��󥹥���
             �Τ����줫����ꤷ�ޤ���

@return �嵭�ʳ����ͤ� input �˻��ꤹ��ȥǥե�����ͤ��֤��ޤ���

@see [[m:Gem::Requirement.new]], [[m:Gem::Requirement.default]]

--- default -> Gem::Requirement
#@todo

����ʾ� ( '>= 0' ) ����ꤷ�ƺ������줿 [[c:Gem::Requirement]] �Υ��󥹥��󥹤��֤��ޤ���


--- new(requirements) -> Gem::Requirement

[[c:Gem::Requirement]] �Υ��󥹥��󥹤�������ޤ���

@param requirements ʸ�������� [[c:Gem::Version]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@see [[m:Gem::Requirement#parse]], [[m:Gem::Requirement.create]]

== Public Instance Methods

--- <=>(other) -> Integer
#@todo

--- as_list -> [String]
#@todo

ɬ�׾���ʸ�����������֤��ޤ���

--- marshal_dump -> Array
#@todo

ɬ�׾��Τߤ� [[m:Marshal.#dump]] �ǻ��Ѥ��뤿����֤��ޤ���

--- marshal_load(array) -> Gem::Requirement
#@todo

ɬ�׾�����ɤ��ޤ���

--- normalize -> nil
#@todo

self �����������ޤ���

--- parse(obj) -> Array
#@todo

�С�������ɬ�׾���ѡ���������ӱ黻�ҤȥС����������ǤȤ��������Ǥ�������֤��ޤ���

@param obj ɬ�׾���ɽ��ʸ����ޤ��� [[c:Gem::Version]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@return ��ӱ黻�Ҥ� [[c:Gem::Version]] �Υ��󥹥��󥹤����ǤȤ��������Ǥ�������֤��ޤ���

@raise ArgumentError obj �������ʥ��֥������Ȥ���ꤹ���ȯ�����ޤ���

--- requirements -> Array
#@todo
���Ȥ˴ޤޤ��ɬ�׾���������֤��ޤ���

����˴ޤޤ������Ǥϡ���ӱ黻�Ҥ� [[c:Gem::Version]] �Υ��󥹥��󥹤����ǤȤ��������Ǥ�����Ǥ���


--- satisfied_by?(version) -> bool
#@todo
���� version �����Ȥ˴ޤޤ�����Ƥ�ɬ�׾������������˿����֤��ޤ���
�����Ǥʤ���е����֤��ޤ���

@param version [[c:Gem::Version]] �Υ��󥹥��󥹤���ꤷ�ޤ���

@see [[m:Gem::Requirement#satisfy?]]

--- satisfy?(op, version, required_version) -> bool
#@todo
version op required_version �����������˿����֤��ޤ���
�����Ǥʤ���е����֤��ޤ���

@param op ��ӱ黻�� (<, <=, =, =>, >, !=, ~>) ��ʸ����ǻ��ꤷ�ޤ���

@param version  ��������Ϳ������С������� [[c:Gem::Version]] �Υ��󥹥��󥹤ǻ��ꤷ�ޤ���

@param required_version �������٤����򼨤��С���������ꤷ�ޤ���

@see [[m:Gem::Requirement#satisfied_by?]]

--- to_s
#@todo


