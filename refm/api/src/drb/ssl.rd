DRb �Υץ�ȥ���Ȥ��� SSL/TLS ����̿����� drbssl ���Ȥ���褦�ˤʤ�ޤ���

 require 'drb/ssl'
 obj = ''
 DRb::DRbServer.new( 'drbssl://localhost:10000', 
                     obj, 
                     {:SSLCertName => [["CN","fqdn.example.com"]]})

#@todo





