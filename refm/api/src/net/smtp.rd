�᡼����������뤿��Υץ�ȥ��� SMTP (Simple Mail Transfer Protocol)
�򰷤��饤�֥��Ǥ���

�إå��ʤɥ᡼��Υǡ����򰷤����ȤϤǤ��ޤ���
SMTP �μ����� [[RFC:2821]] �˴𤤤Ƥ��ޤ���

=== ������

==== �Ȥˤ����᡼�������

SMTP ��Ȥäƥ᡼�������ˤϤޤ� SMTP.start �ǥ��å����򳫤��ޤ���
�������������ФΥ��ɥ쥹������������ݡ����ֹ�Ǥ���
�֥�å���Ȥ��� File.open ��Ʊ���褦�˽�ü������ưŪ�ˤ�äƤ����
�ΤǤ�������Ǥ���

  require 'net/smtp'
  Net::SMTP.start( 'your.smtp.server', 25 ) {|smtp|
    # use smtp object only in this block
  }

your.smtp.server ��Ŭ�ڤ� SMTP �����ФΥ��ɥ쥹���ɤߤ����Ƥ���������
�̾�� LAN �δ����Ԥ�ץ�Х����� SMTP �����Ф��Ѱդ��Ƥ���Ƥ���Ϥ��Ǥ���

���å���󤬳������餢�Ȥ� [[m:Net::SMTP#send_message]]
�ǥ᡼���ή����������Ǥ���

  require 'net/smtp'
  
  Net::SMTP.start('your.smtp.server', 25) {|smtp|
    smtp.send_message(<<-EndOfMail, 'your@mail.address', 'to@some.domain')
  From: Your Name <your@mail.address>
  To: Dest Address <to@some.domain>
  Subject: test mail
  Date: Sat, 23 Jun 2001 16:26:43 +0900
  Message-Id: <unique.message.id.string@some.domain>
  
  This is a test mail.
    EndOfMail
  }

==== ���å�����λ����

�᡼������ä��� [[m:Net::SMTP#finish]] ��Ƥ��
���å�����λ���ʤ���Ф����ޤ���
File �Τ褦�� GC ���˾���� close ����뤳�Ȥ⤢��ޤ���
������ʤȤ���� finish ���ʤ������������ɤ���򸫳ݤ��ޤ�����
���٤Ƹ��Ǥ���finish ��ɬ���Ƥ�Ǥ���������

�ޤ��֥�å��դ��� [[m:Net::SMTP.start]], [[m:Net::SMTP#start]]
��Ȥ��� finish ��Ƥ�Ǥ����Τ������Ǥ���
��ǽ�ʸ¤�֥�å��դ��� start ��Ȥ��Τ��褤�Ǥ��礦��

  require 'net/smtp'

  # using SMTP#finish
  smtp = Net::SMTP.start('your.smtp.server', 25)
  smtp.send_message mail_string, 'from@address', 'to@address'
  smtp.finish
  
  # using block form of SMTP.start
  Net::SMTP.start('your.smtp.server', 25) {|smtp|
    smtp.send_message mail_string, 'from@address', 'to@address'
  }

==== ʸ����ʳ����������

�ҤȤľ����Ǥ�ʸ�����ƥ�� (�ҥ��ɥ������) ��Ȥä��������ޤ�������
each �᥽�åɤ���ä����֥������Ȥ���ʤ�ʤ�Ǥ����뤳�Ȥ��Ǥ��ޤ���
�ʲ��� File ���֥������Ȥ���ľ������������Ǥ���

  require 'net/smtp'

  Net::SMTP.start('your.smtp.server', 25) {|smtp|
    File.open('Mail/draft/1') {|f|
      smtp.send_message f, 'your@mail.address', 'to@some.domain'
    }
  }

==== HELO �ɥᥤ��

SMTP �Ǥϥ᡼�������¦�Υۥ��Ȥ�̾�� (HELO �ɥᥤ��ȸƤ�) ���׵�
�����ΤǤ�����Net::SMTP �ǤϤȤꤢ���� localhost.localdomain ��
����̾�����������Ƥ��ޤ��������Ƥ��� SMTP �����ФϤ��� HELO �ɥᥤ��
�ˤ��ǧ�ڤϤ��ޤ꿿���ܤ˹Ԥ�ʤ��Τ� (��ñ�˵�¤�Ǥ��뤫��Ǥ�)
����ˤʤ�ʤ����Ȥ�¿���ΤǤ������ޤ�˥᡼�륻�å������ڤ���
���Ȥ⤢��ޤ������������Ȥ��ϤȤꤢ���� HELO �ɥᥤ���Ϳ���Ƥߤ�
���������������󤽤�ʳ��λ��� HELO �ɥᥤ��Ϥ������Ϥ��Τ�
�٥��ȤǤ���

HELO �ɥᥤ��� [[m:Net::SMTP.start]], [[m:Net::SMTP#start]]
���軰���� helo_domain �˻��ꤷ�ޤ���

  Net::SMTP.start('your.smtp.server', 25, 'mail.from.domain') {|smtp|

�褯���������륢�åץۥ��Ȥξ�硢HELO �ɥᥤ��ˤ� ISP �Υ᡼��
�����ФΥɥᥤ���ȤäƤ����Ф����Ƥ��̤�ޤ���

=== ȯ�������㳰

���å������� (SMTP ��٥��) ���顼�������ä���硢
�ʲ����㳰��ȯ�����ޤ���

: Net::ProtoSyntaxError
    SMTP ���ޥ�ɤι�ʸ�ߥ� (500����)
: Net::ProtoFatalError
    ����Ū�ʥ��顼 (550����)
: Net::ProtoUnknownError
    ͽ�����ʤ����顼�������餯�Х�
: Net::ProtoServerBusy
    ���Ū�ʥ��顼 (420/450����)



= class Net::SMTP < Object
#@# class alias: Net::SMTPSession

== Singleton Methods

--- new(address, port = 25)
#@todo

������ SMTP ���֥������Ȥ��������ޤ���
address ��SMTP�����С���FQDN�ǡ�
port ����³����ݡ����ֹ�Ǥ���
�����������Υ᥽�åɤǤϤޤ���³�Ϥ��ޤ���

--- start(address, port = 25, helo_domain = 'localhost.localdomain', account = nil, password = nil, authtype = nil)
--- start(address, port = 25, helo_domain = 'localhost.localdomain', account = nil, password = nil, authtype = nil) {|smtp| .... }
#@todo

�ʲ���Ʊ���Ǥ���

  Net::SMTP.new(address, port).start(helo_domain, account, password, authtype)
  
Example:

  require 'net/smtp'

  Net::SMTP.start('your.smtp.server') {|smtp|
    smtp.send_message mail_string, 'from@mail.address', 'dest@mail.address'
  }

--- default_port
#@todo

The default SMTP port number, 25.

#@since 1.9.1
--- default_ssl_context
#@todo

--- default_ssl_port
#@todo

The default SMTP/SSL port number, 465.

--- default_tls_port
#@todo

The default SMTP/TLS port number, 587.

--- disable_ssl
#@todo

--- disable_tls
#@todo

--- enable_ssl(context = SMTP.default_ssl_context)
#@todo

Enable SMTP/SSL.

--- enable_tls
#@todo

--- ssl_context
#@todo

--- use_ssl?
#@todo

--- use_tls?
#@todo
#@end

== Instance Methods

--- esmtp?
#@todo

--- esmtp
--- esmtp=(bool)
#@todo

--- set_debug_output(f)
#@since 1.9.1
--- debug_output=(f)
#@todo
#@end

--- start(helo_domain = <local host name>, account = nil, password = nil, authtype = nil)
--- start(helo_domain = <local host name>, account = nil, password = nil, authtype = nil) {|smtp| .... }
#@todo

TCP ���ͥ�������ĥ�ꡢƱ���� SMTP ���å����򳫻Ϥ��ޤ���
���ΤȤ���������Υۥ��Ȥ� FQDN �� helo_domain �˻��ꤷ�ޤ���
�⤷���Ǥ˥��å���󤬳��Ϥ��Ƥ����� IOError ��ȯ�����ޤ���

account �� password ��ξ����Ϳ����줿��硢
SMTP AUTH ���ޥ�ɤˤ�ä�ǧ�ڤ�Ԥ��ޤ���
authtype �ϻ��Ѥ���ǧ�ڤΥ����פǡ�
����ܥ�� :plain �� :cram_md5 ����ꤷ�ޤ���

--- started?
#@todo

SMTP ���å���󤬳��Ϥ���Ƥ����鿿��

--- inspect
#@todo

--- address
#@todo

��³���륢�ɥ쥹

--- port
#@todo

��³����ݡ����ֹ�

--- open_timeout
--- open_timeout=(n)
#@todo

��³�����Ԥĺ����ÿ��������ÿ����äƤ⥳�ͥ������
�����ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

--- read_timeout
--- read_timeout=(n)
#@todo

�ɤߤ��� ([[man:read(2)]] ���) �ǥ֥�å����Ƥ褤�����ÿ���
�����ÿ����äƤ��ɤߤ���ʤ�����㳰 TimeoutError ��ȯ�����ޤ���

--- finish
#@todo

SMTP ���å�����λ���ޤ���

���å���󳫻����ˤ��Υ᥽�åɤ��ƤФ줿�����㳰 IOError ��ȯ�����ޤ���

--- send_message(mailsrc, from_addr, *to_addrs)
--- send_mail(mailsrc, from_addr, *to_addrs)
--- sendmail(mailsrc, from_addr, *to_addrs)
#@todo

mailsrc ��᡼��Ȥ����������ޤ���
mailsrc �� each ���ƥ졼�������
���֥������Ȥʤ�ʤ�Ǥ⹽���ޤ��� (���Ȥ��� String �� File)��

from_domain �������Υ᡼�륢�ɥ쥹 ('...@...'�Τ������Τ��) �ǡ�
to_addrs �ˤ�������᡼�륢�ɥ쥹���¤٤ޤ���

  require 'net/smtp'

  Net::SMTP.start('your.smtp.server') {|smtp|
    smtp.send_message mail_string,
                      'from@mail.address',
                      'dest@mail.address', 'dest2@mail.address'
  }

--- open_message_stream(from_addr, *to_addrs) {|f| .... }
--- ready(from_addr, *to_addrs) {|f| .... }
#@todo

�᡼��񤭤��ߤν����򤷤������ǡ�
write, print, printf, puts �᥽�åɤ���ĥ��֥������� f ��֥�å��ˤ������ޤ���
from_addr ���������᡼�륢�ɥ쥹��
to_addrs �ϰ���Υ᡼��ܥå����Ǥ���

  require 'net/smtp'

  Net::SMTP.start('your.smtp.server', 25) {|smtp|
    smtp.open_message_stream('from@mail.addr', 'dest@mail.addr') {|f|
      f.puts 'From: aamine@loveruby.net'
      f.puts 'To: someone@somedomain.org'
      f.puts 'Subject: test mail'
      f.puts
      f.puts 'This is test mail.'
    }
  }

#@since 1.9.1
--- use_ssl?
#@todo

--- use_tls?
#@todo

--- disable_ssl
#@todo

--- disable_tls
#@todo

--- enable_ssl
#@todo

--- enable_tls
#@todo

--- authenticate(user, secret, authtype)
#@todo

--- auth_plain(user, secret)
#@todo

Plain authentication.

--- auth_login(user, secret)
#@todo

Login authentication.

--- auth_cram_md5(user, secret)
#@todo

Cram-MD5 authentication.

--- starttls
#@todo

Dispatch STARTTLS command (use SMTP/TLS).

--- helo(domain)
#@todo

Dispatch HELO command (use standard SMTP).

--- ehlo(domain)
#@todo

Dispatch EHLO command (use ESMTP).

--- mailfrom(from_addr)
#@todo

Dispatch MAILFROM command.

--- rcptto_list(to_addrs)
#@todo

Dispatch multiple RCPTTO commands.

--- rcptto(to_addr)
#@todo

Dispatch RCPTTO command.

--- data(message)
--- data {|f| .... }
#@todo

Dispatch DATA command.

--- quit
#@todo

Dispatch QUIT command.
#@end

== Constants

--- Revision
#@todo

File revision.  You cannot assume any specific format.
