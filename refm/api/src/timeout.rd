�����ॢ���Ȥ�Ԥ��饤�֥�ꡣ

= reopen Kernel

== Constants

--- TimeoutError

== Private Instance Methods

#@since 1.7.0
--- timeout(sec) {|i| .... }
--- timeout(sec, exception_class) {|i| .... }

#@# ((<ruby 1.7 feature>))

�֥�å��� sec �äδ����դ��Ǽ¹Ԥ��ޤ���
�֥�å��μ¹Ի��֤����¤�᤮���Ȥ����㳰
[[c:Timeout::Error]] ��ȯ�����ޤ���
exception_class ����ꤷ�����ˤ� [[c:Timeout::Error]] �������
�����㳰��ȯ�����ޤ���

�ޤ� sec �� nil �ΤȤ������»��֤ʤ���
�֥�å���¹Ԥ��ޤ���

[���]

timeout �ˤ������ߤ� Thread �ˤ�äƼ¸�����Ƥ��ޤ���C ����
��٥�Ǽ������졢Ruby �Υ���åɤ�������ʤ�����((-���Τ褦��
��Τϼ��ѥ�٥�ǤϾ��ʤ��ΤǤ�������򤢤���� Socket �ʤɤ�
DNS��̾�����˻��֤������ä���������ޤ���
[[lib:resolv-replace]] ����Ѥ���ɬ�פ�����ޤ�-))���Ф���
timeout ��̵�ϤǤ������ν����� Ruby �Ǽ������ʤ����� C ¦�� Ruby
�Υ���åɤ�ռ����Ƥ�����ɬ�פ�����ޤ���
[[unknown:timeout�����|trap::timeout]]�⻲��
#@end

= module Timeout

�����ॢ���Ȥ�Ԥ�����Υ⥸�塼�롣

== Module Functions

--- timeout(sec, [exception]) {|i| ... }

�֥�å��� sec �äδ����դ��Ǽ¹Ԥ��ޤ���
�֥�å��μ¹Ի��֤����¤�᤮���Ȥ����㳰
[[c:Timeout::Error]] ��ȯ�����ޤ���
exception_class ����ꤷ�����ˤ� [[c:Timeout::Error]] �������
�����㳰��ȯ�����ޤ���

�ޤ� sec �� nil �ΤȤ������»��֤ʤ���
�֥�å���¹Ԥ��ޤ���

[���]

timeout �ˤ������ߤ� Thread �ˤ�äƼ¸�����Ƥ��ޤ���
C �����٥�Ǽ������졢
Ruby �Υ���åɤ�������ʤ��������Ф��� timeout ��̵�ϤǤ���
���Τ褦�ʤ�Τϼ��ѥ�٥�ǤϾ��ʤ��ΤǤ�����
Socket �ʤɤ� DNS��̾�����˻��֤������ä���������ޤ���
���ν����� Ruby �Ǽ������ʤ����� C ¦�� Ruby
�Υ���åɤ�ռ����Ƥ�����ɬ�פ�����ޤ���

[[lib:resolv-replace]] ����Ѥ���ɬ�פ�����ޤ�.

[[unknown:timeout�����|trap::timeout]]�⻲��

== Constants

--- Error

[[c:Timeout::Error]]

= class Timeout::Error < Interrupt

[[lib:timeout]] �����������㳰���饹�Ǥ���
�ؿ� timeout �������ॢ���Ȥ����ȯ�����ޤ���

[[lib:timeout]] ��Ȥ��饤�֥������������ϡ��桼�������ꤷ��
timeout ����ª���ʤ��褦�˥饤�֥����� [[c:TimeoutError]] �Υ��֥��饹��
������ƻ��Ѥ�������̵��Ǥ���
((-��: version 1.6 �Ǥϡ�[[unknown:ruby-list:33352]] �Υѥå���ɬ�פǤ���
���Υѥå��� 1.7 �˼����ޤ�ޤ���[[unknown:ruby-list:33391]]-))

        ==> foo.rb <==
        require 'timeout.rb'
        class Foo
          FooTimeoutError = Class.new(TimeoutError)
          def longlongtime_method
            timeout(100, FooTimeoutError) {
               ...
            }
          end
        end

        ==> main.rb <==
        require 'foo'
        timeout(5) {
          Foo.new.longlongtime_method
        }
