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

[[m:$/]] ����̾

  require "English"

  $INPUT_RECORD_SEPARATOR = '|'
  array = []
  while line = DATA.gets
    array << line
  end
  p array #=> ["ugo|", "ego|", "fogo\n"]

  __END__
  ugo|ego|fogo


--- $ORS
--- $OUTPUT_RECORD_SEPARATOR

[[m:$\]] ����̾

  require "English"

  print "hoge\nhuga\n"
  $OUTPUT_RECORD_SEPARATOR = "\n"
  print "fuge"
  print "ugo"
  # end of sample.rb

  ruby sample.rb 
  hoge
  huga
  fuge
  ugo

--- $INPUT_LINE_NUMBER
--- $NR

[[m:$.]] ����̾

  1 e
  2 f
  3 g
  4 h
  5 i
  # end of a.txt

  require "English"

  File.foreach(ARGV.at(0)){|line|
    # read line
  }
  p $INPUT_LINE_NUMBER
  # end of sample.rb

  ruby sample.rb a.txt 
  #=> 5

--- $LAST_READ_LINE

[[m:$_]] ����̾
  
  1 e
  2 f
  3 g
  4 h
  5 i
  # end of a.txt

  ruby -rEnglish -ne'p $LAST_READ_LINE' a.txt
  #=> 
  "1 e\n"
  "2 f\n"
  "3 g\n"
  "4 h\n"
  "5 i\n"
  
--- $DEFAULT_OUTPUT

[[m:$>]] ����̾
 
  require "English"

  dout = $DEFAULT_OUTPUT.dup
  $DEFAULT_OUTPUT.reopen("out.txt", "w")
  print "foo"
  $DEFAULT_OUTPUT.close
  $DEFAULT_OUTPUT = dout
  p "bar" # => bar
  p File.read("out.txt") #=> foo

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

[[m:$$]] ����̾
 
  require "English"

	p sprintf("something%s", $PID) #=> "something5543" �ʤ�

--- $CHILD_STATUS

[[m:$?]] ����̾

  require "English"

  out = `wget http://www2.ruby-lang.org/ja/LICENSE.txt -O - 2>/dev/null`

  if $CHILD_STATUS.to_i == 0
    print "wget success\n"
    out.split(/\n/).each { |line|
      printf "%s\n", line
    }
  else
    print "wget failed\n"
  end


--- $LAST_MATCH_INFO

[[m:$~]] ����̾

  require "English"

  str = "<a href=http://www2.ruby-lang.org/ja/LICENSE.txt>license</a>"

  if /<a href=(.+?)>/ =~ str
    p $LAST_MATCH_INFO[0] #=> "<a href=http://www2.ruby-lang.org/ja/LICENSE.txt>"
    p $LAST_MATCH_INFO[1] #=> "http://www2.ruby-lang.org/ja/LICENSE.txt"
    p $LAST_MATCH_INFO[2] #=> nil
  end

--- $IGNORECASE

[[m:$=]] ����̾

  require "English"

  $IGNORECASE=true

  str_l = "FOOBAR"
  str_s = "foobar"

  if str_l == str_s
    p "#{str_l} equal to #{str_s}" #=> "FOOBAR equal to foobar"
  end


--- $PROGRAM_NAME

[[m:$0]] ����̾
  
  require "English"
  
  p $PROGRAM_NAME
  #end of sample.rb

  ruby sample.rb  #=> "sample.rb"
  ruby ./sample.rb #=> "./sample.rb"
  ruby /home/hoge/bin/sample.rb #=> "/home/hoge/bin/sample.rb"

--- $ARGV

[[m:$*]] ����̾

  require "English"
  p $ARGV
  # end of sample.rb
  
  ruby sample.rb 31 /home/hoge/fuga.txt
  #=> ["31", "/home/hoge/fuga.txt"]

--- $MATCH

[[m:$&]] ����̾

  require "English"

  str = 'hoge,foo,bar,hee,hoo'

  /(foo|bar)/ =~ str
  p $MATCH     #=> "foo"

--- $PREMATCH

[[m:$`]] ����̾

  require "English"

  str = 'hoge,foo,bar,hee,hoo'

  /foo/ =~ str
  p $PREMATCH  #=> "hoge,"

--- $POSTMATCH

[[m:$']] ����̾

  require "English"

  str = 'hoge,foo,bar,hee,hoo'

  /foo/ =~ str
  p $POSTMATCH #=> ",bar,hee,hoo"

--- $LAST_PAREN_MATCH

[[m:$+]] ����̾

  require "English"

  r1 = Regexp.compile("<img src=(http:.+?)>")
  r2 = Regexp.compile("<a href=(http|ftp).+?>(.+?)</a>")

  while line = DATA.gets
    [ r1, r2 ].each {|rep|
      rep =~ line
      p $+
    }
  end
  __END__
  <tr> <td><img src=http://localhost/a.jpg></td> <td>ikkou</td> <td><a href=http://localhost/link.html>link</a></td> </tr>
  #enf of sample.rb

  $ ruby sample.rb
  "http://localhost/a.jpg"
  "link"
  


