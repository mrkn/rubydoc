--- static NODE *arg_add(NODE *node1, NODE *node2)

--- static void arg_ambiguous(void)

�᥽�åɰ����γ�̤���ά���졢�ǽ�ΰ����ΰ�ʸ���ܤ�
�黻�ҤȤ���Ǥ�����˷ٹ��Ф��ޤ���

--- static NODE *arg_blk_pass(NODE *node1, NODE *node2)

--- static NODE *arg_concat(NODE *node1, NODE *node2)

--- static NODE *arg_prepend(NODE *node1, NODE *node2)

--- static NODE *aryset(NODE *recv, NODE *idx)

--- static int assign_in_cond(NODE *node)

��Ｐ��������˷ٹ��Ф��ޤ���

--- static NODE *assignable(ID id, NODE *val)

--- static NODE *attrset(NODE *recv, ID id)

--- static NODE *block_append(NODE *head, NODE *tail)

head �� tail �� NODE_BLOCK �Υꥹ�ȤȤ���Ϣ�뤷��
��Ƭ�Ρ��ɤ��֤��ޤ���head �ޤ��� tail �� NODE_BLOCK
�Ǥʤ����� NODE_BLOCK �����줿�����Ǥ����Ϣ�뤷�ޤ���
head �⤷���� tail �� NULL �ʤ�Ϣ��Ϥ�����
NULL �Ǥʤ��ۤ����֤��ޤ���

--- static NODE *call_op(NODE *recv, ID id, int narg, NODE *arg1)

--- static NODE *cond(NODE *node)

--- static NODE *cond0(NODE *node)

--- static int dyna_in_block(void)

�֥�å��˥ͥ��Ȥ��Ƥ��륳���ɤ�ѡ�����Ͽ���

--- static void dyna_pop(struct RVarmap *vars)

�֥�å��������ѿ��ơ��֥��ݥåפ��ޤ���

--- static struct RVarmap *dyna_push(void)

�֥�å��������ѿ��ơ��֥��ץå��夷�ޤ���

--- static int e_option_supplied(void)

ruby -e ��Ϳ�����ץ�����¹���ʤ鿿��

--- static void fixpos(NODE *node, NODE *orig)

orig �˳�Ǽ����Ƥ���ե�����̾�ȹ��ֹ�� node �˥��ԡ����ޤ���
node �⤷���� orig �� NULL �ΤȤ��ϲ��⤷�ޤ���

--- static NODE *gettable(ID id)

id ���ѿ�������Ȥ���ͭ���ʤ�С�����򻲾Ȥ���Ρ��ɤ��֤��ޤ���
(get + able �Ǥ��ä� get table �ǤϤʤ�)

--- static int here_document(NODE *here)

lex_strterm ������ term �˽��äƥҥ��ɥ�����Ȥ�
��ü�Ԥޤ��ɤ߹��ࡣ

--- static int heredoc_identifier(void)

�ҥ��ɥ�����ȤΡ�<<�פ�����ɤߤ������ΤȲ��ꤷ��
���ϵ�����ɤߤ��ߡ�lex_strterm �򥻥åȤ��ޤ���
�֤��ͤϡ��ɤ߹��ߤ����������Ȥ��ϥ���ܥ롢���ϤǤ��ʤ��Ȥ��� 0 �Ǥ���

--- static void heredoc_restore(NODE *here)

�ҥ��ɥ�����Ȥ����Τ��ɤ߹��ߤ˼��Ԥ����Ȥ������ϵ���
�Τ���Ԥ��������ޤ���here �� lex_strterm �Ǥ���

--- void Init_sym(void)

����ܥ�ط����ѿ����������ޤ���

--- static ID internal_id(void)

���󥿥ץ꥿�����Ǥ����Ȥ���
¾�Τ�ΤȤϽ�ʣ���ʤ� ID ���֤��ޤ���

--- static VALUE lex_get_str(VALUE s)

ʸ���� s �� lex_gets_ptr �θ夫���Լ��������֤��ޤ���
lex_gets_ptr ��ʤ���ޤ���

--- static VALUE lex_getline(void)

�ؿ� lex_gets ��Ȥä� lex_input ����
Ruby �ץ��������ɤߤ��ߤޤ���

--- static NODE *list_append(NODE *head, NODE *tail)

NODE_LIST �Υꥹ�� head ���� NODE_LIST �ΥΡ���
tail ��Ϣ�뤷����Ƭ�Ρ��ɤ��֤��ޤ���head �� NULL
�ΤȤ��� tail �� NODE_LIST �ǥ�åפ����֤��ޤ���

--- static NODE *list_concat(NODE *head, NODE *tail)

NODE_LIST�Υꥹ��head��NODE_LIST�ΥΡ���tail��Ϣ�뤷��
��Ƭ�Ρ��ɤ��֤���head��tail�Ȥ��NULL�Ǥ��äƤϤʤ�ʤ���

--- static NODE *literal_append(NODE *head, NODE *tail)

--- static NODE *literal_concat(NODE *head, NODE *tail)

--- static NODE *literal_concat_dstr(NODE *head, NODE *tail)

--- static NODE *literal_concat_list(NODE *head, NODE *tail)

--- static NODE *literal_concat_string(NODE *head, NODE *tail, VALUE str)

--- static int local_append(ID id)

�������������ѿ� id ��ơ��֥���ɲä��ޤ���

--- static int local_cnt(ID id)

�������ѿ� id ���ѿ� ID ��������ޤ���
�������Ƥ��Ƥ⤤�ʤ��Ƥ������� ID �������Ǥ��ޤ���

--- static int local_id(ID id)

���ߤΥ������פǥ������ѿ� id ���������Ƥ���п���

--- static void local_pop(void)

�������ѿ��ơ��֥��ݥåפ��ޤ���
�ơ��֥뤬���Ȥ���Ƥ��ʤ���硢
�ơ��֥�ϼ�ưŪ�˳�������ޤ���

--- static void local_push(int top)

�������ѿ��ơ��֥��ץå��夷�ޤ���
�ץ����Υȥåץ�٥��ѡ������Ƥ���Ȥ��� top �򿿤ˤ��ޤ���

--- static ID *local_tbl(void)

�������ѿ��ơ��֥륹���å�����Ƭ�ˤ���ơ��֥��������ޤ���

--- static NODE *logop(enum node_type type, NODE *left, NODE *right)

--- static NODE *match_gen(NODE *node1, NODE *node2)

--- static NODE *new_call(NODE *r, ID m, NODE *a)

--- static NODE *new_fcall(ID m, NODE *a)

--- static NODE *new_super(NODE *a)

--- static NODE *newline_node(NODE *node)

node��NULL�Ǥʤ���и��ߥѡ�����ι��ֹ���Ǽ����
NODE_NEWLINE��node�������ղä���������֤���

--- static char *newtok(void)

�ȡ�����Хåե��������ޤ��ϥ��ꥢ����
���Υȡ�����򳫻Ϥ��롣

--- static int nextc(void)

���Ϥ��鼡�ΰ�ʸ�����ɤ߹��ߤޤ���
CR LF ���Ф��� LF ��EOF ���Ф��� -1 ���֤��ޤ���

--- static NODE *node_assign(NODE *lhs, NODE *rhs)

--- static int nodeline(NODE *node)

node �������ޤ�Ƥ�����ֹ���֤��ޤ���
�ǥХå��ѤǤ���

--- static enum node_type nodetype(node)

node �μ�����֤��ޤ���
�ǥХå��ѤǤ���

--- static int parse_string(NODE *quote)

lex_strterm �����ΥΡ��� quote �λؼ��˽�����
ʸ����ν�ü�ޤ��������߼��λϤޤ�ޤ��ɤߤ��ߤޤ���

--- MACRO static int peek(int c)

�����ɤ߹�����Υץ����μ���ʸ���� c �ʤ�п���

--- static void pushback(int c)

���Ϥ˰�ʸ���ᤷ�ޤ���
c �� EOF (-1) �ΤȤ��Ϥʤˤ⤷�ޤ���

--- static NODE *range_op(NODE *node)

--- static void rb_backref_error(NODE *node)

--- VALUE rb_backref_get(void)

���ߤ� SCOPE �� $~ ���ͤ��֤��ޤ���

--- void rb_backref_set(VALUE val)

���ߤ� SCOPE �� $~ �� val ���������ޤ���

--- NODE *rb_compile_cstr(const char *f, const char *s, int len, int line)

C ��ʸ���� s ��ʸ�ڤ˥���ѥ��뤷��ruby_eval_tree ��
ruby_eval_tree_begin �˳�Ǽ���ޤ���ruby_eval_tree ���֤��ޤ���
�ޤ�����ѥ��뤹��Ȥ��˥ե����� f �� line ���ܤ���򥳥�ѥ���
���Ƥ���Ȳ��ꤷ�ޤ���

--- NODE *rb_compile_file(const char *f, VALUE file, int start)

Ruby �� IO ���֥������� file ����ʸ������ɤ߹��ߡ�
����� Ruby �ץ����Ȥ��ƹ�ʸ�ڤ˥���ѥ��뤷�ޤ���
����������ʸ�ڤ� ruby_eval_tree �� ruby_eval_tree_begin ��
��Ǽ����Ʊ���� ruby_eval_tree ���֤��ޤ���
�ޤ�����ѥ��뤹��Ȥ��˥ե����� f �� line ���ܤ���򥳥�ѥ���
���Ƥ���Ȳ��ꤷ�ޤ���

--- NODE *rb_compile_string(const char *f, VALUE s, int line)

Ruby ��ʸ���� s ��ʸ�ڤ˥���ѥ��뤷��ruby_eval_tree ��
ruby_eval_tree_begin �˳�Ǽ���ޤ���ruby_eval_tree ���֤��ޤ���
�ޤ�����ѥ��뤹��Ȥ��˥ե����� f �� line ���ܤ���򥳥�ѥ���
���Ƥ���Ȳ��ꤷ�ޤ���

--- char *rb_id2name(ID id)

id ���б�����ʸ������֤��ޤ���
�֤��ͤϳ����Ǥ��ޤ���

--- ID rb_id_attrset(ID id)

--- ID rb_intern(const char *name)

Ǥ�դ� char* �Ȱ��а���б��������� ID ���֤���

--- int rb_is_class_id(ID id)

���饹�ѿ�̾�Ȥ���ͭ���� ID �ʤ�п���

--- int rb_is_const_id(ID id)

���̾�Ȥ���ͭ���� ID �ʤ�п���

--- int rb_is_instance_id(ID id)

���󥹥����ѿ�̾�Ȥ���ͭ���� ID �ʤ�п���

--- int rb_is_local_id(ID id)

�������ѿ�̾�Ȥ���ͭ���� ID �ʤ�п���

--- VALUE rb_lastline_get(void)

����ɾ����� SCOPE �� $_ ���ͤ�������ޤ���

--- void rb_lastline_set(VALUE val)

����ɾ����� SCOPE �� $_ �� val ���������ޤ���

--- NODE *rb_node_newnode(enum node_type type, NODE *a0, NODE *a1, NODE *a2)

�Ρ��ɥ����פ� type �� a0 a1 a2 ��
���Ǥ˻��ĥΡ��ɤ����������֤��ޤ���

--- void rb_parser_append_print(void)

ruby �� -p ���ץ����μ�����
�롼�פ� print �ΥΡ��ɤ� ruby_eval_tree �˲ä��ޤ���

--- void rb_parser_while_loop(int chop, int split)

ruby �� -n ���ץ����μ�����
�롼�פ� print �ΥΡ��ɤ� ruby_eval_tree �˲ä��ޤ���

--- static struct kwtable *rb_reserved_word(const char *str, unsigned int len)

Ĺ�� len ��ʸ���� str ��ͽ���Ǥ����
���Υե饰�ơ��֥���֤��ޤ���str ��ͽ���Ǥʤ����
NULL ���֤��ޤ���

    struct kwtable {
        char *name;            /* ͽ����̾�� */
        int id[2];             /* 0:  �󽤾�������ܥ�
                                  1:  ����������ܥ� (kIF_MOD �ʤ�) �������
                                      ������Ǽ���롣�ʤ���� id[0] ��Ʊ��  */
        enum lex_state state;  /* ���ܤ��٤�lex_state */
    };

--- VALUE rb_sym_all_symbols(void)

�ƤӽФ����ޤǤ��Ѵ����Ԥ�줿���٤ƤΥ���ܥ��
������֤���

--- static int read_escape(void)

��ʸ������������Хå�����å��嵭ˡ������
ʸ��������ϥХåե������ɤߤȤꡢɾ���ͤ��֤���
��Ƭ�ΥХå�����å���Ϥ��Ǥ��ɤߤ���Ǥ����ΤȲ��ꤹ�롣
�����ʵ�ˡ���Ф��Ƥ� yyerror ��ƤӽФ�, 0 ���֤���

--- static int regx_options(void)

����ɽ���Υ��ץ���� (ixmo nesu) ���ɤ߹���
�ե饰 (�ӥåȥޥ���) ���֤��ޤ���

--- static NODE *ret_args(NODE *node)

--- static void special_local_set(char c, VALUE val)

$~ �� $_ �򥻥åȤ��ޤ���
���ߤ� c=0 �� $_ �� c=1 �� $~ �Ǥ���

--- static int symbols_i(char *key, ID value, VALUE ary)

rb_sym_all_symbols() �Υ��ƥ졼���֥�å���

--- MACRO static char *tok(void)

���ߤΥȡ��������Ƭ�ؤΥݥ��󥿡�
free ���ƤϤʤ�ʤ���

--- static void tokadd(char c)

�ȡ�����Хåե���ʸ�� c ���ɲä��ޤ���

--- static int tokadd_escape(int term)

ʸ��������ɽ����ǵ������Хå�����å��嵭ˡ��
���ϥХåե������ɤߤȤꡢ�ȡ�����Хåե����ɲä��ޤ���
��Ƭ�ΥХå�����å���Ϥ��Ǥ��ɤߤ���Ǥ����ΤȲ��ꤷ�ޤ���
�����ʵ�ˡ���Ф��Ƥ� yyerror ��ƤӽФ� 0 ���֤��ޤ���

--- static int tokadd_string(int func, int term, int paren)

--- MACRO static void tokfix(void)

�ȡ�����Хåե��� NUL �ǽ�ü���ޤ���

--- MACRO static char* toklast(void)

���ߤΥȡ�����������ؤΥݥ��󥿡�

--- MACRO static int toklen(void)

���ߤΥȡ������Ĺ����

--- static void top_local_init(void)

�ѡ�����Υץ����Υȥåץ�٥�Τ���Υ������ѿ��ơ��֥��ץå��夹�롣

--- static void top_local_setup(void)

�ѡ�����Υץ����Υȥåץ�٥�Τ���Υ������ѿ��ơ��֥��ݥåפ���
����¸�ߤ��� SCOPE �ˤ�����ܤ�­����

--- static int value_expr(NODE *node)

node ��ɾ�������Ȥ��ˡ��μ¤��ͤ������ʤ�����
����ʤ�зٹ�ޤ��ϥ��顼�ˤ��롣

--- static void void_expr(NODE *node)

node ��ɽ���ץ���������ͤ�Ȥ�ʤ���
��̣�Τʤ���������зٹ��Ф���

    # �ٹ𤬽Ф���
    lvar = 1
    lvar      # ̵��
    p lvar

--- static void void_stmts(NODE *node)

node ��ɽ���ץ���������ͤ�Ȥ�ʤ���
��̣�Τʤ���������зٹ��Ф���

    # �ٹ𤬽Ф���
    lvar = 1
    lvar      # ̵��
    p lvar

--- static void warn_unless_e_option(const char *str)

ruby -e ��Ϳ�����ץ�����ɾ����ǤϤʤ��ʤ顢
�ٹ��å����� str ����Ϥ��롣

--- static void warning_unless_e_option(const char *str)

ruby -e ��Ϳ�����ץ�����ɾ����ǤϤʤ���
������ $VERBOSE �����ʤ�С��ٹ��å����� str ����Ϥ��롣

--- static int whole_match_p(char *eos, int len, int indent)

���ߤ����ϹԤ��ҥ��ɥ�����Ȥν�ü����Ǥ���п���

--- static NODE *yycompile(char *f, int line)

����ѥ���򳫻Ϥ��ޤ������ΤȤ���
�ե�����̾ f �� line ���ܤ����
����ѥ��뤹���ΤȲ��ꤷ�ޤ���

--- static int yyerror(char *msg)

�ѡ������顼����𤹤�Ȥ��� yyparse ����ƤӽФ���ޤ���
���顼��å����� msg �ȥ��顼�ˤʤä�������Ϥ��� 0 ���֤��ޤ���

--- static int yylex(void)

yyparse ����ƤӽФ���륹�����롼����Ǥ���
���Υȡ�������ɤ߹��ߡ����Υ���ܥ���֤��ޤ���

--- static int yyparse(void)

�ѡ����򳫻Ϥ��ޤ���
���δؿ��� yacc ����ưŪ����������Τ� parse.y �ˤ�¸�ߤ��ޤ���
