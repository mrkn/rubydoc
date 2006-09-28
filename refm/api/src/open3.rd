= class Open3

�ץ�����¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����ϡ�
ɸ�२�顼���Ϥ˥ѥ��פ�Ĥʤ��ޤ���

#@# == ������

nroff ��¹Ԥ��Ƥ���ɸ�����Ϥ� man �ڡ�����������߽��������롣
nroff �ץ�����ɸ����Ϥ��������̤������롣

  require "open3"

  stdin, stdout, stderr = *Open3.popen3('nroff -man')
  # �����餫���
  Thread.fork {
    File.foreach('/usr/man/man1/ruby.1') do |line|
      stdin.print line
    end
    stdin.close    # �ޤ��� close_write
  }
  # �����餫���ɤ�
  stdout.each do |line|
    print line
  end

== Module Functions

--- popen3(cmd)

�����ץ���� cmd ��¹Ԥ������Υץ�����ɸ�����ϡ�
ɸ����ϡ�ɸ�२�顼���Ϥ���³���줿�ѥ��פ� 3 ���Ǥ�������֤���
cmd ���Ȥ߹��ߴؿ� [[m:Kernel.exec]] ��Ʊ����§�ǲ�ᤵ��롣

        stdin, stdout, stderr = *Open3.popen3("/usr/bin/nroff -man")

�֥�å�����ꤹ��ȥѥ��פ����������˥֥�å���¹Ԥ����Ǹ��
�ѥ��פ� close ���롣���ξ��ϥ֥�å��κǸ�μ��η�̤��֤���

        require 'open3'

        Open3.popen3("read stdin; echo stdout; echo stderr >&2") {|stdin, stdout, stderr|
          stdin.puts "stdin"
          stdin.close     # �ޤ��� close_write
          p stdout.read
          p stderr.read
        }
        #=> "stdout\n"
            "stderr\n"

stdin �ؤ����Ϥ�����ä���Ǥ���¤��᤯ close �� close_write
���Ĥ���٤��Ǥ���

[UNIX��OS��ͭ�����] Open3 �Ǻ��������ҥץ�����
[[man:wait(2)]] ���ʤ��Ƥ⥾��Ӥˤʤ�ޤ���

���ޥ�ɤϼºݤˤ�¹�ץ����Ȥ���ư��뤿�ᡢ�Ȥ߹����ѿ� [[m:$?]] �ǥ��ޥ�ɤν�λ���ơ����������뤳�ȤϤǤ��ޤ���
