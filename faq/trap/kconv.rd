= trap::Kconv
* ������NKF����Ѥ��Ƥ��ޤ���((<trap::NKF>))�⻲�Ȥ��Ƥ���������

MIME ��ǥ����ɤ��ޤ���

  $ ruby -rkconv -e 'p Kconv.tosjis("=?ISO-2022-JP?B?Zm9v?=")' 
  "foo"

����ư�˾�ޤ����ʤ����ϡ��ʲ��Τ褦�� NKF.nkf ��ľ�ܻȤäƲ�������

  $ ruby -rkconv -e 'p NKF.nkf("-s -m0", "=?ISO-2022-JP?B?Zm9v?=")'
  "=?ISO-2022-JP?B?Zm9v?="
