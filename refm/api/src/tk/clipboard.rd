#@since 1.8.2

require tk

= module TkClipboard
extend Tk
include Tk

== Class Methods

--- clear(win = nil)

--- clear_on_display(win)

--- get(type = nil)

--- get_on_display(win, type = nil)

--- set(data, keys = nil)

--- set_on_display(win, data, keys = nil)

--- append(data, keys = nil)

--- append_on_display(win, data, keys = nil)

== Instance Methods

--- clear

--- get(type = nil)

--- set(data, keys = nil)

--- append(data, keys = nil)

== Constants

--- TkCommandNames

#@end
