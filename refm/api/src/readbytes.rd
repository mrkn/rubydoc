[[m:IO#readbytes]] ���󶡤���饤�֥��Ǥ���

= reopen IO
== Instance Methods

--- readbytes(size) -> String
[[m:IO#read]] ��Ʊ�ͤ� size �Х����ɤ߹��ߤޤ�����
EOF����ã���������㳰 [[c:EOFError]] ��ȯ�������ޤ���

@param size �ɤ߹���Ĺ���������ǻ��ꤷ�ޤ���nil ����ꤷ������ EOF �ޤ��ɤ߹��ߤޤ���

@param EOFError EOF ����ã��������ȯ�����ޤ���

@param TruncatedDataError size �Х���̤�������ɤ߹���ʤ��ä�����ȯ�����ޤ���

= class TruncatedDataError < IOError

[[m:IO#readbytes]] ��ȯ���������㳰�Ǥ���

== Instance Methods

--- data -> String

�㳰��ȯ������ޤǤ��ɤ߹�����ǡ�����ʸ������֤��ޤ���
