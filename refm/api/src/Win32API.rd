= class Win32API < Object

Win32 API �򥳡��뤹�뤿��Υ��饹�Ǥ���

=== ������

MessageBox (Win32API �Υ��饹�᥽�åɤˤ��Ƥߤ�)

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

Cygwin �� uname ���ޥ�ɤ�����

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

Cygwin �� cygpath ���ޥ�ɤ�����

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

--- new(dllname, proc, import, export)

DLL dllname ����ɤ���API�ؿ� proc �Υ��֥������Ȥ�
�������ޤ���import �ˤ� proc �ΰ����η��Υꥹ�Ȥ�
export �ˤ� proc ������ͤη�����ꤷ�ޤ���

���λ���ϰʲ���ʸ����ޤ�������Ǥ���

: "p"
    �ݥ���
#@# ���餤: 2001-03-23 ����?
: "n", "l"
    long
: "i"
    int
: "v"
    void

import �� nil �ξ��ϰ����ʤ��ȸ��ʤ���ޤ���
�ޤ���export �� nil �ξ�������ͤʤ� (void) �ȸ��ʤ���ޤ���

== Instance Methods

--- call([args ...])
--- Call([args ...])

API �ؿ��򥳡��뤷�ޤ������ꤹ�����������ͤ� new �ΰ�����
����˽����ޤ����ä˥ݥ��󥿤��Ϥ��Ƥ��Υݥ��󥿤λؤ��ΰ���ͤ�
���ꤵ�����Ϥ����ΰ�򤢤餫������ݤ��Ƥ���ɬ�פ�����ޤ���

�㤨�С�ʸ�����֤�ؿ��򥳡��뤹����ϰʲ��Τ褦�ˤ��ޤ���

  obj = Win32API.new('dllname.dll', 'foo', 'p', 'v')
  arg = "\0" * 256
  obj.call(arg)

�ݥ��󥿤�������Ϥ����ϰʲ��Τ褦�ˤ��ޤ���
#@# ���餤: 2001-03-23 �ޤ���Ƥʤ������äƤ뤫�ʡ�
#@# �Х���: 2004-01-29 obj.call([args.pack("p3")].pack("P"))�Τ褦�ʡ�

  obj = Win32API.new('dllname.dll', 'foo', 'p', 'v')
  args = ["\0" * 256, "\0" * 256, "\0" * 256,]
  obj.call(args.pack("p3"))
