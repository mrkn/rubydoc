= module Comparable

��ӱ黻��������饹�Τ���� Mix-in�����Υ⥸�塼��򥤥󥯥롼
�ɤ��륯�饹�ϡ�����Ū����ӱ黻�ҤǤ��� <=> �黻�Ҥ�������Ƥ�
��ɬ�פ�����ޤ���¾����ӱ黻�ҤϤ�����������Ѥ��������Ǥ��ޤ���

== Instance Methods

--- ==(other)

self �� other ���������������֤��ޤ���

#@since 1.8.0
<=> �� nil ���֤����Ȥ� nil ���֤��ޤ���
#@end

--- >(other)

self �� other ����礭���������֤��ޤ���

#@since 1.8.0
<=> �� nil ���֤����Ȥ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���
#@end

--- >=(other)

self �� other ����礭�����������������֤��ޤ���

#@since 1.8.0
<=> �� nil ���֤����Ȥ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���
#@end

--- <(other)

self �� other ��꾮�����������֤��ޤ���

#@since 1.8.0
<=> �� nil ���֤����Ȥ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���
#@end

--- <=(other)

self �� other ��꾮�������������������֤��ޤ���

#@since 1.8.0
<=> �� nil ���֤����Ȥ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���
#@end

--- between?(min, max)

self �� min �� max ���ϰ���(min, max
��ޤߤޤ�)�ˤ���������֤��ޤ���

#@since 1.8.0
self <=> min ����self <=> max �� nil ����
�����Ȥ��㳰 [[c:ArgumentError]] ��ȯ�����ޤ���
#@end
