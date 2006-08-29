
: VALUE rb_ary_new()
    ���� Ruby �������������֤��ޤ���

    �б�����Ruby������

      ary = Array.new �ޤ���
      ary = []

    ������

      VALUE ary;
      ary = rb_ary_new();

: VALUE rb_ary_new2(long len)
    Ĺ�� ((|len|)) ʬ�����������ݤ�����
    Ĺ������� Ruby �������������֤��ޤ���

    �б�����Ruby������

      ary = Array.new(len)

    ������

      VALUE ary;
      long len;
      ...
      ary = rb_ary_new2(len);

: VALUE rb_ary_new3(long n, VALUE i0, i1, i2...)
    Ĺ�� ((|n|)) �����Ǥ� ((|i0|)) ((|i1|)) ((|i2|)) �Ĥ��Ǽ����
    Ruby �������������֤��ޤ���

    �б�����Ruby������

      ary = Array[i0, i1, i2...] �ޤ���
      ary = [i0, i1, i2...]

    ������

      VALUE ary;
      int i[3] = { 1, 2, 3 };
      ary = rb_ary_new3(3, INT2FIX(i[0]), INT2FIX(i[1]), INT2FIX(i[2]));

: VALUE rb_assoc_new(VALUE a, VALUE b)
    (({[((|a|)),((|b|))]})) ���֤��ޤ���

    �б�����Ruby������

      [a, b]

    ������

      VALUE assoc_string(VALUE str_a, VALUE str_b)
      {
        Check_Type(str_a, T_STRING);
        Check_Type(str_b, T_STRING);
        return rb_assoc_new(str_a, str_b);
      }

: VALUE rb_ary_entry(VALUE ary, long offset)
    ((|ary|)) �Υ���ǥå��� ((|offset|)) �����Ǥ��֤��ޤ���

    ����ǥå������ϰϤ�ۤ���Ȥ��� (({Qnil})) ���֤��ޤ���
    ��Υ���ǥå�����Ȥ��ޤ���

    �б�����Ruby������

      ary[offset] �ޤ���
      ary.at(offset)

    ������

      VALUE num;
      num = rb_ary_entry(ary, offset); 
      printf("%d\n", FIX2INT(num));

      ���㥹�Ȥ�Ȥä����Ǥλ�����ˡ
      
      VALUE num = RARRAY(ary)->ptr[offset];

: VALUE rb_ary_aref(int argc, VALUE *argv, VALUE ary)
    ((|argc|)) �� 1 �ΤȤ��� (({ary[*argv]}))��
    2 �ΤȤ��� (({ary[argv[0], argv[1]]})) ���֤��ޤ���

: void rb_ary_store(VALUE ary, long idx, VALUE val)
    ���� ((|ary|)) �Υ���ǥå��� ((|idx|)) ��
    ((|val|)) ���Ǽ���ޤ���((|idx|)) ���ϰϤ�ۤ���Ȥ���
    Ruby ��٥��Ʊ������ưŪ�˥���������ĥ����ޤ���

    �б�����Ruby������

      ary[idx] = val

    ������

      VALUE ary;
      int idx;
      int n[5] = { 1, 2, 3, 4, 5 };
      ary = rb_ary_new();
      for (idx=0; idx<5; idx++) rb_ary_store(ary, idx, INT2FIX(n[idx])); 

: VALUE rb_ary_push(VALUE ary, VALUE item)
    ���� ((|ary|)) �������� ((|item|)) ���ɲä��ޤ���

    �б�����Ruby������

      ary.push(item) �ޤ���
      ary << item

    ������

      VALUE ary = rb_ary_new();
      char line[4096];
      while ((gets(line)) != NULL){
        item = process_apache_log(line);
        rb_ary_push(ary, item);
      }

: VALUE rb_ary_pop(VALUE ary)
    ���� ((|ary|)) �����������Ǥ�Ȥ�Τ����֤��ޤ���
    ������ΤȤ��� (({Qnil})) ���֤��ޤ���

    �б�����Ruby������

      val = ary.pop

    ������

      last_error = rb_ary_pop(err_ary);
      VALUE str = rb_funcall(last_error, rb_intern("to_s"), 0);

: VALUE rb_ary_shift(VALUE ary)
    ���� ((|ary|)) ����Ƭ�����Ǥ�������֤��ޤ���
    ������ΤȤ��� (({Qnil})) ���֤��ޤ���

    �б�����Ruby������

      val = ary.shift

: VALUE rb_ary_unshift(VALUE ary, VALUE item)
    ���� ((|ary|)) ����Ƭ�� ((|item|)) ���������ޤ���

: VALUE rb_ary_to_s(VALUE ary)
    (({ary.to_s}))

    ������

      void debug_print(VALUE ary)
      {
        Check_Type(ary, T_ARRAY);
        printf("%s", STR2CSTR(rb_ary_to_s(ary)));
      }

: VALUE rb_ary_sort(VALUE ary)
    (({ary.sort}))

: VALUE rb_ary_includes(ary, item)
    (({ary.include? item}))

: VALUE rb_ary_delete(VALUE ary, VALUE item)
    (({ary.delete}))

: VALUE rb_ary_clear(VALUE ary)
    (({ary.clear}))

: VALUE rb_ary_concat(VALUE ary, VALUE x)
    (({ary.concat x}))

