SELECT 학번, 성명, 교과명, AA.schoolyear 학년도, AA.SEMESTER 학기, GRADEJUM 학점, GRADELVL 등급
FROM PSUTIS.TDRESULT AA, PSUTIS.TMGWAMOK BB,
(
select 학번, 성 || 이름 성명, trim(gmkname) 교과명, count(*) 중복수강
from TM학적, PSUTIS.TDRESULT A, PSUTIS.TMGWAMOK B
where --hj_state = '01'
A.schoolyear = :학년도
AND 학번 = HAKBUN
and A.gmcode = B.gmcode
and GRADELVL <> 'F'
group by 학번, 성,이름, gmkname
having count(*) > 1
)
WHERE AA.schoolyear = :학년도
AND AA.HAKBUN = 학번
AND AA.gmcode = BB.gmcode AND BB.gmkname = 교과명
ORDER BY 학번, 성명, 교과명, AA.schoolyear, AA.SEMESTER

