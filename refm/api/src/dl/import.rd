require dl
require dl/types

= module DL::Importable

include DL::Importable::Internal

=== ��­

�ºݤˤϡ��᥽�åɤϡ�
DL::Importable::Internal �ˤ������������Ƥ��ޤ���
Importable �⥸�塼���
Internal �⥸�塼��򥤥󥯥롼�ɤ��Ƥ��뤿��ˡ�
Internal ��������줿�᥽�åɤ�
Importable �⥸�塼��ˤ�ä��󶡤���ޤ���

== Constants

--- LIB_MAP

���ɤ��줿�饤�֥����ݻ�����[[c:Hash]]���֥������ȤǤ���

= module DL::Importable::Internal

== Instance Methods

--- dlload(lib, ...)
--- dllink(lib, ...)

[[m:DL.dlopen]] ���Ѥ��ƥ饤�֥�����ɤ���extend ����
�⥸�塼����Ǥ��Υ饤�֥����������Ƥ��뻲�Ȳ�ǽ�ʥ���ܥ������Ǥ����
���ˤ��ޤ���

--- extern(prototype)

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ����δؿ���ƤӽФ��᥽�åɤ�ưŪ��
������뤳�Ȥ��Ǥ��ޤ���Ƭʸ������ʸ���ξ��Ͼ�ʸ���˼�ưŪ���Ѵ�����ޤ���

--- callback(proto)

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ�����������줿 Ruby �Υ᥽�åɤ� C ��
������Хå��ؿ��Ȥ��ư������Ȥ��Ǥ���褦�ˤ��ޤ���
[[c:DL::Symbol]] ���֥������Ȥ��֤���

--- typealias(newtype, oldtype)

newtype ���� oldtype ���Υ����ꥢ���Ȥ���������롣
newtype ��Ϳ�������� extern �� callback �᥽�å�
�Υץ�ȥ����פ�Ϳ����Ȥ������Ѥ��ޤ���

--- symbol(sym, [typespec])

����ܥ�̾�� sym �Υ���ܥ����Ф���
typespec �ˤϷ������Ϳ���ơ�[[c:DL::Symbol]]���֥������Ȥ��֤��ޤ���
typespec����ά���줿��硢����ܥ�ؤλ��Ȥ�[[c:DL::PtrData]]���֥�������
�Ȥ����֤��ޤ���

--- []

@if (version >= "1.8.2")
--- encode_argument_types(tys)

@end

@if (version <= "1.8.1")
--- encode_types

@end

--- import(name, rettype, argtypes = nil)

#@# example:
#@##   import("get_length", "int", ["void*", "int"])

--- parse_cproto(proto)

--- init_sym

--- init_types

--- _args_

--- _retval_

