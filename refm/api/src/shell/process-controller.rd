�ץ��������椹�뤿��Υ��饹����������饤�֥��Ǥ���

= class Shell::ProcessController < Object

== Singleton Methods

--- new(shell)

���Ȥ��������ޤ���

@param shell [[c:Shell]] �Υ��󥹥��󥹤���ꤷ�ޤ���

--- activate(pc) -> ()
#@todo

--- each_active_object{|ref| ... } -> ()
#@todo

--- inactivate(pc) -> ()
#@todo

--- process_controllers_exclusive -> ()
#@todo

#@since 1.9.1
--- active_process_controllers -> ()
#@todo

--- block_output_synchronize{ ... } -> ()
#@todo

--- wait_to_finish_all_process_controllers -> ()
#@todo

#@end

== Instance Methods

--- active_job?(job) -> bool

���ꤵ�줿����֤��¹���Ǥ�����Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

@param job ����֤���ꤷ�ޤ���

--- active_jobs -> Array

�¹���Υ���֤�������֤��ޤ���

--- active_jobs_exist? -> bool

�¹���Υ���֤�¸�ߤ�����Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

--- add_schedule(command) -> ()

���ꤵ�줿���ޥ�ɤ��Ե�����֤Ȥ�����Ͽ���ޤ���
���������¹���Υ���֤�¸�ߤ��ʤ����ϡ����Υ���֤�ľ���˼¹Ԥ��ޤ���

@param command ���ޥ�ɤ���ꤷ�ޤ���

--- jobs -> Array

���ƤΥ���֤�������֤��ޤ���

--- jobs_exist? -> bool

�¹��椫�Ե���Υ���֤�¸�ߤ�����Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

--- kill_job(signal, command) -> Integer

���ꤵ�줿���ޥ�ɤ˥����ʥ������ޤ���

@param signal �����ʥ������������̾����ʸ����ǻ��ꤷ�ޤ���
              ����ͤ���ĥ����ʥ�(���뤤�ϥ����ʥ�̾������-)����ꤹ��ȡ�
              �ץ����ǤϤʤ��ץ������롼�פ˥����ʥ������ޤ��� 

@param command ���ޥ�ɤ���ꤷ�ޤ���

@see [[m:Porocess.kill]]

--- sfork(command){ ... } -> [Integer, IO, IO]

����ץ�� fork �Ǥ���

@param command ���ޥ�ɤ���ꤷ�ޤ���

@return [PID, ������ IO, ������ IO] ����ʤ�������֤��ޤ���


--- start_job(command = nil)

���ꤵ�줿���ޥ�ɤμ¹Ԥ򳫻Ϥ��ޤ���

���ޥ�ɤ��ά�������ϡ��Ԥ����֤Υ���֤Τ�����Ƭ�Τ�Τ�¹Ԥ��ޤ���

@param command ���ޥ�ɤ���ꤷ�ޤ���

--- terminate_job(command)

���ꤵ�줿���ޥ�ɤ�λ���ޤ���

@param command ���ޥ�ɤ���ꤷ�ޤ���

--- wait_all_jobs_execution -> ()

���ƤΥ���֤μ¹Ԥ������ޤ��Ԥ��ޤ���

--- waiting_job?(job) -> bool

���ꤵ�줿����֤�¸�ߤ�����Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

@param job ����֤���ꤷ�ޤ���

--- waiting_jobs -> Array

�Ե���Υ���֤��֤��ޤ���

--- waiting_jobs_exist? -> bool

�Ե���Υ���֤�¸�ߤ�����Ͽ����֤��ޤ���
�����Ǥʤ����ϵ����֤��ޤ���

#@since 1.9.1
--- shell -> Shell
#@todo

#@end

== Constants

#@since 1.9.1
--- USING_AT_EXIT_WHEN_PROCESS_EXIT -> true
#@todo

#@end
