���ޥ�ɥ饤��Υ��ץ������갷������Υ饤�֥��Ǥ���

#@include(optparse/optparse-tut)
#@include(optparse/Arguable)
#@include(optparse/OptionParser)

= class OptionParser::ParseError < StandardError

OptionParser ���㳰���饹�δ��쥯�饹�Ǥ���

= class OptionParser::AmbiguousOption < OptionParser::ParseError

�䴰��ۣ��ˤ����Ǥ��ʤ����ץ���󤬤��ä������ꤲ���ޤ���

= class OptionParser::NeedlessArgument < OptionParser::ParseError

��������ʤ��Ϥ��Υ��ץ����˰�����Ϳ����줿�����ꤲ���ޤ���

= class OptionParser::MissingArgument < OptionParser::ParseError

������ɬ�פʥ��ץ����˰�����Ϳ�����ʤ��ä������ꤲ���ޤ���

= class OptionParser::InvalidOption < OptionParser::ParseError

�������Ƥ��ʤ����ץ����Ϳ����줿�����ꤲ���ޤ���

= class OptionParser::InvalidArgument < OptionParser::ParseError

���ץ����ΰ��������ꤵ�줿�ѥ�����˥ޥå����ʤ������ꤲ���ޤ���

= class OptionParser::AmbiguousArgument < OptionParser::ParseError

���ץ����ΰ�����ۣ��ˤ����䴰�Ǥ��ʤ������ꤲ���ޤ���

= redefine Kernel
== Constants
--- ARGV
#@todo
optparse �� require ���뤳�Ȥˤ�ꡢARGV �� 
[[c:OptionParser::Arguable]] �� extend ���ޤ���
