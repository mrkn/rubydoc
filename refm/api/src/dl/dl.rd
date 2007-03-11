#@since 1.8.0

Ruby/DL �ϡ�UNIX �� [[man:dlopen(3)]] ��
Windows �� LoadLibrary() �ʤɤ�
�����ʥߥå���󥫤ؤΥ��󥿥ե��������󶡤��ޤ���

#@# ���� dl2 �� Ruby 1.8 �ǤⳫȯ����Ƥ��ޤ���

=== Using Ruby/DL

�̾�ϡ�[[c:DL::Importable]] �⥸�塼�����Ѥ��ޤ���
����� [[c:DL]] �⥸�塼��������ʥ�åѡ��Ǥ���
#@#�Υ饤�֥��ؿ��˥����������뤿��ι���δؿ�����äƤ��ޤ���
���� Ruby �Υ⥸�塼����ĥ����ˤϰʲ��Τ褦�˻��Ѥ��ޤ���

  require "dl/import"
  module M
    extend DL::Importable
  end

�ʸ塢���Υ⥸�塼��� dlload �� extern �᥽�åɤ���ѤǤ��ޤ���
�ʲ��Τ褦�� dlload �Ȥäƥ饤�֥�����ɤ���
���줾��Υ饤�֥��ؿ����Ф��� extern ����Ѥ��뤳�Ȥ�
��åѡ��᥽�åɤ�������ޤ���

  module M
    extend DL::Importable
    dlload "libc.so.6","libm.so.6"
    extern "int strlen(char*)"
  end
  # Note that we should not include the module M from some reason.
  
  p M.strlen('abc') #=> 3

LIBC.strlen ����Ѥ��뤳�Ȥǡ��饤�֥��ؿ� strlen() ����ѤǤ��ޤ���
Ϳ����줿�ؿ�̾�κǽ��ʸ������ʸ���ʤ顢
��������᥽�å�̾�κǽ��ʸ���Ͼ�ʸ���ˤʤ�ޤ���

==== ��¤�Τ򰷤�

��¤�Τⰷ�����Ȥ��Ǥ��ޤ������Ȥ��� [[man:gettimeofday(2)]]
��ȤäƸ��߻�������������ϰʲ��ΤȤ���Ǥ���

 require 'dl/import'
 module M
   extend DL::Importable
   dlload "libc.so.6"
   extern('int gettimeofday(void *, void *)')
 end
 
 timeval = DL.malloc(DL.sizeof('LL'))
 timeval.struct!('LL', :tv_sec, :tv_usec)
 
 e = M.gettimeofday(timeval, nil)
 if e == 0
  p timeval[:tv_sec] #=> 1173519547
 end

��¤�Τ䶦���Τκ����ˤϡ��ʲ��Τ褦�� [[lib:dl/struct]] ���������Ƥ���
[[m:DL::Importable::Internal#struct]] �᥽�åɤ� [[m:DL::Importable::Internal#union]] �᥽�åɤ���Ѥ��뤳�Ȥ�Ǥ��ޤ���

 require 'dl/import'
 require "dl/struct"

 module M
   extend DL::Importable
   dlload "libc.so.6"
   extern('int gettimeofday(void *, void *)')
   Timeval = struct ["long tv_sec", "long tv_usec"]
 end
 
 timeval = M::Timeval.malloc # allocate memory.
 
 e = M.gettimeofday(timeval, nil)
 if e == 0
  p timeval.tv_sec #=> 1173519547
 end

�����ǡ�����γ�����Ƥ� LIBC::Timeval.new �ǤϤʤ���
LIBC::Timeval.malloc ����Ѥ��Ƥ��뤳�Ȥ���դ��Ƥ���������
LIBC::Timeval.new �ϡ�
�����Ѥߤ� PtrData ���֥������Ȥ��åפ��뤿��Τ�ΤǤ���

==== ������Хå�

�ʲ��Τ褦�� �⥸�塼��ؿ� callback ����Ѥ���������Хå�������Ǥ��ޤ���

  require 'dl/import'
  module M 
    extend DL::Importable
    dlload "libc.so.6"
  
    COMPARE = DL.callback('IPP'){|ptr1, ptr2|
      str1 = ptr1.ptr.to_s
      str2 = ptr2.ptr.to_s
      ret = str1[-1] <=> str2[-1]      
    }
    extern 'void qsort(void *, int, int, void *)'
  end
  
  a = ['1b', '2a', '3c']
  ap = a.to_ptr
  M.qsort(ap, a.size, DL.sizeof('P'), M::COMPARE)
  p ap.to_a('P').map{|s| s.to_s } #=> ["2a", "1b", "3c"]
  
������ M::COMPARE �ϡ��֥�å���Ƥ� [[c:DL::Symbol]] ���֥������ȤǤ���

DL::Importable �⥸�塼��ϤȤƤ������Ǥ���
���������Ȥ��ˤ�dlsym() �Τ褦�����٥�ؿ���
ľ�ܻȤ�ʤ���Фʤ�ʤ����̤��������ޤ���
���Τ褦�ʾ��ˤ� DL �⥸�塼��δؿ�����Ѥ��뤳�Ȥˤʤ�Ǥ��礦��
����ˤĤ��Ƥ� [[c:DL]] ���������ޤ���

#@end
