= �Ϥ���ΰ���

¾�� ruby ������ץȤ�Ʊ���褦�˽񤭻Ϥ�ޤ��� �㤨�С�

  #!/usr/local/bin/ruby

�Ȥ������ִ�ñ�� "����ˤ���" ��ɽ�����륹����ץȤϤ����񤱤ޤ���


    #!/usr/local/bin/ruby

    require "tk"

    TkLabel.new {
      text '����ˤ���'
    }.pack

    TkButton.new {
      text '��λ'
      command 'exit'
    }.pack

    Tk.mainloop


�̤ν����򤹤�ȡ� 


    #!/usr/local/bin/ruby

    require "tk"

    TkLabel.new {
      text '����ˤ���'
      pack
    }

    TkButton.new {
      text '��λ'
      command 'exit'
      pack
    }

    Tk.mainloop

��������ˤ�񤱤ޤ���

    #!/usr/local/bin/ruby

    require "tk"

    TkLabel.new (Tk.root, 'text' => '����ˤ���').pack
    TkButton.new (Tk.root, 'text' => '��λ', 'command' => 'exit').pack

    Tk.mainloop

