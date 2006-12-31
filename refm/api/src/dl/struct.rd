import dl
import dl/import

DL::Importable �� extend �����⥸�塼��˹�¤��/�����Τ�������뵡ǽ��Ϳ���롣

�᥽�åɤ䥯�饹�ϡ��ºݤˤ� DL::Importable::Internal ���������Ƥ��롣

= reopen DL::Importable::Internal

== Instance Methods

--- define_struct(contents)
--- struct(contents)

��¤�Τ�������ޤ���
contents�ˤĤ��Ƥ� [[m:DL::Importable::Struct.new]] �򻲾Ȥ��衣

--- define_union(contents)
--- union(contents)

�����Τ�������ޤ���
contents �ˤĤ��ƤϾ嵭 define_struct ��Ʊ�ͤǤ���



= class DL::Importable::Internal::Memory < Object

DL::PtrData �Υ�åѡ��ѥ��饹��
�ɥåȷ����ǹ�¤�Τ䶦���Τ����Ǥإ��������Ǥ���褦�ˤʤ�ޤ���
Struct,Union�Υ��󥹥��󥹤�malloc,new�᥽�åɤ�Ƥ֤��Ȥˤ�äơ�
Memory���饹�Υ��󥹥��󥹤������Ǥ��ޤ���
���Τ��ᡢ�̾ľ����������ɬ�פϤ���ޤ���

== Class Methods

--- new(ptr, names, ty, len, enc, dec)

DL::PtrData ���֥������� ptr �γƥ��Фإ����������뤿��Υ᥽�åɤ�
ưŪ��������롣Struct, Union �Υ��󥹥��󥹤������ξ�����ݻ����롣

== Instance Method

--- to_ptr

�ݻ����Ƥ��� DL::PtrData ���֥������Ȥ��֤��ޤ���

--- size

DL::PtrData#size ��ƤӤޤ���



= class DL::Importable::Internal::Struct < Object

== Class Methods

--- new(types, contents)

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

[[c:DL::PtrData]] ���֥������� ptr ���ݻ����� Memory ���֥������Ȥ��֤��ޤ���

--- malloc(size = nil)

size�Х��Ȥ��ΰ����ݤ���DL::PtrData���֥������Ȥ�������������
DL::PtrData���֥������Ȥ��ݻ�����Memory���֥������Ȥ��֤��ޤ���

--- size

malloc ���줿���������֤��ޤ���

--- members

��¤�Τ�����̾�ǹ�������� [[c:Array]] ���֥������Ȥ��֤��ޤ���

--- parse(contents)

--- parse_elem(elem)


= class DL::Importable::Internal::Union < DL::Importable::Internal::Struct

�����Τ��Ф��륯�饹�Ǥ���ʳ��ϡ�Struct �Ȥۤ�Ʊ���Ǥ���

== Instance Methods

--- new

