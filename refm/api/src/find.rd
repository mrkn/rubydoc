�ǥ��쥯�ȥ��۲��Υե������õ�����뤿��Υ⥸�塼��Ǥ���

=== �Ȥ���

  require "find"
  
  Find.find('/foo','/bar') {|f| ...}

�ޤ���

  require "find"
  
  include Find
  find('/foo','/bar') {|f| ...}

�ʲ��ϡ�ruby �Υ��������֤˴ޤޤ�륵��ץ륹����ץ�
[[unknown:"ruby-src:sample/trojan.rb"]] �򤳤Υ⥸�塼��ǽ񤭴�������ΤǤ���

  #! /usr/bin/env ruby
  require "find"
  # ¾�ͤ��񤭹��߲�ǽ�ʴ��ʥ��ޥ�ɤ�õ��
  
  for dir in ENV['PATH'].split(File::PATH_SEPARATOR)
    Find.find(dir) do |fpath|
      if File.file?(fpath) and (File.stat(fpath).mode & 022) != 0
        printf("file %s is writable from other users\n", fpath)
      end
    end
  end


=== ����
  * version 1.4 (ruby version 1.6.1)
    �ǥ��쥯�ȥ�Υ���ܥ�å���󥯤�é��ʤ��ʤ�ޤ�����

= module Find

== Module Functions

--- find(dir[, ...]) {|file| }
#@todo

[[man:find(1)]] �Τ褦�� dir �۲��Τ��٤ƤΥե������
�ǥ��쥯�ȥ���Ĥ��İ��� file ���Ϥ��ƥ֥�å���¹Ԥ��ޤ���
file ���Ϥ������������Ǥ���

����ǥ��쥯�ȥ��۲���õ�����ά���������

  require 'find'
  
  Find.find('/tmp') {|f|
    Find.prune if f == "/tmp/bar"
    ...
  }

�Τ褦�ˡ�[[m:Find.#prune]] ����Ѥ��ޤ���������Ǥ� "/tmp/bar"
�۲��Υե������ǥ��쥯�ȥ��õ�����ޤ���prune �������
[[unknown:���湽¤/next]] ����Ѥ�����硢"/tmp/bar" ���Τ򥹥��åפ���
�����ǡ������۲���õ����³�Ԥ���ޤ���

--- prune
#@todo

[[m:Find.#find]] �᥽�åɤΥ֥�å��˥ǥ��쥯�ȥ꤬�Ϥ��줿�Ȥ��ˤ�
�Υ᥽�åɤ�¹Ԥ���ȡ����Υǥ��쥯�ȥ��۲���õ����̵�뤷�ޤ���
