--- static char *arg_defined(VALUE self, NODE *node, char *buf, char *type)

--- static void assign(VALUE self, NODE *lhs, VALUE val, int pcall)

���դ�ɽ����ʸ�� lhs ���Ф������դ��� val ���������ޤ���
Proc ���֥������Ȥ�ư������� pcall ���󥼥�Ȥ��ޤ���

--- static VALUE avalue_to_svalue(VALUE v)

--- static VALUE avalue_to_yvalue(VALUE v)

--- static VALUE backtrace(int lev)

--- static VALUE bind_clone(VALUE self)

--- static void blk_copy_prev(struct BLOCK *block)

--- static void blk_free(struct BLOCK *data)

--- static void blk_mark(struct BLOCK *data)

--- static int blk_orphan(struct BLOCK *data)

data ���������줿 SCOPE ���ޤ��Ϥ��λҤǤϤʤ�
SCOPE ��ɾ�����Ƥ���Ȥ�����

--- static VALUE block_pass(VALUE self, NODE *node)

node ��ɾ������ Proc ���֥������Ȥ�����������Ѥߤޤ���

--- static void bm_mark(struct METHOD *data)

--- static VALUE bmcall(VALUE args, VALUE method)

--- static VALUE call_cfunc(VALUE (*func)(), VALUE recv, int len, int argc, VALUE *argv)

C ��������줿�᥽�åɤε�ư�˺ݤ������Τδؿ� func ��ƤӽФ��ޤ���

--- static void call_end_proc(VALUE data)

ɾ����ץ�������λ����Ȥ���
END ʸ����Ͽ���줿 Proc ���֥������� data ��ư���ޤ���

--- static void call_trace_func(char *event, NODE *pos, VALUE self, ID id, VALUE klass)

ɾ�����ư���եå������³�� trace_func ��ɾ�����ޤ���

--- static VALUE catch_i(ID tag)

--- static void catch_timer(int sig)

--- static NODE *compile(VALUE src, char *file, int line)

Ruby ��ʸ����ޤ��� IO ���֥������� src ��
��ʸ�ڤ˥���ѥ��뤷���֤��ޤ������ΤȤ���src ��
�ե����� file �� line ���ܤ���ϤޤäƤ���Ȳ��ꤷ�ޤ���

--- static void compile_error(const char *at)

--- static void copy_fds(fd_set *dst, fd_set *src, int max)

fd_set src �� dst �˥��ԡ����ޤ���
max �� select(2) ����������Ʊ����̣�Ǥ���

--- static NODE *copy_node_scope(NODE *node, VALUE rval)

node ����Ƭ�ˤĤ��Ƥ���Ϥ��Ρ�
�������ѿ��������פ��Ѥि��ξ�����Ǽ�����Ρ��� NODE_SCOPE ��
���ԡ������֤��ޤ������ΤȤ� nd_rval �� rval ���Ǽ���ޤ���

--- static VALUE cvar_cbase(void)

���ߤΥ���ƥ����Ȥǡ����饹�ѿ���õ���ε����Ȥʤ�⥸�塼����֤��ޤ���

--- static inline void dvar_asgn(ID id, VALUE value)

���ߤΥ������ѿ������������¸�ߤ���Ϥ���
�֥�å��������ѿ� id �� value ���������ޤ���

--- static inline void dvar_asgn_curr(ID id, VALUE value)

���ߤΥ֥�å��������ѿ��������פ�¸�ߤ���Ϥ���
�֥�å��������ѿ� id �� value ���������ޤ���

--- static void dvar_asgn_internal(ID id, VALUE value, int curr)

dvar_asgn �� dvar_asgn_curr ������ؿ��Ǥ���

--- static VALUE errat_getter(ID id)

--- static void errat_setter(VALUE val, ID id, VALUE *var)

--- static void errinfo_setter(VALUE val, ID id, VALUE *var)

--- static int error_handle(int ex)

--- static void error_pos(void)

--- static void error_print(void)

--- static VALUE ev_const_defined(NODE *cref, ID id, VALUE self)

���Υ��饹�� cref �� self �� self �ΤȤ���
��� id ���������Ƥ����鿿��

--- static VALUE ev_const_get(NODE *cref, ID id, VALUE self)

���Υ��饹�� cref �� self �� self �Ȥ���
��� id �򻲾Ȥ��ޤ���

--- static VALUE eval(VALUE self, VALUE src, VALUE scope, char *file, int line)

eval �μ��Ρ�ʸ���� src ��ɾ�����ޤ���
���ΤȤ��軰���� scope �� nil �Ǥʤ����
���Υ���ƥ����Ȥθ���ɾ�����ޤ���

�ޤ� src �򥳥�ѥ��뤹��Ȥ���
�ե����� file �� line ���ܤ����֤���Ƥ���Ȳ��ꤷ�ޤ���

--- static VALUE eval_node(VALUE self, NODE *node)

--- static VALUE eval_under(VALUE under, VALUE self, VALUE src, const char *file, int line)

--- static VALUE eval_under_i(VALUE *args)

--- static VALUE exec_under(VALUE (*func)(), VALUE under, VALUE cbase, void *args)

--- static int find_bad_fds(fd_set *dst, fd_set *src, int max)

--- static void frame_dup(struct FRAME *frame)

frame �Ȥ��ο� FRAME ���Ƥ򥹥��å�����ҡ��פ˳�����Ƥʤ����ޤ���

--- static VALUE get_backtrace(VALUE info)

--- static int handle_rescue(VALUE self, NODE *node)

--- void Init_eval(void)

--- void Init_load(void)

--- void Init_Proc(void)

--- void Init_Thread(void)

--- static int intersect_fds(fd_set *src, fd_set *dst, int max)

--- static char *is_defined(VALUE self, NODE *node, char *buf)

node �� self = self ��ɾ�������Ȥ��ͤ�����줽����
���Ǥ���С�node �μ��̤�ɽ��ʸ������֤��ޤ���

--- static void jump_tag_but_local_jump(int state)

--- static void localjump_error(const char *mesg, VALUE status)

--- static VALUE localjump_exitstatus(VALUE exc)

--- static VALUE make_backtrace(void)

--- static VALUE massign(VALUE self, NODE *node, VALUE val, int pcall)

--- static int match_fds(fd_set *dst, fd_set *src, int max)

--- static VALUE method_arity(VALUE method)

--- static VALUE method_call(int argc, VALUE *argv, VALUE method)

--- static VALUE method_clone(VALUE self)

--- static VALUE method_eq(VALUE method, VALUE other)

--- static VALUE method_inspect(VALUE method)

--- static VALUE method_proc(VALUE method)

--- static VALUE method_unbind(VALUE obj)

--- static VALUE mnew(VALUE klass, VALUE obj, ID id, VALUE mklass)

--- static VALUE module_setup(VALUE module, NODE *n)

module ���������⥸�塼��ʸ������ n ��ɾ�����ޤ���

--- static VALUE mproc(void)

--- static VALUE mvalue_to_svalue(VALUE v)

--- static struct BLOCKTAG *new_blktag(void)

--- static struct RVarmap *new_dvar(ID id, VALUE value, struct RVarmap *prev)

--- static void print_undef(VALUE klass, ID id)

���饹 klass �˥᥽�å� id �����դ���ʤ� (undefined) ���Ȥ�
�Ф��륨�顼��å������� stderr �˽��Ϥ��ޤ���

--- static VALUE proc_arity(VALUE proc)

--- static VALUE proc_binding(VALUE proc)

--- static VALUE proc_call(VALUE proc, VALUE args)

--- static VALUE proc_eq(VALUE self, VALUE other)

--- static int proc_get_safe_level(VALUE data)

--- static VALUE proc_invoke(VALUE proc, VALUE args, int pcall, VALUE self)

Proc ���֥������� proc ��ư���ޤ������ΤȤ�
������ args �Ȥ���self �� self �ˤ��ޤ���

--- static VALUE proc_new(VALUE klass)

ɾ����Τ��λ����ǤΥ��ʥåץ���åȤ���¸����
Proc ���֥������Ȥ��������ޤ������饹�� klass �ˤ��ޤ���

--- static VALUE proc_s_new(int argc, VALUE *argv, VALUE klass)

Proc.new �μ��Ρ�

--- static void proc_save_safe_level(VALUE data)

--- static void proc_set_safe_level(VALUE data)

--- static VALUE proc_to_proc(VALUE proc)

--- static VALUE proc_to_s(VALUE self, VALUE other)

--- static VALUE proc_yield(VALUE proc, VALUE args)

Proc.yield �μ��Ρ�

--- void rb_add_method(VALUE klass, ID mid, NODE *node, int noex)

���饹 klass �� mid �Ȥ���̾���Υ᥽�åɤ�������롣
�������Τ� node �Ǥ��ꡢnoex �Ǽ������Ļ�������ġ�

--- void rb_alias(VALUE klass, ID name, ID def)

���饹 klass ��������줿�᥽�å� name ��
���Τ���ΤȤ��뿷�����᥽�å� def ��������ޤ���

--- VALUE rb_apply(VALUE recv, ID mid, VALUE args)

���֥������� recv �Υ᥽�å� mid ��
���� args �ȤȤ�˸ƤӽФ��ޤ���

--- void rb_attr(VALUE klass, ID id, int read, int write, int ex)

--- void rb_backtrace(void)

--- int rb_block_given_p(void)

�᥽�åɤ��֥�å��դ��ǸƤФ�Ƥ���� Qtrue ���֤��ޤ���

--- static VALUE rb_call(VALUE klass, VALUE recv, ID mid, int argc, const VALUE *argv, int scope)

���饹 klass ��������줿�᥽�å� mid ��ƤӽФ��ޤ���
�쥷���Ф� recv �ǡ�������Ĺ�� argc ������ argv ���Ϥ��ޤ���

scope �ϰʲ��Τ褦�˸ƤӽФ��η����򼨤��ޤ���

: 0
    obj.method()   (private/protected �᥽�åɤ�Ƥ٤ʤ�)
: 1
    method()       (private/protected �᥽�åɤ�Ƥ٤�)
: 2
    method_or_lvar (1�Ȥϥ��顼��å��������Ѥ��)
: 3
    super

--- static VALUE rb_call0(VALUE klass, VALUE recv, ID id, int argc, VALUE *argv, NODE *body, int nosuper)

���饹 klass ��������줿�᥽�åɤΥ����� body ��ư���ޤ���
�쥷���Ф� recv �ǡ�������Ĺ�� argc ������ argv ���Ϥ��ޤ���
nosuper ���󥼥�ΤȤ��ϡ����θƤӽФ���� super �����顼�ˤʤ�ޤ���

--- VALUE rb_call_super(int argc, const VALUE *argv)

Ruby��٥�Ǥ� super �Ǥ���
����ɾ����Υ᥽�åɤΥ����ѡ����饹�Υ᥽�åɤ�ƤӽФ��ޤ���

--- static VALUE rb_callcc(VALUE self)

Continuation ���֥������Ȥ��������ޤ���

--- VALUE rb_catch(const char *tag, VALUE (*proc)(), VALUE data)

catch ��Ʊ����ư���¹Ԥ��ޤ���

�ޤ� proc �ˡ�yield ���줿�ͤ� data ���Ϥ��Ƽ¹Ԥ��ޤ���
��������� tag �� throw ���줿�� rb_catch ���Τ�λ���ޤ���

throw ��ȯ���������Ϥ����ͤ��֤��ޤ���
throw ��ȯ�����ʤ��ä��Ȥ��� proc ���֤��ͤ��֤��ޤ���

  static VALUE
  foo_yield(VALUE a, VALUE b)
  {
      return rb_yield(b);
  }

  static VALUE
  foo_catch(VALUE obj)
  {
      return rb_catch("footag", foo_yield, INT2FIX(2));
  }

  static VALUE
  foo_abort(VALUE obj)
  {
      return rb_throw("footag", Qnil);
  }

  void
  Init_foo(void)
  {
      VALUE Foo = rb_define_class("Foo", rb_cObject);
      rb_define_method(Foo, "catch", foo_catch, 0);
      rb_define_method(Foo, "abort", foo_abort, 0);
  }

--- void rb_check_safe_str(VALUE x)

�ޥ��� Check_SafeStr �����ΤǤ���

���� API �� obsolete �Ǥ���
SafeStringValue() ��ȤäƤ���������

--- void rb_clear_cache(void)

�᥽�åɥ���å���򤹤٤ƾõ�ޤ���

--- static void rb_clear_cache_by_class(VALUE klass)

�᥽�åɥ��㥷�夫�� klass ���饹�Υ᥽�åɤ�
����å��奨��ȥ��õ�ޤ���

--- static void rb_clear_cache_by_id(ID id)

�᥽�åɥ��㥷�夫�� id �Ȥ���̾���Υ᥽�åɤ�
����å��奨��ȥ�����ƾõ�ޤ���

--- static VALUE rb_cont_call(int argc, VALUE *argv, VALUE cont)

Continuation#call �μ��Ρ�

--- void rb_disable_super(VALUE klass, const char *name)

���饹 klass �Υ᥽�å� name ����� super ��ػߤ��ޤ���
klass �Ȥ��Υ����ѡ����饹�� name �Ȥ����᥽�åɤ����
����Ƥ��ʤ��Ȥ����㳰 NameError ��ȯ�����ޤ���

--- VALUE rb_dvar_curr(ID id)

���ߤΥ֥�å��������ѿ��������פ� id �򻲾Ȥ��ޤ���

--- VALUE rb_dvar_defined(ID id)

--- void rb_dvar_push(ID id, VALUE value)

--- VALUE rb_dvar_ref(ID id)

���ߤΥ������ѿ��������פ� id �򻲾Ȥ��ޤ���

--- void rb_enable_super(VALUE klass, const char *name)

���饹 klass �Υ᥽�å� name ����� super ����Ĥ��ޤ���
klass �Ȥ��Υ����ѡ����饹�� name �Ȥ����᥽�åɤ����
����Ƥ��ʤ��Ȥ����㳰 NameError ��ȯ�����ޤ���

--- VALUE rb_ensure(VALUE (*body)(), VALUE data1, VALUE (*ensure)(), VALUE data2)

ensure �� C �ǤǤ����ޤ� body(data1) ��¹Ԥ������������
�㳰�� exit ���������Ȥ��Ƥ� ensure(data2) ���μ¤�
�¹Ԥ���ޤ� ( body() �����ｪλ���Ƥ�¹Ԥ���ޤ�)��

--- static VALUE rb_eval(VALUE self, NODE *n)

��ʸ�� n �� self = self �Τ�Ȥ�ɾ�����ޤ���

--- VALUE rb_eval_cmd(VALUE cmd, VALUE arg, int tcheck)

--- VALUE rb_eval_string(const char *str)

str �� Ruby �ץ����Ȥ��ƥ���ѥ��롦ɾ������
�����ͤ��֤��ޤ���

--- VALUE rb_eval_string_protect(const char *str, int *state)

str �� Ruby �ץ����Ȥ��ƥ���ѥ��롦ɾ������
�����ͤ��֤��ޤ���

����ѥ�����ޤ���ɾ������㳰��ޤ����æ�Ф�ȯ���������ϡ�
state �� NULL �Ǥʤ���Ф�����ͤ��������� Qnil ���֤��ޤ���

--- VALUE rb_eval_string_wrap(const char *str, int *state)

((<rb_eval_string_protect>)) ��Ʊ���Ǥ�����������ץȤ�ɾ����
̵̾�Υ⥸�塼��Τ�ȤǹԤ��ޤ���

--- void rb_exc_fatal(VALUE err)

�㳰���֥������� err �� fatal �Ȥ����ꤲ�ޤ���

--- void rb_exc_raise(VALUE err)

�㳰���֥������� err ���ꤲ�ޤ���

--- void rb_exec_end_proc(void)

END �֥�å������ Kernel#at_exit ����Ͽ���� Proc ���֥������Ȥ�
�¹Ԥ��ޤ���

--- void rb_exit(int status)

���ơ����� status �ǥ��󥿥ץ꥿��λ�����ޤ���

--- static void rb_export_method(VALUE klass, ID name, ID noex)

--- void rb_extend_object(VALUE obj, VALUE module)

--- static VALUE rb_f_abort(int argc, VALUE *argv)

--- static VALUE rb_f_at_exit(void)

--- static VALUE rb_f_binding(VALUE self)

--- static VALUE rb_f_block_given_p(void)

block_given? �μ��Ρ�
����ɾ����� (Ruby �Ǽ������줿) �᥽�åɤ��Ф���
�֥�å���Ϳ�����Ƥ����鿿��

--- static VALUE rb_f_caller(int argc, VALUE *argv)

--- static VALUE rb_f_catch(VALUE dmy, VALUE tag)

--- static void rb_f_END(void)

--- static VALUE rb_f_eval(int argc, VALUE *argv, VALUE self)

--- static VALUE rb_f_exit(int argc, VALUE *argv, VALUE obj)

--- VALUE rb_f_lambda(void)

ruby_block ��ü�� BLOCK ���� Proc ���֥������Ȥ���������֤��ޤ���

--- static VALUE rb_f_load(int argc, VALUE *argv)

load �μ��Ρ�

--- static VALUE rb_f_local_variables(void)

--- static VALUE rb_f_loop(void)

loop �μ��Ρ��ʱ�� yield �򷫤��֤��ޤ���

--- static VALUE rb_f_missing(int argc, VALUE *argv, VALUE obj)

--- static VALUE rb_f_raise(int argc, VALUE *argv)

--- VALUE rb_f_require(VALUE obj, VALUE fname)

require �μ��Ρ�
self == obj �Ȥ��� fname �� require ���ޤ���

--- static VALUE rb_f_send(int argc, VALUE *argv, VALUE recv)

--- static VALUE rb_f_throw(int argc, VALUE *argv)

--- static int rb_feature_p(const char *feature, int wait)

--- ID rb_frame_last_func(void)

���߸ƤӽФ���� (Ruby�Ǽ������줿) �᥽�åɤθƤӽФ�̾���֤��ޤ���

--- void rb_frozen_class_p(VALUE klass)

--- VALUE rb_funcall(VALUE recv, ID name, int nargs, ...)

recv ���Ф��ƥ᥽�å� name ��ƤӤ�����
�᥽�åɤ��֤��ͤ��֤��ޤ����ץ饤�١��ȥ᥽�åɤ�
�ƤӤ����ޤ���

�᥽�åɤؤΰ�������Ͱ����ʹߤˤ����������ο��� nargs
�˻��ꤷ�ޤ������������Ϥ��٤� VALUE �Ǥʤ����
�����ޤ���

--- VALUE rb_funcall2(VALUE recv, ID name, int nargs, VALUE *args)

recv ���Ф��ƥ᥽�å� name ��ƤӤ�����
�᥽�åɤ��֤��ͤ��֤��ޤ����ץ饤�١��ȥ᥽�åɤ�
�ƤӤ����ޤ���

�᥽�åɤؤΰ����� VALUE ������Ȥ�����Ͱ����ˤ�������
����Ĺ���� nargs �˻��ꤷ�ޤ���

--- VALUE rb_funcall3(VALUE recv, ID mid, int argc, const VALUE *argv)

recv ���Ф��ƥ᥽�å� name ��ƤӤ�����
�᥽�åɤ��֤��ͤ��֤��ޤ���

�᥽�åɤؤΰ����� VALUE ������Ȥ�����Ͱ����ˤ�������
����Ĺ���� nargs �˻��ꤷ�ޤ���

rb_funcall2 �Ȥΰ㤤�ϡ��ץ饤�١��ȥ᥽�åɤ�ƤӽФ��ʤ����ȤǤ���

--- void rb_gc_mark_threads(void)

¸�ߤ��륹��å����Ƥ�ޡ������ޤ���

--- static NODE *rb_get_method_body(VALUE *klassp, ID *idp, int *noexp)

���饹 klass ���� id �Ȥ���̾���Υ᥽�åɥ���ȥ�򸡺����롣
���դ��ä��餽�����ΤǤ��빽ʸ�ڤ��֤������դ���ʤ����
NULL ���֤���

������̤򥭥�å��夹�롣

--- void rb_interrupt(void)

--- void rb_iter_break(void)

break �� C �ѥ��󥿡��ե������Ǥ���
����ɾ����Υ֥�å�����ȴ���ޤ���

��ɽŪ�ˤϡ�rb_iterate �� block_proc ��ǻȤ��ޤ���

--- VALUE rb_iterate(VALUE (*call_proc)(), VALUE date1, VALUE (*block_proc)(), date2)

�֥�å��դ��᥽�å�(���ƥ졼��)�ƤӽФ���Ԥ��ؿ��Ǥ���

�ޤ� call_proc(data1) ��¹Ԥ��ޤ��������Ƥ��δؿ���
����ľ���Υ᥽�åɤ� yield ��ȯ������Ȱʲ����¹Ԥ���ޤ���

    block_proc(VALUE block_arg, VALUE data2, VALUE self)

block_arg �ϥ֥�å�����(ʣ���ʤ���������äƤ���)��
data2 �� rb_iterate() ���Ϥ�����Ρ�
self �� block_proc �ƤӽФ������Ǥ� self �Ǥ���

--- int rb_iterator_p()

���δؿ���obsolete�Ǥ���((<rb_block_given_p>))����Ѥ��Ƥ���������

--- void rb_jump_tag(int tag)

���: [ruby-dev:4064]

((<rb_load_protect>)),((<rb_eval_string_protect>)),((<rb_protect>))
�ʤɤ���ª�������æ�Ф���������ޤ���

tag�ˤϾ嵭�ؿ��ΰ����Ǽ�����ä�state����ꤷ�ޤ���

--- void rb_load(VALUE fname, int wrap)

����: [ruby-list:21651]

((<load|�ȹ��ߴؿ�>))�����٥륤�󥿥ե������Ǥ���Ruby�������
�Ȥ���Ǽ���줿�ե�����fname ����ɤ��ޤ���

����wrap����non-zero�ʤ�̵̾�Υ⥸�塼����������ơ���
�ɤ������Ƥ򤽤Υ⥸�塼����Ĥ�����ޤ����Ĥ������Τ�

  * ���
  * ���饹���⥸�塼��
  * �ȥåץ�٥�᥽�å�

�Ǥ��������Х��ѿ����ѹ��ʤɤ��Ĥ�������ޤ���

--- void rb_load_protect(VALUE fname, int wrap, int *state)

--- static void rb_longjmp(int tag, VALUE mesg)

--- void rb_mark_end_proc(void)

--- int rb_method_boundp(VALUE klass, ID id, int ex)

--- static VALUE rb_mod_alias_method(VALUE mod, VALUE newname, VALUE oldname)

--- static VALUE rb_mod_append_features(VALUE module, VALUE include)

--- static VALUE rb_mod_define_method(int argc, VALUE *argv, VALUE mod)

--- static VALUE rb_mod_extend_object(VALUE mod, VALUE obj)

--- static VALUE rb_mod_include(int argc, VALUE *argv, VALUE module)

--- static VALUE rb_mod_method(VALUE mod, VALUE vid)

--- static VALUE rb_mod_method_defined(VALUE mod, VALUE mid)

--- static VALUE rb_mod_modfunc(int argc, VALUE *argv, VALUE module)

--- VALUE rb_mod_module_eval(int argc, VALUE *argv, VALUE mod)

Module#module_eval �μ��ΤǤ���

--- static VALUE rb_mod_nesting(void)

--- static VALUE rb_mod_private(int argc, VALUE *argv, VALUE module)

--- static VALUE rb_mod_private_method(int argc, VALUE *argv, VALUE obj)

--- static VALUE rb_mod_protected(int argc, VALUE *argv, VALUE module)

--- static VALUE rb_mod_public(int argc, VALUE *argv, VALUE module)

--- static VALUE rb_mod_public_method(int argc, VALUE *argv, VALUE obj)

--- static VALUE rb_mod_remove_method(VALUE mod, VALUE name)

Module#remove_method �μ��Ρ�

�⥸�塼�� mod ���� name �Ȥ���̾���Υ᥽�åɤ�
������������ȥ�������ޤ������դ���ʤ��ä��Ȥ���
�㳰 [[c:NameError]] ��ȯ�����ޤ���

--- static VALUE rb_mod_s_constants(void)

--- static VALUE rb_mod_undef_method(VALUE mod, VALUE name)

--- void rb_obj_call_init(VALUE obj, int argc, VALUE *argv)

���֥������� obj ���Ф��� initialize ��ƤӽФ��ޤ���
������Ĺ�� argc ������ argv ��ɽ���졢
�֥�å����Ѥ�Ǥ�����Ϥ���⼫ưŪ���Ϥ���ޤ���

--- static VALUE rb_obj_extend(int argc, VALUE *argv, VALUE obj)

--- VALUE rb_obj_instance_eval(int argc, VALUE *argv, VALUE self)

--- static VALUE rb_obj_is_block(VALUE block)

proc �� Proc �ޤ��� Binding �Υ��󥹥��󥹤Ǥ���п���

--- static VALUE rb_obj_is_proc(VALUE proc)

proc �� Proc �Υ��󥹥��󥹤Ǥ���п���

--- static VALUE rb_obj_method(VALUE obj, VALUE vid)

--- static VALUE rb_obj_respond_to(int argc, VALUE *argv, VALUE obj)

--- VALUE rb_proc_new(func, val)

VALUE (*func)(ANYARGS);
VALUE val;

--- VALUE rb_protect(VALUE (*proc)(), VALUE data, int *state)

���: [ruby-dev:4064]

proc(data) ��ɾ����Τ��������æ��(�㳰��ޤ�)����ª���ޤ���

  val = rb_protect(func, arg, &status);
  if (status != 0) {
      puts("���æ�Ф�������");
      rb_jump_tag(status);
  }

--- void rb_provide(const char *feature)

�饤�֥�� feature ����ɤ�����ΤȤ��ƥ�å��򤫤��ޤ���

--- static void rb_provide_feature(VALUE feature)

--- int rb_provided(const char *feature)

--- void rb_remove_method(VALUE klass, const char *name)

���饹 klass ���Τ���Ͽ����Ƥ��� name �Ȥ���̾���Υ᥽�åɤ�
������������ȥ�������ޤ���
���դ���ʤ��ä��Ȥ����㳰 NameError ��ȯ�����ޤ���

--- VALUE rb_require(const char *fname)

require �� C �ǤǤ���feature��fname�פ���ɤ��ޤ���

--- VALUE rb_rescue(VALUE (*b_proc)(), VALUE data1, VALUE (*r_proc)(), VALUE data2)

�ޤ� b_proc(data1) ��¹Ԥ�������������㳰��ȯ�������� r_proc(data2) ��¹Ԥ��ޤ���
��ª�����㳰�� ((<StandardError>)) �Υ��֥��饹�����Ǥ���

--- VALUE rb_rescue2(VALUE (*b_proc)(), VALUE data1, VALUE (*r_proc)(), VALUE data2, ...)

�ޤ� b_proc(data1) ��¹Ԥ�������������㳰��ȯ�������� r_proc(data2) ��¹Ԥ��ޤ���
��ް����ʹߤβ���Ĺ��������ª�������㳰���饹�Υꥹ�Ȥ���ꤷ�ޤ���
�����κǸ�� NULL �ǽ���ʤ���Фʤ�ޤ���

--- int rb_respond_to(VALUE obj, ID id)

obj �˥᥽�å� id ���������Ƥ���Ȥ�����
�ץ饤�١��ȥ᥽�åɤ��Ф��Ƥ⿿���֤��ޤ���

--- void rb_secure(int level)

���ߤΥ����ե�٥뤬 level �ʾ�ΤȤ���
�㳰 SecurityError ��ȯ�����ޤ���

--- void rb_set_end_proc(void (*func)(VALUE), VALUE data)

--- void rb_set_safe_level(int level)

�����ե�٥�� level �˾夲�ޤ���
level �����ߤΥ����ե�٥����㤤����
�㳰 SecurityError ��ȯ�����ޤ���

--- VALUE *rb_svar(int cnt)

���ߤ� SCOPE �ǥ������ѿ�ID�� cnt �Ǥ����ѿ���
�ΰ�ؤΥݥ��󥿤��֤��ޤ������ [[m:$_]] (cnt=0) �� [[m:$~]] (cnt=1) ��
�����������뤿��˻Ȥ��ޤ���

--- static VALUE rb_thread_abort_exc(VALUE thread)

--- static VALUE rb_thread_abort_exc_set(VALUE thread, VALUE val)

--- static VALUE rb_thread_alive_p(VALUE thread)

--- static rb_thread_t rb_thread_alloc(VALUE klass)

--- int rb_thread_alone(void)

ɾ����˥���åɤ���Ĥ���¸�ߤ��ʤ��Ȥ�����

--- static VALUE rb_thread_aref(VALUE thread, VALUE id)

--- static VALUE rb_thread_aset(VALUE thread, VALUE id, VALUE val)

--- void rb_thread_atfork(void)

--- static rb_thread_t rb_thread_check(VALUE data)

--- static void rb_thread_cleanup(void)

--- VALUE rb_thread_create(fn, arg)

VALUE (*fn)();
void *arg;

--- static VALUE rb_thread_critical_get(void)

--- static VALUE rb_thread_critical_set(VALUE obj, VALUE val)

--- VALUE rb_thread_current(void)

���߼¹���Υ���åɤ��֤��ޤ���

--- static int rb_thread_dead(rb_thread_t th)

--- static void rb_thread_deadlock(void)

--- static VALUE rb_thread_exit(void)

--- void rb_thread_fd_close(int fd)

--- int rb_thread_fd_writable(int fd)

--- static VALUE rb_thread_initialize(VALUE thread, VALUE args)

--- static VALUE rb_thread_inspect(VALUE thread)

--- void rb_thread_interrupt(void)

--- static int rb_thread_join(rb_thread_t th, double limit)

--- static VALUE rb_thread_join_m(int argc, VALUE *argv, VALUE thread)

--- static VALUE rb_thread_key_p(VALUE thread, VALUE id)

--- static VALUE rb_thread_keys(VALUE thread)

--- static VALUE rb_thread_kill(VALUE thread)

--- VALUE rb_thread_list(void)

--- VALUE rb_thread_local_aref(VALUE thread, ID id)

--- VALUE rb_thread_local_aset(VALUE thread, ID id, VALUE val)

--- VALUE rb_thread_main(void)

�ᥤ�󥹥�å� (�ץ����ΰ��ֺǽ��¸�ߤ��륹��å�) ���֤��ޤ���

--- static VALUE rb_thread_pass(void)

Thread#pass �μ��Ρ�

--- void rb_thread_polling(void)

--- static VALUE rb_thread_priority(VALUE thread)

--- static VALUE rb_thread_priority_set(VALUE thread, VALUE prio)

--- static VALUE rb_thread_raise(int argc, VALUE *argv, rb_thread_t th)

--- static VALUE rb_thread_raise_m(int argc, VALUE *argv, VALUE thread)

--- static void rb_thread_ready(rb_thread_t th)

--- static void rb_thread_remove(rb_thread_t th)

--- static void rb_thread_restore_context(rb_thread_t th, int exit)

����åɤ��ڤ��ؤ���ˤ����äơ��ڤ��ؤ���Υ���å� th ��
����ƥ����Ȥ�ɾ������������ޤ���

--- VALUE rb_thread_run(VALUE thread)

����å� thread �˼¹Ը����Ϥ��ޤ���

--- static VALUE rb_thread_s_abort_exc(void)

--- static VALUE rb_thread_s_abort_exc_set(VALUE self, VALUE val)

--- static VALUE rb_thread_s_kill(VALUE obj, VALUE th)

--- static VALUE rb_thread_s_new(int argc, VALUE *argv, VALUE klass)

--- static VALUE rb_thread_safe_level(VALUE thread)

--- static void rb_thread_save_context(rb_thread_t th)

����åɤ��ڤ��ؤ���ˤ����äơ����߼¹���Υ���å� th ��
����ƥ����Ȥ�ɾ���狼�� th �����򤷤ޤ���

--- void rb_thread_schedule(void)

¾�Υ���åɤ˼¹Ը����Ϥ��ޤ���
�оݤ�����ϤǤ��ޤ���

see also: [[f:rb_thread_wait_fd]], [[f:rb_thread_wait_for]]

--- int rb_thread_select(int max, fd_set *read, fd_set *write, fd_set *except, struct timeval *timeout)

Ruby �Υ���åɤϼ����Τ���������� select(2) ��ȤäƤ��뤿�ᡢ
��ĥ�饤�֥������ȼ��� select(2) ��Ȥä�����ư����ݾڤ���ޤ���
����ˤ��δؿ� rb_thread_select ��ȤäƤ���������
�����ΰ�̣�� select(2) ��Ʊ���Ǥ���

--- void rb_thread_signal_raise(char *sig)

--- void rb_thread_sleep(int sec)

--- void rb_thread_sleep_forever(void)

--- static VALUE rb_thread_start(VALUE klass, VALUE args)

--- static VALUE rb_thread_start_0(VALUE (*fn)(), void *arg, rb_thread_t th_arg)

--- void rb_thread_start_timer(void)

setitimer(2) ��¸�ߤ�����Τ��������ޤ���

Ruby �Υ���åɥ������塼��󥰤˻��Ѥ��Ƥ���
���󥿡��Х륿���ޡ��򳫻Ϥ��ޤ���

--- static VALUE rb_thread_status(VALUE thread)

--- VALUE rb_thread_stop(void)

���߼¹���Υ���åɤ���ߤ��ޤ���
¾�Υ���åɤ��� rb_thread_wakeup ��ƤФ��ȺƳ����ޤ���

--- static VALUE rb_thread_stop_p(VALUE thread)

--- void rb_thread_stop_timer(void)

setitimer(2) ��¸�ߤ�����Τ��������ޤ���

Ruby �Υ���åɥ������塼��󥰤˻��Ѥ��Ƥ��륤�󥿡��Х륿���ޡ���
��ߤ��ޤ������Υ����ޡ����ߤޤ�� Ruby �Υ���åɵ����ϴ���Ū�����
���ޤ��Τ���դ��Ƥ���������

--- void rb_thread_trap_eval(VALUE cmd, int sig)

--- static VALUE rb_thread_value(VALUE thread)

--- void rb_thread_wait_fd(int fd)

�ե�����ǥ�������ץ� fd ���ɤ߹����褦�ˤʤ�ޤ�
�����ȥ���åɤ���ߤ��ޤ���

--- void rb_thread_wait_for(struct timeval time)

time ��Ĺ���λ��֤��в᤹��ޤǥ����ȥ���åɤ���ߤ��ޤ���

--- static void rb_thread_wait_other_threads(void)

--- VALUE rb_thread_wakeup(VALUE thread)

�����Υ���å� thread ��Ƴ������ޤ���

--- static VALUE rb_thread_yield(VALUE arg, rb_thread_t th)

--- void rb_throw(const char *tag, VALUE val)

throw �μ��Ρ��֤��ͤ� val �Ȥ��ơ�
tag �� catch �����Ȥ���ޤǥ����פ��ޤ���

rb_catch �⻲�Ȥ��Ƥ���������

--- static VALUE rb_trap_eval(VALUE cmd, int sig)

--- void rb_undef(VALUE klass, ID id)

���饹 klass �Υ᥽�å� id �� undef ���ޤ���

--- static VALUE rb_undefined(VALUE obj, ID id, int argc, VALUE *argv, int call_status)

--- VALUE rb_with_disable_interrupt(VALUE (*proc)(), data)

--- VALUE rb_yield(VALUE val)

yield �� C �ǤǤ���val ������˥֥�å���¹Ԥ��ޤ���
ʣ���ΰ�����Ϳ�������Ȥ�������˳�Ǽ�����Ϥ��ޤ���

���δؿ���ƤӽФ����᥽�åɤ��֥�å���ȼ��ʤ����ϡ��㳰
[[c:LocalJumpError]] ��ȯ�����ޤ���

--- static VALUE rb_yield_0(VALUE val, VALUE self, VALUE klass, int pcall)

�����ȥ֥�å��� val ���Ϥ��ƽ�����ܤ���
���Τ��� self �ȥ��饹�� self �� klass ���ڤ��ؤ��롣
Proc �θƤӽФ��ΤȤ��� pcall=�󥼥� �ˤ��ʤ���Фʤ�ʤ���

--- static void remove_method(VALUE klass, ID mid)

���饹 klass ���Τ���Ͽ����Ƥ��� mid �Ȥ���̾���Υ᥽�åɤ�
������������ȥ�������ޤ������դ���ʤ��ä��Ȥ����㳰 [[c:NameError]]
��ȯ�����ޤ���

--- void ruby_finalize(void)

ɾ����ץ����ν�λ������Ԥ��ޤ���

--- void ruby_init(void)

ɾ������������ޤ���Ruby C API ��Ƥ֥ץ����Ǥ�
����ä�ɬ�����δؿ���ƤФʤ���Фʤ�ޤ���

--- void ruby_options(int argc, char **argv)

argc �� argv �� ruby �ؤ�
���ޥ�ɥ饤�󥪥ץ����Ȥ��ƽ������ޤ���

--- void ruby_run(void)

ruby_eval_tree ��ɾ���򳫻Ϥ��ޤ���

--- void ruby_stop(int ex)

ɾ����ץ�������ߤ��ޤ���

--- static VALUE safe_getter(void)

--- static void safe_setter(VALUE val)

--- static void scope_dup(struct SCOPE *scope)

scope �Ȥ��οƤ� SCOPE ���Ƥ� local_vars ��
�����å�����ҡ��פ˳������ľ���ޤ���

--- static NODE *search_method(VALUE klass, ID id, VALUE *origin)

���饹 klass ���� id �Ȥ���̾���Υ᥽�åɥ���ȥ�򸡺�����
�֤��ޤ������դ���ʤ���� NULL ���֤��ޤ���

���Υ᥽�åɤ� undef ���θ���ޤ��󡣤Ĥޤ� m_tbl ��
����ȥ꤬����ʤ餽�����Ƥ˴ؤ餺õ�����������ޤ���

--- static void secure_visibility(VALUE self)

--- static void set_backtrace(VALUE info, VALUE bt)

--- static void set_method_visibility(VALUE self, int argc, VALUE *argv, ID ex)

--- static VALUE set_trace_func(VALUE obj, VALUE trace)

Kernel#set_trace_func �μ��Ρ�
ɾ������Ф���եå���³������Ͽ���ޤ���

--- static VALUE specific_eval(int argc, VALUE *argv, VALUE klass, VALUE self)

rb_obj_instance_eval �� rb_mod_module_eval ���̲����뤿�������ؿ��Ǥ���

--- static void stack_check(void)

--- static void stack_extend(rb_thread_t th, int exit)

--- static VALUE superclass(VALUE self, NODE *node)

���饹ʸ�Υ����ѡ����饹��ɽ���Ρ��� node ��
ɾ�����ƥ��饹�����ޤ���

--- static VALUE svalue_to_avalue(VALUE v)

--- static VALUE svalue_to_mvalue(VALUE v)

--- static void terminate_process(int status, const char *mesg, int mlen)

--- static VALUE thgroup_add(VALUE group, VALUE thread)

--- static VALUE thgroup_list(VALUE group)

--- static VALUE thgroup_s_alloc(VALUE klass)

--- static void thread_free(rb_thread_t th)

--- static int thread_keys_i(ID key, VALUE value, VALUE ary)

--- static void thread_mark(rb_thread_t th)

--- static const char *thread_status_name(enum thread_status status)

--- static int thread_switch(int n)

--- static double timeofday(void)

--- static VALUE top_include(int argc, VALUE *argv)

--- static VALUE top_private(int argc, VALUE *argv)

--- static VALUE top_public(int argc, VALUE *argv)

--- static VALUE umcall(VALUE args, VALUE method)

--- static VALUE umethod_bind(VALUE method, VALUE recv)

UnboundMethod method �� recv ��«�����ޤ���

--- static VALUE umethod_call(int argc, VALUE *argv, VALUE method)

--- static VALUE umethod_proc(VALUE method)

--- static VALUE umethod_unbind(VALUE obj)

--- static VALUE yield_under(VALUE under, VALUE self)

�⥸�塼�� under �θ��Υ���ƥ����Ȥ�
ruby_block ��ɾ�����ޤ���

--- static VALUE yield_under_i(VALUE self)

yield_under ������ؿ��Ǥ���
