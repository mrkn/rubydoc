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
#@todo

���ɤ��줿�饤�֥����ݻ�����[[c:Hash]]���֥������ȤǤ���

= module DL::Importable::Internal

== Instance Methods

--- dlload(lib, ...)
--- dllink(lib, ...)
#@todo

[[m:DL.dlopen]] ���Ѥ��ƥ饤�֥�����ɤ���extend ����
�⥸�塼����Ǥ��Υ饤�֥����������Ƥ��뻲�Ȳ�ǽ�ʥ���ܥ������Ǥ����
���ˤ��ޤ���

--- extern(prototype)
#@todo

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ����δؿ���ƤӽФ��᥽�åɤ�ưŪ��
������뤳�Ȥ��Ǥ��ޤ���Ƭʸ������ʸ���ξ��Ͼ�ʸ���˼�ưŪ���Ѵ�����ޤ���

--- callback(proto)
#@todo

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ�����������줿 Ruby �Υ᥽�åɤ� C ��
������Хå��ؿ��Ȥ��ư������Ȥ��Ǥ���褦�ˤ��ޤ���
[[c:DL::Symbol]] ���֥������Ȥ��֤���

--- typealias(newtype, oldtype)
#@todo

newtype ���� oldtype ���Υ����ꥢ���Ȥ���������롣
newtype ��Ϳ�������� extern �� callback �᥽�å�
�Υץ�ȥ����פ�Ϳ����Ȥ������Ѥ��ޤ���

--- symbol(sym, [typespec])
#@todo

����ܥ�̾�� sym �Υ���ܥ����Ф���
typespec �ˤϷ������Ϳ���ơ�[[c:DL::Symbol]]���֥������Ȥ��֤��ޤ���
typespec����ά���줿��硢����ܥ�ؤλ��Ȥ�[[c:DL::PtrData]]���֥�������
�Ȥ����֤��ޤ���

--- []
#@todo

@if (version >= "1.8.2")
--- encode_argument_types(tys)
#@todo

@end

@if (version <= "1.8.1")
--- encode_types
#@todo

@end

--- import(name, rettype, argtypes = nil)
#@todo

#@# example:
#@##   import("get_length", "int", ["void*", "int"])

--- parse_cproto(proto)
#@todo

--- init_sym
#@todo

--- init_types
#@todo

--- _args_
#@todo

--- _retval_
#@todo

