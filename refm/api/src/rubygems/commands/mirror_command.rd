require rubygems/command

��⡼�ȥ�ݥ��ȥ��������ݥ��ȥ�˥ߥ顼���뤿��Υ饤�֥��Ǥ���

  Usage: gem mirror [options]
#@include(common_options)
    Summary:
      Gem ��ݥ��ȥ��ߥ顼���ޤ�
    Description:
      ���Υ��ޥ�ɤ� ~/.gemmirrorrc �ե��������Ѥ��ƥ�⡼�� Gem ��ݥ��ȥ��
      ������˥ߥ顼���ޤ�������ե������ YAML �ǰʲ��Τ褦�˽񤭤ޤ���
      
        ---
        - from: http://gems.example.com # source repository URI
          to: /path/to/mirror           # destination directory
      
      ʣ���μ����������������ꤹ�뤳�Ȥ��Ǥ��ޤ���


= class Gem::Commands::MirrorCommand < Gem::Command

��⡼�ȥ�ݥ��ȥ��������ݥ��ȥ�˥ߥ顼���뤿��Υ��饹�Ǥ���
