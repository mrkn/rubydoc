#@# = monitor

����åɤ�Ʊ�������Ȥ��ƤΥ�˥�����ǽ���󶡤��륯�饹�Ǥ���
�ޤ�Ʊ������åɤ��鲿�٤� lock �Ǥ��� Mutex �Ȥ��Ƥε�ǽ���󶡤��ޤ���

=== ����

  *[[unknown:ruby-list:6829]]
  *[[unknown:ruby-list:30447]]
    *[[unknown:ruby-list:30449]]

monitor �ϰʲ��Τ褦�� [[c:Mutex]] �Ȥ��Ƥε�ǽ���󶡤��ޤ���

  * lock �λ����礬����åɤǤ��� Mutex / ���٤� lock �Ǥ��� Mutex
    * lock ��������åɤ� Mutex ¦���Ф��Ƥ���
    * ���Υ���åɤ��⤦���� lock ���褦�Ȥ��Ƥ�֥�å����ʤ�
    * synchronize �� lock ���Ƥ��ʤ��ä����̾�ɤ��ꡢ
      ��ʬ�� lock ���Ƥ����� ���� yield ������� (lock/unlock�⤷�ʤ�)
    * unlock �Ϥ��Υ���åɤ������Ǥ���

[[unknown:ruby-list:30447]] ��ꡣ

#@include(monitor/Monitor)
#@include(monitor/MonitorMixin)
#@include(monitor/ConditionVariable)
