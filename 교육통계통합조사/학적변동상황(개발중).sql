SELECT �а���, �г�, --USR_GETJHNAME(USR_GETJHCODE(HJ_HAKBUN)),
�й�, �� || �̸� ����, f_hjstate(�й�, :���������) �����������,
--f_hakjuknm(f_LCSCODE(�й�, :���������)) ������������, USR_TODATE(f_LCDATE(�й�, :��������� )) ����������
f_hakjuknm(f_LCSCODE(�й�, :���������)) ������������, f_LCDATE(�й�, :��������� ) ����������
FROM tm���� ����, tm�а� �а�
WHERE SUBSTR(��������,1,1) <> '8'
--AND �й� LIKE 'A10%'
AND f_hjstate(�й�, :���������) IN ('����', '����')
AND ����.�а��ڵ� = �а�.�а��ڵ�

