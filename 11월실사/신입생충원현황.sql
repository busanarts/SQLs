SELECT hg_name �а���, iw_kname ����, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '������', '������') ��������,
dr_drniymd ��������, cnt ��û����, iw_jcode1 || iw_jcode2 �ֹι�ȣ, iw_ggjyear �������⵵,
cc.sj_sghjum �Ǳ�����, cc.sj_nshjum ��������, iw_shno �����ȣ, si_hakbun �й�
FROM ipsi.ipsi201, ipsi.ipsi104, ipsi.ipsi202 cc, ipsi.ipsi401, ipsi.ipsi203,
(SELECT sj_hakbun, SUM(sj_hjum) cnt FROM AC1401 WHERE sj_year = &NowYear GROUP BY sj_hakbun) aa
WHERE iw_year = &NowYear
AND iw_jwhgcode1 = hg_code
AND iw_year = dr_year
AND iw_shno = dr_shno
AND dr_drniymd IS NOT null
AND dr_drhbymd IS null
AND iw_year = si_year
AND iw_shno = si_shno
AND iw_year = cc.sj_year(+)
AND iw_chasu = cc.sj_chasu(+)
AND iw_jsno = cc.sj_jsno(+)
AND si_hakbun = aa.sj_hakbun(+)
ORDER BY hg_name, ��������