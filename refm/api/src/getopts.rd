#@since 1.8.2
���Υ饤�֥��� obsolete �Ǥ���
[[lib:optparse]] ��ȤäƤ���������
#@end

���ץ�������Ϥ��뤿��Υ饤�֥��Ǥ���
$OPT_xxx ���ͤ����ꤷ�ޤ���

ŵ��Ū�ʻȤ����ϰʲ��Τ褦�ˤʤ�ޤ���

  require 'getopts'
  
  unless getopts('vh', 'version', 'help')
    abort "usage: #$0 [-vh] [--version] [--help] file"
  end
  
  if $OPT_v or $OPT_version
    puts VERSION_STRING
    exit
  end
  
  # ARGV ���饪�ץ����ϼ�������롣
  
  while line = ARGF.gets
    # ...
  end

#@#Author: <jammy@shljapan.co.jp>

= reopen Kernel

== Private Instance Methods

--- getopts(single_opts, *long_opts)    -> Integer | nil

#@since 1.8.2
���Υ᥽�åɤ� obsolete �Ǥ���
[[lib:optparse]] �饤�֥����󶡤���Ƥ���
ARGV.getopts ��ȤäƤ���������[[m:Kernel::ARGV]], [[m:OptionParser::Arguable#getopts]] �򻲾ȡ�
#@end

���ꤵ�줿 short_opt �� long_opt �˱����� ARGV ����Ϥ���
��̤򤽤줾��Υ����Х��ѿ��˥��åȤ��ޤ���

�ºݤ˥��åȤ��줿���ץ����ο����֤��ޤ���
�ޤ����ְ�ä����ץ�������ꤷ�����ϡ�nil ���֤��ޤ���

���ץ�������:

���Ϸ�̤����� "$OPT_���ꤷ������̾" �Ȥ������ǽ�������ޤ���

  * ���󥰥륪�ץ����������ȼ��ʤ����ץ���󤬻��Ѥ��줿���ϡ�
    `true' �����åȤ���ޤ���
//emlist{
      -f        �� $OPT_f = true  
      --version �� $OPT_version = true
//}
  * ����¾�Ϥ��Υ��ץ����ΰ��������åȤ���ޤ���
//emlist{
    -d pengo:0.0     �� $OPT_d = pengo:0.0 
    --geometry 80x25 �� $OPT_geometry = 80x25
//}
  * - �⤷���� -- ����ꤷ����硢����ʹߤβ��Ϥ�Ԥʤ��ޤ���

@param single_opts -f �� -x ���ͤʰ�ʸ���Υ��ץ����λ���򤷤ޤ������ץ���
                   �� -f �� -x ��2�Ĥξ��� "fx" ���ͤ˻��ꤷ�ޤ��������ǥ��ץ�
                   ��󤬤ʤ��Ȥ���ɬ�� nil ����ꤷ�Ʋ�������

@param long_opts  ��󥰥͡���Υ��ץ����䡢������ȼ�����ץ�����ʸ����ǻ���򤷤ޤ���
                  --version �� --geometry 300x400��-d host:0.0 ��������˳�����
                  �ޤ���������ȼ������� ":" ��ɬ���դ����ͤˤ��ޤ���������ξ�硢
                  "version"��"geometry:"��"d:" ���ͤˤʤ�ޤ��� �ޤ������ץ�����
                  ���ꤷ�ʤ��ä����Υǥե���Ȥ��ͤ�������������ϡ�":" ��ľ���
                  ���Υǥե�����ͤ���ꤷ�ޤ����㤨�С�"geometry:80x25" ���ͤˤʤ�
                  �ޤ���
