--- static VALUE boot_defclass(char *name, VALUE super)

(�ޤ�) �᥿���饹������ʤ����饹��������ޤ���
���ĤΥ᥿���֥������� Object, Module, Class ��
��������Τ˻Ȥ��ޤ���

--- static VALUE convert_type(VALUE val, const char *tname, const char *method, int raise)

--- static VALUE false_and(VALUE obj, VALUE obj2)

--- static VALUE false_or(VALUE obj, VALUE obj2)

--- static VALUE false_to_s(VALUE obj)

--- static VALUE false_xor(VALUE obj, VALUE obj2)

--- static int inspect_i(ID id, VALUE value, VALUE str)

--- static VALUE inspect_obj(VALUE obj, VALUE str)

--- static VALUE main_to_s(VALUE obj)

--- static VALUE nil_inspect(VALUE obj)

--- static VALUE nil_plus(VALUE x, VALUE y)

--- static VALUE nil_to_a(VALUE obj)

--- static VALUE nil_to_f(VALUE obj)

--- static VALUE nil_to_i(VALUE obj)

--- static VALUE nil_to_s(VALUE obj)

--- static VALUE rb_any_to_a(VALUE obj)

--- VALUE rb_any_to_s(VALUE obj)

--- VALUE rb_Array(VALUE obj)

obj �� Array �Ǥʤ����� to_a ��Ȥä�
Array ���Ѵ����ޤ���

--- VALUE rb_check_convert_type(VALUE val, int type, const char *tname, const char *method)

val.method ��¹Ԥ��ƥ��饹 tname �Υ��󥹥��󥹤��֤��ޤ���
val ���᥽�å� method ������ʤ���� nil ���֤��ޤ���

type �ϡ�T_ARRAY, T_STRING �ʤɤι�¤�Τ�ɽ�� ID �Ǥ���
method �η�̤η��� type �Ǥʤ�����㳰 TypeError ��ȯ�����ޤ���

--- static VALUE rb_class_allocate_instance(VALUE klass)

[[m:Class#allocate]] �μ��Ρ�

--- static VALUE rb_class_initialize(int argc, VALUE *argv, VALUE klass)

[[m:Class#initialize]] �μ��Ρ�

--- VALUE rb_class_new_instance(int argc, VALUE *argv, VALUE klass)

[[m:Class#new]] �μ��Ρ�

--- VALUE rb_class_real(VALUE cl)

�ðۥ��饹�䲽�ȥ��饹 (T_ICLASS) �����Ф��� cl ��
�����ѡ����饹��é�ꡢRuby ��٥��Ϫ�Ф��Ƥ�褤���饹���֤��ޤ���

��:
   rb_class_real(RBASIC(klass)->super)

rb_obj_class(obj) �ϡ�obj �Υ��饹���֤����Ѥδؿ�(Object#type ��
Ʊ��)������obj �� Qtrue �ʤɤǤʤ� RBasic ��¤�Τ�ΤǤ��뤳�Ȥ�
�狼�äƤ���ʤ�

    rb_class_real(RBASIC(obj)->klass)

�Ǥ��ɤ���(������Ϥ� rb_obj_class(obj) ��Ȥ�����̵�����)

--- static VALUE rb_class_s_new(int argc, VALUE *argv)

--- static VALUE rb_class_superclass(VALUE klass)

--- VALUE rb_convert_type(VALUE val, int type, const char *tname, const char *method)

���֥������� val �򥯥饹 type �Υ��󥹥��󥹤��Ѵ����ޤ���
�Ѵ��ˤϡ�val.method ������ͤ��Ȥ��ޤ���

val ����Ȥ�� type ���饹�Υ��󥹥��󥹤ʤ� val ��
���Τޤ��֤��ޤ���

--- double rb_cstr_to_dbl(const char *p, int badcheck)

--- VALUE rb_eql(VALUE obj1, VALUE obj2)

obj1.equal?(obj2) �ʤ�� Qtrue��
�����Ǥʤ��ʤ�� Qfalse��

--- VALUE rb_equal(VALUE obj1, VALUE obj2)

obj1 == obj2 �ʤ�� Qtrue��
�����Ǥʤ��ʤ�� Qfalse��

--- static VALUE rb_f_array(VALUE obj, VALUE arg)

--- static VALUE rb_f_float(VALUE obj, VALUE arg)

--- static VALUE rb_f_integer(VALUE obj, VALUE arg)

--- static VALUE rb_f_string(VALUE obj, VALUE arg)

--- static VALUE rb_false(VALUE obj)

--- VALUE rb_Float(VALUE val)

--- VALUE rb_inspect(VALUE obj)

obj.inspect �μ��Ρ�

--- VALUE rb_Integer(VALUE obj)

obj �� Ruby �������Ǥʤ����� to_i ��Ȥä�
Integer ���Ѵ����ޤ���

--- static VALUE rb_mod_attr(int argc, VALUE *argv, VALUE klass)

--- static VALUE rb_mod_attr_accessor(int argc, VALUE *argv, VALUE klass)

--- static VALUE rb_mod_attr_reader(int argc, VALUE *argv, VALUE klass)

--- static VALUE rb_mod_attr_writer(int argc, VALUE *argv, VALUE klass)

--- static VALUE rb_mod_cmp(VALUE mod, VALUE arg)

--- static VALUE rb_mod_const_defined(VALUE mod, VALUE name)

--- static VALUE rb_mod_const_get(VALUE mod, VALUE name)

--- static VALUE rb_mod_const_set(VALUE mod, VALUE name, VALUE value)

--- static VALUE rb_mod_eqq(VALUE mod, VALUE arg)

--- static VALUE rb_mod_ge(VALUE mod, VALUE arg)

--- static VALUE rb_mod_gt(VALUE mod, VALUE arg)

--- static VALUE rb_mod_initialize(VALUE module)

--- static VALUE rb_mod_le(VALUE mod, VALUE arg)

--- static VALUE rb_mod_lt(VALUE mod, VALUE arg)

--- static VALUE rb_mod_to_s(VALUE klass)

--- static VALUE rb_module_s_alloc(VALUE klass)

--- double rb_num2dbl(VALUE val)

Ǥ�դ� Numeric �Υ��֥������Ȥ� double ���Ѵ����ޤ���

--- VALUE rb_obj_alloc(VALUE klass)

klass �Υ��󥹥��󥹤�������롣

--- VALUE rb_obj_class(VALUE obj)

[[m:Object#class]] �μ��ΤǤ���

--- VALUE rb_obj_clone(VALUE obj)

[[m:Object#clone]] �μ��ΤǤ���

--- static VALUE rb_obj_dummy(void)

--- VALUE rb_obj_dup(VALUE obj)

[[m:Object#dup]] �μ��ΤǤ���

--- static VALUE rb_obj_equal(VALUE obj1, VALUE obj2)

obj1 �� obj2 ��Ʊ��Υ��֥������Ȥʤ鿿��

--- VALUE rb_obj_freeze(VALUE obj)

[[m:Object#freeze]]

--- VALUE rb_obj_frozen_p(VALUE obj)

[[m:Object#frozen?]]

--- VALUE rb_obj_id(VALUE obj)

[[m:Object#id]] �μ��Ρ�

--- static VALUE rb_obj_inspect(VALUE obj)

[[m:Object#inspect]] �μ��Ρ�

--- VALUE rb_obj_is_instance_of(VALUE obj, VALUE klass)

obj �����饹 klass �Υ��󥹥��󥹤ʤ�п���

--- VALUE rb_obj_is_kind_of(VALUE obj, VALUE klass)

obj �����饹 klass ����Ӥ��Υ��֥��饹��
���󥹥��󥹤ΤȤ�����

--- static VALUE rb_obj_methods(VALUE obj)

[[m:Object#methods]] �μ��Ρ�

--- static VALUE rb_obj_private_methods(VALUE obj)

[[m:Object#private_methods]] �μ��Ρ�

--- static VALUE rb_obj_protected_methods(VALUE obj)

[[m:Object#protected_methods]] �μ��Ρ�

--- VALUE rb_obj_taint(VALUE obj)

[[m:Object#taint]]

--- VALUE rb_obj_tainted(VALUE obj)

[[m:Object#tainted?]]

--- VALUE rb_obj_untaint(VALUE obj)

[[m:Object#untaint]]

--- char *rb_str2cstr(VALUE str, int *len)

strl �� C ��ʸ������Ѵ����ޤ������������Ϳ�����
*len �˥Х���Ĺ��񤭹��ߤޤ���str �� String
�Ǥʤ����� to_str �Ǥ��Ѵ����ߤޤ���

--- double rb_str_to_dbl(VALUE str, int badcheck)

--- VALUE rb_String(VALUE val)

[[m:Kernel.#String]] �μ��Ρ�
val ��ʸ������Ѵ����ޤ���

--- VALUE rb_to_id(VALUE name)

String��Fixnum��Symbol �� ID ���Ѵ����ޤ���

--- VALUE rb_to_int(VALUE val)

val �� to_int �᥽�åɤ�Ȥä� Ruby ���������Ѵ����ޤ���

--- static VALUE rb_to_integer(VALUE val, char *method)

--- static VALUE rb_true(VALUE obj)

Qtrue ���֤��ޤ���

--- static VALUE sym_inspect(VALUE sym)

--- static VALUE sym_intern(VALUE sym)

--- static VALUE sym_to_i(VALUE sym)

--- static VALUE sym_to_s(VALUE sym)

--- static VALUE true_and(VALUE obj, VALUE obj2)

--- static VALUE true_or(VALUE obj, VALUE obj2)

--- static VALUE true_to_s(VALUE obj)

--- static VALUE true_xor(VALUE obj, VALUE obj2)

