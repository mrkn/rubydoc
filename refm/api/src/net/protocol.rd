�ͥåȥ���饤�֥�궦�̤��㳰���饹��
������Ƥ��ޤ������Υ饤�֥���������줿�㳰��
ľ�ܤ����Ѥ���ޤ��󡣼ºݤ�ȯ�������㳰��
������Ѿ�������ΤǤ���

[[lib:net/http]] �� [[lib:pop]] �ʤɤǤ��Υ饤�֥���
������줿�㳰���饹��Ѿ������㳰���饹��
���Ѥ��Ƥ��ޤ���

= class ProtocolError < StandardError
�ͥåȥ���ץ�ȥ����Υ��顼������������
ȯ�������㳰�Ǥ���

= class ProtoSyntaxError < Net::ProtocolError
�ץ�ȥ�����ʸˡ���������ʤ�����ȯ������
�㳰�Ǥ���

Ruby�θ��ߤ�ɸ��ź�ե饤�֥����ǤϻȤ��Ƥ��ޤ���

= class ProtoFatalError < Net::ProtocolError
�����ФؤΥꥯ�����Ȥ��ְ�äƤ���ʤɡ���̿Ū���顼��
����ȯ�����륨�顼�Ǥ���

= class ProtoUnknownError < Net::ProtocolError
�����Ф���Υ쥹�ݥ󥹤����Ǥ��ʤ��ʤɡ������Υ��顼��
�Ф�

= class ProtoServerError < Net::ProtocolError
�����С�¦������ˤ���׵᤬ã���Ǥ��ʤ�����
ȯ�������㳰�Ǥ���

= class ProtoAuthError < Net::ProtocolError
ǧ�ڤ����꤬���ä�����ȯ�������㳰�Ǥ���

= class ProtoCommandError < Net::ProtocolError
Ruby�θ��ߤ�ɸ��ź�ե饤�֥����ǤϻȤ��Ƥ��ޤ���

= class ProtoRetriableError < Net::ProtocolError
alias Net::ProtocRetryError
�ʤ�餫�κƻ�Ԥ򤹤뤳�Ȥǡ������η�³����ǽ�Ǥ���褦��
���顼��ȯ����������ȯ�������㳰�Ǥ���
