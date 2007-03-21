require dl
require dl/import

DL::Importable �� extend �����⥸�塼��˹�¤��/�����Τ�������뵡ǽ��Ϳ���ޤ���

= reopen DL::Importable

== Instance Methods

--- define_struct(contents)
--- struct(contents)
#@todo

��¤�Τ�������ޤ���
contents�ˤĤ��Ƥ� [[m:DL::Importable::Struct.new]] �򻲾Ȥ��衣

--- define_union(contents)
--- union(contents)
#@todo

�����Τ�������ޤ���
contents �ˤĤ��ƤϾ嵭 define_struct ��Ʊ�ͤǤ���



= class DL::Importable::Memory < Object

DL::PtrData �Υ�åѡ��ѥ��饹��
�ɥåȷ����ǹ�¤�Τ䶦���Τ����Ǥإ��������Ǥ���褦�ˤʤ�ޤ���
Struct,Union�Υ��󥹥��󥹤�malloc,new�᥽�åɤ�Ƥ֤��Ȥˤ�äơ�
Memory���饹�Υ��󥹥��󥹤������Ǥ��ޤ���
���Τ��ᡢ�̾ľ����������ɬ�פϤ���ޤ���

== Class Methods

--- new(ptr, names, ty, len, enc, dec)
#@todo

DL::PtrData ���֥������� ptr �γƥ��Фإ����������뤿��Υ᥽�åɤ�
ưŪ��������롣Struct, Union �Υ��󥹥��󥹤������ξ�����ݻ����롣

== Instance Method

--- to_ptr
#@todo

�ݻ����Ƥ��� DL::PtrData ���֥������Ȥ��֤��ޤ���

--- size
#@todo

DL::PtrData#size ��ƤӤޤ���



= class DL::Importable::Struct < Object

== Class Methods

--- new(types, contents)
#@todo

types �ˤ� DL::Types �Υ��󥹥��󥹡�contents �ˤϹ�¤�Τ������
�ʲ��Τ褦�ˤ���Ϳ���롣

  ["int size",
   "char *str"]
  
���Τ褦�ˤ����������줿Struct���֥������Ȥϡ��ʲ��ι�¤�ΤΤ褦�˿��񤦡�

  struct {
    int size;
    char *str;
  }

== Instance Methods

--- new(ptr)
#@todo

[[c:DL::PtrData]] ���֥������� ptr ���ݻ����� Memory ���֥������Ȥ��֤��ޤ���

--- malloc(size = nil)
#@todo

size�Х��Ȥ��ΰ����ݤ���DL::PtrData���֥������Ȥ�������������
DL::PtrData���֥������Ȥ��ݻ�����Memory���֥������Ȥ��֤��ޤ���

--- size
#@todo

malloc ���줿���������֤��ޤ���

--- members
#@todo

��¤�Τ�����̾�ǹ�������� [[c:Array]] ���֥������Ȥ��֤��ޤ���

--- parse(contents)
#@todo

--- parse_elem(elem)
#@todo


= class DL::Importable::Union < DL::Importable::Struct

�����Τ��Ф��륯�饹�Ǥ���ʳ��ϡ�Struct �Ȥۤ�Ʊ���Ǥ���

== Instance Methods

--- new
#@todo

