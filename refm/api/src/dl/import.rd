require dl
require dl/types

= module DL::Importable

DL �⥸�塼��γƥ��饹�������ʥ�åѡ��Ǥ���
Importable �⥸�塼��� extend ���ƻȤ��ޤ���include �ǤϤ���ޤ���

  require "dl/import"
  
  module M
    extend DL::Importable
    dlload "libc.so.6","libm.so.6"
    extern "int strlen(char*)"
  end

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

--- [](name) -> object
#@todo
�ؿ� name �Υ�åѡ��Ǥ��� [[DL::Symbol]] ���֥������Ȥ��֤��ޤ���

@param name �����������ؿ�̾��ʸ�����Ϳ���ޤ���

--- import(name, rettype, argtypes = nil)
#@todo

#@# example:
#@##   import("get_length", "int", ["void*", "int"])

--- _args_ -> [object]
#@todo
ľ���˸Ƥ�������ʥߥå��饤�֥��δؿ��ΰ������֤��ޤ���

--- _retval_ -> object
#@todo
ľ���˸Ƥ�������ʥߥå��饤�֥��δؿ����֤��ͤ��֤��ޤ���

== Constants

--- LIB_MAP
#@todo
���ɤ��줿�饤�֥����ݻ�����[[c:Hash]]���֥������ȤǤ���
