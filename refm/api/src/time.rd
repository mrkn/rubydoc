�Ȥ߹��ߤ� [[c:Time]] ���饹���ĥ���ޤ���
������ɽ��ʸ�����ѡ������� [[c:Time]] ���֥������Ȥ��Ѵ������ꡢ
�դ� [[c:Time]] ���֥������Ȥ� RFC �ʤɤ�����줿ʸ�����
�Ѵ����뵡ǽ���󶡤��ޤ���

 * date-time �� [[RFC:2822]] ���������Ƥ��ޤ���
 * HTTP-date �� [[RFC:2616]] ���������Ƥ��ޤ���
 * dateTime �� XML Schema Part 2: Datatypes (ISO 8601) ���������Ƥ��ޤ���
 * ʸ���󤫤� [[c:Time]] ���֥������Ȥؤ��Ѵ��Ǥ� [[lib:parsedate]] �ˤ���͡��ʷ����򰷤��ޤ���

= reopen Time

== Class Methods

--- parse(date, now = Time.now) -> Time
--- parse(date, now = Time.now) {|year| year } -> Time

#@since 1.9.1
date �� [[m:Date.#_parse]] �ˤ�ä�
�ѡ������� [[c:Time]]���֥������Ȥ��Ѵ����ޤ���
#@else
date �� [[m:ParseDate.#parsedate]] �ˤ�ä�
�ѡ������� [[c:Time]]���֥������Ȥ��Ѵ����ޤ���
#@end

�֥�å��դ��ǸƤФ줿��硢date��ǯ�ϥ֥�å��ˤ�ä��Ѵ�����ޤ���

  Time.parse(...) {|y| y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}

Ϳ����줿����˾�̤����Ǥ��ʤ��ä������Ƥ�����硢now��
�������Ǥ��Ȥ��ޤ���
���̤����Ǥ��ʤ��ä������Ƥ�����硢�Ǿ���(1��0)���Ȥ��ޤ���

@param date [[c:Time]] ���֥������Ȥ��Ѵ���ǽ��ʸ�������ꤷ�ޤ���
@param now  ���߻����[[c:Time]] ���֥������Ȥǻ��ꤷ�ޤ���
            �ǥե���Ȥ�[[m:Time.now]]�Ȥʤ�ޤ���

  # ���߻��郎 "Thu Nov 29 14:33:20 GMT 2001" ��
  # �����ॾ����GMT�Ȥ����:
  Time.parse("16:30")     #=> Thu Nov 29 16:30:00 GMT 2001
  Time.parse("7/23")      #=> Mon Jul 23 00:00:00 GMT 2001
  Time.parse("2002/1")    #=> Tue Jan 01 00:00:00 GMT 2002

#@since 1.9.1
[[m:Date._parse]]��date����������Ф��ʤ��Ȥ���
#@else
[[lib:parsedate]]��date����������Ф��ʤ��Ȥ���
#@end
�ޤ��� [[c:Time]] ���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���
[[c:ArgumentError]] ��ȯ�����ޤ���

���Υ᥽�åɤ�¾�Υѡ����ѥ᥽�åɤΥե����륻���դȤ���
�ʲ��Τ褦�˻��ѤǤ��ޤ�:

  Time.rfc2822(date) rescue Time.parse(date)
  Time.httpdate(date) rescue Time.parse(date)
  Time.xmlschema(date) rescue Time.parse(date)

���ä� [[m:Time.parse]] �μ��Ԥϥ����å����٤��Ǥ���

--- rfc2822(date) -> Time
--- rfc822(date) -> Time

[[RFC:2822]]���������Ƥ���date-time�Ȥ���date��ѡ�������
[[c:Time]]���֥������Ȥ��Ѵ����ޤ���
���η�����[[RFC:822]]����������[[RFC:1123]]�ǹ������줿������
Ʊ���Ǥ���

date��[[RFC:2822]]�˽�򤷤Ƥ��ʤ����ޤ���
[[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���[[c:ArgumentError]]��
ȯ�����ޤ���

@param date [[RFC:2822]] ����������date-time �Ȥ���ʸ�������ꤷ�ޤ���

@raise ArgumentError date��[[RFC:2822]]�˽�򤷤Ƥ��ʤ����ޤ��� 
                     [[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���
                     ȯ�����ޤ���

������
  require 'time'

  rfc2822_time = 'Sun, 31 Aug 2008 12:08:19 +0900'
  t = Time.rfc2822(rfc2822_time)
  p t.kind_of?(Time) #=> true
  non_rfc2822_time = 'Sun 31 Aug 2008 12:08:19 +0900'

  begin
    p Time.rfc2822(non_rfc2822_time)
  rescue ArgumentError => err
    puts "format err: #{err}"
  end

--- httpdate(date) -> Time

[[RFC:2616]]���������Ƥ���HTTP-date�Ȥ���date��ѡ�������
[[c:Time]]���֥������Ȥ��Ѵ����ޤ���

date��[[RFC:2616]]�˽�򤷤Ƥ��ʤ����ޤ���
[[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���[[c:ArgumentError]]��
ȯ�����ޤ���

@param date [[RFC:2616]]���������Ƥ���HTTP-date�Ȥ��ƥѡ��������ʸ�������ꤷ�ޤ���

@raise ArgumentError date��[[RFC:2616]]�˽�򤷤Ƥ��ʤ����ޤ��� [[c:Time]]���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���ȯ�����ޤ���

  require 'time'
  rfc2616_time = 'Sun, 31 Aug 2008 12:34:56 GMT'

  t = Time.httpdate(rfc2616_time)
  p t.kind_of?(Time) #=> true

  non_rfc2616_time = 'San, 31 Aug 2008 12:34:56 GMT'
  begin
    Time.httpdate(non_rfc2616_time)
  rescue ArgumentError => err
    puts err #=>  not RFC 2616 compliant date: "San, 31 Aug 2008 12:34:56 GMT"
  end


--- xmlschema(date) -> Time
--- iso8601(date) -> Time

XML Schema ���������Ƥ��� dateTime �Ȥ���
date ��ѡ������� [[c:Time]] ���֥������Ȥ��Ѵ����ޤ���

date ��ISO 8601���������Ƥ�������˽�򤷤Ƥ��ʤ���
�ޤ��� [[c:Time]] ���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ���
[[c:ArgumentError]] ��ȯ�����ޤ���

@param date XML Schema ���������Ƥ��� dateTime �Ȥ���
            �ѡ��������ʸ�������ꤷ�ޤ���

@raise ArgumentError date ��ISO 8601���������Ƥ�������˽�򤷤Ƥ��ʤ���
                     �ޤ��� [[c:Time]] ���饹�����ꤵ�줿������ɽ���Ǥ��ʤ��Ȥ�
                     ��ȯ�����ޤ���
������
  require 'time'

  iso8601_time = '2008-08-31T12:34:56+09:00'
  t = Time.iso8601(iso8601_time)
  p t #=> Sun Aug 31 03:34:56 UTC 2008
  p t.kind_of?(Time) #=> true

  begin
    non_iso8601_time = '2008-08-31A12:34:56+09:00'
    Time.iso8601(non_iso8601_time)
  rescue ArgumentError => err
    puts err #=> invalid date: "2008-08-31A12:34:56+09:00"
  end

== Instance Methods

--- rfc2822 -> String
--- rfc822 -> String

[[RFC:2822]] ���������Ƥ��� date-time �Ȥ���ɽ�������
�ʲ��η�����ʸ������֤��ޤ�:

 day-of-week, DD month-name CCYY hh:mm:ss zone

������ zone �� [+-]hhmm �Ǥ���

self �� UTC time �ξ�硢zone �� +0000 �ˤʤ�ޤ���

������
  require 'time'

  iso8601_time = '2008-08-31T12:34:56+09:00'
  t = Time.iso8601(iso8601_time)
  p t.rfc2822      #=> "Sun, 31 Aug 2008 03:34:56 -0000"

--- httpdate -> String

[[RFC:2616]]���������Ƥ���HTTP-date��rfc1123-date�Ȥ���
ɽ�������ʲ��η�����ʸ������֤��ޤ�:

  day-of-week, DD month-name CCYY hh:mm:ss GMT

���: ��̤Ϥ��Ĥ� UTC (GMT) �Ǥ���

������
  require 'time'

  iso8601_time = '2008-08-31T12:34:56+09:00'
  t = Time.iso8601(iso8601_time)
  p t.httpdate     #=> "Sun, 31 Aug 2008 03:34:56 GMT"


--- xmlschema(fractional_seconds = 0) -> String
--- iso8601(fractional_seconds = 0) -> String

XML Schema ���������Ƥ��� dateTime �Ȥ���
ɽ�������ʲ��η�����ʸ������֤��ޤ�:

  CCYY-MM-DDThh:mm:ssTZD
  CCYY-MM-DDThh:mm:ss.sssTZD

������ TZD �� Z �ޤ��� [+-]hh:mm �Ǥ���

If self is a UTC time, Z is used as TZD.
[+-]hh:mm is used otherwise.

fractional_seconds �Ͼ������ʲ����ä���ꤷ�ޤ���
fractional_seconds �Υǥե�����ͤ� 0 �Ǥ���

@param fractional_seconds �������ʲ����äη���������ǻ��ꤷ�ޤ���
                          ��ά��������0 �Ȥʤ�ޤ���

������
  require 'time'

  iso8601_time = '2008-08-31T12:34:56+09:00'
  t = Time.iso8601(iso8601_time)
  p t.xmlschema    #=> "2008-08-31T03:34:56Z"
  p t.xmlschema(9) #=> "2008-08-31T03:34:56.000000000Z"

