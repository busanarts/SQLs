select �а���, ���, count(*) �ο��� from
(select �а���, �й�, ����, �������,
case
	when ������� = 4.5 then 'A+'
	when ������� >= 4.0 and ������� < 4.5 then 'A0'
    when ������� >= 3.5 and ������� < 4.0 then 'B+'
    when ������� >= 3.0 and ������� < 3.5 then 'B0'
    when ������� >= 2.5 and ������� < 3.0 then 'C+'
    when ������� >= 2.0 and ������� < 2.5 then 'C0'
    when ������� >= 1.5 and ������� < 2.0 then 'D+'
    when ������� >= 1.0 and ������� < 1.5 then 'D0'
    when ������� < 1.0 then 'F'
end ���
from (select �а���, �й�, ��||�̸� ����, round(sum(avejumsu * gradejum) / sum(gradejum), 2) �������
from tm���� ����, psutis.tdresult ����, tm�а� �а�
where ����.�й� = ����.hakbun
and ����.�а��ڵ� = �а�.�а��ڵ�
and substr(��������,1,1) = '8'
and �������� >= :�г⵵ || '08'
and gradelvl not in ('F')
group by �а���, ����.�й�, ��||�̸�))
group by �а���, ���