select hg_kname �а�, DECODE(SUBSTR(hj_jhgbn,1,1), '5', '������', '������') ��������, hj_hakbun �й�, hj_kname ����,
DECODE(hj_SEXGBN, '1', '��', '2', '��') ����,  age(hj_jcode1, :�г⵵ || '0301') ����, USR_TODATE(HJ_JCODE1) �������, USR_TODATE(HJ_IYMD) ��������,
USR_HJNAME(USR_LCSCODE(hj_hakbun)) ������������
from ac12011_20140401, ac1121
--where HJ_HAKBUN LIKE 'A14%' AND HJ_HAKNYUN = 1
where SUBSTR(HJ_IYMD,1,4) = :�г⵵ --HJ_HAKNYUN = 1
and hj_hgcode = hg_code
