SELECT �б��ڵ�, �б���, �ֹι�ȣ, ����, �з��ڵ�, �����а��ڵ�,
hj_hakbun �й�, hj_haknyun �г�, SUBSTR(hj_iymd,1,4) ���г⵵,
SUBSTR(hj_jymd,1,4) �����⵵, SUM(sj_hjum) �������ɿ���, SUBSTR(hj_jymd, 5,2) ������
FROM tbl����������������, AC1121, tbl�а�, AC12011, AC1401
WHERE
�з��ڵ� = hg_code AND hg_mcode = �а��ڵ�
AND �ֹι�ȣ = hj_jcode1 || hj_jcode2
AND hj_hakbun = sj_hakbun AND sj_pjum > 0
GROUP BY �б��ڵ�, �б���, �ֹι�ȣ, ����, �з��ڵ�, �а���, �����а��ڵ�,
hj_hakbun, hj_haknyun, SUBSTR(hj_iymd,1,4), SUBSTR(hj_jymd,1,4), SUBSTR(hj_jymd, 5,2)
ORDER BY �ֹι�ȣ