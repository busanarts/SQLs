--SELECT DISTINCT �̸�, ������� FROM TMR_�����Ѱ�
UPDATE TMR_�����Ѱ� SET ��������ȣ = (SELECT �������ڵ� FROM tm�λ�
WHERE
TMR_�����Ѱ�.�̸� = tm�λ�.�� || tm�λ�.�̸�
AND tmr_�����Ѱ�.������� = '19' || SUBSTR(tm�λ�.�ֹι�ȣ,1,6)
AND ������ = '1')


WHERE ( �̸�, �������) IN (
SELECT TRIM(�� || �̸�), '19' || SUBSTR(�ֹι�ȣ, 1,6) FROM tm�λ�)