= class Rinda::TupleSpace

include MonitorMixin
include DRbUndumped

((<��ɮ���罸>))

Tuple Space �Τ���Υ��饹�Ǥ���
���̤� [[c:Rinda::TupleSpaceProxy]] ��𤷤ƻȤ��ޤ���

== Class Methods

--- new(period = 60)

Rinda::TupleSpace ���֥������Ȥ��������ޤ���

== Methods

--- move(port, tuple, sec = nil)

((<��ɮ���罸>))

--- notify(event, tuple, sec = nil)

((<��ɮ���罸>))

--- read(tuple, sec=nil)

((<��ɮ���罸>))

--- read_all(tuple)

((<��ɮ���罸>))

--- take(tuple, sec = nil)
--- take(tuple, sec = nil) {|template| ... }

tuple �˥ޥå����륿�ץ�򥿥ץ륹�ڡ���������Ф����֤��ޤ���
�ޥå����륿�ץ뤬¸�ߤ��ʤ����ϡ��ޥå����륿�ץ뤬���ץ륹�ڡ�����
���������ޤ��Ԥ��ޤ���

�Ԥ����֤� sec �ä�᤮�����ˤ� take �򤢤����   
�㳰 [[c:RequestExpiredError]] ���ꤲ�ޤ���
   
--- write(tuple, sec = nil)

[[c:Rinda::Tuple]] ���֥������� tuple �򥿥ץ륹�ڡ����˲ä��ޤ���
tuple ��������뤿��� [[c:Rinda::TupleEntry]] ���֥������Ȥ��֤��ޤ���



= class Rinda::TupleEntry

((<��ɮ���罸>))
