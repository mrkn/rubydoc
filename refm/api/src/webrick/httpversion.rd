= class WEBrick::HTTPVersion < Object
include Comparable

HTTP �ΥС������Τ���ξ����ʥ��饹��

== Class Methods
--- new(version)
#@todo
HTTPVersion ���֥������Ȥ��������롣version ��ʸ���� HTTPVersion ���֥������ȡ�

--- convert(version)
#@todo
version ��ʸ����ξ��� HTTPVersion.new(version) ���֤���
version �� HTTPVersion ���֥������Ȥξ��Ϥ��Τޤ� version ���֤���

== Instance Methods

--- <=>(other)
#@todo
HTTPVersion ���֥������� other �ȤΥС���������Ӥ��롣
other ��꿷�����ʤ� 1��Ʊ���ʤ� 0���Ť��ʤ� -1 ���֤���

--- major
--- major=()
#@todo
HTTP �С������Υ᥸�㡼�����������ꤹ�롣

--- minor
--- minor=()
#@todo
HTTP �С������Υޥ��ʡ������������ꤹ�롣

--- to_s
#@todo
ʸ������Ѵ����롣
