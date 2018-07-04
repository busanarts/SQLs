select 학과명, 학번, 성별, age(SUBSTR(주민등록번호,1,6), :학년도 || '0301') 연령
FROM tm학적_20150401 학적, tm학과 학과
where SUBSTR(입학일자,1,4) = :학년도 --HJ_HAKNYUN = 1
and 학적.학과코드 = 학과.학과코드
