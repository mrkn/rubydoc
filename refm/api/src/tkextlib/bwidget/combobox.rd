#@since 1.8.2

require tk
require tk/entry
require tkextlib/bwidget
require tkextlib/bwidget/listbox
require tkextlib/bwidget/spinbox

= class Tk::BWidget::ComboBox < Tk::BWidget::SpinBox

include Tk::Scrollable

== Instance Methods

--- get_listbox(&b)



--- icursor(idx)



--- post



--- unpost




#@end
