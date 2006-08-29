
: static int delete_never(char *key, char *value, char *never) 
    st_cleanup_safe() �Υ��ƥ졼���֥�å���

: static int new_size(int size) 
    ɬ�פʥ����� size ���顢��Ŭ�ʥϥå��奨��ȥ��
    ���������֤���

: static int numcmp(long x, long y) 
    int�Ѥ���Ӵؿ���

: static int numhash(long n)
    int�ѤΥϥå���ؿ���
    n ���Ф���ϥå����ͤ�׻����롣

: static void rehash(register st_table *table) 
    �ơ��֥�������Ǥ��Ф��ϥå����ͤ�׻����ʤ�����
    �ơ��֥��ƹ������롣����ȥ���Ф������Ǥο���
    �����������ơ��֥뤬�����ʤäƤ����Ȥ���ȯ�����롣

: void st_add_direct(st_table *table, char *key, char *value) 
    st_insert() �Ȼ��Ƥ��뤬��Ʊ���ϥå����ͤ���ĥ���ȥ꡼���Ф���
    ��Ʊ�͸����פ��ά���롣key ���ޤ���Ͽ����Ƥ��ʤ����Ȥ��Ϥä���
    ���Ƥ�����ˤϡ�������®����Ͽ�Ǥ��롣

: void st_cleanup_safe(st_table *table, char *never) 
    never ��Ʊ���ͤ���ĥ���ȥ꡼�������롣

: st_table *st_copy(st_table *old_table) 
    Hash#dup �μ��Ρ�
    old_table ��Ʊ�����Ƥ� st_table �򿷤��˺��������֤���

: int st_delete(register st_table *table, register char **key, char **value) 
    *key ���б������ͤ�ơ��֥뤫��������*key��*value ����Ͽ���Υ�����
    �ͤ�񤭤��ࡣ�֤��ͤϺ���������ɤ�����

: int st_delete_safe(register st_table *table, register char **key, char **value, char *never) 
    st_delete() �Ȼ��Ƥ��뤬�����ξ�Ǥ����˺������ΤǤϤʤ� never ��
    �񤭤���Ǥ�����st_cleanup_safe() �������˺���Ǥ��롣
    Ruby �Ǥ� never �ˤ� Qundef ��Ȥ���

: void st_foreach(st_table *table, enum st_retval (*func)(), char *arg)
    Hash#each,delete_if �ʤɤμ��Ρ��ϥå���������ƤΥ������͡�arg ��
    �����ˤ��ơ�func ��¹Ԥ��롣func ���֤��� enum st_retval �� ST_CONTINUE
    ST_STOP ST_DELETE �Τɤ줫���ɤ�⸫����ɤ����Ư���򤹤롣

: void st_free_table(st_table *table) 
    table ��������롣�������ͤϲ�������ʤ���

: st_table *st_init_numtable(void)
    ������ int ���Ǥ���ϥå���ơ��֥��������롣

: st_table *st_init_numtable_with_size(int size) 
    ������ int ���Ǥ���ϥå���ơ��֥��������롣
    st_init_table() �� int �Ѥ����ؿ����Ϥ��Ƥ��������

: st_table *st_init_strtable(void)
    ������ char* ���Ǥ���ϥå���ơ��֥��������롣

: st_table *st_init_strtable_with_size(int size) 
    ������ char* ���Ǥ���ϥå���ơ��֥��������롣
    st_init_table() ��ʸ�����Ѥ����ؿ����Ϥ��Ƥ��������

: st_table *st_init_table(struct st_hash_type *type)

: st_table *st_init_table_with_size(struct st_hash_type *type, int size) 
    st_table ��������롣_with_size �ϥ���������ꤷ���������롣
    struct st_hash_type �ϥϥå����ͤ�����ؿ��ȡ�Ʊ��Ƚ���Ԥ�
    �ؿ�����ġ�

: int st_insert(register st_table *table, register char *key, char *value) 
    �ϥå���� key �� value ���Ȥ��ɲä��롣
    �Ť��饤�֥��ʤΤ� void* �Τ����� char* ��ȤäƤ��롣

: int st_lookup(st_table *table, register char *key, char **value) 
    key ���б������ͤ�ߤĤ��� value �˥ݥ��󥿤�񤭤��ࡣ
    �֤��ͤϸ��Ĥ��ä����ɤ����ο����͡�

    Ǥ�դη��ݥ��󥿤�void*�Ǥʤ�char*��ȤäƤ���Τ�
    �Ť��饤�֥����������ANSI C������void*�ΰ�̣��
    char*��ȤäƤ�����

: static void stat_col(void) 
    �ϥå���ξ��ͤ˴ؤ������פ� /tmp/col �˽��Ϥ��롣
    #ifdef HASH_LOG �ΤȤ������������롢��ȯ���Ѵؿ���

: static int strhash(register char *string) 
    ʸ�����ѤΥϥå���ؿ���
    string ���Ф���ϥå����ͤ�׻����롣
