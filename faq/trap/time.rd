= Time
== �����ॾ����

ruby�����Ϥ��륿���ॾ����ʸ�����OS�μ����˰�¸���Ƥ��ޤ����ʲ��Τ褦
��ʸ������֤�OS��������ޤ���
((-Windows�ǴĶ��ѿ�TZ�����ꤷ�Ƥ��ʤ��Ȥ��ˤ��Τ褦�ˤʤ뤳�Ȥ�����褦�Ǥ���-))

  $ ruby -e 'p Time.now'
  Mon Sep 04 17:32:11 ��� (ɸ���) 2000

�ޤ��������ȤΥ����ॾ������֤�������¿����Time.gmtime �ʤɤ�
���Ϥ��ڤФʤ���礬����ޤ���

  puts Time.now.gmtime.strftime("%H:%M %Z") #-> 06:09 GMT+9:00

OS�ˤ�餺ruby���Ȥ�"UTC"����Ϥ�����⤢��ΤǤ����ʣ���Ǥ���
((- ((<version 1.7|ruby 1.7 feature>))�Ǥ� ((<Time#zone|Time>)) ��"UTC"
���֤��ޤ�-))

  $ ruby -e 'p Time.now.gmtime.zone'
  "GMT"
  $ ruby -e 'p Time.now.gmtime'
  Tue Jan 16 17:09:22 UTC 2001

����������αƶ��������᥽�åɤˤϰʲ��Τ�Τ�����ޤ���
  * Time#strftime
  * Time#zone
  * Time#to_s
  * Time#inspect
  * Time#to_a
