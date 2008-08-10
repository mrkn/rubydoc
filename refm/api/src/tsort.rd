
tsort �ϥȥݥ����륽���Ȥȶ�Ϣ����ʬ�˴ؤ���⥸�塼����󶡤��ޤ���

=== Example

  require 'tsort'

  class Hash
    include TSort
    alias tsort_each_node each_key
    def tsort_each_child(node, &block)
      fetch(node).each(&block)
    end
  end

  {1=>[2, 3], 2=>[3], 3=>[], 4=>[]}.tsort
  #=> [3, 2, 1, 4]

  {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}.strongly_connected_components
  #=> [[4], [2, 3], [1]]

=== ��긽��Ū����

����ñ��� `make' �˻����ġ���ϰʲ��Τ褦�˼����Ǥ��ޤ���

  require 'tsort'

  class Make
    def initialize
      @dep = {}
      @dep.default = []
    end

    def rule(outputs, inputs=[], &block)
      triple = [outputs, inputs, block]
      outputs.each {|f| @dep[f] = [triple]}
      @dep[triple] = inputs
    end

    def build(target)
      each_strongly_connected_component_from(target) {|ns|
        if ns.length != 1
          fs = ns.delete_if {|n| Array === n}
          raise TSort::Cyclic.new("cyclic dependencies: #{fs.join ', '}")
        end
        n = ns.first
        if Array === n
          outputs, inputs, block = n
          inputs_time = inputs.map {|f| File.mtime f}.max
          begin
            outputs_time = outputs.map {|f| File.mtime f}.min
          rescue Errno::ENOENT
            outputs_time = nil
          end
          if outputs_time == nil ||
             inputs_time != nil && outputs_time <= inputs_time
            sleep 1 if inputs_time != nil && inputs_time.to_i == Time.now.to_i
            block.call
          end
        end
      }
    end

    def tsort_each_child(node, &block)
      @dep[node].each(&block)
    end
    include TSort
  end

  def command(arg)
    print arg, "\n"
    system arg
  end

  m = Make.new
  m.rule(%w[t1]) { command 'date > t1' }
  m.rule(%w[t2]) { command 'date > t2' }
  m.rule(%w[t3]) { command 'date > t3' }
  m.rule(%w[t4], %w[t1 t3]) { command 'cat t1 t3 > t4' }
  m.rule(%w[t5], %w[t4 t2]) { command 'cat t4 t2 > t5' }
  m.build('t5')

=== Bugs

tsort �Ȥ���̾�������ΤǤϤ���ޤ��󡣤ʤ��ʤ�
���Υ饤�֥��� Tarjan �ζ�Ϣ����ʬ�˴ؤ��륢�르�ꥺ���ȤäƤ��뤫��Ǥ���
�ȤϤ��� strongly_connected_components �Ȥ������Τ�̾����Ĺ�᤮�ޤ���

=== References
R. E. Tarjan,
Depth First Search and Linear Graph Algorithms,
SIAM Journal on Computing, Vol. 1, No. 2, pp. 146-160, June 1972.

#@#@Article{Tarjan:1972:DFS,
#@#  author =       "R. E. Tarjan",
#@#  key =          "Tarjan",
#@#  title =        "Depth First Search and Linear Graph Algorithms",
#@#  journal =      j-SIAM-J-COMPUT,
#@#  volume =       "1",
#@#  number =       "2",
#@#  pages =        "146--160",
#@#  month =        jun,
#@#  year =         "1972",
#@#  CODEN =        "SMJCAT",
#@#  ISSN =         "0097-5397 (print), 1095-7111 (electronic)",
#@#  bibdate =      "Thu Jan 23 09:56:44 1997",
#@#  bibsource =    "Parallel/Multi.bib, Misc/Reverse.eng.bib",
#@#}

= module TSort

TSort �϶�Ϣ����ʬ�˴ؤ��� Tarjan �Υ��르�ꥺ����Ѥ���
�ȥݥ����륽���Ȥμ����Ǥ���

TSort ��Ǥ�դΥ��֥������Ȥ�ͭ������դȤ��Ʋ��Ǥ���褦���߷פ���Ƥ��ޤ���
TSort �����֥������Ȥ򥰥�դȤ��Ʋ�᤹��ˤ�2�ĤΥ᥽�åɤ��׵ᤷ�ޤ���
���ʤ����tsort_each_node �� tsort_each_child �Ǥ���

 * tsort_each_node �ϥ���վ�Τ��٤Ƥ�ĺ�����󤹤�Τ��Ѥ����ޤ���
 * tsort_each_child ��Ϳ����줿ĺ���λҤ��󤹤�Τ��Ѥ����ޤ���

ĺ��Ʊ�Τ��������� eql? �� hash �ˤ�ä��������ޤ���
����� TSort �������ǥϥå�����Ѥ��Ƥ��뤫��Ǥ���

== Instance Methods
--- tsort -> Array
#@todo

ĺ����ȥݥ����륽���Ȥ���������������֤��ޤ���
��������ϻҤ���Ƥ˸����äƥ����Ȥ���Ƥ��ޤ���
���ʤ�����ǽ�����ǤϻҤ���������Ǹ�����ǤϿƤ�����ޤ���

��ϩ��¸�ߤ���Ȥ����㳰[[c:TSort::Cyclic]]�򵯤����ޤ���

--- tsort_each {|node| ...} -> nil
#@todo

tsort �᥽�åɤΥ��ƥ졼���ǤǤ���
obj.tsort_each �� obj.tsort.each �Ȼ��Ƥ��ޤ�����
�֥�å���ɾ����� obj ���ѹ����줿����ͽ�����ʤ���̤ˤʤ�
���Ȥ�����ޤ���

tsort_each �� nil ���֤��ޤ���
��ϩ��¸�ߤ���Ȥ����㳰 [[c:TSort::Cyclic]] �򵯤����ޤ���

--- strongly_connected_components -> Array
#@todo

��Ϣ����ʬ�ν��ޤ�����������Ȥ����֤��ޤ���
��������ϻҤ���Ƥ˸����äƥ����Ȥ���Ƥ��ޤ���
�����Ǥ϶�Ϣ����ʬ��ɽ������Ǥ���

--- each_strongly_connected_component {|nodes| ...} -> nil
#@todo

strongly_connected_components �᥽�åɤΥ��ƥ졼���ǤǤ���
obj.each_strongly_connected_component ��
obj.strongly_connected_components.each �˻��Ƥ��ޤ�����
�֥�å���ɾ����� obj ���ѹ����줿����ͽ�����ʤ���̤ˤʤ�
���Ȥ�����ޤ���

each_strongly_connected_component �� nil ���֤��ޤ���

--- each_strongly_connected_component_from(node) {|nodes| ...} -> ()
#@todo

node ������ã��ǽ�ʶ�Ϣ����ʬ�ˤĤ��ƤΥ��ƥ졼���Ǥ���

�֤��ͤϵ��ꤵ��Ƥ��ޤ���

each_strongly_connected_component_from ��
tsort_each_node ��ƤӤޤ���

--- tsort_each_node {|node| ...} -> ()

TSort �ǳ�ĥ����륯�饹���������Ƥ��ʤ���Фʤ�ʤ��᥽�åɤǤ���

tsort_each_node is used to iterate for all nodes over a graph.

@raise NotImplementedError TSort �ǳ�ĥ����륯�饹���������Ƥ��ʤ����ȯ�����ޤ���

--- tsort_each_child(node) {|child| ...} -> ()

TSort �ǳ�ĥ����륯�饹���������Ƥ��ʤ���Фʤ�ʤ��᥽�åɤǤ���

tsort_each_child is used to iterate for child nodes of node.

@raise NotImplementedError TSort �ǳ�ĥ����륯�饹���������Ƥ��ʤ����ȯ�����ޤ���

= class TSort::Cyclic < StandardError

��ϩ��¸�ߤ������ȯ�����ޤ���
