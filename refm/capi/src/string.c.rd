--- VALUE rb_str_new(const char *ptr, long len)

ptr ���� len �Х���ʬ�򥳥ԡ�����
Ruby ��ʸ�����������֤��ޤ���

  rb_str_new(0,0)

�Ǥ϶�ʸ��������������֤��ޤ���

--- VALUE rb_str_new2(const char *ptr)

rb_str_new(ptr, strlen(ptr))

--- VALUE rb_str_new4(VALUE orig)

ʸ���� orig ���ѹ��Բ�ǽ��ʣ����������֤��ޤ���

--- VALUE rb_str_dup(VALUE str)

ʸ���� str ��ʣ����������֤��ޤ���

--- VALUE rb_str_substr(VALUE str, long beg, long len)
str[beg, len]

--- VALUE rb_str_cat(VALUE str, const char *ptr, long len)

ʸ���� str �ˡ�Ĺ�� len (NUL �ޤޤ�)�� C ��ʸ����
ptr ���˲�Ū��Ϣ�뤷�ޤ���

--- VALUE rb_str_cat2(VALUE str, const char *ptr)

ʸ���� str �� C ��ʸ���� ptr ���˲�Ū��
Ϣ�뤷�ޤ���ptr �ϥ̥뽪ü���ꤷ�Ƥ��ޤ���

--- VALUE rb_str_concat(VALUE s1, VALUE s2)

equivalent to "s1.concat s2"
