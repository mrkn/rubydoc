= Ruby/Tk ���󥹥ȡ���

== Ruby/Tk �򥽡������饤�󥹥ȡ��뤹��ˤϤɤ��������ɤ��Ǥ�����

�ޤ���Tcl/Tk �򥷥��ƥ�˥��󥹥ȡ��뤷�Ƥ������������ΤȤ���
����ѥ����ɬ�פʥإå���饤�֥��⥤�󥹥ȡ��뤹��褦��
���Ƥ�������(���Ѥ���Х��ʥ�ѥå������ˤ�äƤϥإå�����
��ȯ�ѥå������Ȥ����̤˥��󥹥ȡ��뤹��ɬ�פ����뤫���Τ��
����)

��դȤ��ơ����ߤ� Ruby/Tk �Ǥϡ���Ϥ� Tcl/Tk �ΥС������ 
8.0 �������Τ�Τϥ��Ƥ��оݤˤʤäƤ��ʤ����Ȥ���դ���
��������(ư�����⤷��ޤ��󤱤�)

ruby �� build ����Ȥ��� configure �Υ��ץ����˰ʲ���ޤ�
�Ƥ�������(�����λ���Ϥ������ټ�ư���Ф���ޤ�����Tcl/Tk 
�ΥС������䥤�󥹥ȡ�����֤��͡��ʤΤǡ����٤Ƥ��б��Ǥ�
�Ƥ��ޤ���)

    ./configure --with-tcllib=tcl8.3 \
                --with-tklib=tk8.3 \
                --with-tcl-include=/usr/include/tcl8.3
                --with-X11-include=/usr/X11R6/include

--with-tcllib=XXX �ˤϥ����ƥ��¸�ߤ��� libtclXXX.so �� 
libtclXXX.a �� tclXXX ����ʬ��

--with-tklib=XXX �ˤϥ����ƥ��¸�ߤ��� libtkXXX.so �� 
libtkXXX.a �� tkXXX ����ʬ����ꤷ�ޤ���XXX ����ʬ�ˤϤ褯
Tcl/Tk �ΥС������򼨤��ֹ椬�ղä���Ƥ��ޤ���

--with-tcl-include=XXX �ˤϡ�tcl �Υإå��ե�����Τ���ѥ�
����ꤷ�ޤ���ɸ��� /usr/include �����֤���Ƥ�����ˤ�ɬ
�פ���ޤ��󡣤⤷��tk �Υإå��ե����뤬����Ȥ��̤ξ���
����ʤ� --with-tk-include=XXX ���碌�ƻ��ꤹ��ɬ�פ�����
�ޤ���

tk �Υإå��� X Window System �Υإå��ե������(���Ȥ���MS
Windows �Ķ��Ǥ��äƤ�)�ɤ⤦�Ȥ��ޤ������Υإå������Ĥ���
�ʤ����ϡ�--with-X11-include=XXX �� XXX ��ʬ�� X �Υإå�
�ե�����Τ���ǥ��쥯�ȥ����ꤷ�ޤ���
(���Τ��ᡢCygwin �Ķ��� Ruby/Tk �򥳥�ѥ��뤹��ˤϡ�XFree86 �⥤��
���ȡ��뤹��ɬ�פ�����ޤ�����������Ҥ��� bitWalk �� Tcl/Tk 
�ѥå������ˤ� X �Υإå��ե����뤬�ޤޤ�Ƥ���ΤǤ���ɬ��
�Ϥ���ޤ���)

Tcl/Tk �� Stub ��ǽ����ľ��(Tcl/Tk 8.1 �ʹ�)�嵭�������
�ʲ��Τ褦�˻��ꤹ�뤳�Ȥ�侩���ޤ���

    ./configure --enable-tcltk_stubs \
                --with-tcl-include=/usr/include/tcl8.3 \
                --with-tcllib=tclstub83 \
                --with-tklib=tkstub83 \
                --with-X11-include=/usr/X11R6/include

--enable-tcltk_stubs �ˤ�ꡢStub ��Ȥ����Ȥ��������ޤ���

--with-tcllib=XXX �ˤϥ����ƥ��¸�ߤ��� libtclstubXXX.so �� 
libtcstublXXX.a �� tclstubXXX ����ʬ��

--with-tklib=XXX �ˤϥ����ƥ��¸�ߤ��� libtkstubXXX.so �� 
libtkstubXXX.a �� tkstubXXX ����ʬ����ꤷ�ޤ���

��ϡ����Ĥ�Τ褦��
  make
  make test
  make install
���Ƥ���������

=== Cygwin �Ǥξ��

cygwin �Υǥե���Ȥ����äƤ��뤫�⤷��ʤ� tcl8.0 �Ǥ� Stub ���Ȥ�����
�ޤ����ܸ첽���ʤ���Ƥ��ޤ���

�����ư�����ˤϡ�TCL_LIBRARY �Ķ��ѿ���Ŭ�ڤ����ꤹ��ɬ�פ������
����((*���δĶ��ѿ��� Windows �����Υѥ�����ꤹ��ɬ�פ�����ޤ�*))

    $ export TCL_LIBRARY=`cygpath -w /usr/share/tcl8.0`
    $ ruby -Ks -rtk -e 'TkButton.new(nil, "text"=>"�Ƥ���") {
                command { puts "�Ƥ���" }
        }.pack' -e Tk.mainloop    

�ʾ�Τ��Ȥ��顢Tcl/Tk 8.1 �ʹ�(��ݲ��б�����Ƥ��ޤ�)�ΥХ��ʥ�ѥå�����������
���󥹥ȡ��뤹�뤳�Ȥ�侩���ޤ���

bitWalk�� Tcl/Tk����Ѥ��� ruby �� cygwin �Ķ��Ǻ�������ˤ�
�ʲ��Τ褦�ˤ��ޤ���(����������Ƥ��Ruby/Tk �򥽡������饤�󥹥ȡ��뤹��ˤ�...��
�⻲�Ȥ��Ƥ�������)

    (bitWalk �� Tcl/Tk �ѥå������� d:\Tcl �˥��󥹥ȡ��뤷���Ȥ���)

    $ cd ruby/ext/tcltklib
    $ ruby extconf.rb --with-{tcl,tk}-dir=/cygdrive/d/tcl \
                      --enable-tcltk_stubs \
                      --with-tcllib=tclstub83 \
                      --with-tklib=tkstub83
    (configure ���˾嵭���ץ������ɲäǻ��ꤷ�Ƥ��ɤ�)

    $ PATH=/cygdrive/d/Tcl/bin:$PATH
    (�ޤ���)
      $ export RUBY_TCL_DLL=`cygpath -w /cygdrive/d/Tcl/bin/tcl83.dll`
      $ export RUBY_TK_DLL=`cygpath -w /cygdrive/d/Tcl/bin/tk83.dll`

    $ ruby -Ks -rtk -e 'TkButton.new(nil, "text"=>"�Ƥ���") {
                command { puts "�Ƥ���" }
        }.pack' -e Tk.mainloop    

== Ruby/Tk �ΥХ��ʥ�Ϥ���ޤ�����

=== UNIX �� OS �ξ��

((<Ruby ���󥹥ȡ��륬����|URL:http://www.ruby-lang.org/ja/install.html>))�򻲹ͤˤ��Ʋ�������

=== Windows �ξ��

�㤨�С��ʲ����ȹ礻�ξ��
* ((<URL:http://www.ruby-lang.org/~eban/ruby/binaries/cygwin/>))
* ((<URL:http://members10.tsukaeru.net/bitwalk/download_win.html>))

�ʲ��Τ褦�ˤ����ư��ޤ�

Cygwin �Ķ��� ruby ����Τ� Tcl ����Ѥ�����(ɬ�פʥ饤�֥�ꡢDLL�򥳥ԡ�)

* c:/Program Files/Tcl/lib ��Υե������ǥ��쥯�ȥ�� c:/usr/local/lib �˥��ԡ�
* c:/Program Files/Tcl/bin �� tcl83.dll, tk83.dll �� c:/windows/system �˥��ԡ�
* ��ϡ����󥹥ȡ��뤷�� Tcl/Tk �򥢥󥤥󥹥ȡ��뤷�Ƥ�褤

���̤� Tcl/Tk ��Ȥ��������

* c:/Program Files/Tcl/bin ��PATH�˴ޤ��

���뤤�ϡ�

* �Ķ��ѿ� RUBY_TCL_DLL, RUBY_TK_DLL �� tcl83.dll, tk83.dll �Τ���ѥ�
  �����ꤹ��(Windows �����Υѥ������ꤹ�뤳��)

  Windows ����(autoexec.bat �����ꤹ��ʤ�)

    set RUBY_TCL_DLL=c:\Program Files\Tcl\bin\tcl83.dll
    set RUBY_TK_DLL=c:\Program Files\Tcl\bin\tk83.dll

  Cygwin ����(~/.bashrc �����ꤹ��ʤ�)

    export RUBY_TCL_DLL=`cygpath -w /cygdrive/c/Program\ Files/Tcl/bin/tcl83.dll`
    export RUBY_TK_DLL=`cygpath -w /cygdrive/c/Program\ Files/Tcl/bin/tk83.dll`

