###nonref

= �Ķ��ѿ�

Ruby���󥿥ץ꥿�ϰʲ��δĶ��ѿ��򻲾Ȥ��ޤ���


: (({RUBYOPT}))

  Ruby���󥿥ץ꥿�˥ǥե���Ȥ��Ϥ����ץ�������ꤷ�ޤ���

  * (({sh��}))

      RUBYOPT='-Ke -rkconv'
      export RUBYOPT

  * (({csh��}))

      setenv RUBYOPT '-Ke -rkconv'

  * (({MS-DOS��}))

      set RUBYOPT=-Ke -rkconv

: (({RUBYPATH}))

  ((<Ruby�ε�ư/-S>)) ���ץ���������ˡ��Ķ��ѿ� (({PATH})) �ˤ�� 
  Ruby ������ץȤ�õ���˲ä��ơ����δĶ��ѿ��ǻ��ꤷ���ǥ��쥯�ȥ��
  õ���оݤˤʤ�ޤ���((({PATH})) ���ͤ���ͥ�褷�ޤ�)��

  * (({sh��}))

      RUBYPATH=$HOME/ruby:/opt/ruby
      export RUBYPATH

  * (({csh��}))

      setenv RUBYPATH $HOME/ruby:/opt/ruby

  * (({MS-DOS��}))

      set RUBYPATH=%HOME%\ruby:\opt\ruby

: (({RUBYLIB}))

  Ruby�饤�֥���õ���ѥ�((<�Ȥ߹����ѿ�/$:>))�Υǥե���
  ���ͤ����ˤ��δĶ��ѿ����ͤ��դ�­���ޤ���

  * (({sh��}))

      RUBYLIB=$HOME/ruby/lib:/opt/ruby/lib
      export RUBYLIB

  * (({csh��}))

      setenv RUBYLIB $HOME/ruby/lib:/opt/ruby/lib

  * (({MS-DOS��}))

      set RUBYLIB=%HOME%\ruby\lib:\opt\ruby\lib

: (({RUBYLIB_PREFIX}))

  ���δĶ��ѿ��� ((<DJGPP>))�ǡ�((<Cygwin>))�ǡ�((<mswin32>))�ǡ�
  ((<mingw32>))�Ǥ�ruby�ǤΤ�ͭ���Ǥ���

  ���δĶ��ѿ����ͤϡ�path1;path2 ���뤤�� path1 path2 �Ȥ��������ǡ�
  Ruby�饤�֥���õ���ѥ�((<�Ȥ߹����ѿ�/$:>))����Ƭ��ʬ
  ��path1�˥ޥå��������ˡ������path2���֤������ޤ���
  ((-���ߤμ����Ǥϥ饤�֥��Υѥ��� prefix �� ruby.exe �� ruby.dll �Τ�����֤���
  ����Ū�˵���ΤǤ��δĶ��ѿ���ɬ�����Ϥʤ��ʤäƤ��ޤ�-))

  * (({MS-DOS��}))

      set RUBYLIB_PREFIX=/usr/local/lib/ruby;d:/ruby

: (({RUBYSHELL}))

  ���δĶ��ѿ��� ((<OS2>))�ǡ�((<mswin32>))�ǡ�((<mingw32>))�Ǥ�ruby��
  �Τ�ͭ���Ǥ���

  ((<�Ȥ߹��ߴؿ�/system>)) �ǥ��ޥ�ɤ�¹Ԥ���Ȥ��˻��Ѥ��륷����
  ����ꤷ�ޤ������δĶ��ѿ�����ά����Ƥ����(({COMSPEC}))���ͤ�
  ���Ѥ��ޤ���

: (({PATH}))

  ((<�Ȥ߹��ߴؿ�/system>))�ʤɤǥ��ޥ�ɤ�¹Ԥ���Ȥ��˸�������ѥ��Ǥ���
  ���ꤵ��Ƥ��ʤ��Ȥ�(nil�ΤȤ�)��
  (({"/usr/local/bin:/usr/ucb:/usr/bin:/bin:."}))
  �Ǹ�������ޤ���
