require rubygems
require rubygems/gem_openssl

���Υ饤�֥��ϰŹ��̾�� RubyGems �ѥå������˻��Ѥ��뤿��˻��Ѥ��ޤ���

==== ��̾�դ��� Gem �ѥå�����

===== �ܼ�

 * ����
 * ����
 * ���ޥ�ɥ饤�󥪥ץ����
 * OpenSSL ��ե����
 * Bugs / TODO
 * ��ԤˤĤ���

===== ����

���Υ饤�֥��ϰŹ��̾�� RubyGems �ѥå������˻��Ѥ��뤿��˻��Ѥ��ޤ���
�ʲ��Υ��������Ǥϡ���̾�դ��� Gem �ѥå����������������ˡ��
���ƥåץХ����ƥåפǲ��⤷�Ƥ��ޤ���

===== ����
#@todo

���ʤ�����ʬ�� Gem �˽�̾���뤿��ˤϡ���̩���ȼ��ʽ�̾����������ɬ�פǤ���
�ʲ��Υ��ޥ�ɤ�¹Ԥ���Ȥ�����������뤳�Ȥ��Ǥ��ޤ���

  # gemmaster@example.com �Τ������̩���Ⱦ������������ޤ�
  $ gem cert --build gemmaster@example.com

���ʤ��Υ���ԥ塼������ǽ�ˤ���ޤ���������ˤ� 5 �ä��� 10 ʬ���٤�����ޤ���
(��������������륢�르�ꥺ��������ǰ���®����Τ�ȤäƤ���櫓�ǤϤʤ�)
���줬��λ����ȡ������ȥǥ��쥯�ȥ�� "gem-private_key.pem", "gem-public_cert.pem"
����ĤΥե����뤬�Ǥ��ޤ���

�ޤ��ϡ��ʤ�٤����ʤ����������������Ǥ������ "gem-private_key.pem" ���ư������
���������� FD, CD-ROM �ʤ�Ʊ�����餤�����ʤ�ΤǤ��ޤ��ޤ���
��������̩������̩�Τޤޤˤ��Ƥ����Ƥ����������⤷�����줬�軰�Ԥ�ϳ�̤������ϡ�
ï�������ʤ��Υե�򤷤ƥѥå������˽�̾���뤳�Ȥ��Ǥ��ޤ���(NOTE: ��Ҥ��ޤ���
PKI �ˤ���ޤ줿���ˤ��ꥹ����ڸ�������ˡ������ޤ���)

���ơ�Gem �˽�̾���ޤ��礦��������Ǥ� Imlib2-Ruby ����Ѥ��ޤ�����
���ʤ��Ϲ����� Gem ����Ѥ��Ƥ⤤���Ǥ��衣���ʤ��� gemspec �ե�����򳫤���
�ʲ������Ƥ��ɲä��Ƥ���������

   # signing key and certificate chain
   s.signing_key = '/mnt/floppy/gem-private_key.pem'
   s.cert_chain  = ['gem-public_cert.pem']

("/mnt/floppy" �Ϥ��ʤ����Ȥ���̩�����֤��Ƥ���ѥ����ɤ��ؤ��Ƥ��������͡�)

���줫�顢���Ĥ��̤ꤢ�ʤ��� Gem ��ӥ�ɤ��ޤ���
����ǤȤ������ä��������ʤ��κǽ�ν�̾�դ� Gem ���ӥ�ɤǤ��ޤ�����
����夬�ä� Gem �ե��������������Ƥߤ�ȡ��ɲä��줿�ե����뤬���뤳�Ȥ��狼��ޤ���

   $ tar tf tar tf Imlib2-Ruby-0.5.0.gem
   data.tar.gz
   data.tar.gz.sig
   metadata.gz
   metadata.gz.sig

��������̾�򸡾ڤ��Ƥߤޤ��礦���ʲ��Τ褦�� "-P HighSecurity" ���ץ�����
�դ��� Gem �򥤥󥹥ȡ��뤷�ƤߤƤ���������

   # install the gem with using the security policy "HighSecurity"
   $ sudo gem install Imlib2-Ruby-0.5.0.gem -P HighSecurity

���� -P ���ץ����ϥ������ƥ��ݥꥷ�������ꤷ�ޤ���
���Τ褦���ä򤷤Ƥ��뤦���ˡġ������ȡ��ʤ��������ϡ�

   Attempting local installation of 'Imlib2-Ruby-0.5.0.gem'
   ERROR:  Error installing gem Imlib2-Ruby-0.5.0.gem[.gem]: Couldn't
   verify data signature: Untrusted Signing Chain Root: cert =
   '/CN=gemmaster/DC=example/DC=com', error = 'path
   "/root/.rubygems/trust/cert-15dbb43a6edf6a70a85d4e784e2e45312cff7030.pem"
   does not exist'

���Υ��顼�θ����ϥ������ƥ��ݥꥷ���ˤ���ޤ���RubyGems �ˤϤ����Ĥ���
�ۤʤ륻�����ƥ��ݥꥷ��������ޤ��������ٷƤ��Ƥ��顢�������ƥ��ݥꥷ��
�������򤷤ޤ��礦���ʲ��ˡ����߻��Ѳ�ǽ�ʥ������ƥ��ݥꥷ���ΰ����򼨤��ޤ���

: NoSecurity
  �ʤ�Υ������ƥ��⤢��ޤ��󡣽�̾�դ��Υѥå��������̵̾���Υѥå�������
  �褦�˰����ޤ���
: LowSecurity
  �ۤȤ�ɤʤ�Υ������ƥ��⤢��ޤ���RubyGems �Ͻ�̾�դ��Υѥå�������
  ���ڤ��ޤ����������񤬼������Ƥ��ʤ���и��ڤ��������ޤ������դΤ���桼����
  ���Τ褦�ʥ������ƥ����ñ�˲��򤹤뤳�Ȥ��Ǥ��ޤ���
: MediumSecurity
  LowSecurity, NoSecurity �����ɤ��Ǥ������ޤ��Գμ¤Ǥ���
  �ѥå����������Ƥϡ���̾�դ��ξ�������Ф��Ƹ��ڤ���ޤ���
  ������������������ڤ���ޤ���������ϻĤ�ξ��������������Ф��Ƹ��ڤ���ޤ���
  (���ʤ����������������ˤĤ����Τ�ʤ����ϡ���������������ΤǾ����ԤäƤ�������)
  LowSecurity �ݥꥷ������κ���β������� MediumSecurity �ݥꥷ���Ͽ������ʤ�
  ����������̾�����ѥå������򥤥󥹥ȡ��뤷�ʤ����ȤǤ���
  �Թ��ʤ��Ȥ� MediumSecurity �ݥꥷ���ϴ����˥����奢�Ȥ����櫓�ǤϤ���ޤ���
  ���դΤ���桼���ϡ���̾�򳰤����ꡢ��̾�ʤ��� Gem �����ۤ���ȡ� Gem ��Ÿ������
  ���Ȥ��Ǥ��ޤ���
: HighSecurity
  ���������ϻ䤿���򤳤�ʾ��֤ˤ��ޤ����� HighSecurity �ݥꥷ����
  ��̾�ʤ��� Gem �򥤥󥹥ȡ��뤷�ʤ��Ȥ������Ȥ������ MediumSecurity ��Ʊ���Ǥ���
  ���դΤ���桼���ϡ��ʤ�μ��ʤ����äƤ��ʤ������դΤ���桼���ϡ���̾��
  ̵���ˤ��뤳�Ȥʤ��˥ѥå��������Ƥ��ѹ����뤳�Ȥ��Ǥ��ޤ��󡣤ޤ�����̾���ѹ�������
  ��������ꡢ�������������������뤳�Ȥ��Ǥ��ޤ���RubyGems �Ϥ��Τ褦��
  �ѥå������Υ��󥹥ȡ����ñ�˵��ݤ��ޤ����������ۤ����ä�����������äƤ�����
  CPAN �桼���˲����������������������(��)


�Ȥ����櫓�ǡ�RubyGems ���桹�ε���������������̾�դ��� Gem �Υ��󥹥ȡ������ݤ���
��ͳ�ϡ����줬���ꤵ��Ƥ��ʤ���������ͳ�褹���Τ��ä�����ʤΤǤ��������ȡ�
��Υ����ɤ����гμ�(��)�ʤΤǡ���ʬ���Ȥ��ꤵ�줿���������ɲä��ޤ���

�ʲ��Τ褦�ˤ��Ƥ���������

    # add trusted certificate
    gem cert --add gem-public_cert.pem

��θ�����������ꤵ�줿�������Ȥ����ɲä��ޤ��������Ǥϻ����̩���ǽ�̾����
�ѥå��������Ѥ路�����򤻤��˥��󥹥ȡ��뤹�뤳�Ȥ�����ޤ�����������Ҥ�
���󥹥ȡ��륳�ޥ�ɤ�⤦���ټ¹Ԥ��Ƥ���������

  # install the gem with using the HighSecurity policy
  # (���٤Ϥʤ������⤢��ޤ���)
  $ sudo gem install Imlib2-Ruby-0.5.0.gem -P HighSecurity

����ϡ�RubyGems �Ϥ��ʤ��ν�̾�դ��ѥå�������������졢���󥹥ȡ���򳫻Ϥ���Ϥ��Ǥ���
RubyGems ����ˡ�򤫤��Ƥ���֤ˡ�¾�Υ������ƥ��˴ؤ��륳�ޥ�ɤ򸫤Ƥ����ޤ��礦��

   Usage: gem cert [options]

   Options:
      -a, --add CERT                   ���ꤹ���������ɲä��ޤ���
      -l, --list                       ���ꤷ�Ƥ��������Υꥹ�Ȥ�ɽ�����ޤ���
      -r, --remove STRING              STRING ��ޤ������������ޤ���
      -b, --build EMAIL_ADDR           EMAIL_ADDR ���Ф�����̩���伫�ʽ�̾�������
                                       �������ޤ���
      -C, --certificate CERT           --sign �ǻ��Ѥ�����������ꤷ�ޤ���
      -K, --private-key KEY            --sign �ǻ��Ѥ�����̩������ꤷ�ޤ���
      -s, --sign NEWCERT               ��ʬ�θ����Ѥ��ƾ�����˽�̾���ޤ���
  
(�Ȥ���ǡ�"gem cert --help" ��¹Ԥ���Ȥ��ĤǤ⹥���ʻ��˾嵭�Υꥹ�ȤαѸ��Ǥ�
���뤳�Ȥ�����ޤ���)

�դࡣ�䤿���ϡ�"--build" ���ץ����ϴ��˸��ޤ����� "--add", "--list", "--remove" ��
�ƥ��ץ����϶ˤ��ľ��Ū�Ǥ��͡����ʤ��ο��ꤵ�줿������Υꥹ�Ȥ˾�������ɲä����ꡢ
��������Ϥ����ꡢ���������������Ǥ��ޤ��������� "--sign" ���ץ����Ȥϲ��Ǥ��礦����

���μ���������뤿��ˡ���ۤɸ��ڤ��� "�������������" �Ȥ�����ǰ�򸫤Ƥ����ޤ��礦��
���ʽ�̾������ˤ���Ĥ����꤬����ޤ�����Ĥϡ����ʽ�̾���������ΤΥ������ƥ���
�󶡤��Ƥ��ʤ����ȤǤ��������������ϡ��ޤĤ�Ȥ椭�Ҥ��̾���ޤ������Ŀ�Ū��
�������������ʤ��¤ꡢ���줬������ matz �ˤ�ä��������줿���Ȥ�ɤ���äƳ�ǧ
����ΤǤ��礦����

����ܤ�����ϳ�ĥ���Ǥ��������� 50 �ͤ� Gem ��ȯ�Ԥ�������ˡ�50 �ξ������
�����Τ����ꤢ��ޤ���Gem ��ȯ�Ԥ� 500 �ͤ� 1000 �ͤˤʤä���ɤ��ʤ�ޤ�����
���ꤵ�줿��������ɲä�³����Τ϶��ˤǤ�������ˡ��ºݤ�RubyGems �桼����������
�������Ǳ��˿��ꤹ�뤳�Ȥˤ�äƤ��ο����������ƥ�ϰ����Ǥʤ��ʤäƤ��ޤ��ޤ���

#@# ��������Ϥʤ���
������������󤬤ɤ��������Τ������ޤ����������������ϡ�����ȯ�Ծ������
�Ҥξ�����δ֤�Ŭ��Ĺ���������κ�����Ω�����ޤ���������䤿���ϡ��������
��ȯ�Ԥ��Ȥ˿��ꤹ�뤫���ˡ�����Ū�ʿ���γ��ؤ��ۤ��� PKI �γ�ǰ�Ǥ���
����������������Ѥ��ޤ�������γ��ؤ����޼����ޤ���


                         --------------------------
                         | rubygems@rubyforge.org |
                         --------------------------
                                     |
                   -----------------------------------
                   |                                 |
       ----------------------------    -----------------------------
       | seattle.rb@zenspider.com |    | dcrubyists@richkilmer.com |
       ----------------------------    -----------------------------
            |                |                 |             |
     ---------------   ----------------   -----------   --------------
     | alf@seattle |   | bob@portland |   | pabs@dc |   | tomcope@dc |
     ---------------   ----------------   -----------   --------------


���ơ�4 �Ĥο��ꤵ�줿������(alf@seattle, bob@portland, pabs@dc, tomecope@dc)
������ޤ������ºݤˤϥ桼���ϡ���Ĥξ�����("rubygems@rubyforge.org")����
��������Ǥ����ΤǤ����ʲ��ˤ��줬�ɤΤ褦��Ư�����������ޤ���

��� "al@seatle" ����̾���� "Alf2000-Ruby-0.1.0.gem" �򥤥󥹥ȡ��뤷�ޤ���
��� "al@seatle" �ʤ��ʹ�������Ȥ⤢��ޤ��󤬡���ξ������ "seattle.rb@zenspider.com"
�ξ����񤫤�ͭ���Ǥ���Ⱦ�������Ƥ��ޤ���"seattle.rb@zenspider.com" ��
"rubygems@rubyforge.org" ����ͭ���Ǥ���Ⱦ�������Ƥ��ޤ���
�����餷�����פ���ˡ� "rubygems@rubyforge.org" �ؤĤʤ�������������Ω�����뤳�Ȥ�
�Ǥ���Τ� "al@seatle" �ˤ�äƽ�̾���줿�ѥå��������ꤹ��Τˤ�Τ������������Ȥ������ȤǤ���

"--sign" ���ץ����Ϥ��������ƹԤ��ޤ���
��ȯ�Ԥ� "--build" ���ץ����Ǿ������������ޤ���
�����ǹԤ��� Ruby ��Ĥ� Ruby �ٶ���ˤ��ξ��������äƤ��ä�(��ο���γ��ؤΤ褦��)��
��ή�ξ��������äƤ���ͤ˽�̾���Ƥ�餤�ޤ������뤤�ϡ������ RubyConf �ǥȥåץ�٥��
���������äƤ���ͤ˽�̾���Ƥ�餤�ޤ����ɤ���ξ��Ǥ��̾�򤹤�ͤ�
Ʊ�����ޥ�ɤ�¹Ԥ��ޤ���

  # sign a certificate with the specified key and certificate
  # (note that this modifies client_cert.pem!)
  $ gem cert -K /mnt/floppy/issuer-priv_key.pem -C issuer-pub_cert.pem --sign client_cert.pem

ȯ�Ԥ��줿������λ����� (���Υ������ξ�� "alf@seatle") �ϼ�ʬ�Υѥå������˽�̾���뤿���
���ξ��������Ѥ��뤳�Ȥ��Ǥ��ޤ����Ȥ���ǡ��ߤ�ʤ���ο�������Ũ�ʽ�̾�Ѥߤξ������
�Τ餻��ˤϡ�"alf@seatle" ����� gemspec ��ʲ��Τ褦���ѹ�����ɬ�פ�����ޤ���

  # signing key (still kept in an undisclosed location!)
  s.signing_key = '/mnt/floppy/alf-private_key.pem'
  
  # certificate chain (includes the issuer certificate now too)
  s.cert_chain  = ['/home/alf/doc/seattlerb-public_cert.pem',
                   '/home/alf/doc/alf_at_seattle-public_cert.pem']

�����ޤǤ�ʤ������� RubyGems �ο�����פϤޤ�¸�ߤ��Ƥ��ޤ���
�ޤ����ָ��������פǤ�ȯ�ԼԤ����ϥꥯ�����Ȥ�����С��������ȯ�Ԥ��Ƥ��ޤ���
���γ��إ����ƥ�ˤϾ��������ä����Ȥߤ��礱�Ƥ��ޤ���
����������ϡ����轤�������Ǥ��礦��

�����ޤǤˡ���������̾�դ��� Gem �򥤥󥹥ȡ���Ѥߤ��Ȼפ��ޤ�(���ʤ���
Rails �Ȥ��ΰ�¸���Ƥ��� Gem �򥤥󥹥ȡ��뤷�Ƥ������Ǥʤ����)��
�����Ǥϡ��ؤ�����Ȥȶ�̣�������Ȥ򤪤��餤���Ƥ����ޤ��礦��

 * ��̾�Ⱦ�������Ѥ��� Gem ��ӥ�ɤ��뤳��
 * ��̾�򥵥ݡ��Ȥ���褦�˴���¸�ߤ��� Gem �������뤳��
 * �������ƥ��ݥꥷ����Ĵ�����뤳��
 * ����Ѥߤξ�����Υꥹ�Ȥ��Խ����뤳��
 * ������˽�̾���뤳��

===== ���ޥ�ɥ饤�󥪥ץ����

�ʲ��ˡ���̾�դ� Gem �˴ط����륳�ޥ�ɥ饤�󥪥ץ�����ޤȤ�Ƥ����ޤ���

  gem install
    -P, --trust-policy POLICY        Gem �ο��ꤹ��ݥꥷ������ꤷ�ޤ���
  
  gem cert
    -a, --add CERT                   ���ꤹ���������ɲä��ޤ���
    -l, --list                       ���ꤷ�Ƥ��������Υꥹ�Ȥ�ɽ�����ޤ���
    -r, --remove STRING              STRING ��ޤ������������ޤ���
    -b, --build EMAIL_ADDR           EMAIL_ADDR ���Ф�����̩���伫�ʽ�̾�������
                                     �������ޤ���
    -C, --certificate CERT           --sign �ǻ��Ѥ�����������ꤷ�ޤ���
    -K, --private-key KEY            --sign �ǻ��Ѥ�����̩������ꤷ�ޤ���
    -s, --sign NEWCERT               ��ʬ�θ����Ѥ��ƾ�����˽�̾���ޤ���

���줾��Υ��ץ����˴ؤ�����ܤ�������ϡ�����򻲾Ȥ��Ƥ���������

===== OpenSSL ��ե����

gem cert --build, gem cert --sign ����Ѥ��ƺ����Ǥ��� *.pem �ե������
����Ū�� OpenSSL PEM �ե�����ΤߤǤ����ʲ��ˤ����Ĥ��������ʥ��ޥ�ɤ�
�Ҳ𤷤Ƥ����ޤ���

  X509 �ե����ޥåȤ� PEM �ե������ DER �ե����ޥåȤ��Ѵ�����
  (�Ρ���:Windows �� *.cer �ե������ X509 ������� DER �ե����ޥåȤǤ�) :
  $ openssl x509 -in input.pem -outform der -out output.der

  �ʹ֤��ɤߤ䤹���ե����ޥåȤǾ��������Ϥ��� :
  $ openssl x509 -in input.pem -noout -text

��̩�����Ф��Ƥ�Ʊ�����Ȥ��Ǥ��ޤ���

  PEM �ե����ޥåȤ� RSA ���� DER �ե����ޥåȤ��Ѵ����ޤ� :
  $ openssl rsa -in input_key.pem -outform der -out output_key.der
  
  ����ʹ֤��ɤߤ䤹���ե����ޥåȤǽ��Ϥ��ޤ� :
  $ openssl rsa -in input_key.pem -noout -text


===== Bugs / TODO
#@todo


===== ��ԤˤĤ���

 * Paul Duncan <pabs@pablotron.org>
 * http://pablotron.org/

= module Gem::Security

== Singleton Methods

--- add_trusted_cert(cert, options = {}) -> nil
#@todo

����Ѥ߾�����ꥹ�Ȥ�Ϳ����줿��������ɲä��ޤ���

Note: ���Ф餯�δ� OPT[:trust_dir] ����¸����ޤ����������ѹ�������ǽ��������ޤ���

@param cert ���������ꤷ�ޤ���

@param options ���ץ�������ꤷ�ޤ���

--- build_cert(name, key, options = {}) -> OpenSSL::X509::Certificate
#@todo

Ϳ����줿 DN ����̩������Ѥ��ƾ������������ޤ���

@param name DN ����ꤷ�ޤ���

@param key ��̩������ꤷ�ޤ���

@param options ���ץ�������ꤷ�ޤ���

--- build_self_signed_cert(email_addr, options = {}) -> Hash
#@todo

Ϳ����줿�᡼�륢�ɥ쥹�򸵤ˤ��Ƽ��ʽ�̾�������������ޤ���

@param email_addr �᡼�륢�ɥ쥹����ꤷ�ޤ���

@param options ���ץ�������ꤷ�ޤ���

@return ���Ⱦ�����Ȥ�������¸�����ѥ���ɽ���ϥå�����֤��ޤ���

--- sign_cert(cert, signing_key, signing_cert, options = {}) -> OpenSSL::X509::Certificate
#@todo

Ϳ����줿��̾�Ѥθ��Ⱦ�������Ѥ��ƾ�����˽�̾���ޤ���

@param cert ��̾������������ꤷ�ޤ���

@param signing_key ��̾�ˤ��褦���븰����ꤷ�ޤ���

@param signing_cert ��̾�˻��Ѥ�����������ꤷ�ޤ���

@param options ���ץ�������ꤷ�ޤ���

@return ��̾���줿��������֤��ޤ���

--- verify_trust_dir(path, perms)
#@todo

���ꤹ��ǥ��쥯�ȥ꤬¸�ߤ��뤳�Ȥ��ǧ���ޤ���

Ϳ����줿�ѥ���¸�ߤ����硢�ǥ��쥯�ȥ�Ǥ��뤳�Ȥ��ǧ���ޤ���
�����Ǥʤ����ϡ��ǥ��쥯�ȥ��������ƥѡ��ߥå������ѹ����ޤ���

@param path ��ǧ����ѥ�����ꤷ�ޤ���

@param perms �ǥ��쥯�ȥ�����������Υѡ��ߥå�������ꤷ�ޤ���

@raise Gem::Security::Exception path ���ǥ��쥯�ȥ�Ǥʤ�����ȯ�����ޤ���

== Constants

--- AlmostNoSecurity -> Gem::Security::Policy
#@todo

�ۤȤ�ɤθ��ڤ�Ԥ�ʤ��ݥꥷ���Ǥ���

��̾���줿�ǡ����θ��ڤΤ߹Ԥ��ޤ���

���Υݥꥷ���ϲ��⤷�ʤ����ϥޥ��Ǥ������ۤȤ�����Ω���ʤ��塢
��ñ���٤����Ȥ��Ǥ���Τǡ����Ѥ��ʤ��Ǥ���������

    :verify_data      => true,
    :verify_signer    => false,
    :verify_chain     => false,
    :verify_root      => false,
    :only_trusted     => false,
    :only_signed      => false

--- HighSecurity -> Gem::Security::Policy
#@todo

���٥�Υ������ƥ��ݥꥷ���Ǥ���

��̾���줿 Gem �Τߥ��󥹥ȡ����ǽ�Ǥ���

�롼�Ⱦ�����Τߤ��ꤷ�ơ����Ƥθ��ڤ�Ԥ��ޤ���
�����������ꤹ��褦�˻��ꤵ�줿������Ͽ��ꤷ�ޤ���

���Υ������ƥ��ݥꥷ���ϥХ��ѥ�����Τ���Τ���������Ǥ���

    :verify_data      => true,
    :verify_signer    => true,
    :verify_chain     => true,
    :verify_root      => true,
    :only_trusted     => true,
    :only_signed      => true

--- LowSecurity -> Gem::Security::Policy
#@todo

���٥�Υ������ƥ��Υݥꥷ���Ǥ���

��̾���줿�ǡ����Ƚ�̾�Ԥθ��ڤ�Ԥ��ޤ���

���Υݥꥷ���ϲ��⤷�ʤ����ϥޥ��Ǥ������ۤȤ�����Ω���ʤ��塢
��ñ���٤����Ȥ��Ǥ���Τǡ����Ѥ��ʤ��Ǥ���������


    :verify_data      => true,
    :verify_signer    => true,
    :verify_chain     => false,
    :verify_root      => false,
    :only_trusted     => false,
    :only_signed      => false

--- MediumSecurity -> Gem::Security::Policy
#@todo

���٥�Υ������ƥ��ݥꥷ���Ǥ���

�롼�Ⱦ�����Τߤ��ꤷ�ơ����Ƥθ��ڤ�Ԥ��ޤ���
�����������ꤹ��褦�˻��ꤵ�줿������Ͽ��ꤷ�ޤ���

���Υݥꥷ���������Ǥ�������̵̾���Υѥå���������Ĥ��Ƥ���Τǡ�
�ٰ��ʿ�ʪ���ѥå������ν�̾��ñ��˺�����Ƹ��ڤ�ѥ������뤳�Ȥ��Ǥ��ޤ���

    :verify_data      => true,
    :verify_signer    => true,
    :verify_chain     => true,
    :verify_root      => true,
    :only_trusted     => true,
    :only_signed      => false

--- NoSecurity -> Gem::Security::Policy
#@todo

�������ƥ��ʤ��Υݥꥷ���Ǥ���

���Ƥθ��ڤ�Ԥ��ޤ���

    :verify_data      => false,
    :verify_signer    => false,
    :verify_chain     => false,
    :verify_root      => false,
    :only_trusted     => false,
    :only_signed      => false

--- OPT -> Hash
#@todo

�ۤȤ�ɤΥ᥽�åɤǻ��Ѥ���ǥե���ȤΥ��ץ������֤��ޤ���

--- Policies -> Hash
#@todo

���Ѳ�ǽ�ʥݥꥷ���ΰ������֤��ޤ���

 * [[m:Gem::Security::NoSecurity]]
 * [[m:Gem::Security::AlmostNoSecurity]]
 * [[m:Gem::Security::LowSecurity]]
 * [[m:Gem::Security::MediumSecurity]]
 * [[m:Gem::Security::HighSecurity]]

= class Gem::Security::Policy
#@todo

��̾�դ��� Gem �ѥå������򸡾ڤ��뤿�������򥫥ץ��벽���Ƥ��륯�饹�Ǥ���

�ݥꥷ�����֥������ȤȤ��Ƥ��Υ��饹�Υ��󥹥��󥹤䡢
���Υ饤�֥�������Ѥߤ��������Ѥ��뤳�Ȥ��Ǥ��ޤ���

== Public Instance Methods

--- only_signed -> bool
#@todo

�����ͤ����Ǥ�����ϡ���̾�դ��� Gem �Τߥ��󥹥ȡ��뤷�ޤ���

--- only_signed=(flag)
#@todo

��̾�դ��� Gem �Τߥ��󥹥ȡ��뤹�뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

--- only_trusted -> bool
#@todo

�����ͤ����Ǥ�����ϡ����ںѤߤ� Gem �Τߥ��󥹥ȡ��뤷�ޤ���

--- only_trusted=(flag)
#@todo

���ںѤߤ� Gem �Τߥ��󥹥ȡ��뤹�뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

--- verify_chain -> bool
#@todo

�����ͤ����Ǥ�����ϡ��������������򸡾ڤ��ޤ���

--- verify_chain=(flag)
#@todo

�������������򸡾ڤ��뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

--- verify_data -> bool
#@todo

�����ͤ����Ǥ�����ϡ��ǡ����򸡾ڤ��ޤ���

--- verify_data=(flag)
#@todo

�ǡ����򸡾ڤ��뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

--- verify_gem(signature, data, chain, time = Time.now)
#@todo

Ϳ����줿�ǡ�����Ϳ����줿��̾�Ⱦ������������Ǹ��ڤ��ޤ���


@param signature ��̾����ꤷ�ޤ���

@param data ���ڤ���ǡ�������ꤷ�ޤ���

@param chain ���ڤǻ��Ѥ������������������ꤷ�ޤ���

@param time ���λ����ͭ���Ǥ��뤳�Ȥ򸡾ڤ��롣

@raise Gem::Security::Exception ���ڤ˼��Ԥ�������ȯ�����ޤ���


--- verify_root -> bool
#@todo

�����ͤ����Ǥ�����ϡ��������������Υ롼�Ȥ򸡾ڤ��ޤ���

--- verify_root=(flag)
#@todo

�������������Υ롼�Ȥ򸡾ڤ��뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

--- verify_signer -> bool
#@todo

�����ͤ����Ǥ�����ϡ���̾�Ԥ򸡾ڤ��ޤ���

--- verify_signer=(flag)
#@todo

��̾�Ԥ򸡾ڤ��뤫�ɤ��������ꤷ�ޤ���

@param flag �����ޤ��ϵ�����ꤷ�ޤ���

== Singleton Methods

--- new(policy = {}, options = {})

@param policy �⡼�ɤ���ꤷ�ޤ���

@param options ����¾�Υ��ץ�������ꤷ�ޤ���

--- trusted_cert_path(cert, options) -> String
#@todo

Ϳ����줿������ؤΥѥ����֤��ޤ���

@param cert �����񥪥֥������Ȥ���ꤷ�ޤ���

@param options ����¾�Υ��ץ�������ꤷ�ޤ���


= class Gem::Security::Signer
#@todo

OpenSSL �ν�̾�Ԥ򰷤�����Υ��饹�Ǥ���

== Public Instance Methods

--- key -> OpenSSL::PKey::PKey
#@todo

�����֤��ޤ���

--- key=(key)
#@todo

���򥻥åȤ��ޤ���

--- cert_chain -> Array
#@todo

���������������֤��ޤ���

--- cert_chain=(cert_chain)
#@todo

�������������򥻥åȤ��ޤ���

@param cert_chain ����������������ꤷ�ޤ���

--- sign(data)

���Ȥ�����ѤߤΥ����������ȥ��르�ꥺ����Ѥ���Ϳ����줿�ǡ����˽�̾���ޤ���

@param data ��̾�оݤΥǡ�������ꤷ�ޤ���

== Singleton Methods

--- new(key, cert_chain)
#@todo

Ϳ����줿���Ⱦ��������������Ѥ��Ƽ��Ȥ��������ޤ���

@param key ������ꤷ�ޤ���

@param cert_chain ����������������ꤷ�ޤ���

= class Gem::Security::Exception < Gem::Exception
#@todo

�������ƥ���Ϣ�Υ��顼��ɽ���ޤ���
