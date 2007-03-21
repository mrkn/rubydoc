�ü��ѿ� $! �ʤɤ˱Ѹ�̾����̾ ($ERROR_INFO �ʤ�)��Ĥ��ޤ���

��:

  p $/  #=> "\n"
  p $RS #=> nil

  require 'English'
  p $RS #=> "\n"



= reopen Kernel

== Special Variables

--- $ERROR_INFO

[[m:$!]] ����̾

  require "English"
  class SomethingError < StandardError; end

  begin
    raise SomethingError 
  rescue
    p $ERROR_INFO.backtrace #=> ["sample.rb:5"]
    p $ERROR_INFO.to_s #=> "SomethingError"
  end

--- $ERROR_POSITION

[[m:$@]] ����̾

  require "English"
  class SomethingError < StandardError; end

  begin
    raise SomethingError
  rescue
    p $ERROR_POSITION #=> ["sample.rb:5"]
  end

--- $LOADED_FEATURES

[[m:$"]] ����̾

  require "English"
  require "find"

  p $LOADED_FEATURES #=> ["English.rb", "find.rb"]

--- $FS
--- $FIELD_SEPARATOR

[[m:$;]] ����̾

  require "English"

  str = "hoge,fuga,ugo,bar,foo"
  p str.split #=> ["hoge,fuga,ugo,bar,foo"]
  $FIELD_SEPARATOR = ","
  p str.split #=> ["hoge", "fuga", "ugo", "bar", "foo"]

--- $OFS
--- $OUTPUT_FIELD_SEPARATOR

[[m:$,]] ����̾

  require "English"

  array = %w|hoge fuga ugo bar foo|
  p array.join #=> "hogefugaugobarfoo"
  $OUTPUT_FIELD_SEPARATOR = ","
  p array.join #=> "hoge,fuga,ugo,bar,foo"

--- $RS
--- $INPUT_RECORD_SEPARATOR
#@todo

[[m:$/]] ����̾


--- $ORS
--- $OUTPUT_RECORD_SEPARATOR
#@todo

[[m:$\]] ����̾

--- $INPUT_LINE_NUMBER
--- $NR
#@todo

[[m:$.]] ����̾

--- $LAST_READ_LINE
#@todo

[[m:$_]] ����̾

--- $DEFAULT_OUTPUT
#@todo

[[m:$>]] ����̾

--- $DEFAULT_INPUT

[[m:$<]] ����̾
  
  require "English"
  while line = $DEFAULT_INPUT.gets
    p line
  end
  # end of sample.rb

  ruby sample.rb < /etc/passwd 
  # => "hoge:x:500:501::/home/hoge:/bin/bash\n"
       ...

--- $PID
--- $PROCESS_ID
#@todo

[[m:$$]] ����̾

--- $CHILD_STATUS
#@todo

[[m:$?]] ����̾

--- $LAST_MATCH_INFO
#@todo

[[m:$~]] ����̾

--- $IGNORECASE
#@todo

[[m:$=]] ����̾

--- $PROGRAM_NAME
#@todo

[[m:$0]] ����̾

--- $ARGV

[[m:$*]] ����̾

  require "English"
  p $ARGV
  # end of sample.rb
  
  ruby sample.rb 31 /home/hoge/fuga.txt
  #=> ["31", "/home/hoge/fuga.txt"]

--- $MATCH
#@todo

[[m:$&]] ����̾

--- $PREMATCH
#@todo

[[m:$`]] ����̾

--- $POSTMATCH
#@todo

[[m:$']] ����̾

--- $LAST_PAREN_MATCH
#@todo

[[m:$+]] ����̾
