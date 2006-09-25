�Ȥ߹��ߤ� [[c:Time]] ���饹���ĥ���ޤ���
������ɽ��ʸ�����ѡ������� [[c:Time]] ���֥������Ȥ��Ѵ������ꡢ
�դ� [[c:Time]] ���֥������Ȥ� RFC �ʤɤ�����줿ʸ�����
�Ѵ����뵡ǽ���󶡤��ޤ���

 * date-time �� [[c:RFC:2822]] ���������Ƥ��ޤ���
 * HTTP-date �� [[c:RFC:2616]] ���������Ƥ��ޤ���
 * dateTime �� XML Schema Part 2: Datatypes (ISO 8601) ���������Ƥ��ޤ���
 * ʸ���󤫤� [[c:Time]] ���֥������Ȥؤ��Ѵ��Ǥ� [[unknown:parsedate]] �ˤ���͡��ʷ����򰷤��ޤ���

= reopen Time

== Class Methods

--- parse(date, now=Time.now)
--- parse(date, now=Time.now) {|year| year}

date��[[m:parsedate#ParseDate.parsedate]] �ˤ�ä�
�ѡ�������[[c:Time]]���֥������Ȥ��Ѵ����ޤ���

�֥�å��դ��ǸƤФ줿��硢date��ǯ�ϥ֥�å��ˤ�ä��Ѵ�����ޤ���

//ex{
Time.parse(...) {|y| y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}
//}

Ϳ����줿����˾�̤����Ǥ��ʤ��ä������Ƥ�����硢now��
�������Ǥ��Ȥ��ޤ���
���̤����Ǥ��ʤ��ä������Ƥ�����硢�Ǿ���(1��0)���Ȥ��ޤ���

//ex{
#@# ���߻��郎 "Thu Nov 29 14:33:20 GMT 2001" ��
#@# �����ॾ����GMT�Ȥ����:
Time.parse("16:30")     #=> Thu Nov 29 16:30:00 GMT 2001
Time.parse("7/23")      #=> Mon Jul 23 00:00:00 GMT 2001
Time.parse("2002/1")    #=> Tue Jan 01 00:00:00 GMT 2002
//}

[[unknown:parsedate]]��date����������Ф��ʤ��Ȥ���
�ޤ��� [[c:Time]] ���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���
[[c:ArgumentError]] ��ȯ�����ޤ���

���Υ᥽�åɤ�¾�Υѡ����ѥ᥽�åɤΥե����륻���դȤ���
�ʲ��Τ褦�˻��ѤǤ��ޤ�:

//emlist{
Time.rfc2822(date) rescue Time.parse(date)
Time.httpdate(date) rescue Time.parse(date)
Time.xmlschema(date) rescue Time.parse(date)
//}

���ä� [[m:Time.parse]] �μ��Ԥϥ����å����٤��Ǥ���

--- rfc2822(date)
--- rfc822(date)

[[c:RFC:2822]]���������Ƥ���date-time�Ȥ���date��ѡ�������
[[c:Time]]���֥������Ȥ��Ѵ����ޤ���
���η�����[[c:RFC:822]]����������[[c:RFC:1123]]�ǹ������줿������
Ʊ���Ǥ���

date��[[c:RFC:2822]]�˽�򤷤Ƥ��ʤ����ޤ���
[[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���[[c:ArgumentError]]��
ȯ�����ޤ���

--- httpdate(date)

[[c:RFC:2616]]���������Ƥ���HTTP-date�Ȥ���date��ѡ�������
[[c:Time]]���֥������Ȥ��Ѵ����ޤ���

date��[[c:RFC:2616]]�˽�򤷤Ƥ��ʤ����ޤ���
[[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���[[c:ArgumentError]]��
ȯ�����ޤ���

--- xmlschema(date)
--- iso8601(date)

XML Schema ���������Ƥ��� dateTime �Ȥ���
date ��ѡ������� [[c:Time]] ���֥������Ȥ��Ѵ����ޤ���

date ��ISO 8601���������Ƥ�������˽�򤷤Ƥ��ʤ���
�ޤ��� [[c:Time]] ���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���
[[c:ArgumentError]] ��ȯ�����ޤ���

== Instance Methods

--- rfc2822
--- rfc822

[[c:RFC:2822]] ���������Ƥ��� date-time �Ȥ���ɽ�������
�ʲ��η�����ʸ������֤��ޤ�:

//emlist{
day-of-week, DD month-name CCYY hh:mm:ss zone
//}

������ zone �� [+-]hhmm �Ǥ���

self �� UTC time �ξ�硢zone �� +0000 �ˤʤ�ޤ���

--- httpdate

[[c:RFC:2616]]���������Ƥ���HTTP-date��rfc1123-date�Ȥ���
ɽ�������ʲ��η�����ʸ������֤��ޤ�:

//emlist{
day-of-week, DD month-name CCYY hh:mm:ss GMT
//}

���: ��̤Ϥ��Ĥ� UTC (GMT) �Ǥ���

--- xmlschema([fractional_seconds])
--- iso8601([fractional_seconds])

XML Schema ���������Ƥ��� dateTime �Ȥ���
ɽ�������ʲ��η�����ʸ������֤��ޤ�:

//emlist{
CCYY-MM-DDThh:mm:ssTZD
CCYY-MM-DDThh:mm:ss.sssTZD
//}

������ TZD �� Z �ޤ��� [+-]hh:mm �Ǥ���

If self is a UTC time, Z is used as TZD.
[+-]hh:mm is used otherwise.

fractional_seconds �Ͼ������ʲ����ä���ꤷ�ޤ���
fractional_seconds �Υǥե�����ͤ� 0 �Ǥ���
