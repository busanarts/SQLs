select 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명,
hb_name 학적상태, hc_siymd 변동일자, cnt 수강과목수, RCVDT 납입일자, RCVAMT 납입금, RTNDT 환불일자, '' 비고
from psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.AC1202, psutis.AC1104,
(SELECT sj_hakbun, COUNT(*) cnt FROM psutis.AC1401 WHERE sj_year = :학년도 AND sj_hakgi = :학기 GROUP BY sj_hakbun),
(SELECT * FROM ciss.tdfeegoji WHERE schoolyear = :학년도 AND semester = :학기)
where hj_hakbun = hc_hakbun
and hj_hgcode = hg_code and hg_mcode = 학과코드
AND hj_state = hb_code
and hc_year = :학년도 and hc_hakgi = :학기
and hc_scode  = '61'
AND hj_hakbun = sj_hakbun(+)
AND hj_hakbun = hakbun(+)
ORDER BY 학과명