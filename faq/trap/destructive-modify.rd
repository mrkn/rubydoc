= �˲�Ū�᥽�å�

* �ѹ����ʤ��ä��Ȥ���nil���֤���
    'a'.sub!(/a/,'b') #=> "b"
    'b'.sub!(/a/,'b') #=> nil

* �˲�Ū�᥽�åɤ����

    class String
      def sample!
        self.replace('sample')
    #    self = 'sample' # ����ϸ��
      end
    end
