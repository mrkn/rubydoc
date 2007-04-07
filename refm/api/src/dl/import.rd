require dl
require dl/types

= module DL::Importable

DL �⥸�塼��γƥ��饹�������ʥ�åѡ��Ǥ���

Importable �⥸�塼��ϡ��⥸�塼�뤫�� extend ��Ƥ�ǻȤ��ޤ���include �ǤϤ���ޤ���
���饹�䥪�֥������Ȥ��� extend ��Ƥ�ǻȤ����ȤϤǤ��ޤ���

  require "dl/import"
  
  module M
    extend DL::Importable
    dlload "libc.so.6"
    extern "int strlen(char*)"
  end
  
  p M.strlen("abc") #=> 3

== Instance Methods

--- dlload(*lib)    -> ()
--- dllink(*lib)    -> ()
#@todo

[[m:DL.dlopen]] ���Ѥ��ƥ饤�֥�����ɤ���extend ����
�⥸�塼����Ǥ��Υ饤�֥����������Ƥ��뻲�Ȳ�ǽ�ʥ���ܥ������Ǥ����
���ˤ��ޤ���

@param lib ���ɤ������饤�֥���ʸ�����Ϳ���ޤ���

@raise RuntimeError [[man:dlopen(3)]] �˼��Ԥ�������ȯ�����ޤ���

--- extern(proto)    -> DL::Symbol
#@todo

Ϳ����줿�ץ�ȥ����פˤ������äơ������ʥߥå��饤�֥����Υ���ܥ�򸡺�����
���Ȥ��ðۥ᥽�åɤȤ��ơ�������ޤ���

@param proto C �δؿ��ץ�ȥ����פ�ʸ�����Ϳ���ޤ���Ƭʸ������ʸ���ξ��Ͼ�ʸ���˼�ưŪ���Ѵ�����ޤ���

  require "dl/import"
  
  module M
    extend DL::Importable
    dlload "libc.so.6"
    extern "double strtod(char*, void**)"
  end
  
  p M.strtod("1.23", nil) #=> 1.23

--- callback(proto)    -> DL::Symbol
#@todo

Ϳ����줿�ץ�ȥ����פˤ������äơ����ȤΥ��󥹥��󥹥᥽�åɤ�
C �Υ�����Хå��ؿ����Ѵ�����[[c:DL::Symbol]] �Ȥ����֤��ޤ���

@param proto C �δؿ��ץ�ȥ����פ�ʸ�����Ϳ���ޤ���Ƭʸ������ʸ���ξ��Ͼ�ʸ���˼�ưŪ���Ѵ�����ޤ���

 require 'dl/import'
 module M
   extend DL::Importable
   dlload "libc.so.6"
 
   def cmp(a, b)
     a.ptr.to_s[-1] <=> b.ptr.to_s[-1]
   end
   callback 'int cmp(const char **, const char **)'
   extern 'void qsort(void *, int, int, void *)'
 end
 
 a = ['1b', '2a', '3c']
 ap = a.to_ptr
 M.qsort(ap, a.size, DL.sizeof('P'), M['cmp'])
 p ap.to_a('P').map{|s| s.to_s } #=> ["2a", "1b", "3c"]

--- typealias(newtype, oldtype)    -> ()
#@todo

newtype ���� oldtype ���Υ����ꥢ���Ȥ���������롣
newtype ��Ϳ�������� extern �� callback �᥽�å�
�Υץ�ȥ����פ�Ϳ����Ȥ������Ѥ��ޤ���

--- symbol(sym)    -> DL::PtrData
#@todo
���ɤ��������ʥߥå��饤�֥����Υ���ܥ�򸡺���
����ܥ�ؤΥݥ��󥿤��֤��ޤ���

@param sym �ߤ�������ܥ�̾��ʸ�����Ϳ���ޤ���

@raise RuntimeError �饤�֥����ǥ���ܥ뤬���Ĥ���ʤ�����ȯ�����ޤ���

--- symbol(sym, typespec)    -> DL::Symbol 
#@todo

���ɤ��������ʥߥå��饤�֥����Υ���ܥ�򸡺���
̾���� sym �Υ���ܥ����Ф��ޤ���

@param sym �ߤ�������ܥ�̾��ʸ�����Ϳ���ޤ���

@param typespec ����ܥ�η��򷿻���Ҥ�Ȥä�ʸ�����Ϳ���ޤ���

@raise RuntimeError �饤�֥����ǥ���ܥ뤬���Ĥ���ʤ�����ȯ�����ޤ���

--- [](func)    -> nil |  DL::Symbol | DL::PtrData

[[m:DL::Importable#extern]]��[[m:DL::Importable#import]] �ޤ���
[[m:DL::Importable#callback]] �ˤ�ä����������
C ��٥�δؿ����ѿ�̾ func ���б����� [[c:DL::Symbol]] ���֥������Ȥ��֤��ޤ���

�������Ƥ��ʤ����ϡ�nil ���֤��ޤ���

@param func ��������������ܥ��ʸ�����Ϳ���ޤ���

--- import(sym, rettype, argtypes = nil)    -> DL::Symbol
#@todo

�����ʥߥå��饤�֥����Υ���ܥ�򸡺�����
���Ȥ��ðۥ᥽�åɤȤ��ơ�������ޤ���

@param sym �ߤ�������ܥ�̾��ʸ�����Ϳ���ޤ���

@param rettype �֤��ͤη���C �δؿ��ץ�ȥ����פ�Ȥä�ʸ�����Ϳ���ޤ���

@param argtypes �����η���C �δؿ��ץ�ȥ����פ�Ȥä�ʸ����������Ϳ���ޤ���

 import("get_length", "int", ["void*", "int"])

--- _args_ -> [object]

ľ���˸Ƥ�������ʥߥå��饤�֥��δؿ��ΰ�����������֤��ޤ���

--- _retval_ -> object

ľ���˸Ƥ�������ʥߥå��饤�֥��δؿ����֤��ͤ��֤��ޤ���

== Constants

--- LIB_MAP
#@todo
���ɤ��줿�饤�֥����ݻ�����[[c:Hash]]���֥������ȤǤ���
