
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

[[m:TkVariable#trace]]�ˤ����Ͽ���줿Proc���֥������Ȥ�¹Ԥ��ޤ���
args �ϡ� [TkVariable�Υ��󥹥���, "����", "���"]
�Ǥ�������Ǥ���

--- new(val="")

�ͤ�val�Ǥ���TkVariable���֥������Ȥ��������ޤ���val��
[[c:Array]] �ޤ��� [[c:Hash]] �Υ��֥������ȤǤ����硢�������줿����
���󥹤� Tcl������Ȥ��ƿ����񤤤ޤ���

--- new_hash(val = {})

== Instance Methods

--- wait

�ͤ��Ѳ�����ޤ��Ԥ��ޤ���

--- value

�ͤ��֤��ޤ���self��Tcl������ʤ��(Tcl�������Ϣ�������
�Τ�) [[c:Hash]]�Ȥ����֤��ޤ�������ʳ��ǤϾ��ʸ������֤��ޤ���

--- value=(val)

�ͤ�val�����ꤷ�ޤ���

#@since 1.8.3
--- set_value(val)

�ͤ� val �����ꤷ��self ���֤��ޤ���

--- set_value_type(val)
--- value_type=

#@end

--- [](index)

index���ܤ��ͤ��֤��ޤ���
self��Tcl������Ǥʤ���Фʤ�ޤ���

--- []=(index, val)

index���ܤ����Ǥ�val�ˤ��ޤ���
self��Tcl������Ǥʤ���Фʤ�ޤ���

--- to_i

�ͤ����([[c:Fixnum]])�Ȥ����֤��ޤ���(������TkVariable�ϡ�
Bignum���ͤˤ��뤳�ȤϤǤ��ޤ���)

#@since 1.8.3
--- element_to_i(*idxs)

#@end

--- to_f

�ͤ����([[c:Float]])�Ȥ����֤��ޤ���


#@since 1.8.3
--- element_to_f(*idxs)

#@end

--- to_s

�ͤ�ʸ����([[c:String]])�Ȥ����֤��ޤ���

--- to_a

�ͤ�����([[c:Array]])�Ȥ����֤��ޤ���

--- ==(other)

�ͤ�other��Ʊ���Ǥ�����˿��Ǥ���other�ϡ�
TkVariable, String, Integer, Float, Array�Τ����줫�Ǥ���

--- <=>(other)

--- &(other)

--- |(other)

--- +(other)

--- -(other)

--- *(other)

--- /(other)

--- %(other)

--- **(other)

--- =~(other)

--- unset(elem=nil)
--- remove(elem=nil)

�ͤ�Tcl����Ǥ���Ȥ���elem���ͤ������ޤ���

--- id

--- is_hash?

--- is_scalar?

--- keys

--- ref(*idxs)

#@since 1.8.3
--- exist?(*elems)

#@end

--- trace_callback(elem, op)

[[m:TkVariable#trace]]�ˤ����Ͽ���줿Proc���֥������Ȥ������self,
elem, op����ꤷ�Ƽ¹Ԥ��ޤ���

  require "tk"

  var = TkVariable.new(0)

  var.trace "rwu", proc {|arg| puts "callback called with #{arg.inspect}"}
  var.trace_callback([], "r")

--- trace(opts, cmd)

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

--- trace_vinfo

#@if (version <= "1.8.2")
--- trace_vinfo_for_element(elem)

#@end

--- trace_vdelete(opts, cmd)

[[m:TkVariable#trace]] �����ꤷ��cmd�������ޤ���opts �� TkVariable#trace ��
���ꤷ���Ȥ��Ȱ��פ��ʤ���в��⤷�ޤ���

--- trace_vdelete_for_element(elem, opts, cmd)

--- clear

--- coerce(other)

#@since 1.8.3
--- size

--- lappend(*elems)

--- element_lappend(idxs, *elems)

--- lindex(idx)
--- lget(idx)

--- element_lindex(elem_idxs, idx)
--- element_lget(elem_idxs, idx)

--- lget_i(idx)

--- element_lget_i(elem_idxs, idx)

--- lget_f(idx)

--- element_lget_f(elem_idxs, idx)

--- lset(idx, val)

--- element_lset(elem_idxs, idx, val)

#@end

--- bool

--- bool=
--- set_bool

--- list

--- list=

#@since 1.8.3
--- set_list(val)

--- list_element(*idxs)
--- element_to_a(*idxs)

--- list_type=
--- set_list_type(val)

--- set_list_element_type(idxs, val)

#@end

--- numeric

--- numeric=

#@since 1.8.3
--- set_numeric(val)

--- numeric_element(*idxs)

--- set_numeric_element(idxs, val)

--- set_numeric_type(val)
--- numeric_type=

--- set_numeric_element_type(idxs, val)

#@end


#@since 1.8.3
--- bool_element

--- set_bool_element

--- bool_type=
--- set_bool_type(val)

--- set_bool_element_type(idxs, val)

--- numlist

--- numlist_element(*idxs)

--- set_numlist(val)
--- numlist=

--- set_numlist_type(val)
--- numlist_type=

--- set_numlist_element_type(idxs, val)

--- set_list_element(idxs, val)
--- set_numlist_element(idxs, val)

--- procedure

--- set_procedure(cmd)
--- procedure=

--- procedure_element(*idxs)

--- set_procedure_element(idxs, cmd)

--- procedure_type=
--- set_procedure_type(cmd)

--- set_procedure_element_type(idxs, cmd)

--- string

--- string=
--- set_string(val)

--- element_to_s(*idxs)
--- string_element(*idxs)

--- set_string_element(idxs, val)

--- string_type=
--- set_string_type(val)

--- set_string_element_type(idxs, val)

--- set_element_value(idxs, val)

--- set_element_value_type(idxs, val)

#@end

--- default_value(val = nil)
--- default_value(val = nil) { .... }

--- default_value=

#@since 1.8.3
--- set_default_value(val)

--- default_element_value_type(idxs)

--- default_value_type

--- default_value_type=
--- set_default_value_type(type)

--- set_default_element_value_type(idxs, type)

#@end

--- default_proc(cmd = Proc.new)

--- undef_default

--- eventloop_wait(check_root = false)

--- thread_wait(check_root = false)

--- tkwait(on_thread = true)

--- eventloop_tkwait

--- thread_tkwait

--- to_eval

#@since 1.8.3
--- symbol
--- to_sym

--- element_to_sym(*idxs)


--- symbol=
--- set_symbol(val)

--- symbol_element

--- symbol_type=
--- set_symbol_type(val)

--- set_symbol_element(idxs, val)

--- set_symbol_element_type(idxs, val)

#@end

--- update(hash)

#@since 1.8.3
--- variable

--- set_variable(var)
--- variable=

--- variable_element(*idxs)

--- set_variable_element(*idxs)

--- set_variable_type(var)
--- variable_type=

--- set_variable_element_type(idxs, var)

--- window

--- set_window(win)
--- window=

--- window_element(*idxs)

--- set_window_element(idxs, win)

--- set_window_type(win)
--- window_type=

--- set_window_element_type(idxs, win)

#@end

--- zero?

--- nonzero?

== Constants

--- TkVar_CB_TBL

������Хå��ؿ���Ͽ����ϥå���Ǥ������������Ѥ��Ƥ��ޤ���

--- Tk_VARIABLE_ID

Tcl��٥���ѿ�̾�򥤥󥹥��󥹤˳�����Ƥ뤿������������Ѥ���Ƥ��ޤ���

Tk_VARIABLE_ID�ϡ�����Ǥ���0���ܤ����Ǥ����Ȥ��Ƥ��ޤ���
Ruby�ˤ�����������ͤ��ѹ��Ǥ��ʤ�����Ǥ���

--- TkCommandNames

--- TkVar_ID_TBL

--- USE_TCLs_SET_VARIABLE_FUNCTIONS

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

Tcl�ѿ� varname �������������󥹥��󥹤��Ϣ�դ��ޤ���
val ����ꤹ����ͤ������Ԥ��ޤ���

--- new_hash(name, *args)

