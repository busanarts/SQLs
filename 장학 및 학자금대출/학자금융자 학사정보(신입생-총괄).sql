SELECT 학자금코드 학자금융자학과코드, '11' 학적코드, iw_jcode1 || iw_jcode2 주민번호, si_hakbun 학번, iw_kname 성명,
:입시년도 입학년도, '13' 학적상태코드, '1' 학년, DECODE(state, '77', '2', '11', '1', '0') 등록납부대상구분,
admissionfee + tuition  예상등록금액,
:입시년도 || :등록마감일  등록마감일,
'11' 성적유형, 'N' 계절학기포함여부,
4.5 학점만점기준, 15 학기당최소이수학점,
0 직전학기이수학점, 0 직전학기이수평점,
0 총이수학점, 0 총이수평점, 0 직전학기백분위점수, 0 총평균백분위점수,
'Y' 성적유형통과여부, '' 최종성적취득년도, '' 최종성적취득학기,
'N' 졸업학기여부, :입시년도 || :입학일자 입학예정일자, 'Y' 입학당시신입생여부
from ipsi.IPSI201, ipsi.ipsi401, TDFEEGOJI, tm학과
where iw_year = :입시년도  --AND iw_chasu = '01'
AND iw_year = schoolyear AND si_hakbun = hakbun AND CLASS = 학과코드
--AND studentgbn = '3030'
AND STUDENTGBN <> '30304000'
AND iw_year = si_year AND iw_shno = si_shno
