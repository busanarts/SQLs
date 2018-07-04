UPDATE TM학적 SET 최종학적변동코드 = usr_lcscode(학번), 최종학적변동일자 = usr_lcdate(학번)
WHERE 학적상태 IN ('01' ,'11', '12', '13', '14', '15')
AND 학번 IN (SELECT DISTINCT hakbun FROM TDSCHOOLCHG)