= class RegexpError < StandardError

����ɽ���Υ���ѥ���˼��Ԥ����Ȥ���ȯ�����ޤ���

��:

  $ ruby -e 'Regexp.compile("*")'
  -e:1:in `initialize': target of repeat operator is not specified: /*/ (RegexpError)
          from -e:1:in `Regexp#compile'
          from -e:1

