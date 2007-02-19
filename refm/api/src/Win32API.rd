Win32 API ��ƤӽФ�����Υ饤�֥��Ǥ���

= class Win32API < Object

Win32 API ��ƤӽФ�����Υ��饹�Ǥ���

=== ������ 1: MessageBox
#@# Win32API �Υ��饹�᥽�åɤˤ��Ƥߤ�

  require 'Win32API'
  # require 'dl/win32'
  
  class Win32API
    # type flag
    MB_OK               = 0
    MB_OKCANCEL         = 1
    MB_ABORTRETRYIGNORE = 2
    MB_YESNOCANCEL      = 3
    MB_YESNO            = 4
    MB_RETRYCANCEL      = 5
    
    # return values
    IDOK     = 1
    IDCANCEL = 2
    IDABORT  = 3
    IDRETRY  = 4
    IDIGNORE = 5
    IDYES    = 6
    IDNO     = 7
    
    def Win32API.MessageBox(wnd, text, caption, type = MB_OK)
      messagebox = Win32API.new('user32', 'MessageBox', %w(p p p i), 'i')
      
      messagebox.call(wnd, text, caption, type)
    end
    
    def Win32API.MessageBoxEx(wnd, text, caption, type = MB_OK, languageid = 0)
      messagebox = Win32API.new('user32', 'MessageBoxEx', %w(p p p i i), 'i')
      
      messagebox.call(wnd, text, caption, type, languageid)
    end
  end
  
  p Win32API.MessageBox(0, "test message", "test caption")
  p Win32API.MessageBoxEx(0, "test message", "test caption")
  p Win32API.MessageBox(0, "�Ƥ���", "�ƥ���")
  p Win32API.MessageBoxEx(0, "�Ƥ���", "�ƥ���")

=== ������ 2: Cygwin �� uname ���ޥ�ɤ�����

  require 'Win32API'
  
  module Cygwin
    def uname
      uname = Win32API.new 'cygwin1', 'uname', ['P'], 'I'
      utsname = ' ' * 100
      raise 'cannot get system name' if uname.call(utsname) == -1
      
      utsname.unpack('A20' * 5)
    end
    module_function :uname
  end
  
  p Cygwin.uname
  
  => ["CYGWIN_98-4.10", "hoge", "1.1.7(0.31/3/2)", "2000-12-25 12:39", "i586"]

=== ������ 3: Cygwin �� cygpath ���ޥ�ɤ�����

  require 'Win32API'
  
  module Cygwin
    @conv_to_full_posix_path =
      Win32API.new('cygwin1.dll', 'cygwin_conv_to_full_posix_path', 'PP', 'I')
    @conv_to_posix_path =
      Win32API.new('cygwin1.dll', 'cygwin_conv_to_posix_path', 'PP', 'I')
    @conv_to_full_win32_path =
      Win32API.new('cygwin1.dll', 'cygwin_conv_to_full_win32_path', 'PP', 'I')
    @conv_to_win32_path =
      Win32API.new('cygwin1.dll', 'cygwin_conv_to_win32_path', 'PP', 'I')
    
    def cygpath(options, path)
      absolute = shortname = false
      func = nil
      options.delete(" \t-").each_byte {|opt|
        case opt
        when ?u
          func = [@conv_to_full_posix_path, @conv_to_posix_path]
        when ?w
          func = [@conv_to_full_win32_path, @conv_to_win32_path]
        when ?a
          absolute = true
        when ?s
          shortname = true
        end
      }
      raise ArgumentError "first argument must contain -u or -w" if func.nil?
      func = absolute ? func[0] : func[1]
      buf = "\0" * 300
      if func.Call(path, buf) == -1
        raise "cannot convert path name"
      end
      buf.delete!("\0")
      buf
    end
    module_function :cygpath
  end
  
  p Cygwin.cygpath("-u", 'c:\\')         # => "/cygdrive/c"
  p Cygwin.cygpath("-w", '/cygdrive/c')  # => "c:\\"
  p Cygwin.cygpath("-wa", '.')           # => "d:\\home\\arai"

== Class Methods

--- new(dllname, func, import, export)
#@todo

DLL dllname ����ɤ���API func �Υ��֥������Ȥ��������ޤ���

�� 3 ���� import �ˤ� func �ΰ����η��Υꥹ�Ȥ���ꤷ�ޤ���
nil �ξ��ϰ����ʤ��ȸ��ʤ���ޤ���

�� 4 ���� export �ˤ� func ������ͤη�����ꤷ�ޤ���
nil �ξ�������ͤʤ� (void) �ȸ��ʤ���ޤ���

�� 3 ���� import ���� 4 ���� export ��
������ꤹ��ˤϰʲ���ʸ������Ѥ��ޤ���

: "p"
    �ݥ���
#@# ���餤: 2001-03-23 ����?
: "n", "l"
    long
: "i"
    int
: "v"
    void

== Instance Methods

--- call(*args)
--- Call(*args)
#@todo

API ��ƤӽФ��ޤ���
���ꤹ�����������ͤ� [[Win32API.new]] �ΰ����λ���˽����ޤ���
�ä˥ݥ��󥿤��Ϥ��Ƥ��Υݥ��󥿤λؤ��ΰ���ͤ����ꤵ������
�����ΰ�򤢤餫������ݤ��Ƥ���ɬ�פ�����ޤ���

�㤨�С������ΥХåե��˽񤭹���ؿ���ƤӽФ��ˤϰʲ��Τ褦�ˤ��ޤ���

  api = Win32API.new('foo.dll', 'foo', 'p', 'v')
  buf = "\0" * 256
  api.call(buf)

�ݥ��󥿤�������Ϥ����ϰʲ��Τ褦�ˤ��ޤ���
#@# ���餤: 2001-03-23 �ޤ���Ƥʤ������äƤ뤫�ʡ�
#@# �Х���: 2004-01-29 obj.call([args.pack("p3")].pack("P"))�Τ褦�ʡ�

  api = Win32API.new('foo.dll', 'foo', 'p', 'v')
  args = ["\0" * 256, "\0" * 256, "\0" * 256]
  api.call(args.pack("p3"))
