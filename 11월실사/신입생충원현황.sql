SELECT hg_name 학과명, iw_kname 성명, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '정원외', '정원내') 전형구분,
dr_drniymd 납입일자, cnt 신청학점, iw_jcode1 || iw_jcode2 주민번호, iw_ggjyear 고교졸업년도,
cc.sj_sghjum 실기점수, cc.sj_nshjum 내신점수, iw_shno 수험번호, si_hakbun 학번
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
ORDER BY hg_name, 전형구분