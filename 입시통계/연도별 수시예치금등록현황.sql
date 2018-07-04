SELECT DISTINCT iw_year 입시연도, iw_chasu 차수, hg_name 지원학과, iw_shno 수험번호, HAKBUN, F_FINDEXAMNO(HAKBUN),
DECODE(iw_result, '1', '최초합격', '2', '예비합격', '3', '면접불참', '5', '추가합격', '4', '불합격', iw_result) 합격여부,
DECODE(state, '77', '등록', '88', '환불', '') 등록여부
FROM (SELECT * FROM tdfeegoji WHERE STUDENTGBN = '30304000'
UNION SELECT * FROM tdfeegoji_예치금), ipsi.ipsi201, ipsi.ipsi104
WHERE schoolyear >= '2015'
--AND LENGTH(hakbun) = 5
--AND state = 77
--AND studentgbn = 30304000
AND schoolyear = iw_Year
AND F_FINDEXAMNO(hakbun) = iw_shno
AND iw_year = hg_year
AND iw_jwhgcode1 = hg_code
-- 합격여부(1=합격,2=예비합격,3=면접불참,5=추가합격,4=등록포기)