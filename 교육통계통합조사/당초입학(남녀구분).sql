select �г�, �а���, �й�, �� || �̸� ����, f��������(�й�) ��������, ����
	from tm����_20150401 ����, tm�а� �а�
	where �������� = '01'
	and �й� not in (select distinct hakbun from TDSCHOOLCHG where hakbun = ����.�й�)
  AND ����.�а��ڵ�= �а�.�а��ڵ�
