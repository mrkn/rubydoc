
: static int clone_method(ID mid, NODE *body, st_table *tbl) 
    (({m_tbl})) ��Ǽ�����Υ᥽�å� (��ʸ��) �򥳥ԡ������֤��ޤ���
    (({ST_CONTINUE})) ���֤��ޤ���

: static VALUE include_class_new(VALUE module, VALUE super) 
    ((|super|)) �򥹡��ѡ����饹�Ȥ���
    �⥸�塼��Ρֲ��ȡץ��饹��������֤��ޤ���

: static int ins_methods_i(ID key, NODE *body, VALUE ary) 
    (({rb_class_instance_methods()})) �Υ��ƥ졼���֥�å� (�̾���)��

: static int ins_methods_priv_i(ID key, NODE *body, VALUE ary) 
    (({rb_class_instance_methods()})) �Υ��ƥ졼���֥�å�
    (private �᥽�å���)��

: static int ins_methods_prot_i(ID key, NODE *body, VALUE ary) 
    (({rb_class_instance_methods()})) �Υ��ƥ졼���֥�å�
    (protected �᥽�å���)��

: static VALUE method_list(VALUE mod, int option, int (*func)())
    �⥸�塼�� ((|mod|)) ���������Ƥ���᥽�åɤ��Ф���
    ���֤� (({func})) �򷫤��֤��ƤӽФ��ޤ���

: VALUE rb_class_boot(VALUE super) 
    �����ѡ����饹�� ((|super|)) �Ȥ��륯�饹���֥������Ȥ���������֤��ޤ���

: VALUE rb_class_inherited(VALUE super, VALUE klass) 
    ���饹 ((|super|)) �β��̥��饹 ((|klass|)) ���������줿���Ȥ�
    �����ơ�((|super|)) ���Ф� (({inherited})) �᥽�åɤ�ƤӽФ��ޤ���

: VALUE rb_class_instance_methods(int argc, VALUE *argv, VALUE mod) 
    (({Module#instance_methods})) �μ��Ρ�
    �⥸�塼�� ((|mod|)) ���������Ƥ��� public �᥽�å�̾��
    �ꥹ�Ȥ�ʸ�����������֤��ޤ���

: VALUE rb_class_new(VALUE super) 
    ((|super|)) �򥹡��ѡ����饹�Ȥ���
    ���������饹���֥������Ȥ����������֤��ޤ���

: VALUE rb_class_private_instance_methods(int argc, VALUE *argv, VALUE mod) 
    (({Module#private_instance_methods})) �μ��Ρ�
    �⥸�塼�� ((|mod|)) ���������Ƥ��� private �᥽�å�̾��
    �ꥹ�Ȥ�ʸ�����������֤��ޤ���

: VALUE rb_class_protected_instance_methods(int argc, VALUE *argv, VALUE mod) 
    (({Module#protected_instance_methods})) �μ��Ρ�
    �⥸�塼�� ((|mod|)) ���������Ƥ��� protected �᥽�å�̾��
    �ꥹ�Ȥ�ʸ�����������֤��ޤ���

: void rb_define_alias(VALUE klass, const char *new, const char *old)
    ���饹 ((|klass|)) �Υ��󥹥��󥹥᥽�å� ((|old|)) ��
    ��̾ ((|new|)) ��������ޤ���

: void rb_define_attr(VALUE klass, const char *name, int read, int write) 
    ���饹 ((|klass|)) �˥᥽�å� name �� name= ��������ޤ���
    ((|read|)) �����ΤȤ��� name ���������
    ((|write|)) �����ΤȤ��� name= ��������ޤ���

: VALUE rb_define_class(const char *name, VALUE super)
    ���饹 ((|super|)) �β��̥��饹 ((|name|)) ��������֤��ޤ���

: VALUE rb_define_class_id(ID id, VALUE super) 
    ���饹̾ id �ǥ��饹 super ��Ѿ��������饹��
    �������������롣���饹�����饹̾ (���̾) �δ�Ϣ�դ���
    �ʤ���뤬����������饹�δ�Ϣ�դ��Ϥʤ���ʤ���

: VALUE rb_define_class_under(VALUE outer, const char *name, VALUE super)
    ���饹 ((|super|)) �β��̥��饹 (({((|outer|))::((|name|))}))
    ��������֤��ޤ���

: void rb_define_global_function(const char *name, VALUE (*func)(), int argc)
    �ؿ� ((|name|)) ��������ޤ���
    ((|func|)) �� ((|argc|)) �� (({rb_define_method})) ��Ʊ���Ǥ���

: void rb_define_method(VALUE klass, const char *name, VALUE(*func)(), int argc)
    ���饹((|klass|))�Υ��󥹥��󥹥᥽�å�((|name|))��������ޤ���

    ((|argc|))��C�δؿ����Ϥ��������ο�(�ȷ���)����ޤ���
    * ((|argc|))��0�ʾ�λ�

      ((|argc|))�ǻ��ꤷ���ͤ����Υ᥽�åɤΰ����ο��ˤʤ�ޤ���
      16�İʾ�ΰ����ϻȤ��ޤ���

        VALUE func(VALUE self, VALUE arg1, ... VALUE argN)

    * ((|argc|))��-1�ΤȤ�

      ������C������Ȥ������������������Ϥ���ޤ���
      ����������������ǿ��Ǥ���

        VALUE func(int argc, VALUE *argv, VALUE self)

    * ((|argc|))��-2�ΤȤ�

      ������Ruby�������������Ϥ���ޤ���

        VALUE func(VALUE self, VALUE args)

    ((<rb_scan_args>))�⻲��

: void rb_define_method_id(VALUE klass, ID name, VALUE (*func)(), int argc)
    ((|klass|)) �� public �᥽�å� ((|name|)) ��������ޤ���
    ���μ��Τϴؿ� ((|func|)) �Ǥ����ޤ� ((|argc|)) �ΰ�̣��
    rb_define_method ��Ʊ���Ǥ���

: VALUE rb_define_module(const char *name)
    �⥸�塼�� ((|name|)) ��������֤��ޤ���

: void rb_define_module_function(VALUE module, const char *name, VALUE (*func)(), int argc)
    �⥸�塼�� ((|module|)) �˥⥸�塼��ؿ� ((|name|)) ��������ޤ���
    ((|func|)) �� ((|argc|)) �� (({rb_define_method})) ��Ʊ���Ǥ���

: VALUE rb_define_module_id(ID id) 
    ̾���� ((|id|)) �Ǥ��뿷�����⥸�塼����������������֤��ޤ���
    �⥸�塼�뢪̾�� (���) �Υ�󥯤ϳ�Ω���ޤ���
    ̾�����⥸�塼��Υ�󥯤Ϥޤ���Ω���Ƥ��ޤ���

: VALUE rb_define_module_under(VALUE outer, const char *name)
    �⥸�塼�� (({((|outer|))::((|name|))})) ��������֤��ޤ���

: void rb_define_private_method(VALUE klass, const char *name, VALUE(*func)(), int argc)
    ���饹 ((|klass|)) �˥ץ饤�١��ȥ��󥹥��󥹥᥽�å� ((|name|)) ��
    ������ޤ������μ��Τϴؿ� ((|func|)) �Ǥ��ꡢ���δؿ����Ȥ�
    �����Υ����פ� ((|argc|)) �ǻ��ꤷ�ޤ���((|argc|)) �Υե����ޥåȤ�
    �Ĥ��Ƥ� (({rb_define_method})) �ι�򻲾Ȥ��Ƥ���������

: void rb_define_protected_method(VALUE klass, const char *name, VALUE (*func)(), int argc)
    ���饹 ((|klass|)) �� protected ���󥹥��󥹥᥽�å� ((|name|)) ��
    ������ޤ������μ��Τϴؿ� ((|func|)) �Ǥ��ꡢ���δؿ����Ȥ�
    �����Υ����פ� ((|argc|)) �ǻ��ꤷ�ޤ���((|argc|)) �Υե����ޥåȤ�
    �Ĥ��Ƥ� (({rb_define_method})) �ι�򻲾Ȥ��Ƥ���������

: void rb_define_singleton_method(VALUE obj, const char *name, VALUE (*func)(), int argc)
    ((|obj|)) ���ðۥ᥽�å� ((|name|)) ��������ޤ���
    �᥽�åɤμ��Τ� ((|func|)) �˴ؿ��ݥ��󥿤�Ϳ�������δؿ����Ȥ�
    �����Υ����פ� ((|argc|)) ���Ϥ��ޤ���((|argc|)) �Υե����ޥåȤ�
    �Ĥ��Ƥ� (({rb_define_method})) �ε��Ҥ򻲾Ȥ��Ƥ���������

: void rb_include_module(VALUE klass, VALUE module) 
    (({Module#append_features})) �μ��Ρ�
    ���饹�ޤ��ϥ⥸�塼�� ((|klass|)) �˥⥸�塼�� ((|module|)) ��
    ���󥯥롼�ɤ��ޤ���

: VALUE rb_make_metaclass(VALUE obj, VALUE klass) 
    ���饹 ((|klass|)) �Υ��󥹥��� ((|obj|)) ���ðۥ��饹��Ƴ����
    �ðۥ��饹�� ((|obj|)) ���ӤĤ��ޤ���

: VALUE rb_mod_ancestors(VALUE mod) 
    �⥸�塼�� ((|mod|)) �˥��󥯥롼�ɤ���Ƥ���⥸�塼�롢
    ����� ((|mod|)) �����饹�ʤ�Х����ѡ����饹�Ȥ����
    ���󥯥롼�ɤ���Ƥ���⥸�塼���Ƶ�Ū�˽����
    �᥽�å�õ��ͥ���̽���¤٤��֤��ޤ� (�᤯õ�������ۤ�����)��

: VALUE rb_mod_clone(VALUE mod) 
    �⥸�塼�� ((|mod|)) �� clone �����֤��ޤ���

: VALUE rb_mod_dup(VALUE mod) 
    �⥸�塼�� ((|mod|)) �� dup �����֤��ޤ���

: VALUE rb_mod_include_p(VALUE mod, VALUE mod2)
    �⥸�塼�� ((|mod|)) �� ((|mod2|)) �򥤥󥯥롼�ɤ��Ƥ���п���

: VALUE rb_mod_included_modules(VALUE mod) 
    �⥸�塼�� ((|mod|)) �˥��󥯥롼�ɤ���Ƥ���⥸�塼���������֤��ޤ���

: VALUE rb_module_new(void) 
    �������⥸�塼�륪�֥������Ȥ���������֤��ޤ���

: VALUE rb_obj_singleton_methods(int argc, VALUE *argv, VALUE obj) 
    (({Object#singleton_methods})) �μ��Ρ�
    ���֥������� ((|obj|)) ���������Ƥ����ðۥ᥽�å�̾�Υꥹ�Ȥ�
    ʸ�����������֤���

: int rb_scan_args(int argc, const VALUE *argv, const char *fmt, ...)
    Ĺ�� ((|argc|)) ������ ((|argv|)) �� ((|fmt|)) �˽��ä�
    ���Ϥ�����Ͱ����ʹߤ��Ϥ��줿���ɥ쥹�˽񤭹��ߤޤ���

    ((|fmt|)) �Υե����ޥåȤϰʲ����̤�Ǥ���

      * ɬ�ܰ����ο� (��ά��ǽ�ʰ���������ʤ��ά�Բ�)
      * ��ά��ǽ�ʰ����ο� (����Ĥʤ�о�ά��)
      * �Ĥ�ΰ����� Ruby ������Ȥ��Ƽ�����뤳�Ȥ򼨤� '*' (��ά��)
      * �֥�å��� Proc ���֥������Ȳ����Ƽ�����뤳�Ȥ򼨤� '&' (��ά��)

    �����λ���ʸ���Ϥ��줾���ά��ǽ�Ǥ�����
    ɬ�����ν��֤Ǹ���ʤ���Ф����ޤ���

    ������

	VALUE a, b, optv;
	rb_scan_args(argc, argv, "21", &a, &b, &optv);

    �б����� Ruby �ץ����Ǥ����

	def some_method( a, b, opt = nil )

    ������ (2)

	VALUE a, rest, block;
	rb_scan_args(argc, argv, "1*&", &a, &rest, &block);

    �б����� Ruby �ץ����Ǥ����

	def some_method( a, *rest, &block )

: VALUE rb_singleton_class(VALUE obj) 
    ((|obj|)) ���ðۥ��饹��Ƴ�����������ðۥ��饹���֤��ޤ���
    ���Ǥ��ðۥ��饹��Ƴ������Ƥ���Ȥ��Ϥ���򤽤Τޤ��֤��ޤ���

    ((|obj|)) ���ðۥ᥽�åɤ�����Ǥ��ʤ����Υ��֥������ȤǤ���
    �Ȥ����㳰 (({TypeError})) ��ȯ�����ޤ���

: void rb_singleton_class_attached(VALUE klass, VALUE obj) 
    �ðۥ��饹 ((|klass|)) �ˤ���ͣ��Υ��󥹥��� ((|obj|)) ���ӤĤ��ޤ���

: VALUE rb_singleton_class_clone(VALUE klass) 
    �ðۥ��饹 ((|klass|)) �� clone �����֤��ޤ���
    ((|klass|)) ���ðۥ��饹�Ǥʤ��Ȥ��Ϥ��� ((|klass|)) ���֤��ޤ���

: VALUE rb_singleton_class_new(VALUE super) 
    ((|super|)) �򥹡��ѡ����饹�Ȥ����ðۥ��饹�����������֤��ޤ���

: void rb_undef_method(VALUE klass, const char *name)
    ���饹 ((|klass|)) �Υ��󥹥��󥹥᥽�å� ((|name|)) ��
    undef ���ޤ���
