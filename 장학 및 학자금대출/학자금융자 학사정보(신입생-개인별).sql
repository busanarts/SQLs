SELECT 학자금코드 학자금융자학과코드, '11' 학적코드, iw_jcode1 || iw_jcode2 주민번호, Iw_shno 수험번호, iw_kname 성명,
:입시년도 입학년도, '13' 학적상태코드, '1' 학년, DECODE(state, '77', '2', '11', '1', '0') 등록납부대상구분,
admissionfee + tuition  예상등록금액,
:입시년도 || :등록마감일  등록마감일,
'11' 성적유형, 'N' 계절학기포함여부,
4.5 학점만점기준, 15 학기당최소이수학점,
0 직전학기이수학점, 0 직전학기이수평점,
0 총이수학점, 0 총이수평점, 0 직전학기백분위점수, 0 총평균백분위점수,
'Y' 성적유형통과여부, '' 최종성적취득년도, '' 최종성적취득학기,
'N' 졸업학기여부, :입시년도 || :입학일자 입학예정일자, 'Y' 입학당시신입생여부
from ipsi.IPSI201, TDFEEGOJI, tm학과
where iw_year = :입시년도  --AND iw_chasu = '01'
AND iw_year = schoolyear AND iw_shno = hakbun AND CLASS = 학과코드
--AND studentgbn = '30303130' -- 30303000 = 정시1차, 30303112 = 정시1차 추가합격2, 30303120 = 정시2차, 30303130 = 정시3차
AND SUBSTR(STUDENTGBN,5,4) <> '4000'
--AND hakbun = :수험번호
AND iw_shno IN ('15034', '15002', '32035')