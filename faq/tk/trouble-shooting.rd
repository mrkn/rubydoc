= 9. �ȥ�֥륷�塼�ƥ���

== 9.1 

  #!/usr/bin/env ruby
  
  require 'tk'
  
  for i in [0, 1, 2]
    p defined?(i)
    TkButton.new {
      text "Button #{i}"
      command { puts "click Button #{i}!!" }
      pack
    }
  end
  
  Tk.mainloop

�ʲ��Τ褦�˵��Ҥ���С��տ��̤��ư���Ǥ��礦��
  #!/usr/bin/env ruby
  
  require 'tk'
  
  #i = 1
  
  [0, 1, 2].each do |i|
    p defined?(i)
    TkButton.new {
      text "Button #{i}"
      command { puts "click Button #{i}!!" }
      pack
    }
  end
  
  Tk.mainloop

#�����������ε��ҤǤ⥳���ȥ����Ȥ���Ƥ����ѿ� ((|i|)) �Τ�

== 9.2 

�ʲ��Τ褦�˵��Ҥ����Ȥ������顼�������Ƥ��ޤ�ư���ޤ���
  #!/usr/bin/env ruby
  
  require "tk"
  
  class App
    def initialize
      TkButton.new {
        text "Push Me!"
        #command { p self }
        command { push }
        pack
      }
      Tk.mainloop
    end
  
    def push
      puts "push!"
    end
  end
  
  App.new


���ޤ�������
  #!/usr/bin/env ruby
  
  require "tk"
  
  class App
    def initialize
      b = TkButton.new
      b.text "Push Me!"
      #b.command { p self }
      b.command { push }
      b.pack
      Tk.mainloop
    end
  
    def push
      puts "push!"
    end
  end
  
  App.new
