* Matrix#det
* Matrix#determinant

  �����ǳ�껻���Ƥ뤿�ᡤ���Ǥ� Integer �ξ��Ϸ�̤����������ʤ�ޤ���

        $ ruby -r matrix -e 'p Matrix[[3, 2], [4, 1]].det'
        -3

  ������ȷ׻������뤿��ˤϡ����Ǥ� Float �ˤ���

        $ ruby -r matrix -e 'p Matrix[[3.0, 2.0], [4.0, 1.0]].det'
        -5.0

  �Ȥ��뤫��mathn �� require ����

        $ ruby -r mathn -r matrix -e 'p Matrix[[3, 2], [4, 1]].det'
        -5

  �������ޤ��礦��
