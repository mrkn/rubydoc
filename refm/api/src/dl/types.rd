improt dl

= class DL::Types < Object

����������ݻ����륪�֥������ȤΥ��饹��

=== �����������

  ["alias name", "type name",
   encoding_method, decoding_method,   # for function prototypes
   encoding_method, decoding_method]   # for structures (not implemented)

�Ȥ�������������������˻����ޤ��������ꥢ��̾�ȼºݤη������󥳡��ǥ��󥰡�
�ǥ����ǥ��󥰤���ˡ��������ޤ���DL::Types::TYPES �ϥǥե���Ȥǻ��ä�
��������Ǥ���

== Instance Methods

--- typealias(alias, type, enc, dec, struct_enc, struct_dec)

��������ɲä�Ԥ���

���󥹥����ѿ� @TYDEFS ����Ƭ��

  [alias, type,
   enc, dec, struct_end, struct_dec]

���Ȥ��ɲä��롣

--- encode_type(alias)

DL �⥸�塼����Ѥ��뷿����� Ruby �Υ��֥������Ȥ�
DL �⥸�塼����Ѥ���ǡ����ؤΥ��󥳡����� Proc ���֥������Ȥȡ�
DL �⥸�塼��Υǡ������� Ruby ���֥������ȤؤΥǥ������Ѥ�
Proc ���֥������Ȥ��Ȥ򼡤��̤�� Array �Ȥ����֤���

  [ty,enc,dec,senc,sdec]
  ty : DL�Ǥη������
  enc : ���󥳡�����Proc
  dec : �ǥ�������Proc
  senc : ���󥳡�����Proc(dl/struct�ǻ���)
  sdec : �ǥ�������Proc(dl/struct�ǻ���)

#@if (version >= "1.8.2")
--- encode_argument_type(alias_type)

--- encode_return_type(ty)

--- encode_struct_type(alias_type)

#@end

#@if (version <= "1.8.1")
--- encode_type(ty)

#@end

--- init_types

== Constants

--- TYPES

���󥹥����ѿ� @TYDEFS �ν���͡�

