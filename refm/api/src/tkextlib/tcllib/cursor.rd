#@since 1.8.2

require tk
require tkextlib/tcllib

= module Tk::Tcllib::Cursor
extend TkCore

== Singleton Methods
#@since 1.8.3
--- package_name
#@todo

#@end
--- package_version
#@todo

--- cursor_display(win = None)
#@todo

--- cursor_propagate(win, cursor)
#@todo

--- cursor_restore(win, cursor = None)
#@todo

= reopen Tk::Tcllib
== Singleton Methods
--- cursor_display(parent = None)
#@todo

= reopen TkWindow
== Instance Methods
--- cursor_propagate(cursor)
#@todo

--- cursor_restore(cursor = None)
#@todo

#@end
