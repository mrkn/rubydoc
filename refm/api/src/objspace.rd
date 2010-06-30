���Υ饤�֥��� [[c:ObjectSpace]] ���ĥ���ƥ��֥������Ȥ��������ˤĤ��Ƥ�
���׾�����������᥽�åɤ򤤤��Ĥ��ɲä��ޤ���

MRI �μ����ˤĤ��ƾܤ����ʤ����̤Υ桼���Ϥ��Υ饤�֥���ȤäƤϤ����ޤ���
���Υ饤�֥��ϡ�����ץ�ե�����γ�ȯ�Ԥ� MRI ���ɤΤ褦�˥������Ѥ��뤫
�Τꤿ�� MRI ��ȯ�Ԥ����Ѥ��ޤ���

= reopen ObjectSpace

--- count_objects_size(result_hash = nil) -> Hash
#@todo

Counts objects size (in bytes) for each type.

Note that this information is incomplete.  You need to deal with
this information as only a *HINT*.  Especaially, total size of
T_DATA may not right size.

It returns a hash as:
  {:TOTAL=>1461154, :T_CLASS=>158280, :T_MODULE=>20672, :T_STRING=>527249, ...}

If the optional argument, result_hash, is given,
it is overwritten and returned.
This is intended to avoid probe effect.

The contents of the returned hash is implementation defined.
It may be changed in future.

This method is not expected to work except C Ruby.

--- memsize_of(obj) -> Integer
#@todo
Return consuming memory size of obj.

Note that this information is incomplete.  You need to deal with
this information as only a *HINT*.  Especaially, the size of
T_DATA may not right size.

This method is not expected to work except C Ruby.

--- count_nodes(result_hash = nil) -> Hash
#@todo
Counts nodes for each node type.

This method is not for ordinary Ruby programmers, but for MRI developers
who have interest in MRI performance and memory usage.

It returns a hash as:
{:NODE_METHOD=>2027, :NODE_FBODY=>1927, :NODE_CFUNC=>1798, ...}

If the optional argument, result_hash, is given,
it is overwritten and returned.
This is intended to avoid probe effect.

The contents of the returned hash is implementation defined.
It may be changed in future.

This method is not expected to work except C Ruby.


--- count_tdata_objects(result_hash = nil) -> Hash
#@todo
Counts nodes for each node type.

This method is not for ordinary Ruby programmers, but for MRI developers
who interest on MRI performance.

It returns a hash as:
{:NODE_METHOD=>2027, :NODE_FBODY=>1927, :NODE_CFUNC=>1798, ...}

If the optional argument, result_hash, is given,
it is overwritten and returned.
This is intended to avoid probe effect.

The contents of the returned hash is implementation defined.
It may be changed in future.

This method is not expected to work except C Ruby.
