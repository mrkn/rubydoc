= timeout

* gethostbyname �� timeout �Ǥ��ʤ�

  timeout �� Thread �Ǽ¸�����Ƥ��뤿�ᡢC ��٥����ߤ��Ƥ��ޤ�
  (Thread�����ؤ���ȯ�����ʤ�)�������Ф��Ƥϸ��̤�����ޤ���

  �ʲ�����Ǥϡ�gethostbyname(���褽0.6�ý����˻��֤������äƤ���) ����λ��
  ��ľ��((A)�βս�)�� TimeoutError �㳰�������äƤ��ޤ���

      require 'timeout'
      require 'socket'

      start = Time.now
      begin
        timeout(0.1) {
          p TCPSocket.gethostbyname("www.ruby-lang.org")
          # (A)
        }
      ensure
        p Time.now - start
      end

      => ["helium.ruby-lang.org", [], 2, "210.251.121.214"]
         0.689331
         /usr/local/lib/ruby/1.6/timeout.rb:37: execution expired (TimeoutError)
                from -:6:in `timeout'
                from -:6

  Ruby�ǽ񤫤줿�꥾��Ф����Ѥ���Ȥ��������������ޤ���
  (({require "resolv-replace"})) ����ȡ�(({resolv})) ��������줿��
  �꥾��Ф����Ѥ����褦�ˤʤ�ޤ���

* Windows�� Ruby �� timeout �Ǥ��ʤ�

  Win32�� ruby (((<Cygwin>))��((<MinGW>))��((<mswin32>)),
  ((<bccwin32>)))�Ǥϡ��ʲ��ξ��� Thread �����ؤ���������ʤ������ 
  timeout �Ǥ��ޤ���

      # Win32�ͥ��ƥ�����(mingw, mswin32, bccwin32)

      require 'timeout'

      begin
        timeout(5) do
          $stdin.gets
        end
      rescue TimeoutError
        print "timeout\n"
      end

      # Cygwin��

      i = 0
      begin
        timeout(5) do
          while true
              puts (i+=1)
          end
        end
      rescue TimeoutError
        print "timeout\n"
      end

  ((<Win32�ͥ��ƥ�����>))�Ǥϡ�$stdin.gets ����((<Cygwin>))�� �Ǥϡ�
  puts �� Thread �����ؤ���ȯ�������ʤ��褦�Ǥ���((-���Τˤ� cygwin��
  �� ((<setitimer(2)|manual page>)) �˥Х�������(�餷��)���� 
  Thread ���ڤ��ؤ��ʤ��褦�Ǥ���Cygwin�� ruby version 1.6.8 �� 
  1.7.3 �κǿ��Ǥ� setitimer(2) ��Ȥ�ʤ��褦�ˤ��뤳�ȤǤ����Զ�礬
  ��������ޤ���((<ruby-list:36058>)), ((<ruby 1.6 feature>))-))
