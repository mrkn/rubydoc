--- static int autoload_i(ID key, const char *name, st_table *tbl)

--- static VALUE classname(VALUE klass)

--- static int cv_i(ID key, VALUE value, VALUE ary)

--- static void cvar_override_check(VALUE id, VALUE a)

--- static int fc_i(ID key, VALUE value, struct fc_result *res)

--- static VALUE fc_path(struct fc_result *fc, ID name)

--- static VALUE find_class_path(VALUE klass)

���饹 klass �Υ��饹�ѥ���õ������Ruby ��ʸ������֤��ޤ���

--- static VALUE generic_ivar_defined(VALUE obj, ID id)

--- static VALUE generic_ivar_get(VALUE obj, ID id)

--- static int generic_ivar_remove(VALUE obj, ID id, VALUE *valp)

--- static void generic_ivar_set(VALUE obj, ID id, VALUE val)

--- static int givar_i(VALUE obj, st_table *tbl)

--- static int givar_mark_i(ID key, VALUE value)

--- static ID global_id(const char *name)

--- static int gvar_i(ID key, struct global_entry *entry, VALUE ary)

--- void Init_var_tables(void)

--- static int ivar_i(ID key, struct global_entry *entry, VALUE ary)

--- static int list_i(ID key, ID value, VALUE ary)

--- static int mark_global_entry(ID key, struct global_entry *entry)

--- static void mod_av_set(VALUE klass, ID id, VALUE val, int isconst)

--- static VALUE original_module(VALUE c)

--- void rb_alias_variable(ID name1, ID name2)

--- void rb_autoload(const char *klass, const char *filename)

--- int rb_autoload_defined(ID id)

--- static void rb_autoload_id(ID id, const char *filename)

--- void rb_autoload_load(ID id)

--- char *rb_class2name(VALUE klass)

klass ��̾�����֤��ޤ���
�֤��ͤ����Ƥ��ѹ������� free ���ƤϤ����ޤ���

  RSTRING(rb_class_path(klass))->ptr

��Ʊ���Ǥ���

--- VALUE rb_class_path(VALUE klass)

klass ��̾�����֤��ޤ���klass��̵̾���饹��̵̾�⥸�塼
��ξ�� #<Class 0xXXXX>, #<Module 0xXXXX> �η������֤��ޤ���

[[m:Module#to_s]] �������

  rb_str_dup(rb_class_path(klass));

�Ǥ���

--- void rb_const_assign(VALUE klass, ID id, VALUE val)

--- int rb_const_defined(VALUE klass, ID id)

klass �Ȥ��Υ����ѡ����饹����� id ���������Ƥ���п���

--- int rb_const_defined_at(VALUE klass, ID id)

klass ���Τ���� id ���������Ƥ���п���

--- VALUE rb_const_get(VALUE klass, ID name)

��� klass::name ���ͤ�������ޤ���

--- VALUE rb_const_get_at(VALUE klass, ID name)

���饹 klass ��������줿��� name ���ͤ�������ޤ�
(����䳰�Υ��饹��Ĵ�٤ʤ�)��

--- VALUE rb_const_list(void *data)

--- void rb_const_set(VALUE klass, ID name, VALUE val)

��� klass::name ���ͤ� val �Ȥ���������ޤ���

--- void rb_copy_generic_ivar(VALUE clone, VALUE obj)

--- VALUE rb_cv_get(VALUE klass, char *name)

klass �Υ��饹�ѿ� name ���ͤ�
�������ޤ���

--- void rb_cv_set(VALUE klass, char *name, VALUE val)

klass �Υ��饹�ѿ� name �� val ���������ޤ���
�ѿ����ޤ��������Ƥ��ʤ����� NameError ��ȯ�����ޤ���

--- void rb_cvar_declear(VALUE klass, ID name, VALUE val)

klass �Υ��饹�ѿ� name �� val ���������ޤ���

--- VALUE rb_cvar_defined(VALUE klass, ID id)

--- VALUE rb_cvar_get(VALUE klass, ID name)

klass �Υ��饹�ѿ� name ���ͤ�
�������ޤ���

--- void rb_cvar_set(VALUE klass, ID name, VALUE val)

klass �Υ��饹�ѿ� name �� val ���������ޤ���
�ѿ����ޤ��������Ƥ��ʤ����� NameError ��ȯ�����ޤ���

--- void rb_define_class_variable(VALUE klass, const char *name, VALUE val)

���饹 klass �Υ��饹�ѿ� name ������ val ��
������ޤ�������Ʊ̾���ѿ����������Ƥ�����ٹ𤷤ޤ���

--- void rb_define_const(VALUE klass, const char *name, VALUE val)

���饹 klass ����� name ������ val ��
������ޤ�������Ʊ̾��������������Ƥ�����ٹ𤷤ޤ���

--- void rb_define_global_const(const char *name, VALUE val)

�ȥåץ�٥� (���ߤ� [[c:Object]]) ����� name ������ val ��
������ޤ�������Ʊ̾��������������Ƥ�����ٹ𤷤ޤ���

--- void rb_define_hooked_variable(const char *name, VALUE *var, VALUE (*getter)(), VALUE (*setter)())


--- void rb_define_readonly_variable(const char *name, VALUE *var)

--- void rb_define_variable(const char *name, VALUE *var)

--- void rb_define_virtual_variable(const char *name, VALUE (*getter)(), VALUE (*setter)())

--- VALUE rb_f_autoload(VALUE obj, VALUE klass, VALUE file)

--- VALUE rb_f_global_variables(void)

--- VALUE rb_f_trace_var(int argc, VALUE *argv)

--- VALUE rb_f_untrace_var(int argc, VALUE *argv)

--- void rb_free_generic_ivar(VALUE obj)

--- void rb_gc_mark_global_tbl(void)

--- st_table *rb_generic_ivar_table(VALUE obj)

--- struct global_entry *rb_global_entry(ID id)

--- VALUE rb_gv_get(const char *name) [1.5 feature]

Ruby �Υ����Х��ѿ����ͤ�������ޤ���

������

    VALUE v = rb_gv_get("$!")

--- VALUE rb_gv_set(const char *name, VALUE val)
#@# [1.5 feature]

Ruby �Υ����Х��ѿ� name �� val ���������ޤ���
val ���֤��ޤ���

--- VALUE rb_gvar_defined(struct global_entry *entry)

entry �Ǽ�����륰���Х��ѿ����������Ƥ���ʤ鿿��

--- VALUE rb_gvar_get(struct global_entry *entry)

�����Х��ѿ��Υ���ȥ� entry �����ͤ�������ޤ���

--- VALUE rb_gvar_set(struct global_entry *entry, VALUE val)

�����Х��ѿ��Υ���ȥ� entry ���ͤ��������ޤ���

--- VALUE rb_iv_get(VALUE obj, char *name)

���֥������� obj �Υ��󥹥����ѿ� name ���ͤ�
�������ޤ���

--- VALUE rb_iv_set(VALUE obj, char *name, VALUE val)

���֥������� obj �Υ��󥹥����ѿ� name ��
val ���������ޤ���

--- VALUE rb_ivar_defined(VALUE obj, ID id)

���֥������� obj �Υ��󥹥����ѿ� name ��
�������Ƥ���п���

--- VALUE rb_ivar_get(VALUE obj, ID name)

���֥������� obj �Υ��󥹥����ѿ� name ���ͤ�
�������ޤ���

--- VALUE rb_ivar_set(VALUE obj, ID name, VALUE val)

���֥������� obj �Υ��󥹥����ѿ� name ��
val ���������ޤ���

--- void rb_mark_generic_ivar(VALUE obj)

--- void rb_mark_generic_ivar_tbl(void)

--- VALUE rb_mod_class_variables(VALUE obj)

--- void *rb_mod_const_at(VALUE mod, void *data)

--- void *rb_mod_const_of(VALUE mod, void *data)

--- VALUE rb_mod_constants(VALUE mod)

--- VALUE rb_mod_name(VALUE mod)

[[m:Module#name]] �μ��ΤǤ���
̵̾���饹��̵̾�⥸�塼����Ф��Ƥ϶�ʸ������֤��ޤ���

--- VALUE rb_mod_remove_const(VALUE mod, VALUE name)

--- VALUE rb_mod_remove_cvar(VALUE mod, VALUE name)

--- void rb_name_class(VALUE klass, ID id)

���饹 klass �� id ��̿̾���ޤ���

--- VALUE rb_obj_instance_variables(VALUE obj)

--- VALUE rb_obj_remove_instance_variable(VALUE obj, VALUE name)

--- VALUE rb_path2class(const char *path)

--- void rb_set_class_path(VALUE klass, VALUE under, const char *name)

--- static void rb_trace_eval(VALUE cmd, VALUE val)

--- static void readonly_setter(VALUE val, ID id, void *var)

--- static void remove_trace(struct global_variable *var)

--- static int sv_i(ID key, VALUE value, st_table *tbl)

--- static int top_const_get(ID id, VALUE *klassp)

�ȥåץ�٥����� id �򻲾Ȥ��ޤ���
��� id ���������Ƥ����鿿���֤� klassp ��
�����ͤ�񤭹��ߤޤ���̤����ʤ鵶���֤��ޤ���

--- static VALUE trace_en(struct global_variable *var)

--- static VALUE trace_ev(struct trace_data *data)

--- static VALUE undef_getter(ID id)

--- static void undef_marker(void)

--- static void undef_setter(VALUE val, ID id, void *data, struct global_variable *var)

--- static VALUE val_getter(ID id, VALUE val)

--- static void val_marker(VALUE data)

--- static void val_setter(VALUE val, ID id, void *data, struct global_variable *var)

--- static VALUE var_getter(ID id, VALUE *var)

--- static void var_marker(VALUE *var)

--- static void var_setter(VALUE val, ID id, VALUE *var)

