#@if (version >= "1.7.0")
#@# = dl

Ruby/DL �ϡ�UNIX �� [[man:dlopen(3)]] �� Windows ��
LoadLibrary() �ʤɤΥ����ʥߥå���󥫤ؤΥ��󥿥ե��������󶡤�
���ޤ����ޤ�������[[unknown:dl2|URL:http://rubyforge.net/projects/ruby-dl2/]]��ruby-1.8
�ǤⳫȯ����Ƥ��ޤ���

=== Libraries

* [[c:DL]]
  * [[c:DL::Handle]]
  * [[c:DL::Symbol]]
  * [[c:DL::PtrData]]
* [[unknown:DL::Importable|"dl/import"]]
  * [[unknown:"dl/struct"]]
* [[unknown:DL::Types|"dl/types"]]
* [[unknown:"dl/win32"]]

=== Using Ruby/DL

�̾�ϡ�[[unknown:DL::Importable|"dl/import"]] �⥸�塼�����Ѥ��ޤ���
����ϥ饤�֥��ؿ��˥����������뤿��ι���δؿ�����äƤ��ޤ���
����⥸�塼����ĥ����ˤϰʲ��Τ褦�� DL::Importable ����Ѥ��ޤ���

  require "dl/import"
  module LIBC
    extend DL::Importable
  end

�ʸ塢���Υ⥸�塼��� dlload �� extern �᥽�åɤ���ѤǤ��ޤ����ʲ��Τ�
���� dlload �Ȥäƥ饤�֥�����ɤ������줾��Υ饤�֥��ؿ����Ф�
�� extern ����Ѥ��뤳�Ȥǥ�åѡ��᥽�åɤ�������ޤ���

  module LIBC
    extend DL::Importable
    dlload "libc.so.6","libm.so.6"
    extern "int strlen(char*)"
  end
  # Note that we should not include the module LIBC from some reason.

#@# We can call the library function strlen() using LIBC.strlen. If the first
#@# character of given function name is an uppercase, the first character of the
#@# defined method name becomes lowercase.
#@# We can also construct memory images of structures and unions using functions
#@# struct and union which are defined in "dl/struct" as follows:

LIBC.strlen ����Ѥ��뤳�Ȥǡ��饤�֥��ؿ� strlen() ����ѤǤ��ޤ���Ϳ
����줿�ؿ�̾�κǽ��ʸ������ʸ���ʤ顢��������᥽�å�̾�κǽ��ʸ
���Ͼ�ʸ���ˤʤ�ޤ���

�ʲ��Τ褦�� [[unknown:"dl/struct"]] ���������� struct �� union �ؿ�����Ѥ�
�뤳�Ȥǹ�¤�Τ䶦���ΤΥ��ꥤ�᡼����������뤳�Ȥ�Ǥ��ޤ���

  require "dl/import"
  require "dl/struct"
  module LIBC
    extend DL::Importable
    Timeval = struct [       # define timeval structure.
      "long tv_sec",
      "long tv_uses",
    ]
  end
  val = LIBC::Timeval.malloc # allocate memory.

#@# Notice that the above example takes LIBC::Timeval.malloc to allocate memory,
#@# rather than LIBC::Timeval.new. It is because DL::Timeval.new is for wrapping
#@# an object, PtrData, which has already been created.

�����ǡ�����γ�����Ƥ� LIBC::Timeval.new �ǤϤʤ���
LIBC::Timeval.malloc ����Ѥ��Ƥ��뤳�Ȥ���դ��Ƥ���������LIBC::Timeval.new �ϡ�
�����Ѥߤ� PtrData ���֥������Ȥ��åפ��뤿��Τ�ΤǤ���

#@# We can define a callback using the module function "callback" as follows:

�ʲ��Τ褦�� �⥸�塼��ؿ� callback ����Ѥ���������Хå�������Ǥ��ޤ���

  module Foo
    extend DL::Importable
    def my_comp(str1,str2)
      str1 <=> str2
    end
    COMPARE = callback "int my_comp(char*,char*)"
  end

#@# where Foo::COMPARE is a Symbol object which invokes the method "my_comp".

������ Foo::COMPARE �ϡ�my_comp �᥽�åɤ�ư���� Symbol ���֥������ȤǤ���

#@# DL::Importable module is very useful. However, we sometimes encounter a case
#@# that we must directly use low-level functions such as dlsym(). In such case,
#@# we would use DL module functions. They are described in next section.

DL::Importable �⥸�塼��ϤȤƤ������Ǥ������������Ȥ��ˤ�dlsym() �Τ�
�������٥�ؿ���ľ�ܻȤ�ʤ���Фʤ�ʤ����̤��������ޤ������Τ褦�ʾ�
��ˤ� DL �⥸�塼��δؿ�����Ѥ��뤳�Ȥˤʤ�Ǥ��礦������ˤĤ��Ƥ�
[[c:DL]] ���������ޤ���


#@include(dl/DL)
#@include(dl/Handle)
#@include(dl/PtrData)
#@include(dl/Symbol)
#@end
