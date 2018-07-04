SELECT 학과명, iw_kname 성명, iw_shno 수험번호, DECODE(iw_result, '1', '합격', '2', '예비합격', '5', '충원합격', '4', '등록포기', '') 합격여부,
DECODE(SUBSTR(iw_jhgubun,1,1), '2', '일반전형', '3', '특별전형', '5', '정원외') 전형구분,
DECODE(state, '77', '완납', '88', '환불', '11', '', state) 납부구분
FROM ipsi.IPSI201, CISS.TDFEEGOJI g, CISS.tm학과 a,CISS.TM학적
WHERE g.schoolyear = :입시연도
AND iw_result IN ('1', '4', '5')
AND g.schoolyear = iw_year
AND g.hakbun = 학번 AND 수험번호 = iw_shno AND 주민등록번호 = iw_jcode1 || iw_jcode2
--AND state <> '11'
AND g.studentgbn = '30304000'  -- 수시
--AND g.studentgbn <> '30304000'  -- 정시
AND CLASS = a.학과코드
ORDER BY 학과명, DECODE(SUBSTR(iw_jhgubun,1,1), '2', '일반전형', '3', '특별전형', '5', '정원외')
