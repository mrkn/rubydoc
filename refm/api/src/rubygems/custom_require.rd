require rubygems

[[m:Kernel#require]] ���������뤿��Υ饤�֥��Ǥ���

Ruby1.9 �����ǻ��Ѥ��Ƥ��ޤ���

= reopen Kernel

== Private Instance Methods

--- require(path) -> bool

RubyGems �� require ����ȡ�[[m:Kernel#require]] �� Gem ��
�׵ᤵ�줿�Ȥ��˥��ɤ���褦���֤������ޤ���

��������줿 [[m:Kernel#require]] ��ƤӽФ��Ȱʲ��λ���Ԥ��ޤ���
Ruby �Υ��ɥѥ���¸�ߤ���饤�֥�����ꤷ�����Ϥ��Τޤޥ��ɤ��ޤ���
�����ǤϤʤ������󥹥ȡ��뤵�줿 Gem �ե�������椫�鸫�Ĥ��ä����ϡ�
���� Gem ����ɥѥ�����Ͽ���ޤ���

@param path ���ɤ������饤�֥���̾������ꤷ�ޤ���

@return ���˥��ɤ���Ƥ���饤�֥�����٥��ɤ��褦�Ȥ������� false ���֤��ޤ���
        �����Ǥʤ����� true ���֤��ޤ���

