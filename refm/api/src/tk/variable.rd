
= class TkVariable < Object

extend TkCore
include Tk
include Comparable

Tcl���ѿ��򥢥��������뤿��Υ��饹�Ǥ���
((-Tcl������Ȥ��Ƥο����񤤤ϻ��ͤ��԰���Τ褦�Ǥ�-))

  require "tk"
  p TkVariable.new(0).value                     # => "0"
  p TkVariable.new(1.2).value                   # => "1.2"
  p TkVariable.new(["a", "b"]).value            # => {"0"=>"a", "1"=>"b"}
  p TkVariable.new(1=>"a", 2=>"b").value        # => {"1"=>"a", "2"=>"b"}


== Class Methods

--- callback(args)
#@todo

[[m:TkVariable#trace]]�ˤ����Ͽ���줿Proc���֥������Ȥ�¹Ԥ��ޤ���
args �ϡ� [TkVariable�Υ��󥹥���, "����", "���"]
�Ǥ�������Ǥ���

--- new(val="")
#@todo

�ͤ�val�Ǥ���TkVariable���֥������Ȥ��������ޤ���val��
[[c:Array]] �ޤ��� [[c:Hash]] �Υ��֥������ȤǤ����硢�������줿����
���󥹤� Tcl������Ȥ��ƿ����񤤤ޤ���

--- new_hash(val = {})
#@todo

== Instance Methods

--- wait
#@todo

�ͤ��Ѳ�����ޤ��Ԥ��ޤ���

--- value
#@todo

�ͤ��֤��ޤ���self��Tcl������ʤ��(Tcl�������Ϣ�������
�Τ�) [[c:Hash]]�Ȥ����֤��ޤ�������ʳ��ǤϾ��ʸ������֤��ޤ���

--- value=(val)
#@todo

�ͤ�val�����ꤷ�ޤ���

#@since 1.8.3
--- set_value(val)
#@todo

�ͤ� val �����ꤷ��self ���֤��ޤ���

--- set_value_type(val)
--- value_type=
#@todo

#@end

--- [](index)
#@todo

index���ܤ��ͤ��֤��ޤ���
self��Tcl������Ǥʤ���Фʤ�ޤ���

--- []=(index, val)
#@todo

index���ܤ����Ǥ�val�ˤ��ޤ���
self��Tcl������Ǥʤ���Фʤ�ޤ���

--- to_i
#@todo

�ͤ����([[c:Fixnum]])�Ȥ����֤��ޤ���(������TkVariable�ϡ�
Bignum���ͤˤ��뤳�ȤϤǤ��ޤ���)

#@since 1.8.3
--- element_to_i(*idxs)
#@todo

#@end

--- to_f
#@todo

�ͤ����([[c:Float]])�Ȥ����֤��ޤ���


#@since 1.8.3
--- element_to_f(*idxs)
#@todo

#@end

--- to_s
#@todo

�ͤ�ʸ����([[c:String]])�Ȥ����֤��ޤ���

--- to_a
#@todo

�ͤ�����([[c:Array]])�Ȥ����֤��ޤ���

--- ==(other)
#@todo

�ͤ�other��Ʊ���Ǥ�����˿��Ǥ���other�ϡ�
TkVariable, String, Integer, Float, Array�Τ����줫�Ǥ���

--- <=>(other)
#@todo

--- &(other)
#@todo

--- |(other)
#@todo

--- +(other)
#@todo

--- -(other)
#@todo

--- *(other)
#@todo

--- /(other)
#@todo

--- %(other)
#@todo

--- **(other)
#@todo

--- =~(other)
#@todo

--- unset(elem=nil)
--- remove(elem=nil)
#@todo

�ͤ�Tcl����Ǥ���Ȥ���elem���ͤ������ޤ���

--- id
#@todo

--- is_hash?
#@todo

--- is_scalar?
#@todo

--- keys
#@todo

--- ref(*idxs)
#@todo

#@since 1.8.3
--- exist?(*elems)
#@todo

#@end

--- trace_callback(elem, op)
#@todo

[[m:TkVariable#trace]]�ˤ����Ͽ���줿Proc���֥������Ȥ������self,
elem, op����ꤷ�Ƽ¹Ԥ��ޤ���

  require "tk"

  var = TkVariable.new(0)

  var.trace "rwu", proc {|arg| puts "callback called with #{arg.inspect}"}
  var.trace_callback([], "r")

--- trace(opts, cmd)
#@todo

opts�ϡ�"r", "w", "u" �Τ����줫���ޤ��Ϥ������Ȥ߹�碌�ǡ����줾��
�ѿ������ȡ����ꡢ��� ���줿�Ȥ���[[c:Proc]]���֥������� cmd ��
�ƤӽФ��ޤ���2���ܰʹߤθƤӽФ��Ǥϡ�opts ������������Ȱۤʤ�
��cmd������ꤷ�ޤ���

cmd�ϡ������ˡ�self��������"���" ���Ϥ���ƸƤФ�
�ޤ���"����Υ���" �ϡ��ѿ�������ξ��ʳ��϶�ʸ����Ǥ���"���"�ϡ�
"r","w","u" �Τ����줫�Ǥ���

  require "tk"
  
  var = TkVariable.new(0)
  
  var.trace "rwu", proc {|arg| puts "callback called with #{arg.inspect}"}
  
  p var.value
  p var.value = 1
  p var.unset
  
  =>callback called with [<TkVariable: v00000>, [], "r"]
    "0"
    callback called with [<TkVariable: v00000>, [], "w"]
    "1"
    callback called with [<TkVariable: v00000>, [], "u"]
    ""

--- trace_element(elem, opts, cmd)
#@todo

--- trace_vinfo
#@todo

#@if (version <= "1.8.2")
--- trace_vinfo_for_element(elem)
#@todo

#@end

--- trace_vdelete(opts, cmd)
#@todo

[[m:TkVariable#trace]] �����ꤷ��cmd�������ޤ���opts �� TkVariable#trace ��
���ꤷ���Ȥ��Ȱ��פ��ʤ���в��⤷�ޤ���

--- trace_vdelete_for_element(elem, opts, cmd)
#@todo

--- clear
#@todo

--- coerce(other)
#@todo

#@since 1.8.3
--- size
#@todo

--- lappend(*elems)
#@todo

--- element_lappend(idxs, *elems)
#@todo

--- lindex(idx)
--- lget(idx)
#@todo

--- element_lindex(elem_idxs, idx)
--- element_lget(elem_idxs, idx)
#@todo

--- lget_i(idx)
#@todo

--- element_lget_i(elem_idxs, idx)
#@todo

--- lget_f(idx)
#@todo

--- element_lget_f(elem_idxs, idx)
#@todo

--- lset(idx, val)
#@todo

--- element_lset(elem_idxs, idx, val)
#@todo

#@end

--- bool
#@todo

--- bool=
--- set_bool
#@todo

--- list
#@todo

--- list=
#@todo

#@since 1.8.3
--- set_list(val)
#@todo

--- list_element(*idxs)
--- element_to_a(*idxs)
#@todo

--- list_type=
--- set_list_type(val)
#@todo

--- set_list_element_type(idxs, val)
#@todo

#@end

--- numeric
#@todo

--- numeric=
#@todo

#@since 1.8.3
--- set_numeric(val)
#@todo

--- numeric_element(*idxs)
#@todo

--- set_numeric_element(idxs, val)
#@todo

--- set_numeric_type(val)
--- numeric_type=
#@todo

--- set_numeric_element_type(idxs, val)
#@todo

#@end


#@since 1.8.3
--- bool_element
#@todo

--- set_bool_element
#@todo

--- bool_type=
--- set_bool_type(val)
#@todo

--- set_bool_element_type(idxs, val)
#@todo

--- numlist
#@todo

--- numlist_element(*idxs)
#@todo

--- set_numlist(val)
--- numlist=
#@todo

--- set_numlist_type(val)
--- numlist_type=
#@todo

--- set_numlist_element_type(idxs, val)
#@todo

--- set_list_element(idxs, val)
--- set_numlist_element(idxs, val)
#@todo

--- procedure
#@todo

--- set_procedure(cmd)
--- procedure=
#@todo

--- procedure_element(*idxs)
#@todo

--- set_procedure_element(idxs, cmd)
#@todo

--- procedure_type=
--- set_procedure_type(cmd)
#@todo

--- set_procedure_element_type(idxs, cmd)
#@todo

--- string
#@todo

--- string=
--- set_string(val)
#@todo

--- element_to_s(*idxs)
--- string_element(*idxs)
#@todo

--- set_string_element(idxs, val)
#@todo

--- string_type=
--- set_string_type(val)
#@todo

--- set_string_element_type(idxs, val)
#@todo

--- set_element_value(idxs, val)
#@todo

--- set_element_value_type(idxs, val)
#@todo

#@end

--- default_value(val = nil)
--- default_value(val = nil) { .... }
#@todo

--- default_value=
#@todo

#@since 1.8.3
--- set_default_value(val)
#@todo

--- default_element_value_type(idxs)
#@todo

--- default_value_type
#@todo

--- default_value_type=
--- set_default_value_type(type)
#@todo

--- set_default_element_value_type(idxs, type)
#@todo

#@end

--- default_proc(cmd = Proc.new)
#@todo

--- undef_default
#@todo

--- eventloop_wait(check_root = false)
#@todo

--- thread_wait(check_root = false)
#@todo

--- tkwait(on_thread = true)
#@todo

--- eventloop_tkwait
#@todo

--- thread_tkwait
#@todo

--- to_eval
#@todo

#@since 1.8.3
--- symbol
--- to_sym
#@todo

--- element_to_sym(*idxs)
#@todo


--- symbol=
--- set_symbol(val)
#@todo

--- symbol_element
#@todo

--- symbol_type=
--- set_symbol_type(val)
#@todo

--- set_symbol_element(idxs, val)
#@todo

--- set_symbol_element_type(idxs, val)
#@todo

#@end

--- update(hash)
#@todo

#@since 1.8.3
--- variable
#@todo

--- set_variable(var)
--- variable=
#@todo

--- variable_element(*idxs)
#@todo

--- set_variable_element(*idxs)
#@todo

--- set_variable_type(var)
--- variable_type=
#@todo

--- set_variable_element_type(idxs, var)
#@todo

--- window
#@todo

--- set_window(win)
--- window=
#@todo

--- window_element(*idxs)
#@todo

--- set_window_element(idxs, win)
#@todo

--- set_window_type(win)
--- window_type=
#@todo

--- set_window_element_type(idxs, win)
#@todo

#@end

--- zero?
#@todo

--- nonzero?
#@todo

== Constants

--- TkVar_CB_TBL
#@todo

������Хå��ؿ���Ͽ����ϥå���Ǥ������������Ѥ��Ƥ��ޤ���

--- Tk_VARIABLE_ID
#@todo

Tcl��٥���ѿ�̾�򥤥󥹥��󥹤˳�����Ƥ뤿������������Ѥ���Ƥ��ޤ���

Tk_VARIABLE_ID�ϡ�����Ǥ���0���ܤ����Ǥ����Ȥ��Ƥ��ޤ���
Ruby�ˤ�����������ͤ��ѹ��Ǥ��ʤ�����Ǥ���

--- TkCommandNames
#@todo

--- TkVar_ID_TBL
#@todo

--- USE_TCLs_SET_VARIABLE_FUNCTIONS
#@todo

= class TkVarAccess < TkVariable

Tcl�饤�֥��ʤɤǴ����������Ƥ����ѿ��˥����������뤿��Υ��饹��
����((-Tcl�Υ������פ�ռ��������Ѥ��ʤ��Ȥ��ޤ����������Ǥ��ʤ��Ȼפ�
��롣�ޤ�������Tcl������ˤϥ����������뤳�ȤϤǤ��ʤ�-))

  require 'tk'
  p TkCore::INTERP._eval("set tclvar 1")  # => 1
  var = TkVarAccess.new("tclvar", 2)
  p TkCore::INTERP._eval("set tclvar")    # => 2
  var.value = 3
  p TkCore::INTERP._eval("set tclvar")    # => 3

== Class Methods

--- new(name, *args)
#@todo

Tcl�ѿ� varname �������������󥹥��󥹤��Ϣ�դ��ޤ���
val ����ꤹ����ͤ������Ԥ��ޤ���

--- new_hash(name, *args)
#@todo

