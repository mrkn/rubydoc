[[lib:shell]] �ǻ��Ѥ����㳰����������饤�֥��Ǥ���

= module Shell::Error
extend Exception2MessageMapper

[[lib:shell]] �ǻ��Ѥ����㳰�Τ����̾�����֤Ǥ���

= class Shell::Error::CantApplyMethod < StandardError

�᥽�åɤ�Ŭ�ѤǤ��ʤ��Ȥ���ȯ�������㳰�Ǥ���

= class Shell::Error::CantDefine < StandardError

���ޥ�ɤ��������ʤ��Ȥ���ȯ�������㳰�Ǥ���

= class Shell::Error::CommandNotFound < StandardError

���ޥ�ɤ����Ĥ���ʤ��Ȥ���ȯ�������㳰�Ǥ���

= class Shell::Error::DirStackEmpty < StandardError

���Υǥ��쥯�ȥꥹ���å��������Ǥ���Ф����Ȥ����Ȥ���ȯ�������㳰�Ǥ���
