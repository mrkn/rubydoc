--- type* ALLOC(type)

type ���Υ���������Ƥ롣

--- type* ALLOC_N(type, n)

type ���Υ���� n �ĳ�����Ƥ롣

--- type* ALLOCA_N(type, n)

type ���Υ���� n �ĥ����å��ե졼��˳�����Ƥ롣
���Υ���ϴؿ��������ȼ�ưŪ�˲�������롣

--- int BUILTIN_TYPE(VALUE obj)

obj �ι�¤�η� ID ���֤��ޤ���
[[f:SPECIAL_CONST_P(obj)]] �����Υ��֥������Ȥ��Ф��ƻȤ�������ޤ���

--- void Check_SafeStr(VALUE v)

�Ť� API �Ǥ���[[f:SafeStringValue]] ��ȤäƤ���������

--- void Check_Type(VALUE val, int typeflag)

val �ι�¤�η��ե饰�� typeflag �Ǥʤ����
�㳰 TypeError ��ȯ�����ޤ���val ��¨�ͤ� VALUE �Ǥ��äƤ�
�����ޤ���

--- VALUE CHR2FIX(char x)

char �������� x �� Ruby �� Fixnum ���Ѵ����ޤ���

--- VALUE CLASS_OF(VALUE obj)

obj �Υ��饹���֤��ޤ���
���ξ��Ρ֥��饹�פȤ� C ��٥�Υ��饹��
�Ĥޤ� RBasic ��¤�Τ� klass ���Ф��ͤǤ���
�ޤ�����¤�Τ�����ʤ� Fixnum �ʤɤ��Ф��Ƥ������Ư���ޤ���

--- void CLONESETUP(VALUE clone, VALUE obj)

OBJSETUP() ���Ѽ
clone ��obj ���� clone �Ǻ�ä�
���֥������ȤȤ��ƽ�������ޤ���

--- void Data_Get_Struct(VALUE obj, type, type *svar)

Ruby �Υ��֥������� obj ���� type ���ؤΥݥ��󥿤�
�Ȥ���� svar ���������ޤ���

������

    struct mytype {
        int i;
        char *s;
    };

    VALUE
    my_i(VALUE self)
    {
        struct mytype *m;
        Data_Get_Struct(self, struct mytype, m);
        return INT2NUM(m->i);
    }

--- VALUE Data_Make_Struct(VALUE klass, type, RUBY_DATA_FUNC mark, RUBY_DATA_FUNC free, type *svar)

type ���ι�¤�Τ�ҡ��פ˳�����ƤƤ���ؤΥݥ��󥿤�
svar �������������饹 klass �Υ��󥹥��󥹤Ǥ���
Ruby �Υ��֥������Ȥ���������������֤��ޤ���mark
free �Ϥ��줾��ޡ����ѡ������Ѥδؿ��ؤΥݥ��󥿤Ǥ���
�ɤ���⡢ɬ�פʤ��Ȥ��Ϥ����� 0 ���Ϥ��ޤ���

�ޤ� RUBY_DATA_FUNC ������ϰʲ��Τ褦�Ǥ���

    typedef void (*RUBY_DATA_FUNC)(void *st)

������ st �ˤ� svar ���ͤ��Ϥ���ޤ���

������

    struct mytype {
        int i;
        char *s;
    };

    VALUE
    my_s_new(klass)
        VALUE klass;
    {
        struct mytype *dummy;
        return Data_Make_Struct(MyClass, struct mytype,
                                mark_my, free_my, dummy);
    }

--- void *DATA_PTR(VALUE dta)

�ºݤ� struct RData* ���Ǥ��� dta ���顢
���줬��åפ��Ƥ���ݥ��󥿤���Ф��ޤ���

--- VALUE Data_Wrap_Struct(VALUE klass, RUBY_DATA_FUNC mark, RUBY_DATA_FUNC free, void *sval)

C �ι�¤�� sval ���åפ��� klass ���饹��
���󥹥��󥹤Ǥ��� Ruby ���֥������Ȥ���������������֤��ޤ���
mark��free �Ϥ��줾�� sval �Υޡ����ѡ������Ѥ�
�ؿ��ؤΥݥ��󥿤Ǥ����ɤ���⡢ɬ�פʤ��Ȥ��Ϥ����� 0 ���Ϥ��ޤ���

�ޤ� RUBY_DATA_FUNC ������ϰʲ��Τ褦�Ǥ���

    typedef void (*RUBY_DATA_FUNC)(void *st)

������ st �ˤ� sval ���Ϥ���ޤ���

������

    struct mytype {
        int i;
        char *s;
    };

    VALUE
    my_s_new(klass)
        VALUE klass;
    {
        struct mytype *m = malloc(sizeof(struct mytype));
        m->i = 0;
        m->s = 0;
        return Data_Wrap_Struct(MyClass, 0, free_my, m);
    }

--- void DUPSETUP(dup, obj)

OBJSETUP() ���Ѽ
dup ��obj ���� dup �Ǻ�ä�
���֥������ȤȤ��ƽ�������ޤ���

--- int FIX2INT(VALUE x)

Fixnum �� int ���Ѵ����ޤ���
�֤��ͤ� int ���ϰϤ��鳰������ RangeError ��ȯ�����ޤ���

--- long FIX2LONG(VALUE x)

Fixnum �� long ���Ѵ����ޤ���
�֤��ͤ� long ���ϰϤ��鳰������ RangeError ��ȯ�����ޤ���

--- unsigned int FIX2UINT(VALUE x)

Fixnum �� unsigned int ���Ѵ����ޤ���
�֤��ͤ� unsigned int ���ϰϤ��鳰������ RangeError ��ȯ�����ޤ���

--- unsigned long FIX2ULONG(VALUE x)

Fixnum �� unsigned long ���Ѵ����ޤ���
�֤��ͤ� unsigned long ���ϰϤ��鳰������ RangeError ��ȯ�����ޤ���

--- int FIXABLE(long f)

f �� Fixnum ���ϰϤ˼��ޤäƤ���ʤ鿿��

--- long FIXNUM_MAX

Fixnum �ˤǤ��������ξ���͡�

--- long FIXNUM_MIN

Fixnum �ˤǤ��������β����͡�

--- int FIXNUM_P(VALUE obj)

obj �� Fixnum �Υ��󥹥��󥹤ΤȤ�����

--- int FL_ABLE(VALUE x)

x ��¨�ͤ� VALUE �Ǥʤ���п���

--- void FL_REVERSE(VALUE x, int f)

x �Υե饰 f ��ȿž���롣

--- void FL_SET(VALUE x, int f)

x ���Ф��ƥե饰 f �򥻥åȤ��롣

--- int FL_TEST(VALUE x, int f)

x �Υե饰 f ��Ω�äƤ����鿿��

--- void FL_UNSET(VALUE x, int f)

x �Υե饰 f �򥯥ꥢ���롣

--- VALUE ID2SYM(ID id)

id �� Symbol ���Ѵ����ޤ���

--- int IMMEDIATE_P(VALUE obj)

obj ���ݥ��󥿤Ǥʤ��Ȥ��������ʤ�����ߤμ����Ǥ�
Symbol �� Fixnum �Υ��󥹥��󥹤Ǥ���Ȥ�����

--- VALUE INT2FIX(int i)

31�ӥåȰ���ˤ����ޤ������� Fixnum ���Ѵ����ޤ���

--- VALUE INT2NUM(long i)

Ǥ�դ������� Fixnum �� Bignum ���Ѵ����ޤ���

--- int ISALNUM(char c)

--- int ISALPHA(char c)

--- int ISASCII(char c)

--- int ISDIGIT(char c)

--- int ISLOWER(char c)

--- int ISPRINT(char c)

--- int ISSPACE(char c)

--- int ISUPPER(char c)

--- int ISXDIGIT(char c)

--- VALUE LL2NUM(long long v)

--- VALUE LONG2FIX(long i)

--- VALUE LONG2NUM(long v)

--- int MEMCMP(p1, p2, type, n)

type ���Υ����ΰ� p1 �� p2 ����Ƭ n �Ĥ���Ӥ��롣
p1 �� p2 �κǽ�� n �Ĥ�꾮���������������礭���Ȥ�����
�줾������0������ͤ��֤���

--- void MEMCPY(p1, p2, type, n)

type ���Υ����ΰ� p2 �Τ�����Ƭ�� n �Ĥ� p1 �˥��ԡ����롣

--- void MEMMOVE(p1, p2, type, n)

type ���Υ����ΰ� p2 �Τ�����Ƭ�� n �Ĥ� p1 �˰�ư���롣

--- void MEMZERO(p, type, n)

type ���Υ����ΰ� p �򥼥��ꥢ���롣 n �����ǿ���

--- int NEGFIXABLE(long f)

--- NEWOBJ(obj, int typeflag)

--- int NIL_P(VALUE obj)

obj �� Qnil �ΤȤ�����

--- char NUM2CHR(VALUE x)

--- double NUM2DBL(VALUE x)

--- int NUM2INT(VALUE x)

--- long NUM2LONG(VALUE x)

--- unsigned int NUM2UINT(VALUE x)

--- unsigned long NUM2ULONG(VLAUE x)

--- void OBJ_FREEZE(VALUE x)

--- int OBJ_FROZEN(VALUE x)

--- void OBJ_INFECT(VALUE dest, VALUE src)

src �˱����ޡ������դ��Ƥ����� dest ��������롣

--- void OBJ_TAINT(VALUE x)

x �˱����ޡ������դ��롣

--- int OBJ_TAINTED(VALUE x)

x �˱����ޡ������դ��Ƥ����鿿��

--- void OBJSETUP(obj, VALUE klass, int typeflag)

obj �򥯥饹 klass �ȥե饰 typeflag �ǽ�������롣
$SAFE >= 3 �ΤȤ���̵���Ǳ������롣

--- int POSFIXABLE(long f)

f �� Fixnum �ξ���Ͱʲ��ʤ�п���

--- struct RArray *RARRAY(VALUE obj)

obj �� struct RArray* �˥��㥹�Ȥ��롣
������ obj �� struct RArray* �Ǥʤ��Ȥ��Ƥ⥭�㥹�Ȥ��Ƥ��ޤ���

--- VALUE rb_fix_new(long v)

--- VALUE rb_int_new(long v)

--- int rb_safe_level(void)

���ߤΥ����ե�٥���֤��ޤ���

--- VALUE rb_uint_new(unsigned int v)

--- struct RBasic *RBASIC(VALUE obj)

--- struct RBignum *RBIGNUM(VALUE obj)

--- struct RClass *RCLASS(VALUE obj)

--- struct RData *RDATA(VALUE obj)

--- type* REALLOC_N(var, type, n)

type ���Υ����ΰ� var �Υ������� n �Ĥ��ѹ����롣

--- struct RFile *RFILE(VALUE obj)

--- struct RFloat *RFLOAT(VALUE obj)

--- struct RHash *RHASH(VALUE obj)

--- struct RClass *RMODULE(VALUE obj)

--- struct RObject *ROBJECT(VALUE obj)

--- struct RRegexp *RREGEXP(VALUE obj)

--- struct RString *RSTRING(VALUE obj)

--- struct RStruct *RSTRUCT(VALUE obj)

--- int RTEST(VALUE obj)

obj �� Qfalse �Ǥ� Qnil �Ǥ�ʤ��Ȥ�����

--- RUBY_DATA_FUNC(func)

Ǥ�դδؿ��ؤΥݥ��� func �� struct RData �� dmark/dfree ��
�ͤȤ���Ŭ���뷿�˶������㥹�Ȥ��ޤ���

--- RUBY_METHOD_FUNC(func)

Ǥ�դδؿ��ؤΥݥ��� func �� Ruby �Υ᥽�åɤμ��ΤȤ���Ŭ����
���˶������㥹�Ȥ��ޤ���

--- SafeStringValue(v)

[[f:StringValue]] ��Ʊ������val �� String �Ǥʤ���� to_str �᥽�åɤ�
�Ȥä� String ���Ѵ����ޤ���Ʊ���� rb_check_safe_str() �ˤ������å���
�Ԥ��ޤ���

--- int SPECIAL_CONST_P(VALUE obj)

obj �����Τι�¤�Τ�����ʤ��Ȥ������������ǿ��ˤʤ�Τ�
Qnil Qtrue Qfalse �ȡ�
Fixnum��Symbol �Υ��󥹥��󥹡�

--- char *STR2CSTR(VALUE str)

Ruby �Υ��֥������� str ���� C ��ʸ�������Ф��ޤ���
str �� String �Ǥʤ����� to_str �ˤ�ä�
�Ѵ����ߤޤ���

�֤��ͤ� free ������ľ�ܽ񤭴������ꤷ�ƤϤ����ޤ���

STR2CSTR �ϡ�Ϳ����줿���֥������Ȥ�ʸ����Ǥʤ� to_str �᥽��
�ɤ���ľ�硢������ to_str ��ƤӽФ��ư��ۤη��Ѵ���Ԥ���
���줬�ݻ�����ʸ����ݥ��󥿤��֤��ޤ���
������������API�Ǥϰ��ۤη��Ѵ���̤Ȥʤ륪�֥������Ȥ��ɤ������
�ݻ�����ʤ����ᡢ��դ��ƻ��Ѥ��ʤ��ȷ�̤� GC ������ǽ��������ޤ���

Ruby 1.7 �ʹߤǤ������ [[f:StringValuePtr]] ����Ѥ��ޤ���������
�ϡ������λ����褬���ۤη��Ѵ��η�̤��֤�����뤿���Ѵ���̤� GC
����ޤ���(Ruby 1.7 �Ǥϡ�STR2CSTR() �ϡ�obsolete �Ǥ�)

[[f:StringValue]] �ϡ������� to_str �ˤ����ۤη��Ѵ�����Ԥ���
���˻��Ѥ��ޤ���

--- StringValue(VALUE val)

val �� String �Ǥʤ���� to_str �᥽�åɤ�Ȥä� String ���Ѵ����ޤ���

���Υޥ�����Ϥ��� VALUE �� ruby �� GC ����μ¤��ݸ��ޤ���

--- char *StringValuePtr(VALUE val)

val �� String �Ǥʤ���� to_str �᥽�åɤ�Ȥä� String ���Ѵ�����
���μ��ΤΥݥ��󥿤��֤��ޤ���

���Υޥ�����Ϥ��� VALUE �� ruby �� GC ����μ¤��ݸ��ޤ���

--- int SYM2ID(VALUE symbol)

Symbol symbol ����ͤ��Ѵ����ޤ���
1.4�Ǥϡ�[[f:FIX2INT]](symbol)��Ʊ���Ǥ���

--- int SYMBOL_P(VALUE obj)

obj �� Symbol �Υ��󥹥��󥹤ΤȤ�����

--- int TYPE(VALUE obj)

obj �ι�¤�η� ID ���֤��ޤ���

--- VALUE UINT2NUM(unsigned long i)

Ǥ�դ������� Fixnum �� Bignum ���Ѵ����ޤ���

--- VALUE ULL2NUM(unsigned long long n)

--- VALUE ULONG2NUM(unsigned long n)

--- VALUE UINT2FIX(unsigned int i)

unsigned int �� Fixnum ���Ѵ����ޤ���
