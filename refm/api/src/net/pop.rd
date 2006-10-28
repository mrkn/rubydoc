�᡼���������뤿��Υץ�ȥ���
POP3 (Post Office Protocol version 3) �򰷤��饤�֥��Ǥ���
POP3 �μ����� [[RFC:1939]] �˴𤤤Ƥ��ޤ���

=== ������

==== �᡼��μ���

�ʲ��Υ����ɤϡ��᡼���������ƥե����� 'inbox/1' 'inbox/2'... ��
�񤭤��ߡ������о夫��᡼���ä��ޤ���pop3.server.address ��Ŭ��
�ɤߤ����Ƥ���������

  require 'net/pop'
  
  pop = Net::POP3.new('pop3.server.address', 110)
  pop.start('YourAccount', 'YourPassword')          ###
  if pop.mails.empty?
    $stderr.puts 'no mail.'
  else
    pop.mails.each_with_index do |m, idx|
      File.open("inbox/#{idx + 1}", 'w') {|f|
        f.write m.pop
      }
      m.delete
    end
    $stderr.puts "#{pop.mails.size} mails popped."
  end
  pop.finish                                        ###

POP �����Фϥͥåȥ���Τळ����¸�ߤ���Τǡ�
�ʤˤ��Ż��򤵤���ˤϤ������˳��ϼ�³����
����ä��齪λ��³���򡢹Ԥ�ʤ���Ф����ޤ���
�����Ԥ��Τ� [[m:Net::POP3#start]] �� [[m:Net::POP#finish]] �ǡ�
POP3 ���֥������ȤϤ�����ĤΥ᥽�åɤδ֤Ǥ���ͭ���ˤʤ�ޤ���

�����о�Υ᡼��� POPMail ���֥������ȤȤ���ɽ������Ƥ��ꡢ����
���֥������ȤΥ᥽�åɤ�Ƥ֤��Ȥǥ᡼����äƤ�����ä����ꤹ��
���Ȥ��Ǥ��ޤ���[[m:Net::POP3#mails]] �Ϥ��� POPMail ���֥������Ȥ�����Ǥ��ꡢ
[[m:Net::POP3#each_mail]] �Ϥ���� pop.mails.each �Υ��硼�ȥ��åȤǤ���

==== û������

�����Ϥ����ƾ�ά��û���ѥ᥽�åɤ��򤱤�����ˤ��ʤ��Ĺ�Ǥ���
�ޤ����֥�å��դ��� [[m:Net::POP3.start]] ��Ȥ����Ȥ�
POP3.new, #start, #finish ��ʻ��Ǥ��ޤ���

  require 'net/pop'
  
  Net::POP3.start('pop3.server.address', 110,
                  'YourAccount', 'YourPassword') {|pop|
    if pop.mails.empty?
      $stderr.puts 'no mail.'
    else
      pop.mails.each_with_index do |m, idx|
        File.open("inbox/#{idx + 1}", 'w') {|f|
          f.write m.pop
        }
        m.delete
      end
      $stderr.puts "#{pop.mails.size} mails popped."
    end
  }

[[m:Net::POP3#delete_all]] ��Ȥ���
����� [[m:Net::POP3#each_mail]] ��
[[m:Net::POP3#delete]] ��ʻ��Ǥ��ޤ���

  require 'net/pop'
  
  Net::POP3.start('pop3.server.address', 110,
                  'YourAccount', 'YourPassword') {|pop|
    if pop.mails.empty?
      $stderr.puts 'no mail.'
    else
      i = 0
      pop.delete_all do |m|
        File.open("inbox/#{i}", 'w') {|f|
          f.write m.pop
        }
        i += 1
      end
    end
  }

���饹�᥽�åɤ� [[m:Net::POP3.delete_all]] ��Ȥ��Ȥ����û���ʤ�ޤ���

  require 'net/pop'
  
  i = 0
  Net::POP3.delete_all('pop3.server.address', 110,
                       'YourAccount', 'YourPassword') do |m|
    File.open("inbox/#{i}", 'w') {|f|
      f.write m.pop
    }
    i += 1
  end

==== �ե������ľ�ܽ�

����ޤǤ���Ǥ� [[m:Net::POPMail#pop]] ��Ȥ���
�᡼���ҤȤĤ�ʸ����Ȥ��Ƥ����ȤäƤ��ޤ�����
���������⤷�᡼�뤬 100MB ��ۤ���褦�ʵ���ʥ᡼����ä���硢
������ˡ�ǤϤޤ������⤷��ޤ���
���Τ褦�ʾ��ϰʲ��Τ褦�� [[m:Net::POPMail#pop]] ��
File ���֥������Ȥ�Ϳ����꤬�Ȥ��ޤ���

  require 'net/pop'

  Net::POP3.delete_all('pop3.server.address', 110,
                       'YourAccount', 'YourPassword') do |m|
    File.open('inbox', 'w') {|f|
        m.pop f   ####
    }
  end

==== APOP ��Ȥ�

Net::POP3 ���饹�Τ����� Net::APOP ���饹��Ȥ��ȡ�
ǧ�ڻ��� APOP ��Ȥ��褦�ˤʤ�ޤ���
�ޤ�ưŪ�˥Ρ��ޥ� POP �� APOP �����򤹤�ˤϡ�
�ʲ��Τ褦�� [[m:Net::POP3.APOP]] �᥽�åɤ�Ȥ��Τ������Ǥ���

  require 'net/pop'
  
  # use APOP authentication if $isapop == true
  pop = Net::POP3.APOP($isapop).new('apop.server.address', 110)
  pop.start(YourAccount', 'YourPassword') {|pop|
    # �Ĥ�Υ����ɤ�Ʊ��
  }

������ˡ�ϥ��饹���Τ��Ѥ���Τǡ����饹�᥽�åɤ� start �� foreach��
delete_all��auth_only �ʤɤ� APOP �ȤȤ�˻Ȥ��ޤ���



= class Net::POP3 < Object
#@# class alias: Net::POP
#@# class alias: Net::POPSession

== Class Methods

--- new(address, port = 110, apop = false)

Net::POP3 ���֥������Ȥ��������ޤ����ޤ���³�Ϥ��ޤ���
apop �����ΤȤ��� APOP ǧ�ڤ�Ԥ����֥������Ȥ��������ޤ���

--- start(address, port = 110, account, password)
--- start(address, port = 110, account, password) {|pop| .... }

address �� port �֥ݡ��Ȥ���³������������� account �ѥ����
password �� POP �����󤷤ޤ���������� port �� nil ���Ϥ���
POP3 �Υǥե���ȥݡ���(110)��Ȥ��ޤ���
  
������:

  require 'net/pop'

  Net::POP3.start(addr, port, account, password) {|pop|
    pop.each_mail do |m|
      file.write m.pop
      m.delete
    end
  }

--- APOP(is_apop)

bool �����ʤ� Net::APOP ���饹�����ʤ� Net::POP3 ���饹���֤��ޤ���
  
������:

  require 'net/pop'

  pop = Net::POP3::APOP($isapop).new(addr, port)
  pop.start(account, password) {
    ....
  }

--- foreach(address, port = 110, account, password) {|mail| .... }

POP ���å����򳫤��������о�Τ��٤ƤΥ᡼����Ф��Ʒ����֤��ޤ���
�ʲ���Ʊ���Ǥ���

  Net::POP3.start(address, port, account, password) {|pop|
    pop.each_mail do |m|
      yield m
    end
  }
  
������:

  require 'net/pop'

  Net::POP3.foreach('your.pop.server', 110,
                    'YourAccount', 'YourPassword') do |m|
    file.write m.pop
    m.delete if $DELETE
  end

--- delete_all(address, port = 110, account, password)
--- delete_all(address, port = 110, account, password) {|mail| .... }

POP ���å����򳫤��������о�Υ᡼��򤹤٤ƺ�����ޤ���
�֥�å���Ϳ����줿���Ϻ���������˥֥�å��ˤ��Υ᡼����Ϥ��ޤ���

������:

  require 'net/pop'

  Net::POP3.delete_all(addr, nil, 'YourAccount', 'YourPassword') do |m|
    puts m.pop
  end

--- auth_only(address, port = 110, account, password)

POP ���å����򳫤�ǧ�ڤ�����Ԥä���³���ڤ�ޤ���
��� POP before SMTP �Τ�����Ѱդ���Ƥ��ޤ���

������:

  require 'net/pop'

  Net::POP3.auth_only('your.pop3.server', nil,     # using default port (110)
                      'YourAccount', 'YourPassword')

--- default_port
#@since 1.9.0
--- default_pop3_port

--- default_pop3s_port

--- certs

will be altered by #ssl_context.

--- verify

will be altered by #ssl_context.

--- use_ssl?

--- enable_ssl(verify, certs)

signature will be changed to enable_ssl(ctx).

--- disable_ssl

#@end

--- socket_type

���Υ᥽�åɤ� obsolete �Ǥ���
�Ȥ�ʤ��Ǥ���������

== Instance Methods

#@since 1.9.0
--- use_ssl?

--- enable_ssl(verify, certs)

--- disable_ssl
#@end

--- inspect

#@# --- logging   # internal use only

--- start(account, password)
--- start(account, password) {|pop| .... }

��⡼�ȥۥ��ȤȤ� TCP ��³�򳫻Ϥ�����������Ȥ� account��
�ѥ���ɤ� password ��Ȥä� POP �����󤷤ޤ���

--- started?
--- active?

POP3 ���å���󤬳��Ϥ���Ƥ����鿿���֤��ޤ���

Ruby 1.8.0 �ʹߤǤ� active? �� obsolete �Ǥ���
���줫��Ͼ�� started? ��ȤäƤ���������

--- address

��³���륢�ɥ쥹�Ǥ���

--- port

��³����ݡ����ֹ�Ǥ���

--- set_debug_output(f)
#@# --- debug_output=(f)

�ǥХå��Ѥν��� f �򥻥åȤ��ޤ���
f �� << �᥽�åɤ���äƤ��륪�֥������ȤǤʤ���Фʤ�ޤ���

������:

  require 'net/pop'

  pop = Net::POP3.new('your.pop3.server', 110)
  pop.set_debug_output $stderr
  pop.start('YourAccount', 'YourPassword') {
    p pop.n_bytes
  }

�¹Է��:

  POP session started: your.pop3.server:110 (POP)
  -> "+OK popd <1162042773.26346.155555a1861c@your.pop3.server>\r\n"
  <- "APOP YourAccount XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n"
  -> "+OK\r\n"
  <- "STAT\r\n"
  -> "+OK 37 339936\r\n"
  339936
  <- "QUIT\r\n"
  -> "+OK\r\n"

--- open_timeout
--- open_timeout=(n)

��³�����Ԥĺ����ÿ��Ǥ���
�����ÿ����äƤ⥳�ͥ�����󤬳����ʤ��Ȥ���
�㳰 TimeoutError ��ȯ�����ޤ���

--- read_timeout
--- read_timeout=(n)

�ɤߤ��� ([[man:read(2)]] ���) �ǥ֥�å����Ƥ褤�����ÿ��Ǥ���
�����ÿ����äƤ��ɤߤ���ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

--- finish

POP3 ���å�����λ���ޤ������å���󳫻����ˤ��Υ᥽�åɤ�
�ƤФ줿�����㳰 IOError ��ȯ�����ޤ���

--- apop?

���Υ��󥹥��󥹤� APOP ��Ȥäƥ����Ф���³����ʤ� true ���֤��ޤ���

--- n_bytes

�����Фˤ���᡼�����Х��ȿ����֤��ޤ���

--- n_mails

�����Фˤ���᡼��ο����֤��ޤ���

--- mails

[[c:Net::POPMail]] ���֥������Ȥ�����򤫤����ޤ���
��������ϥ��å����򳫻Ϥ����Ȥ��˼�ưŪ�˹�������ޤ���

--- each_mail {|popmail| .... }
--- each {|popmail| .... }

pop3.mails.each ��Ʊ���Ǥ���

--- delete_all
--- delete_all {|popmail| .... }

�����о�Υ᡼������ƾõ�ޤ���
�֥�å���Ϳ����줿�Ȥ��Ͼõ�����ˤ��� POPMail ���֥������Ȥ�
�֥�å����Ϥ��ޤ���

������:

  require 'net/pop'

  n = 1
  pop.delete_all do |m|
    File.open("inbox/#{n}") {|f| f.write m.pop }
    n += 1
  end

--- auth_only(account, password)

POP ���å����򳫤�ǧ�ڤ�����Ԥä���³���ڤ�ޤ���
��� POP before SMTP �Τ�����Ѱդ���Ƥ��ޤ���

������:

  require 'net/pop'

  pop = Net::POP3.new('your.pop3.server')
  pop.auth_only 'YourAccount', 'YourPassword'

--- reset

���å�����ꥻ�åȤ��ޤ���
����Ū�ˤ� [[m:Net::POPMail#delete]] �Ǿõ���᡼�뤬�������褷�ޤ���

POP3 �Ǥϥ᡼���Ĥ��������褹����ˡ�Ϥ���ޤ���

#@# --- set_all_uids   # internal use only

== Constants

--- Revision

net/pop3 file revision.



= class Net::APOP < Net::POP3

���Υ��饹�ǤϿ������᥽�åɤ�Ƴ�����Ƥ��ޤ���
ǧ�������� APOP ���Ѥ������Ǥ���



= class Net::POPMail < Object

POP �����С���Υ᡼����̤�ɽ�����륯�饹��
�᡼��μ�����õ�Ȥ��ä����򥫥ץ��벽���ޤ���

== Instance Methods

--- pop
--- all
--- mail

�᡼����������ʸ������֤��ޤ���

pop, all, mail �Ϥ��٤�Ʊ�����̤Ǥ�����
all �� mail �� obsolete �Ǥ���
���줫��Ͼ�� pop ��ȤäƤ���������

������:

  require 'net/pop'

  Net::POP3.start('your.pop3.server', 110,
                  'YourAccount, 'YourPassword') {|pop|
    pop.mails.each do |m|
      puts m.pop
    end
  }

--- pop {|str| .... }
--- all {|str| .... }
--- mail {|str| .... }

�᡼���ʸ����򾯤��Ť��ɤߤ��ߡ��缡�֥�å���Ϳ���ޤ���

pop, all, mail �Ϥ��٤�Ʊ�����̤Ǥ�����
all �� mail �� obsolete �Ǥ���
���줫��Ͼ�� pop ��ȤäƤ���������

������:

  require 'net/pop'

  Net::POP3.start('localhost', 110) {|pop|
    pop.each_mail do |m|
      m.pop do |str|
        print str
      end
    end
  }

--- header

�إå��������������ʸ������֤��ޤ���

--- top(lines)

�᡼��إå��� lines �Ԥ֤����ʸ�������ʸ������֤��ޤ���

--- delete
--- delete!

�����о夫��᡼��������ޤ���

Ruby 1.8 �ʹߤǤ� delete �� delete! ��Ʊ�����̤Ǥ���
�ޤ���delete! �� obsolete �ʤΤǡ�
���줫��Ͼ�� delete ��Ȥ��٤��Ǥ���

--- deleted?

�᡼�뤬�����о�Ǿõ��Ƥ����� true ���֤��ޤ���

���ä���᡼���õ����
[[m:Net::POP3#reset]] ��Ȥ��ʳ������褹����ˡ�Ϥ���ޤ���

--- size

�᡼��Υ����� (ñ�̤ϥХ���) �򤫤����ޤ���

--- number

�᡼����Ф��ƿ���줿�����Υ᡼��ܥå����ǰ�դ��ֹ�Ǥ���
�����Ф���³���ʤ����Ȥ����ֹ���Ѳ������礬����ޤ���
�᡼�뤴�Ȥ˰�դʼ��̻Ҥ�ɬ�פʤȤ���
[[m:Net::POPMail#uidl]] ��ȤäƤ���������

--- uidl
--- unique_id

�᡼����Ф��ƿ���줿�������о�ǰ�դʼ��̻� (UIDL) �򤫤����ޤ���
[[m:Net::POPMail#number]] �Ȱ㤤��
���� UIDL ����³���ʤ����Ƥ��Ѳ����ޤ���



= class Net::POPError < Net::ProtocolError

POP3 �Ρ�ǧ�ڰʳ��Υ��顼���������Ȥ���ȯ�����ޤ���

= class Net::POPBadResponse < Net::POPError

�����Ф���ͽ�����ʤ��쥹�ݥ󥹤����äƤ����Ȥ���ȯ�����ޤ���

= class Net::POPAuthenticationError < Net::ProtoAuthError

POP3 ��ǧ�ڤ˼��Ԥ����Ȥ���ȯ�����ޤ���
