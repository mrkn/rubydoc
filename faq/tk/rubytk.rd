= Ruby/Tk �� Tcl/Tk, Perl/Tk, Python Tkinter�ʤɤȤΰ㤤

== Ruby/Tk �� Tcl/Tk �Ȥΰ㤤�Ϥɤ��Ǥ�����

: ��¸�ط��Τ��� widget ��������ˡ
  ScrollBar �� ListBox, Text, Canvas

: TkVariable

: ��������

: ɾ�������ߥ�


== Ruby/Tk �� Tcl/Tk �Ȥΰ㤤�����ϡ�

    what              Tcl/Tk                 Ruby/Tk
    variable          set a 123              a = 123 or a = '123'
     initialization
    re-assignment     set b $a               b = a.dup

    lists/arrays      set a {1 2 fred 7.8}   a = [1, 2, 'fred', 7.8]
    re-assignment     set b $a               b = a.dup

    associative       set a(Jan) 456.02      a = {'Jan' => 456.02, 'Feb' => 534.96}
    arrays            set a(Feb) 534.96
                      or
                      array set a {Jan 456.02 Feb 534.96}
    re-assignment     foreach i \            b = a.dup
                       [array names a] {
                       set b($i) = $a($i) }
                      or
                      array set b [array get a]

    expressions       set a [expr $b+$c]     a = b + c

    increment         incr i                 i += 1

    declare           proc plus {a b} {      def plus(a, b)
     subroutines       expr $a + $b }            return a + b
                                             end

    variable scope    local default          local default
                       override w/ "global"   

    call              plus 1 2               plus(1,2)
     subroutines                             

    statement sep     newline or at ";"      newline or at ";"

    statement         "\" - newline          none required
     continuation

    verbatim strings  {}                     ''
     e.g.             {a \ lot@ of $stuff}   'a \ lot@ of $stuff'

    escaped strings   ""                     ""
     e.g.             "Who\nWhat\nIdunno"    "Who\nWhat\nIdunno"

    STDOUT            puts "Hello World!"    print "Hello!\n"
                      puts stdout "Hello!"   STDOUT.print "Hello World!\n"


== Ruby/Tk �� Perl/Tk �Ȥΰ㤤�Ϥɤ��Ǥ�����

* Ruby/Tk �Ǥϰ����Υ᥽�åɤ�Ʊ��̾���ǥ����ѡ����饹���������Ƥ��ޤäƤ��ꡢ��̾�Υ᥽�å�̾�ȤʤäƤ��롣((-��-))
  type
* Ruby/Tk �Ǥ��ѿ��Τ����� TkVariable ���饹����Ѥ���
* Tcl/Tk �ǥ��ޥ�ɤ�2�İʾ�ȤäƤ���᥽�å�̾�ΰ㤤
* Perl/Tk �� Perl5 �ε�ǽ���Τ�ʤ��ȻȤ��Τ��Ĥ餤
* Perl/Tk �� Tcl/Tk �Ȥ���Ω�����ץ����ȤʤäƤ��ư��� Tix �ε�ǽ���Ȥ���
* Perl/Tk ���ܤ����Ǥ���Ƥ���

== Ruby/Tk �� Perl/Tk �Ȥΰ㤤�����ϡ�

    what              Perl/Tk                     Ruby/Tk
    variable          $a = 123; or $a = '123';    a = 123 or a = '123'
     initialization
    re-assignment     $b = $a;                    b = a.dup

    lists/arrays      @a = (1,2,'fred',7.8);      a = [1, 2, 'fred', 7.8]
    re-assignment     @b = @a;                    b = a.dup

    associative       %a = ('Jan',456.02,         a = {'Jan' => 456.02, 'Feb' => 534.96}
     arrays            'Feb',534.96);
    re-assignment     %b = %a;                    b = a.dup
                  
    expressions       $a = $b+$c;                 a = b + c

    increment         $i++; or ++$i;              i += 1

    declare           sub plus { my($a,$b) = @_;  def plus(a, b)
     subroutines       $a+$b; }                    return a + b
                                                  end

    variable scope    global default              local default
                       override w/ "my" (or "local")

    call              &plus(1,2); #or             plus(1,2)
     subroutines       plus(1,2);  #OK after sub plus

    statement sep     ";" required                newline or at ";"

    statement         none required               none required
     continuation

    verbatim strings  ''                          ''
     e.g.             'a \ lot@ of $stuff'        'a \ lot@ of $stuff'

    escaped strings   ""                          ""
     e.g.             "Who\nWhat\nIdunno"         "Who\nWhat\nIdunno"

    STDOUT            print "Hello World!\n"      print "Hello World!\n"
                      STDOUT "Hello!\n"           STDOUT.print "Hello World!\n"

== Ruby/Tk �� Python Tkinter �Ȥΰ㤤�Ϥɤ��Ǥ�����

* Python Tkinter �������� Tkconstants.py �����뤬��Ruby/Tk �ˤϤʤ�
* Python Tkinter �� PMW (Python Mega Widgets) �ʤɤ���������Ƥ���
* Python Tkinter ���ܤ����Ǥ���Ƥ���(�Ѹ�)

== Ruby/Tk �� Python Tkinter �Ȥΰ㤤�����ϡ�
