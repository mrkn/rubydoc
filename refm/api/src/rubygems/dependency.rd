
Gem �ΰ�¸�ط���������뤿��Υ饤�֥��Ǥ���

= class Gem::Dependency

Gem �ΰ�¸�ط���������륯�饹�Ǥ���

== Public Instance Methods

--- <=>(other) -> Integer
#@todo

self �� other �� [[m:Gem::Dependency#name]] �� ASCII �����ɤ���Ӥ���
self ���礭�����ˤ��������������������ˤ� 0�����������ˤ�����������֤��ޤ���

--- =~(other) -> bool
#@todo

self �� other ����Ӥ��ƿ����ͤ��֤��ޤ���

self �� [[m:Gem::Dependency#name]] ������ɽ���Ȥ��� other �ȥޥå����ʤ����ϵ����֤��ޤ���
self �� other �Ȥΰ�¸�ط����������Ƥ���п����֤��ޤ����������Ƥ��ʤ���е����֤��ޤ���

--- name -> String
#@todo

��¸�ط���̾����ʸ��������ɽ�����֤��ޤ���

--- name=(name)
#@todo

��¸�ط���̾����ʸ��������ɽ���ǥ��åȤ��ޤ���

--- normalize -> nil
#@todo

@see [[c:Gem::Requirement]]

--- requirement_list  -> [String]
--- requirements_list -> [String]
#@todo

�С�������ɬ�׾���ʸ���������Ȥ����֤��ޤ���

--- type -> Symbol
#@todo

��¸�ط��η����֤��ޤ���

--- version_requirements -> Gem::Requirement
#@todo

��¸���Ƥ���С��������֤��ޤ���

--- version_requirements=(version_requirements)
#@todo

��¸���Ƥ���С����������ꤷ�ޤ���

@param version_requirements [[c:Gem::Requirement]] �Υ��󥹥��󥹤���ꤷ�ޤ���

== Constants

--- TYPES
#@todo

ͭ���ʰ�¸�ط��η���ɽ������Ǥ���

@see [[m:Gem::Specification.CURRENT_SPECIFICATION_VERSION]]
