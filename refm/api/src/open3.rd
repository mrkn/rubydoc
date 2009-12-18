�ץ�����¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����ϡ�
ɸ�२�顼���Ϥ˥ѥ��פ�Ĥʤ��ޤ���

= module Open3

�ץ�����¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����ϡ�
ɸ�२�顼���Ϥ˥ѥ��פ�Ĥʤ��ޤ���

=== ������

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

#@since 1.9.2
--- popen3(*cmd) -> [IO, IO, IO, Thread]
--- popen3(*cmd) {|stdin, stdout, stderr, wait_thr| ... } -> ()

�����ץ���� cmd ��¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����ϡ�ɸ�२�顼
���Ϥ���³���줿�ѥ��פȼ¹Ԥ����ץ������ԤĤ���Υ���åɤ� 4 ���Ǥ�
������֤��ޤ���

  stdin, stdout, stderr, wait_thr = *Open3.popen3("/usr/bin/nroff -man")

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä�����ɸ�����ϡ�ɸ����ϡ�ɸ�२�顼��
        �Ϥȼ¹Ԥ����ץ������ԤĤ���Υ���åɤ���³���줿�ѥ��פ���
        ���ޤ���

�֥�å�����ꤹ��ȥѥ��פ����������˥֥�å���¹Ԥ����Ǹ�˥ѥ���
�� close ���ޤ������ξ��ϥ֥�å��κǸ�μ��η�̤��֤��ޤ���

  require 'open3'

  Open3.popen3("read stdin; echo stdout; echo stderr >&2") {|stdin, stdout, stderr, wait_thr|
    stdin.puts "stdin"
    stdin.close     # �ޤ��� close_write
    p stdout.read
    p stderr.read
  }
  #=> "stdout\n"
      "stderr\n"

#@else
--- popen3(*cmd) -> [IO, IO, IO]
--- popen3(*cmd) {|stdin, stdout, stderr| ... } -> ()

�����ץ���� cmd ��¹Ԥ������Υץ�����ɸ�����ϡ�
ɸ����ϡ�ɸ�२�顼���Ϥ���³���줿�ѥ��פ� 3 ���Ǥ�������֤��ޤ���
cmd ���Ȥ߹��ߴؿ� [[m:Kernel.#exec]] ��Ʊ����§�ǲ�ᤵ��ޤ���

  stdin, stdout, stderr = *Open3.popen3("/usr/bin/nroff -man")

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä�����ɸ�����ϡ�ɸ����ϡ�ɸ�२�顼
        ���֤��ޤ���

�֥�å�����ꤹ��ȥѥ��פ����������˥֥�å���¹Ԥ����Ǹ�˥ѥ���
�� close ���ޤ������ξ��ϥ֥�å��κǸ�μ��η�̤��֤��ޤ���

  require 'open3'

  Open3.popen3("read stdin; echo stdout; echo stderr >&2") {|stdin, stdout, stderr|
    stdin.puts "stdin"
    stdin.close     # �ޤ��� close_write
    p stdout.read
    p stderr.read
  }
  #=> "stdout\n"
      "stderr\n"

#@end

stdin �ؤ����Ϥ�����ä���Ǥ���¤��᤯ close �� close_write
���Ĥ���٤��Ǥ���

[UNIX��OS��ͭ�����] Open3 �Ǻ��������ҥץ�����
[[man:wait(2)]] ���ʤ��Ƥ⥾��Ӥˤʤ�ޤ���

���ޥ�ɤϼºݤˤ�¹�ץ����Ȥ���ư��뤿�ᡢ�Ȥ߹����ѿ� [[m:$?]] �ǥ��ޥ�ɤν�λ���ơ����������뤳�ȤϤǤ��ޤ���
#@#��λ���ơ��������ۤ����ҤȤϡ�((<POpen4|URL:http://popen4.rubyforge.org/>)) ���Ƥߤ�Ȥ������⤷��ޤ���

#@since 1.9.2
[[m:Kernel.#spawn]]��Ʊ�ͤˡ������ꥹ�Ȥκǽ�˴Ķ��ѿ���ϥå��������
���ꤹ������Ǥ��ޤ���

��:

  require 'open3'

  Open3.popen3({"foo" => "1", "bar" => "2"}, "env") {|i, o, e, t|
    i.close
    print o.read
  }
  #=> ...
      foo=1
      bar=2

[[m:Kernel.#spawn]]��Ʊ�ͤˡ������ꥹ�ȤκǸ�˥��ץ�����ϥå������
�ǻ��ꤹ������Ǥ��ޤ���

��:

  require "open3"
  
  # ���ץ�������ꤷ����硣
  Dir.chdir("/tmp")
  Open3.popen3("pwd", :chdir=> "/") {|i,o,e,t|
    p o.read.chomp #=> "/"
  }
  
  # ���ץ�������ꤷ�ʤ���硣
  Dir.chdir("/tmp")
  Open3.popen3("pwd") {|i,o,e,t|
    p o.read.chomp #=> "/tmp"
  }

@see [[m:Kernel.#spawn]]

#@end

#@since 1.9.2

--- popen2(*cmd) -> [IO, IO, Thread]
--- popen2(*cmd) {|stdin, stdout, wait_thr| ... } -> ()

cmd�ǻ��ꤵ�줿���ޥ�ɤ�¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����Ϥ˥ѥ�
�פ�Ĥʤ��ޤ���Open3.popen3�˻��Ƥ��ޤ�����ɸ�२�顼�򰷤��ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä�����ɸ�����ϡ�ɸ����Ϥ���³���줿��
        ���פȼ¹Ԥ����ץ������ԤĤ���Υ���åɤ��֤��ޤ���

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- popen2e(*cmd) -> [IO, IO, Thread]
--- popen2e(*cmd) {|stdin, stdout_and_stderr, wait_thr| ... } -> ()

cmd�ǻ��ꤵ�줿���ޥ�ɤ�¹Ԥ������Υץ�����ɸ�����ϡ�ɸ����Ϥ�ɸ��
���顼�˥ѥ��פ�Ĥʤ��ޤ���Open3.popen3�˻��Ƥ��ޤ�����ɸ����Ϥ�ɸ��
���顼��1�Ĥ��ѿ��ǰ����ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä�����ɸ�����ϡ�ɸ����Ϥ�ɸ�२�顼��
        ��³���줿�ѥ��פȼ¹Ԥ����ץ������ԤĤ���Υ���åɤ��֤���
        ����

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- capture3(*cmd) -> [String, String, Process::Status]

cmd�ǻ��ꤵ�줿���ޥ�ɤ�¹Ԥ������Υץ�����ɸ����Ϥ�ɸ�२�顼����
�����ν�λ���ơ�������ɽ�����֥������Ȥ��֤��ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �¹Ԥ������ޥ�ɤ�ɸ����Ϥ�ɸ�२�顼���ץ����ν�λ���ơ���
        ����ɽ�����֥������Ȥ�������֤��ޤ���

���ꤵ�줿������opts[:stdin_data]��opts[:binmode]�ʳ�������
[[m:Open3.#popen3]]���Ϥ���ޤ���opts[:stdin_data]�ϼ¹Ԥ��륳�ޥ�ɤ�
ɸ����Ϥ��Ϥ���ޤ���opts[:binmode]�򿿤˻��ꤵ���������ǻ��Ѥ����
�ѥ��פ�Х��ʥ�⡼�ɤ˻��ꤷ�ޤ���

��:

  require "open3"
  
  o, e, s = Open3.capture3("echo a; sort >&2", :stdin_data=>"foo\nbar\nbaz\n")
  p o #=> "a\n"
  p e #=> "bar\nbaz\nfoo\n"
  p s #=> #<Process::Status: pid 32682 exit 0>

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- capture2(*cmd) -> [String, Process::Status]

cmd�ǻ��ꤵ�줿���ޥ�ɤ�¹Ԥ������Υץ�����ɸ����Ϥȥץ����ν�λ
���ơ�������ɽ�����֥������Ȥ��֤��ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �¹Ԥ������ޥ�ɤ�ɸ����ϤȽ�λ���ơ�������ɽ�����֥������Ȥ�
        ������֤��ޤ���

���ꤵ�줿������opts[:stdin_data]��opts[:binmode]�ʳ�������
[[m:Open3.#popen3]]���Ϥ���ޤ���opts[:stdin_data]�ϼ¹Ԥ��륳�ޥ�ɤ�
ɸ����Ϥ��Ϥ���ޤ���opts[:binmode]�򿿤˻��ꤵ���������ǻ��Ѥ����
�ѥ��פ�Х��ʥ�⡼�ɤ˻��ꤷ�ޤ���

��:

  require "open3"
  
  # factor���ޥ�ɤ�Ϳ����줿����(42)���ǰ���ʬ�򤹤롣
  o, s = Open3.capture2("factor", :stdin_data=>"42")
  p o #=> "42: 2 3 7\n"

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- capture2e(*cmd) -> [String, Process::Status]

cmd�ǻ��ꤵ�줿���ޥ�ɤ�¹Ԥ������Υץ�����ɸ����Ϥ�ɸ�२�顼��1
�Ĥ�ʸ����ˤ�����Τȥץ����ν�λ���ơ�������ɽ�����֥������Ȥ��֤�
�ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤ���ꤷ�ޤ���

@return �¹Ԥ������ޥ�ɤ�ɸ����Ϥ�ɸ�२�顼��1�Ĥ�ʸ����ˤ�����Τ�
        ��λ���ơ�������ɽ�����֥������Ȥ�������֤��ޤ���

���ꤵ�줿������opts[:stdin_data]��opts[:binmode]�ʳ�������
[[m:Open3.#popen3]]���Ϥ���ޤ���opts[:stdin_data]�ϼ¹Ԥ��륳�ޥ�ɤ�
ɸ����Ϥ��Ϥ���ޤ���opts[:binmode]�򿿤˻��ꤵ���������ǻ��Ѥ����
�ѥ��פ�Х��ʥ�⡼�ɤ˻��ꤷ�ޤ���

��:

  require "open3"
  
  o, s = Open3.capture2e("echo a; sort >&2", :stdin_data=>"foo\nbar\nbaz\n")
  p o #=> "a\nbar\nbaz\nfoo\n"
  p s #=> #<Process::Status: pid 20574 exit 0>

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- pipeline_rw(*cmds) -> [IO, IO, [Thread]]
--- pipeline_rw(*cmds) {|first_stdin, last_stdout, wait_thrs| ... } -> ()

���ꤷ�����ޥ�ɤΥꥹ�Ȥ�ѥ��פǷҤ��ǽ��֤˼¹Ԥ��ޤ����ǽ��
���ޥ�ɤ�ɸ�����Ϥ˽񤭹������Ǹ�Υ��ޥ�ɤ�ɸ����Ϥ�����Ȥ����
�Ǥ��ޤ���

@param cmds �¹Ԥ��륳�ޥ�ɤΥꥹ�Ȥ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä����Ϻǽ�˼¹Ԥ��륳�ޥ�ɤ�ɸ������
        �ȺǸ�˼¹Ԥ��륳�ޥ�ɤ�ɸ����ϡ��¹Ԥ����ץ������ԤĤ���
        �Υ���åɤ������������֤��ޤ���

��:

  require "open3"
  
  Open3.pipeline_rw("sort", "cat -n") {|stdin, stdout, wait_thrs|
    stdin.puts "foo"
    stdin.puts "bar"
    stdin.puts "baz"
    
    # sort���ޥ�ɤ�EOF�����롣
    stdin.close
    
    # stdin���Ϥ���ʸ�����sort���ޥ�ɤ��¤��ؤ�����Τˡ�cat���ޥ��
    # �����ֹ���դ���ʸ����ɽ������롣
    p stdout.read   #=> "     1\tbar\n     2\tbaz\n     3\tfoo\n"
  }

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- pipeline_r(*cmds) -> [IO, [Thread]]
--- pipeline_r(*cmds) {|last_stdout, wait_thrs| ... } -> ()

���ꤷ�����ޥ�ɤΥꥹ�Ȥ�ѥ��פǷҤ��ǽ��֤˼¹Ԥ��ޤ����Ǹ��
���ޥ�ɤ�ɸ����Ϥ�����Ȥ�����Ǥ��ޤ���

@param cmds �¹Ԥ��륳�ޥ�ɤΥꥹ�Ȥ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä����ϺǸ�˼¹Ԥ��륳�ޥ�ɤ�ɸ����ϡ�
        �¹Ԥ����ץ������ԤĤ���Υ���åɤ������������֤��ޤ���

��:

  require "open3"
  
  Open3.pipeline_r("yes", "head -10") {|r, ts|
    p r.read      #=> "y\ny\ny\ny\ny\ny\ny\ny\ny\ny\n"
    p ts[0].value #=> #<Process::Status: pid 24910 SIGPIPE (signal 13)>
    p ts[1].value #=> #<Process::Status: pid 24913 exit 0>
  }

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- pipeline_w(*cmds) -> [IO, [Thread]]
--- pipeline_w(*cmds) {|first_stdin, wait_thrs| ... } -> ()

���ꤷ�����ޥ�ɤΥꥹ�Ȥ�ѥ��פǷҤ��ǽ��֤˼¹Ԥ��ޤ����ǽ��
���ޥ�ɤ�ɸ�����Ϥ˽񤭹�������Ǥ��ޤ���

@param cmds �¹Ԥ��륳�ޥ�ɤΥꥹ�Ȥ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä����Ϻǽ�˼¹Ԥ��륳�ޥ�ɤ�ɸ�����ϡ�
        �¹Ԥ����ץ������ԤĤ���Υ���åɤ������������֤��ޤ���

��:

  require "open3"
  
  Open3.pipeline_w("bzip2 -c", :out=>"/tmp/hello.bz2") {|w, ts|
    w.puts "hello"
  }

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- pipeline_start(*cmds) -> [Thread]
--- pipeline_start(*cmds) {|wait_thrs| ... } -> ()

���ꤷ�����ޥ�ɤΥꥹ�Ȥ�ѥ��פǷҤ��ǽ��֤˼¹Ԥ��ޤ���

@param cmd �¹Ԥ��륳�ޥ�ɤΥꥹ�Ȥ���ꤷ�ޤ���

@return �֥�å�����ꤷ�����ϥ֥�å��κǸ��ɾ�����줿�ͤ��֤��ޤ���
        �֥�å�����ꤷ�ʤ��ä����ϼ¹Ԥ����ץ������ԤĤ���Υ����
        �ɤ�������֤��ޤ���

��:

  require "open3"
  
  # xeyes��10�ä����¹Ԥ��롣
  Open3.pipeline_start("xeyes") {|ts|
    sleep 10
    t = ts[0]
    Process.kill("TERM", t.pid)
    p t.value #=> #<Process::Status: pid 911 SIGTERM (signal 15)>
  }

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

--- pipeline(*cmds) -> [Process::Status]

���ꤷ�����ޥ�ɤΥꥹ�Ȥ�ѥ��פǷҤ��ǽ��֤˼¹Ԥ��ޤ���

@param cmds �¹Ԥ��륳�ޥ�ɤΥꥹ�Ȥ���ꤷ�ޤ���

@return �¹Ԥ������ޥ�ɤν�λ���ơ�������������֤��ޤ���

��:

  require "open3"
  
  fname = "/usr/share/man/man1/ruby.1.gz"
  p Open3.pipeline(["zcat", fname], "nroff -man", "less")
  #=> [#<Process::Status: pid 11817 exit 0>,
  #    #<Process::Status: pid 11820 exit 0>,
  #    #<Process::Status: pid 11828 exit 0>]

[[m:Open3.#popen3]]��Ʊ�ͤ˰����˴Ķ��ѿ��ȥ��ץ�������ꤷ�ƥ��ޥ��
��¹Ԥ�������Ǥ��ޤ���

@see [[m:Open3.#popen3]]

#@end
