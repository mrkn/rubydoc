���ޥ�ɥ饤��Υ��ץ������갷������Υ饤�֥��Ǥ���

=== ��

The following example is a complete Ruby program.  You can run it and see the
effect of specifying various options.

  require 'optparse'
  require 'optparse/time'
  require 'ostruct'
  require 'pp'

  class OptparseExample

    CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
    CODE_ALIASES = {"jis" => "iso-2022-jp", "sjis" => "shift_jis"}

    #
    # Return a structure describing the options.
    #
    def self.parse(args)
      # The options specified on the command line will be collected in *options*.
      # We set default values here.
      options = OpenStruct.new
      options.library = []
      options.inplace = false
      options.encoding = "utf8"
      options.transfer_type = :auto
      options.verbose = false

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.separator ""
        opts.separator "Specific options:"

        # Mandatory argument.
        opts.on("-r", "--require LIBRARY",
                "Require the LIBRARY before executing your script") do |lib|
          options.library << lib
        end

        # Optional argument; multi-line description.
        opts.on("-i", "--inplace [EXTENSION]",
                "Edit ARGV files in place",
                "  (make backup if EXTENSION supplied)") do |ext|
          options.inplace = true
          options.extension = ext || ''
          options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
        end

        # Cast 'delay' argument to a Float.
        opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
          options.delay = n
        end

        # Cast 'time' argument to a Time object.
        opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
          options.time = time
        end

        # Cast to octal integer.
        opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
                "Specify record separator (default \\0)") do |rs|
          options.record_separator = rs
        end

        # List of arguments.
        opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
          options.list = list
        end

        # Keyword completion.  We are specifying a specific set of arguments (CODES
        # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
        # the shortest unambiguous text.
        code_list = (CODE_ALIASES.keys + CODES).join(',')
        opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
                "  (#{code_list})") do |encoding|
          options.encoding = encoding
        end

        # Optional argument with keyword completion.
        opts.on("--type [TYPE]", [:text, :binary, :auto], "Select transfer type (text, binary, auto)") do |t|
          options.transfer_type = t
        end

        # Boolean switch.
        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options.verbose = v
        end

        opts.separator ""
        opts.separator "Common options:"

        # No argument, shows at tail.  This will print an options summary.
        # Try it and see!
        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        # Another typical switch to print the version.
        opts.on_tail("--version", "Show version") do
          puts OptionParser::Version.join('.')
          exit
        end
      end

      opts.parse!(args)
      options
    end  # parse()

  end  # class OptparseExample

  options = OptparseExample.parse(ARGV)
  pp options

Note: if you get errors or strange results from any of the above code, make
sure you have the latest version installed.  Some changes have been made since
Ruby 1.8.0 was released.

#@include(optparse/Arguable)
#@include(optparse/OptionParser)

= class OptionParser::ParseError < StandardError

OptionParser ���㳰���饹�δ��쥯�饹�Ǥ���

= class OptionParser::AmbiguousOption < OptionParser::ParseError

�䴰��ۣ��ˤ����Ǥ��ʤ����ץ���󤬤��ä������ꤲ���ޤ���

= class OptionParser::NeedlessArgument < OptionParser::ParseError

��������ʤ��Ϥ��Υ��ץ����˰�����Ϳ����줿�����ꤲ���ޤ���

= class OptionParser::MissingArgument < OptionParser::ParseError

������ɬ�פʥ��ץ����˰�����Ϳ�����ʤ��ä������ꤲ���ޤ���

= class OptionParser::InvalidOption
< OptionParser::ParseError

�������Ƥ��ʤ����ץ����Ϳ����줿�����ꤲ���ޤ���

= class OptionParser::InvalidArgument < OptionParser::ParseError

���ץ����ΰ��������ꤵ�줿�ѥ�����˥ޥå����ʤ������ꤲ���ޤ���

= class OptionParser::AmbiguousArgument < OptionParser::ParseError

���ץ����ΰ�����ۣ��ˤ����䴰�Ǥ��ʤ������ꤲ���ޤ���

= redefine Kernel
== Constants
--- ARGV
#@todo
optparse �� require ���뤳�Ȥˤ�ꡢARGV �� 
[[c:OptionParser::Arguable]] �� extend ���ޤ���
