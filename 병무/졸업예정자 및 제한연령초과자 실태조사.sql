SELECT 학교코드, 학교명, 주민번호, 성명, 학력코드, 최종전공학과 원학과, c.hg_kname 최종전공학과명, 전공코드,
B.HJ_HAKBUN 학번, B.HJ_HAKNYUN 학년, SUBSTR(B.HJ_IYMD, 1,4 ) 입학년도, '2011' 졸업년도,
DECODE(SIGN(80 - (NVL(취득학점, 0) + NVL(신청학점, 0))), 1, '졸업불가', '졸업가능') 졸업가능여부,
DECODE(SIGN(80 - (NVL(취득학점, 0) + NVL(신청학점, 0))), 1, '', '02') 졸업월,
B.HJ_EMAIL, B.HJ_HSHPTEL 휴대전화, 취득학점, 신청학점, hb_name 학적상태
FROM TBL병무용졸업예정자 a, psutis.ac12011 b, psutis.ac1121 c, PSUTIS.AC1104,
(select A.HJ_HAKBUN, 취득학점, 신청학점
from (select hj_hakbun, sum(sj_hjum) 취득학점
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and SUBSTR(hj_state,1,1) IN ('0', '1') and sj_dunggub not in ('F', 'P')
--and  hj_hakbun in  (select distinct sj_hakbun from ac1401 where hj_hakbun = sj_hakbun and sj_haknyun = '2' and  sj_hakgi = '2')
group by hj_hakbun) A,
(select hj_hakbun, sum(sj_hjum) 신청학점
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun --and hj_state = '01'
AND SJ_YEAR = '2010' AND SJ_HAKNYUN = '2' AND SJ_HAKGI = '2'
group by hj_hakbun) B
WHERE A.HJ_HAKBUN = B.HJ_HAKBUN(+)) D
WHERE 주민번호 = hj_jcode1 || hj_jcode2
AND hj_hgcode = hg_code AND hj_state = hb_code
AND B.hj_hakbun = D.HJ_HAKBUN(+)
