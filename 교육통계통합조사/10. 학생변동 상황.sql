SELECT �а���, ����, �й�, �г�, f��������(�й�) ��������, f��������(�й�) ��������, f������(�й�) ������, �� || �̸� ����, f_hakjuknm(��������) ��������,
usr_todate(SUBSTR(�ֹε�Ϲ�ȣ,1,6)) �������, --age(substr(�ֹε�Ϲ�ȣ,1,6), SUBSTR(:���������,1,4) || '0301') ����,
		f_statenm(changecd) ��������, changedt ��������
	FROM tm����_&��������� ����, tm�а� �а�,
	(
		SELECT hakbun, changecd, changedt FROM TDSCHOOLCHG --WHERE
		--(hakbun, changedt) IN (SELECT hakbun, MAX(changedt) FROM tdschoolchg
		WHERE changedt >= substr(:���������,1,4) -1 || '0301' AND changedt <= substr(:���������,1,4) || '0229'
    AND substr(changecd,1,1) NOT IN ('8', '6')
		--GROUP BY hakbun)
	) ��������
	WHERE ����.�й� = ��������.hakbun
	AND ����.�а��ڵ� = �а�.�а��ڵ�

