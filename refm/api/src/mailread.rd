Unix mbox �����Υ᡼��ե��������Ϥ���饤�֥��Ǥ���

= class Mail < Object 

Unix mbox �����Υ᡼��ե��������Ϥ���饤�֥��Ǥ���

=== mailread �λȤ���

  require 'mailread'
  
  m = Mail.new('/var/mail/foo')
  puts 'From: ' + m['From'],
       'Subject: ' + m['Subject'],
       '--',
       m.body[0,5]

== Class Methods

--- new(f)

�᡼�����Ϥ��ޤ���
f �ˤϥե�����̾�� [[c:IO]] ���֥������Ȥ��Ϥ��ޤ���
���Υ᥽�åɤ�¹Ԥ��������ǥإå�����ʸ���ڤ�ʬ����졢
�إå��Υϥå���(�إå��ե������ñ��)����ʸ������(��ñ��)������ޤ���

1�ե�����ʣ���᡼��η���(Unix mbox ����)���б����Ƥ��ޤ�
(���ξ�� open �Ѥߤ� IO ���Ϥ�ɬ�פ����뤳�Ȥ����)��
�㤨�аʲ��Τ褦�ˤ��Ƴƥ᡼��� Subject ��ɽ���Ǥ��ޤ���

��:

  require 'mailread'
  require 'nkf'
  
  mailbox = File.open('/var/mail/foo')
  until (m = Mail.new(mailbox)).header.empty?
    puts NKF.nkf('-me', m['subject'])
  end

== Instance Methods

--- header

�إå��� [[c:Hash]] ���֤��ޤ���
������ 'From'��'Subject' �ʤɤΥե������̾�ǡ����٤ƤΥ�����
[[m:String#capitalize]] ����Ƥ��ޤ���

�ͤ������β��ԤϺ������ޤ���
ʣ���Ԥ�ʬ����Ƥ����硢�֤˲��Ԥ�Ϥ��ߤޤ�(��³�Ԥ�ɽ������Ϻ������ޤ�)��
MIME encoded-word �Υǥ����ɤʤɤ�Ԥ��������� [[lib:nkf]] �ʤɤ���Ѥ��Ƥ���������

--- body

��ʸ���ñ�̤� [[c:Array]] ���֤��ޤ���

--- [](field)

�إå��� field ���ͤ��֤��ޤ���
m.header[field.capitalize] ��Ʊ���Ǥ��Τ��ͼ����κݤϡ�
�ե������̾�Υ���ե��٥åȤ��羮�򵤤ˤ���ɬ�פϤ���ޤ���
