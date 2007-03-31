require dl
require dl/types

= module DL::Importable

DL �⥸�塼��γƥ��饹�������ʥ�åѡ��Ǥ���

Importable �⥸�塼��� extend ���ƻȤ��ޤ���include �ǤϤ���ޤ���

  require "dl/import"
  
  module M
    extend DL::Importable
    dlload "libc.so.6"
    extern "int strlen(char*)"
  end
  
  p M.strlen("abc") #=> 3

== Instance Methods

--- dlload(lib, ...)    -> ()
--- dllink(lib, ...)    -> ()
#@todo

[[m:DL.dlopen]] ���Ѥ��ƥ饤�֥�����ɤ���extend ����
�⥸�塼����Ǥ��Υ饤�֥����������Ƥ��뻲�Ȳ�ǽ�ʥ���ܥ������Ǥ����
���ˤ��ޤ���

--- extern(prototype)    -> DL::Symbol
#@todo

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ����δؿ���ƤӽФ��᥽�åɤ�ưŪ��
������뤳�Ȥ��Ǥ��ޤ���Ƭʸ������ʸ���ξ��Ͼ�ʸ���˼�ưŪ���Ѵ�����ޤ���

--- callback(proto)    -> DL::Symbol
#@todo

C �δؿ��ץ�ȥ����פ�Ϳ���뤳�Ȥˤ�äơ�����������줿 Ruby �Υ᥽�åɤ� C ��
������Хå��ؿ��Ȥ��ư������Ȥ��Ǥ���褦�ˤ��ޤ���
[[c:DL::Symbol]] ���֥������Ȥ��֤���

@param proto 

--- typealias(newtype, oldtype)    -> ()
#@todo

newtype ���� oldtype ���Υ����ꥢ���Ȥ���������롣
newtype ��Ϳ�������� extern �� callback �᥽�å�
�Υץ�ȥ����פ�Ϳ����Ȥ������Ѥ��ޤ���

--- symbol(sym, [typespec])    -> DL::Symbol 
#@todo

����ܥ�̾�� sym �Υ���ܥ����Ф���
typespec �ˤϷ������Ϳ���ơ�[[c:DL::Symbol]]���֥������Ȥ��֤��ޤ���

--- [](name)    -> DL::Symbol
#@todo
�ؿ� name �Υ�åѡ��Ǥ��� [[DL::Symbol]] ���֥������Ȥ��֤��ޤ���

@param name �����������ؿ�̾��ʸ�����Ϳ���ޤ���

--- import(name, rettype, argtypes = nil)    -> DL::Symbol
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
