
= class Shell::SystemCommand < Shell::Filter

== Singleton Methods

--- new(sh, command, *opts)
#@todo

@param sh

@param command

@param opts

== Instance Methods

--- active? -> bool
#@todo

--- command -> String
--- name    -> String
#@todo

���ޥ��̾���֤��ޤ���

--- each(rs = nil){|line| ... }
#@todo

@param rs

--- flush -> ()
#@todo

--- input=(inp)
#@todo

--- kill(signal) -> Integer

���ȤΥץ����˥����ʥ������ޤ���

@param signal �����ʥ������������̾����ʸ����ǻ��ꤷ�ޤ���
              ����ͤ���ĥ����ʥ�(���뤤�ϥ����ʥ�̾������-)����ꤹ��ȡ�
              �ץ����ǤϤʤ��ץ������롼�פ˥����ʥ������ޤ��� 

@see [[m:Porocess.kill]]

--- notify(*opts) -> String
--- notify(*opts){|message| ... } -> String
#@todo

@param opts

@see [[m:Shell#notify]]

--- start -> ()
#@todo

--- start_export
#@todo

--- start_import -> ()
#@todo

--- super_each -> ()
#@todo

[[m:Shell::Filter#each]] �Ǥ���

--- terminate -> ()
#@todo

--- wait? -> bool
#@todo

