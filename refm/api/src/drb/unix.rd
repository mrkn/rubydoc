DRb �Υץ�ȥ���Ȥ��� UNIX �ɥᥤ�󥽥��åȷ�ͳ���̿����� drbunix ���Ȥ���褦�ˤʤ�ޤ���

 require 'drb/unix'
 obj = ''
 DRb::DRbServer.new('drbunix:/tmp/hoge', obj)
