= trap::CGI
* ((<CGI#out|cgi/out>)) ��ɸ����Ϥؤν��Ϥ�Ԥ��ޤ����� ((<CGI#header|cgi/header>)) �Ǥ�
  ���Ϥ�Ԥ��ޤ��󡣤���ʸ������֤������Ǥ���
  
  ���Τ���
  
    cgi = CGI.new
    cgi.out({"charset" => "shift_jis"}){
      "<html><head><title>TITLE</title></head><body>BODY</body></html>\r\n"
    }
  
  ����������Ǥ���
  
    cgi = CGI.new
    cgi.header({"charset" => "shift_jis"})
    print "<html><head><title>TITLE</title></head><body>BODY</body></html>\r\n"

  �ϴְ�ä���Ǥ���
