= class WEBrick::HTTPVersion < Object
include Comparable

HTTP �ΥС������Τ���ξ����ʥ��饹�Ǥ���
�С������Ʊ�Τ���ӤΤ���˻Ȥ��ޤ���

== Class Methods
--- new(version)    -> WEBrick::HTTPVersion

HTTPVersion ���֥������Ȥ��������롣version ��ʸ���� HTTPVersion ���֥������ȡ�

@param version HTTP �ΥС������� WEBrick::HTTPVersion ���֥������Ȥ�ʸ����ǻ��ꤷ�ޤ���

--- convert(version)    -> WEBrick::HTTPVersion

���ꤵ�줿 version �� HTTPVersion ���֥������Ȥ��Ѵ������֤��ޤ���
version �� HTTPVersion ���֥������Ȥξ��Ϥ��Τޤ� version ���֤��ޤ���

@param version HTTP �ΥС������� WEBrick::HTTPVersion ���֥������Ȥ�ʸ����ǻ��ꤷ�ޤ���

== Instance Methods

--- <=>(other)    -> -1 | 0 | 1 | nil

���ȤȻ��ꤵ�줿 other �ΥС���������Ӥ��ޤ���
���Ȥ� other ��꿷�����ʤ� 1��Ʊ���ʤ� 0���Ť��ʤ� -1 ���֤��ޤ���
��ӤǤ��ʤ����� nil ���֤��ޤ���

@param other HTTP �ΥС�������ɽ�� WEBrick::HTTPVersion ���֥������Ȥ�ʸ�������ꤷ�ޤ���

  require 'webrick'
  v = WEBrick::HTTPVersion.new('1.1')
  p v < '1.0'                          #=> false

--- major      -> Integer
--- major=(n)

HTTP �С������Υ᥸�㡼��������ɽ�����������Ǥ���

@param n HTTP �С������Υ᥸�㡼�������ǻ��ꤷ�ޤ���

--- minor      -> Integer
--- minor=(n)

HTTP �С������Υޥ��ʡ���������ɽ�����������Ǥ���

@param n HTTP �С������Υޥ��ʡ��������ǻ��ꤷ�ޤ���

--- to_s    -> String

���Ȥ�ʸ������Ѵ������֤��ޤ���

  require 'webrick'
  v = WEBrick::HTTPVersion.new('1.1')
  p v.to_s                            #=> "1.1"

