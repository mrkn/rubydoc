Finalizer �Ȥ�, ���륪�֥������� obj �� GC �������� obj �˰�¸���Ƥ��륪�֥������Ȥ���
���ƥ�å����������뵡ǽ�Ǥ���

[[unknown:ruby-list:3465]]

= module Finalizer
== Singleton Methods

--- add(obj, dependant, method = :finalize, *opt)
--- add_dependency(obj, dependant, method = :finalize, *opt)
#@todo

--- delete(id, dependant, method = :finalize)
--- delete_dependency(id, dependant, method = :finalize)
#@todo

--- delete_all_dependency(id, dependant)
#@todo

--- delete_by_dependant(dependant, method = :finalize)
#@todo

--- delete_all_by_dependant(dependant)
#@todo

--- finalize_dependency(id, dependant, method = :finalize)
#@todo

--- finalize_all_dependency(id, dependant)
#@todo

--- finalize_by_dependant(dependant, method = :finalize)
#@todo

--- finalize_all_by_dependant(dependant)
#@todo

--- finalize_all
#@todo

--- safe
#@todo
